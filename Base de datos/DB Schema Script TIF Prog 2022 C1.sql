USE [master]
GO
IF EXISTS(select NAME from sys.databases where name = 'TIF2022_PROG') DROP DATABASE TIF2022_PROG
CREATE DATABASE TIF2022_PROG
GO

USE TIF2022_PROG
GO


CREATE TABLE Desarrolladores
(
	IdDesarrollador int IDENTITY(1,1) NOT NULL,
	NombreDesarrollador varchar(50) NOT NULL,
	SitioWeb varchar(100) NOT NULL,
	UbicacionSede varchar(100) NOT NULL,
	Historia varchar(100) NOT NULL,
	CONSTRAINT PK_Desarrolladores PRIMARY KEY (IdDesarrollador)
)

	
CREATE TABLE Usuarios
(
	Username varchar(30) NOT NULL,
	Contrasena varchar(50) NOT NULL,
	Descripcion varchar(MAX) NULL,
	Email varchar(50) NOT NULL,
	Administrador bit NOT NULL,
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Usuarios PRIMARY KEY (Username),
	CONSTRAINT C_Usuarios_Email UNIQUE (Email)
)

CREATE TABLE Plataformas
(
	IdPlataforma int IDENTITY(1,1) NOT NULL,
	Nombre varchar(30) NOT NULL,
	Activo bit NOT NULL
	CONSTRAINT PK_Plataformas PRIMARY KEY (IdPlataforma)
)

INSERT INTO Plataformas
(
Nombre,
Activo
)
VALUES('Play Station',1)
GO

INSERT INTO Plataformas
(
Nombre,
Activo
)
VALUES('XBOX',1)
GO

CREATE TABLE Categorias
(
	IdCategoria int IDENTITY(1,1) NOT NULL,
	Nombre varchar(30) NOT NULL,
	Activo bit NOT NULL
	CONSTRAINT PK_Categorias PRIMARY KEY (IdCategoria)
)
GO

INSERT INTO Categorias (Nombre, Activo)
VALUES 
	('Accion', 1),
	('Aventura', 1),
	('RPG', 1),
	('Deportes', 1)
GO

CREATE TABLE Tiendas
(
	IdTienda int IDENTITY(1,1) NOT NULL,
	Nombre varchar(30) NOT NULL,
	RutaImagen varchar(50) NULL,
	SitioWeb varchar(100) NOT NULL,
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Tiendas PRIMARY KEY (IdTienda)
)


CREATE TABLE Juegos
(
	IdJuego int IDENTITY(1,1) NOT NULL,
	IdDesarrollador int NOT NULL,
	Nombre varchar(50) NOT NULL,
	Descripcion varchar(MAX) NOT NULL,
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Juegos PRIMARY KEY (IdJuego),
	CONSTRAINT FK_Juegos_Desarrolladores 
		FOREIGN KEY (IdDesarrollador) REFERENCES Desarrolladores(IdDesarrollador)
)


CREATE TABLE Opiniones
(
	IdJuego int NOT NULL,
	Username varchar(30) NOT NULL,
	Calificacion tinyint NOT NULL CHECK (Calificacion BETWEEN 1 AND 5),
	Comentario varchar(300) NULL,
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Opiniones PRIMARY KEY (IdJuego,Username),
	CONSTRAINT FK_Opiniones_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego),
	CONSTRAINT FK_Opiniones_Usuarios
		FOREIGN KEY (Username) REFERENCES Usuarios(Username),
)


CREATE TABLE JuegosImagenes
(
	IdJuego int NOT NULL,
	NombreArchivo varchar(50) NOT NULL,
	Orden int NOT NULL,
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_JuegosImagenes PRIMARY KEY (IdJuego, NombreArchivo),
	CONSTRAINT FK_JuegosImagenes_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego)
)


CREATE TABLE JuegosXPlataformas
(
	IdJuego int NOT NULL,
	IdPlataforma int NOT NULL,
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_JuegosXPlataformas PRIMARY KEY (IdJuego,IdPlataforma),
	CONSTRAINT FK_JuegosXPlataformas_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego),
	CONSTRAINT FK_JuegosXPlataformas_Plataformas
		FOREIGN KEY (IdPlataforma) REFERENCES Plataformas (IdPlataforma)
)


