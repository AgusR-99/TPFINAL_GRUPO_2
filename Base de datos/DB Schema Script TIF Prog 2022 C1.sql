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
	FechaLanzamiento Date,
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
	Comentario varchar(2000) NULL,
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
	IdLink int IDENTITY(1,1) NOT NULL,
	IdJuego int NOT NULL,
	IdCategoria int NOT NULL,
	Activo bit NOT NULL,
	CONSTRAINT PK_JuegosXCategorias PRIMARY KEY (IdLink), 
	CONSTRAINT FK_JuegosXCategorias_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego),
	CONSTRAINT FK_JuegosXCategorias_Categorias
		FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
)
GO


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

CREATE TABLE Deseados
(
	Username varchar(30) NOT NULL,
	IdJuego int NOT NULL,
	CONSTRAINT PK_Deseados PRIMARY KEY (IdJuego,Username),
	CONSTRAINT FK_Deseados_Usuarios
		FOREIGN KEY (Username) REFERENCES Usuarios(Username),
	CONSTRAINT FK_Deseados_Juegos
		FOREIGN KEY (IdJuego) REFERENCES Juegos(IdJuego)
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
	WHERE Email = @Email 
		AND Contrasena = @Contrasena COLLATE SQL_Latin1_General_CP1_CS_AS
		AND Activo=1
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

create PROC SP_Juegos_Obtener
AS
BEGIN
	SELECT Juegos.IdJuego, IdDesarrollador, Nombre, Descripcion, FechaLanzamiento, Juegos.Activo 
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
@Fecha Date,
@Activo bit
AS
BEGIN
UPDATE Juegos
SET IdDesarrollador = @IdDesarrollador, Nombre = @Nombre, Descripcion = @Descripcion, FechaLanzamiento = @Fecha, Activo = @Activo
WHERE IdJuego=@IdJuego
END
GO

create PROC SP_Juegos_Agregar
@IdDesarrollador int,
@Nombre varchar(50),
@Descripcion varchar(MAX),
@Fecha date,
@Activo bit
AS
BEGIN
INSERT INTO Juegos(IdDesarrollador,Nombre,Descripcion, FechaLanzamiento, Activo)
SELECT @IdDesarrollador,@Nombre,@Descripcion, @Fecha, @Activo
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

CREATE PROC SP_Juegos_Obtener_Id_Por_Nombre
	@Nombre varchar(50),
	@OutputValue int output
AS
BEGIN
	SELECT @OutputValue = Juegos.IdJuego
	FROM Juegos
	WHERE Juegos.Nombre = @Nombre
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

CREATE PROC SP_Categorias_Obtener_Id_Por_Nombre
	@Nombre varchar(50),
	@OutputValue int output
AS
BEGIN
	SELECT @OutputValue = Categorias.IdCategoria
	FROM Categorias
	WHERE Categorias.Nombre = @Nombre
END
GO

CREATE PROC SP_Categorias_Obtener_Nombres_Por_Nombre
	@Nombre varchar(30)
AS
BEGIN
	SELECT Nombre FROM Categorias
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
@SoloActivo bit = 1
AS
BEGIN
	SELECT IdPlataforma, Nombre, Activo
	FROM Plataformas
	WHERE (@SoloActivo = 0 OR Activo=1)
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

CREATE PROC SP_JuegosXCategorias_Actualizar
	@IdLink int,
	@Juego varchar(50),
	@Categoria varchar(30),
	@Activo bit
AS
BEGIN
	DECLARE 
	@IdJuego int, @IdCategoria int
	exec SP_Juegos_Obtener_Id_Por_Nombre @Juego, @IdJuego output
	exec SP_Categorias_Obtener_Id_Por_Nombre @Categoria, @IdCategoria output
	--Si el ID Categoria obtenido NO existe en las tabla correspondiente, devolver error
	IF NOT EXISTS(
			SELECT Categorias.IdCategoria
			FROM Categorias WHERE Categorias.IdCategoria = @IdCategoria
			)
		BEGIN
			RETURN -1; --ERROR -1: IdCategoria obtenido no existe en tabla Categoria
		END
	--Si el ID Juego obtenidos NO existe en las tabla correspondiente, devolver error
	IF NOT EXISTS(
			SELECT Juegos.IdJuego
			FROM Juegos WHERE Juegos.IdJuego = @IdJuego
			)
		BEGIN
			RETURN -2; --ERROR -2: IdJuego obtenido no existe en tabla Juego
		END
	--Si la combinacion de IDs obtenidos existe en la tabla actual, validar si la combinacion es del campo a actualizar
	IF EXISTS(
			SELECT * FROM JuegosXCategorias
			WHERE IdCategoria = @IdCategoria AND
				  IdJuego = @IdJuego
	)
	BEGIN
		--Si es el campo a actualizar, validar si el campo activo fue modificado
		IF EXISTS(
				SELECT IdLink FROM JuegosXCategorias
				WHERE (Idlink = @IdLink AND
					   IdCategoria = @IdCategoria AND
					   IdJuego = @IdJuego
				)
		)
		BEGIN
			--Si el campo Activo no fue modificado, retornar error
			IF EXISTS(
					SELECT Activo FROM JuegosXCategorias
					WHERE (Activo = @Activo AND
						   Idlink = @IdLink
					)
			)
			BEGIN
				RETURN -4; --ERROR -4: registro ya existe en la tabla
			END
		END
		ELSE
		BEGIN
			RETURN -3; --ERROR -3: Ids obtenidos ya existen en la tabla
		END
	END
	UPDATE JuegosXCategorias
	SET
		IdCategoria = @IdCategoria,
		IdJuego = @IdJuego,
		Activo = @Activo
	WHERE
		IdLink = @IdLink
	RETURN @@ROWCOUNT;
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

CREATE PROC SP_JuegosXCategorias_Agregar
	@Juego varchar(50),
	@Categoria varchar(30),
	@Activo bit
AS
BEGIN
	DECLARE 
	@IdJuego int, @IdCategoria int
	exec SP_Juegos_Obtener_Id_Por_Nombre @Juego, @IdJuego output
	exec SP_Categorias_Obtener_Id_Por_Nombre @Categoria, @IdCategoria output
	--Si el ID Categoria obtenido NO existe en las tabla correspondiente, devolver error
	IF @IdCategoria is null
	BEGIN
		RETURN -1;
	END
	--Si el ID Juego obtenido NO existe en las tabla correspondiente, devolver error
	IF @IdJuego is null
	BEGIN
		RETURN -2;
	END
	--Si la combinacion de IDs ingresada existe en la tabla actual, devolver error
	IF EXISTS(
			SELECT * FROM JuegosXCategorias
			WHERE IdCategoria = @IdCategoria AND
				  IdJuego = @IdJuego
	)
	BEGIN
		RETURN -3;
	END
	INSERT INTO JuegosXCategorias(IdCategoria, IdJuego, Activo)
		VALUES (@IdCategoria, @IdJuego, @Activo)
		RETURN 1;
END
GO

CREATE PROC SP_JuegosXCategorias_Obtener
AS
BEGIN
	SELECT JuegosXCategorias.IdLink, JuegosXCategorias.Activo,
		   Juegos.Nombre as NombreJuego, Categorias.Nombre as NombreCategoria
	FROM JuegosXCategorias
	INNER JOIN Categorias ON Categorias.IdCategoria = JuegosXCategorias.IdCategoria
	INNER JOIN Juegos ON Juegos.IdJuego = JuegosXCategorias.IdJuego
END
GO

CREATE PROC .SP_JuegosXCategorias_Obtener_Por_Input
	@Input varchar(80)
AS
BEGIN
	SELECT JuegosXCategorias.IdLink, JuegosXCategorias.Activo,
		   Juegos.Nombre as NombreJuego, Categorias.Nombre as NombreCategoria
	FROM JuegosXCategorias
	INNER JOIN Categorias ON Categorias.IdCategoria = JuegosXCategorias.IdCategoria
	INNER JOIN Juegos ON Juegos.IdJuego = JuegosXCategorias.IdJuego
	WHERE CONCAT(Juegos.Nombre,' ',Categorias.Nombre) like '%' + @Input + '%' OR 
		  CONCAT(Categorias.Nombre,' ',Juegos.Nombre) like '%' + @Input + '%'
END
GO

CREATE PROC SP_JuegosXCategorias_Obtener_Siguiente_Id
AS
BEGIN
	SELECT
  CASE
    WHEN (SELECT
        COUNT(1)
      FROM JuegosXCategorias) = 0 THEN 1
    ELSE IDENT_CURRENT('JuegosXCategorias') + 1
  END AS Current_Identity;
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

CREATE PROC SP_Desarrolladores_Actualizar
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

CREATE PROC SP_Desarrolladores_Agregar
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

CREATE PROCEDURE SP_Desarrolladores_Obtener
@idDesarrollador int = NULL
AS
BEGIN
	SELECT IdDesarrollador, NombreDesarrollador,  SitioWeb, UbicacionSede, Historia
	FROM Desarrolladores
	WHERE (@idDesarrollador IS NULL OR IdDesarrollador=@idDesarrollador)
END
GO

CREATE PROC SP_Desarrolladores_Obtener_Por_Nombre
	@Nombre varchar(30)
AS
BEGIN
	SELECT * FROM Desarrolladores
	WHERE NombreDesarrollador like '%' + @Nombre + '%'
END
GO

CREATE PROC SP_Imagenes_Actualizar
	@IdJuego int,
	@NombreArchivo varchar(50),
	@NombreAnterior varchar(50),
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
		IdJuego = @IdJuego and
		NombreArchivo = @NombreAnterior
END
GO

CREATE PROC SP_Imagenes_Agregar
	@idJuego int,
	@NombreArchivo varchar(50),
	@Orden int,
	@activo BIT
AS
BEGIN
	INSERT INTO JuegosImagenes(IdJuego, NombreArchivo, Orden, activo)
	VALUES (@idJuego, @NombreArchivo, @Orden, @activo)
END
GO

CREATE PROCEDURE SP_Imagenes_Obtener
@idJuego int = NULL,
@SoloActivo bit = 0
AS
BEGIN
	SELECT IdJuego, NombreArchivo,  Orden, activo
	FROM JuegosImagenes
	WHERE (@idJuego IS NULL OR IdJuego=@idJuego) AND
		 (@SoloActivo = 0 OR Activo=1)
	ORDER BY IdJuego,Orden
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
@IdJuego int,
@SoloActivo bit = 1
AS
BEGIN
	SELECT C.IdCategoria, C.Nombre, C.Activo
	FROM Categorias AS C
		INNER JOIN JuegosXCategorias JC ON C.IdCategoria = JC.IdCategoria
	WHERE (@SoloActivo=0 OR C.Activo=1) AND JC.IdJuego=@IdJuego
END
GO

CREATE PROC SP_Plataformas_ObtenerPorJuego
@IdJuego int,
@SoloActivo bit = 1
AS
BEGIN
	SELECT P.IdPlataforma, P.Nombre, P.Activo
	FROM Plataformas AS P
		INNER JOIN JuegosXPlataformas JP ON P.IdPlataforma = JP.IdPlataforma
	WHERE JP.IdJuego=@IdJuego AND
		(@SoloActivo = 0 OR P.Activo=1)
END
GO

CREATE PROC SP_Tiendas_ObtenerPorJuego
@IdJuego int,
@SoloActivo bit = 1
AS
BEGIN
	SELECT T.IdTienda, T.Nombre, T.SitioWeb, T.RutaImagen, T.Activo
	FROM Tiendas AS T
		INNER JOIN JuegosXTiendas JT ON T.IdTienda=JT.IdTienda
	WHERE (@SoloActivo = 0 OR (JT.Activo = 1 AND T.Activo=1)) AND JT.IdJuego=@IdJuego
END
GO


CREATE PROC SP_JuegosXTiendas_ObtenerPorJuego
@IdJuego int,
@SoloActivo bit = 1
AS
BEGIN
	SELECT JT.IdJuego, JT.IdTienda, JT.SitioWeb, JT.Precio, JT.PrecioRebajado, JT.Activo
	FROM JuegosXTiendas JT
	WHERE (@SoloActivo = 0 OR JT.Activo = 1) AND JT.IdJuego=@IdJuego
END
GO

CREATE PROC SP_Opiniones_ObtenerPorJuego
@IdJuego int
AS
BEGIN
	SELECT IdJuego, Username, Calificacion, Comentario, Activo
	FROM Opiniones
	WHERE IdJuego=@IdJuego
END
GO

CREATE PROC SP_Opiniones_Agregar
	@IdJuego int,
	@Username varchar(30),
	@Calificacion tinyint,
	@Comentario varchar(1500)
AS
BEGIN
	INSERT INTO Opiniones VALUES (@IdJuego, @Username, @Calificacion, @Comentario, 1);
END
GO

CREATE PROC SP_Opiniones_Actualizar
	@IdJuego int,
	@Username varchar(30),
	@Calificacion tinyint,
	@Comentario varchar(1500)
AS
BEGIN
	UPDATE Opiniones
	SET
		Calificacion = @Calificacion,
		Comentario = @Comentario
	WHERE
		IdJuego = @IdJuego AND Username = @Username;
END
GO

CREATE PROCEDURE SP_SignUp
(
@Username varchar(30),
@Contrasena varchar(50),
@Email varchar(50),
@Administrador bit,
@Activo bit
)
AS
IF EXISTS(SELECT * FROM Usuarios WHERE @Username LIKE Username)
BEGIN
RETURN -1;
END
ELSE IF EXISTS(SELECT * FROM Usuarios WHERE @Email LIKE Email)
BEGIN
RETURN 0;
END
ELSE
BEGIN
INSERT INTO Usuarios
(
Username,
Contrasena,
Email,
Administrador,
Activo
)
VALUES(@Username,@Contrasena,@Email,@Administrador,@Activo)
END
GO

CREATE PROC SP_Deseados_ObtenerPorUsuario
@Username varchar(30)
AS
BEGIN
	SELECT d.Username, d.IdJuego
	FROM Deseados d
		INNER JOIN Juegos j ON j.IdJuego=d.IdJuego
	WHERE d.Username=@Username 
		AND j.Activo=1
END
GO

CREATE PROC SP_Opiniones_ObtenerPorUsuario
@username varchar(30)
AS
BEGIN
	SELECT IdJuego, Username, Calificacion, Comentario, Activo
	FROM Opiniones
	WHERE Username=@username
END
GO

CREATE PROCEDURE SP_Usuarios_ActualizarDatos
(
@usuariocomparacion varchar(30),
@usuario varchar(30),
@contrasena varchar(50),
@descripcion varchar(MAX),
@email varchar(50)
)
AS
IF EXISTS(SELECT * FROM Usuarios WHERE @usuario LIKE Username)
BEGIN
RETURN -1;
END
BEGIN
UPDATE Usuarios
SET
Username=@usuario,
Contrasena=@contrasena,
Descripcion=@descripcion,
Email=@email
WHERE Username=@usuariocomparacion
END
GO

CREATE PROCEDURE SP_JuegosXPlataformas_Obtener
@IdJuego int,
@IdPlataforma int
AS
BEGIN
	SELECT j.Nombre AS Juego, j.IdJuego, p.Nombre AS Plataforma, p.IdPlataforma
	FROM JuegosXPlataformas jp
		INNER JOIN Juegos j ON j.idJuego = jp.IdJuego
		INNER JOIN Plataformas p ON p.IdPlataforma = jp.IdPlataforma
	WHERE 
		(@IdJuego=-1 OR @IdJuego=jp.IdJuego) AND
		(@IdPlataforma=-1 OR @IdPlataforma=jp.IdPlataforma)
END
GO

CREATE PROC SP_JuegosXPlataformas_Existe
@IdJuego int,
@IdPlataforma int
AS
BEGIN
	SELECT COUNT(IdJuego)
	FROM JuegosXPlataformas
	WHERE IdJuego=@IdJuego AND IdPlataforma=@IdPlataforma
END
GO

CREATE PROC SP_JuegosXPlataformas_Agregar
@IdJuego int,
@IdPlataforma int
AS
BEGIN
	INSERT INTO JuegosXPlataformas (IdJuego,IdPlataforma)
		VALUES(@IdJuego,@IdPlataforma)
END
GO

CREATE PROC SP_JuegosXPlataformas_Eliminar
@IdJuego int,
@IdPlataforma int
AS
BEGIN
	DELETE FROM JuegosXPlataformas
	WHERE IdJuego=@IdJuego AND IdPlataforma=@IdPlataforma
END
GO

CREATE PROCEDURE SP_Categorias_Activos
(
@Activo bit
)
AS
BEGIN
SELECT IdCategoria, Nombre, Activo FROM Categorias
WHERE Activo=@Activo
END
GO

CREATE PROCEDURE SP_Juegos_Activos
(
@Activo bit
)
AS
BEGIN
SELECT IdJuego, IdDesarrollador, Nombre, Descripcion, FechaLanzamiento, Activo
FROM Juegos
WHERE Activo=@Activo
END
GO

CREATE PROCEDURE SP_Juegos_ObtenerRecientes
AS
BEGIN
SELECT IdJuego, IdDesarrollador, Nombre, Descripcion, FechaLanzamiento, Activo
FROM Juegos
ORDER BY FechaLanzamiento DESC
END
GO

CREATE PROCEDURE SP_Plataformas_Activos
(
@Activo bit
)
AS
BEGIN
SELECT IdPlataforma, Nombre, Activo FROM Plataformas
WHERE Activo=@Activo
END
GO

CREATE PROCEDURE SP_Usuarios_Activos
(
@Activos bit
)
AS
BEGIN
	SELECT Username , Contrasena, Descripcion, Email, Administrador, Activo
	FROM Usuarios
WHERE Activo=@Activos
END
GO

CREATE PROCEDURE SP_Usuarios_Administrador
(
@Administrador bit
)
AS
BEGIN
	SELECT Username , Contrasena, Descripcion, Email, Administrador, Activo
	FROM Usuarios
	WHERE Administrador=@Administrador
END
GO
