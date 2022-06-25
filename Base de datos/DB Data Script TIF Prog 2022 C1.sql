USE [TIF2022_PROG]
GO

INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'Pedro', N'pp123', NULL, N'pedro@user.com', 1, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES ('NTTSalva', N'ss123', NULL, N'salva@user.com', 0, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'agusR-99', N'aa123', NULL, N'agus@user.com', 0, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'jorge', N'jj123', NULL, N'jorge@user.com', 0, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'superjuan', N'sj123', NULL, N'sjuan@user.com', 1, 1)
GO
INSERT [dbo].[Tiendas]([Nombre],[SitioWeb],[RutaImagen],[Activo])
VALUES ('Epic Games','https://store.epicgames.com/','',1)
GO
INSERT [dbo].[Tiendas]([Nombre],[SitioWeb],[RutaImagen],[Activo])
VALUES ('Steam','https://store.steampowered.com/','',1)
GO
INSERT [dbo].[Tiendas]([Nombre],[SitioWeb],[RutaImagen],[Activo])
VALUES ('Microsoft Store','https://xbox.com/','',1)
GO
INSERT [dbo].[Tiendas]([Nombre],[SitioWeb],[RutaImagen],[Activo])
VALUES ('Origin','https://www.origin.com/','',1)
GO
INSERT [dbo].[Desarrolladores]([NombreDesarrollador],[SitioWeb],[UbicacionSede],[Historia])
VALUES ('Electronic Arts','https://www.ea.com/','','Estamos dedicados a crear experiencias de juego nuevas, innovadoras y envolventes.')
GO
INSERT [dbo].[Desarrolladores]([NombreDesarrollador],[SitioWeb],[UbicacionSede],[Historia])
VALUES ('Rockstar Games','https://www.rockstargames.com/','','')
GO
INSERT [dbo].[Desarrolladores]([NombreDesarrollador],[SitioWeb],[UbicacionSede],[Historia])
VALUES ('Activision','https://www.activision.com/','','Fundada en 1979, Activision continúa revolucionando el mundo del entretenimiento.')
GO
INSERT [dbo].[Desarrolladores]([NombreDesarrollador],[SitioWeb],[UbicacionSede],[Historia])
VALUES ('Ubisoft','https://www.ubisoft.com/','','')
GO
INSERT [dbo].[Desarrolladores]([NombreDesarrollador],[SitioWeb],[UbicacionSede],[Historia])
VALUES ('Square Enix','https://www.square-enix.com/','','')
GO
INSERT [dbo].[Desarrolladores]([NombreDesarrollador],[SitioWeb],[UbicacionSede],[Historia])
VALUES ('From Software','https://www.fromsoftware.jp/','','')
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Grand Theft  Auto V',2,'Un joven estafador callejero, un ladrón de bancos retirado y un psicópata aterrador',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('FIFA22',1,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Far Cry 6',4,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Battlefield2042',1,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('COD: WARZONE',3,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Red Dead Redemption II',2,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Hitman: Absolution',5,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Final Fantasy XV',5,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Elden Ring',6,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Bloodborne',6,'',1)
GO
INSERT [dbo].[Juegos]([Nombre],[IdDesarrollador],[Descripcion],[Activo])
VALUES ('Sekiro: Shadows Die Twice',6,'',1)