CREATE TABLE JuegosXCategorias
(
	IdJuego int NOT NULL,
	IdCategoria int NOT NULL,
	CONSTRAINT PK_JuegosXCategorias PRIMARY KEY (IdJuego,IdCategoria), 
	CONSTRAINT FK_JuegosXCategorias_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego),
	CONSTRAINT FK_JuegosXCategorias_Categorias
		FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
)


CREATE TABLE JuegosXTiendas
(
	IdJuego int NOT NULL,
	IdTienda int NOT NULL,
	SitioWeb varchar(100) NOT NULL,
	Precio float NOT NULL CHECK (Precio>0),
	PrecioRebajado float NULL CHECK (ISNULL(PrecioRebajado,0)>=0),
	Activo bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_JuegosXTiendas PRIMARY KEY (IdJuego,IdTienda),
	CONSTRAINT FK_JuegosXTiendas_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego),
	CONSTRAINT FK_JuegosXTiendas_Tiendas
		FOREIGN KEY (IdTienda) REFERENCES Tiendas(IdTienda)
)

GO

 --------------- PROCEDIMIENTOS ALMACENADOS ---------------
CREATE PROC SP_Login
@Email varchar(30),
@Contrasena varchar(50)
AS
BEGIN
	SELECT Username, Email, Descripcion, Administrador
	FROM Usuarios
	WHERE Email = @Email AND Contrasena = @Contrasena AND Activo=1
END
GO
 
CREATE PROC SP_Tiendas_Obtener
@filtro varchar(100) = null
AS
BEGIN
	if @filtro is null
		SELECT IdTienda as [ID], Nombre as [Tienda], RutaImagen as Imagen, SitioWeb as [Sitio Web], Activo
		FROM Tiendas
	else
		SELECT IdTienda as [ID], Nombre as [Tienda], RutaImagen as Imagen, SitioWeb as [Sitio Web], Activo
		FROM Tiendas
		WHERE Nombre like '%'+@filtro+'%' or SitioWeb like '%'+@filtro+'%' 
END
GO

CREATE PROC SP_Tiendas_Actualizar
@IdTienda int,
@Nombre varchar(30),
@RutaImagen varchar(50),
@Sitioweb varchar(100),
@Activo bit
AS
BEGIN
	UPDATE Tiendas
	SET
		Nombre = @Nombre,
		RutaImagen = @RutaImagen,
		SitioWeb = @Sitioweb,
		Activo = @Activo
	WHERE
		IdTienda = @IdTienda
END
go

CREATE PROC SP_Tiendas_Agregar
@Nombre varchar(30),
@RutaImagen varchar(50),
@Sitioweb varchar(100),
@Activo bit
AS
BEGIN
	INSERT INTO Tiendas (Nombre, RutaImagen, SitioWeb, Activo)
	VALUES (@Nombre, @RutaImagen, @Sitioweb, @Activo)
END
GO


CREATE PROC SP_Tiendas_Eliminar
@IdTienda int
AS
BEGIN
	DELETE FROM Tiendas WHERE IdTienda = @IdTienda
END
GO

CREATE PROC SP_Juegos_Obtener
AS
BEGIN
	SELECT Juegos.IdJuego, IdDesarrollador, Nombre, Descripcion, Juegos.Activo 
	FROM Juegos
END
GO

CREATE PROC SP_Juegos_Obtener_Por_Nombre
	@Nombre varchar(50)
AS
BEGIN
	SELECT * FROM Juegos
	WHERE Nombre like '%' + @Nombre + '%'
END
GO


CREATE PROCEDURE SP_Juegos_Actualizar
@IdJuego int,
@IdDesarrollador int,
@Nombre varchar(50),
@Descripcion varchar(MAX),
@Activo bit
AS
BEGIN
UPDATE Juegos
SET IdDesarrollador = @IdDesarrollador, Nombre = @Nombre, Descripcion = @Descripcion, Activo = @Activo
WHERE IdJuego=@IdJuego
END
GO

CREATE PROC SP_Juegos_Agregar
@IdDesarrollador int,
@Nombre varchar(50),
@Descripcion varchar(MAX),
@Activo bit
AS
BEGIN
INSERT INTO Juegos(IdDesarrollador,Nombre,Descripcion,Activo)
SELECT @IdDesarrollador,@Nombre,@Descripcion,@Activo
END
GO

