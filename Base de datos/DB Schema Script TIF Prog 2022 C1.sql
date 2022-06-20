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
	NombreImagen varchar(50) NULL,
	CONSTRAINT PK_Plataformas PRIMARY KEY (IdPlataforma)
)

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
AS
BEGIN
	SELECT IdTienda as [ID], Nombre as [Tienda], RutaImagen as Imagen, SitioWeb as [Sitio Web], Activo
	FROM Tiendas
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

CREATE PROC SP_Usuarios_Obtener
AS
BEGIN
	SELECT Username , Contrasena as [Password], Descripcion, Email, Administrador, Activo
	FROM Usuarios
END
GO

CREATE PROC SP_Juegos_Obtener
AS
BEGIN
	SELECT Juegos.IdJuego, IdDesarrollador, Nombre, Descripcion, Juegos.Activo, NombreArchivo as [imagen] 
	FROM Juegos inner join JuegosImagenes on Juegos.IdJuego = JuegosImagenes.IdJuego
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

CREATE PROC SP_Categorias_Actualizar
	@IdCategoria int,
	@Nombre varchar(30),
	@Activo bit
AS
BEGIN
	UPDATE Categorias
	SET
		Nombre = @Nombre,
		Activo = @Activo
	WHERE
		IdCategoria = @IdCategoria
END
GO

CREATE PROC SP_Categorias_Agregar
	@Nombre varchar(30),
	@Activo bit
AS
BEGIN
	INSERT INTO Categorias(Nombre, Activo)
	VALUES (@Nombre, @Activo)
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
@NombreImagen varchar(50)
AS
BEGIN
INSERT INTO Plataformas
(
Nombre,
NombreImagen
)
VALUES(@Nombre, @NombreImagen)
END
GO

CREATE PROCEDURE SP_Plataformas_Actualizar
@IdPlataforma int,
@Nombre varchar(30),
@NombreImagen varchar(50)
AS
BEGIN
UPDATE Plataformas
SET Nombre=@Nombre, NombreImagen=@NombreImagen
WHERE IdPlataforma=@IdPlataforma
END
GO

CREATE PROCEDURE SP_Plataformas_Obtener
AS
BEGIN
SELECT IdPlataforma AS [ID], Nombre AS [Plataforma], NombreImagen AS [Imagen] FROM Plataformas
END
GO