CREATE PROC SP_Juegos_Eliminar
@IdJuego int
AS
DELETE FROM Juegos WHERE IdJuego = @IdJuego
GO


CREATE PROC SP_Usuarios_Obtener
AS
BEGIN
	SELECT Username , Contrasena as [Password], Descripcion, Email, Administrador, Activo
	FROM Usuarios
END
GO

CREATE PROC SP_Usuarios_Obtener_Por_Nombre
	@Nombre varchar(30)
AS
BEGIN
	SELECT * FROM Usuarios
	WHERE Username like '%' + @Nombre + '%'
END
GO

CREATE PROC SP_Usuarios_Actualizar
@Username varchar(30),
@Descripcion Varchar(MAX),
@Email varchar(50),
@Administrador bit,
@Activo bit
AS
BEGIN
	UPDATE Usuarios
	SET
		Username = @Username,
		Descripcion = @Descripcion,
		Email = @Email,
		Administrador = @Administrador,
		Activo = @Activo
	WHERE
		Username = @Username
END
GO

CREATE PROC SP_Usuarios_Eliminar
@Username varchar(30)
AS
DELETE FROM Usuarios WHERE Username = @Username
GO

CREATE PROC SP_Categorias_Actualizar
	@IdCategoria int,
	@Nombre varchar(30),
	@Activo bit
AS
BEGIN
	IF NOT EXISTS(select * from Categorias where @Nombre like nombre) or @Activo not like (select Activo from Categorias where IdCategoria like @IdCategoria)
	BEGIN
		UPDATE Categorias
		SET
			Nombre = @Nombre,
			Activo = @Activo
		WHERE
			IdCategoria = @IdCategoria
		RETURN @@ROWCOUNT;
	END
	ELSE RETURN -1
END
GO

CREATE PROC SP_Categorias_Agregar
	@Nombre varchar(30),
	@Activo bit
AS
BEGIN
	IF NOT EXISTS(select * from Categorias where @Nombre like nombre)
	BEGIN
		INSERT INTO Categorias(Nombre, Activo)
		VALUES (@Nombre, @Activo)
	END
	ELSE RETURN -1
END
GO

CREATE PROC SP_Categorias_Obtener_Por_Nombre
	@Nombre varchar(30)
AS
BEGIN
	SELECT * FROM Categorias
	WHERE Nombre like '%' + @Nombre + '%'
END
GO

CREATE PROC SP_Categorias_Obtener_Siguiente_Id
AS
BEGIN
	SELECT
  CASE
    WHEN (SELECT
        COUNT(1)
      FROM Categorias) = 0 THEN 1
    ELSE IDENT_CURRENT('Categorias') + 1
  END AS Current_Identity;
END
GO

CREATE PROCEDURE SP_Categorias_Obtener
AS
BEGIN
	SELECT IdCategoria, Nombre, Activo
	FROM Categorias
END
GO


CREATE PROCEDURE SP_Plataforma_Agregar
@Nombre varchar(30),
@Activo bit
AS
BEGIN
IF NOT EXISTS(SELECT * FROM Plataformas WHERE @Nombre like nombre)
BEGIN
INSERT INTO Plataformas
(
Nombre,
Activo
)
VALUES(@Nombre, @Activo)
END
ELSE RETURN -1
END
GO

CREATE PROCEDURE SP_Plataformas_Actualizar
@IdPlataforma int,
@Nombre varchar(30),
@Activo bit
AS
BEGIN
IF NOT EXISTS (SELECT * FROM PLATAFORMAS WHERE @Nombre LIKE Nombre) OR @Activo NOT LIKE (SELECT Activo FROM Plataformas WHERE IdPlataforma LIKE @IdPlataforma)
BEGIN
UPDATE Plataformas
SET Nombre=@Nombre, Activo=@Activo
WHERE IdPlataforma=@IdPlataforma
RETURN @@ROWCOUNT;
END
ELSE RETURN -1
END
GO

CREATE PROCEDURE SP_Plataformas_Obtener
AS
BEGIN
SELECT IdPlataforma, Nombre, Activo
FROM Plataformas
END
GO

CREATE PROCEDURE SP_Plataformas_Obtener_Por_Nombre
	@Nombre varchar(30)
AS
BEGIN
	SELECT * FROM Plataformas
	WHERE Nombre like '%' + @Nombre + '%'
END
GO

CREATE PROCEDURE SP_Plataformas_Obtener_Siguiente_Id
AS
BEGIN
	SELECT
  CASE
    WHEN (SELECT
        COUNT(1)
      FROM Plataformas) = 0 THEN 1
    ELSE IDENT_CURRENT('Plataformas') + 1
  END AS Current_Identity;
END
GO


CREATE PROCEDURE SP_Desarrolladores_Obtener
@idDesarrollador int = NULL
AS
BEGIN
SELECT IdDesarrollador, NombreDesarrollador, SitioWeb, UbicacionSede, Historia FROM Desarrolladores
WHERE (@idDesarrollador IS NULL OR IdDesarrollador=@idDesarrollador)
END
GO


CREATE PROCEDURE SP_JuegosXTiendas_Obtener
@filtro varchar(100) = null
AS
BEGIN
	IF @filtro IS NULL
		SELECT Juegos.Nombre AS Juego, Tiendas.Nombre AS Tienda, Juegos.IdJuego, Tiendas.IdTienda,
		JuegosXTiendas.SitioWeb [URL], Precio, PrecioRebajado [Precio rebajado], JuegosXTiendas.Activo
		FROM JuegosXTiendas
		INNER JOIN Juegos ON JuegosXTiendas.IdJuego=Juegos.IdJuego
		INNER JOIN Tiendas ON JuegosXTiendas.IdTienda=Tiendas.IdTienda
	ELSE
		SELECT Juegos.Nombre AS Juego, Tiendas.Nombre AS Tienda, Juegos.IdJuego, Tiendas.IdTienda,
		JuegosXTiendas.SitioWeb [URL], Precio, PrecioRebajado [Precio rebajado], JuegosXTiendas.Activo
		FROM JuegosXTiendas
		INNER JOIN Juegos ON JuegosXTiendas.IdJuego=Juegos.IdJuego
		INNER JOIN Tiendas ON JuegosXTiendas.IdTienda=Tiendas.IdTienda
		WHERE 
			Juegos.Nombre LIKE '%'+@filtro+'%' OR
			Tiendas.Nombre LIKE '%'+@filtro+'%' OR
			JuegosXTiendas.SitioWeb LIKE '%'+@filtro+'%'
END
GO

CREATE PROCEDURE SP_JuegosXTiendas_Actualizar
@IdJuego int,
@IdTienda int,
@SitioWeb varchar(100),
@Precio float,
@PrecioRebajado float,
@Activo bit
AS
BEGIN
	UPDATE JuegosXTiendas
	SET
		SitioWeb=@SitioWeb,
		Precio=@Precio,
		PrecioRebajado=@PrecioRebajado,
		Activo = @Activo
	WHERE IdJuego=@IdJuego AND IdTienda=@IdTienda
END
GO

CREATE PROC SP_JuegosXTiendas_Eliminar
@IdJuego int,
@IdTienda int
AS
BEGIN
	DELETE FROM JuegosXTiendas
	WHERE IdJuego=@IdJuego AND IdTienda=@IdTienda
END
GO

CREATE PROC SP_JuegosXTiendas_Agregar
@IdJuego int,
@IdTienda int,
@SitioWeb varchar(100),
@Precio float,
@PrecioRebajado float,
@Activo bit
AS
BEGIN
	INSERT INTO  JuegosXTiendas  (IdJuego, IdTienda, SitioWeb, Precio, PrecioRebajado, Activo)
	VALUES (@IdJuego, @IdTienda, @SitioWeb, @Precio, @PrecioRebajado, @Activo)
END
GO

CREATE PROC SP_Desarolladores_Actualizar
	@IdDesarrollador int,
	@Nombre varchar(50),
	@SitioWeb varchar(100),
	@UbicacionSede varchar(100),
	@Historia varchar(100)
AS
BEGIN
	UPDATE Desarrolladores
	SET
		NombreDesarrollador = @Nombre,
		SitioWeb = @SitioWeb,
		UbicacionSede = @UbicacionSede,
		Historia = @Historia

	WHERE
		IdDesarrollador = @IdDesarrollador
END
GO

CREATE PROC SP_Desarolladores_Agregar
	@Nombre varchar(50),
	@SitioWeb varchar(100),
	@UbicacionSede varchar(100),
	@Historia varchar(100)
AS
BEGIN
	INSERT INTO Desarrolladores(NombreDesarrollador, SitioWeb, UbicacionSede, Historia)
	VALUES (@Nombre, @SitioWeb, @UbicacionSede, @Historia)
END
GO

CREATE PROCEDURE SP_Desarolladores_Obtener
AS
BEGIN
	SELECT IdDesarrollador, NombreDesarrollador,  SitioWeb, UbicacionSede, Historia
	FROM Desarrolladores
END
GO

CREATE PROC SP_Imagenes_Actualizar
	@IdJuego int,
	@NombreArchivo varchar(50),
	@Orden int,
	@activo bit
AS
BEGIN
	UPDATE JuegosImagenes
	SET
		nombreArchivo = @NombreArchivo,
		Orden = @Orden,
		activo = @activo

	WHERE
		IdJuego = @IdJuego
END
GO

CREATE PROC SP_Imagenes_Agregar
	@Nombre varchar(50),
	@SitioWeb varchar(100),
	@UbicacionSede varchar(100),
	@Historia varchar(100)
AS
BEGIN
	INSERT INTO Desarrolladores(NombreDesarrollador, SitioWeb, UbicacionSede, Historia)
	VALUES (@Nombre, @SitioWeb, @UbicacionSede, @Historia)
END
GO

CREATE PROCEDURE SP_Imagenes_Obtener
@idJuego int = NULL
AS
BEGIN
	SELECT IdJuego, NombreArchivo,  Orden, activo
	FROM JuegosImagenes
	WHERE (@idJuego IS NULL OR IdJuego=@idJuego)
END
GO

CREATE PROC SP_JuegosXTiendas_Existe
@IdJuego int,
@IdTienda int
AS
BEGIN
	SELECT COUNT(1) FROM JuegosXTiendas where IdJuego=@IdJuego and IdTienda=@IdTienda
END
GO

CREATE PROC SP_Obtener_Cantidad_Usuarios
AS
SELECT COUNT(*) FROM Usuarios WHERE Activo = 1
go
CREATE PROC SP_Obtener_Cantidad_Juegos
AS
SELECT COUNT(*) FROM Juegos WHERE Activo = 1
GO
CREATE PROC SP_Obtener_Cantidad_Opiniones
AS
SELECT COUNT(*) FROM Opiniones WHERE Activo = 1
GO

CREATE PROC SP_Categorias_ObtenerPorJuego
@IdJuego int
AS
BEGIN
	SELECT C.IdCategoria, C.Nombre, C.Activo
	FROM Categorias AS C
		INNER JOIN JuegosXCategorias JC ON C.IdCategoria = JC.IdCategoria
	WHERE C.Activo=1 AND JC.IdJuego=@IdJuego
END
GO

CREATE PROC SP_Plataformas_ObtenerPorJuego
@IdJuego int
AS
BEGIN
	SELECT P.IdPlataforma, P.Nombre, P.Activo
	FROM Plataformas AS P
		INNER JOIN JuegosXPlataformas JP ON P.IdPlataforma = JP.IdPlataforma
	WHERE JP.IdJuego=@IdJuego
END
GO

CREATE PROC SP_Tiendas_ObtenerPorJuego
@IdJuego int
AS
BEGIN
	SELECT T.IdTienda, T.Nombre, T.SitioWeb, T.RutaImagen, T.Activo
	FROM Tiendas AS T
		INNER JOIN JuegosXTiendas JT ON T.IdTienda=JT.IdTienda
	WHERE JT.IdJuego=@IdJuego
END
GO


CREATE PROC SP_JuegosXTiendas_ObtenerPorJuego
@IdJuego int
AS
BEGIN
	SELECT JT.IdJuego, JT.IdTienda, JT.Precio, JT.PrecioRebajado, JT.Activo
	FROM JuegosXTiendas JT
	WHERE JT.IdJuego=@IdJuego
END
GO