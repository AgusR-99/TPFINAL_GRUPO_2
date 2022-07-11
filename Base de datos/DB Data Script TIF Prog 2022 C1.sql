USE [TIF2022_PROG]
GO
SET IDENTITY_INSERT [dbo].[Desarrolladores] ON 
GO
INSERT [dbo].[Desarrolladores] ([IdDesarrollador], [NombreDesarrollador], [SitioWeb], [UbicacionSede], [Historia]) VALUES (1, N'Electronic Arts', N'https://www.ea.com/', N'California, EEUU', N'Electronic Arts Inc. es una empresa estadounidense desarrolladora y distribuidora de videojuegos, fundada por Trip Hawkins el 27 de mayo de 1982 en San Mateo, California. Sus oficinas centrales est�n en Redwood City, California')
GO
INSERT [dbo].[Desarrolladores] ([IdDesarrollador], [NombreDesarrollador], [SitioWeb], [UbicacionSede], [Historia]) VALUES (2, N'Rockstar Games', N'https://www.rockstargames.com/', N'Nueva York, EEUU', N'Rockstar Games es una compa��a desarrolladora y publicadora de videojuegos adquirido por el publicador de videojuegos Take-Two Interactive y creador del motor de videojuego RAGE. La compa��a es internacionalmente conocida por t�tulos como la serie Grand Theft Auto, Max Payne, Midnight Club o Red Dead. ')
GO
INSERT [dbo].[Desarrolladores] ([IdDesarrollador], [NombreDesarrollador], [SitioWeb], [UbicacionSede], [Historia]) VALUES (3, N'Activision', N'https://www.activision.com/', N'California, EEUU', N'Activision es una empresa de videojuegos estadounidense propiedad de Activision Blizzard. Fue el primer desarrollador y distribuidor independiente de este tipo de juegos, fundado el 1 de octubre de 1979 y con sede en Santa M�nica, California.?')
GO
INSERT [dbo].[Desarrolladores] ([IdDesarrollador], [NombreDesarrollador], [SitioWeb], [UbicacionSede], [Historia]) VALUES (4, N'Ubisoft', N'https://www.ubisoft.com/', N'Montreal, Canad�', N'Ubisoft Entertainment S. A. es una empresa desarrolladora y distribuidora de videojuegos francesa, fundada el 28 de marzo de 1986 en Carentoir, en Breta�a, Francia. Yves Guillemot, uno de los fundadores, es el actual director ejecutivo y presidente de la compa��a.')
GO
INSERT [dbo].[Desarrolladores] ([IdDesarrollador], [NombreDesarrollador], [SitioWeb], [UbicacionSede], [Historia]) VALUES (5, N'Square Enix', N'https://www.square-enix.com/', N'Tokio, Jap�n', N'Square Enix Holdings Co., Ltd. es una compa��a desarrolladora de videojuegos japonesa y distribuidora, ? m�s conocida por sus franquicias de videojuegos de rol como la saga Final Fantasy, Dragon Quest, y la saga de acci�n RPG Kingdom Hearts')
GO
INSERT [dbo].[Desarrolladores] ([IdDesarrollador], [NombreDesarrollador], [SitioWeb], [UbicacionSede], [Historia]) VALUES (6, N'From Software', N'https://www.fromsoftware.jp/', N'Tokio, Jap�n', N'FromSoftware, Inc. es una compa��a japonesa de videojuegos fundada en noviembre de 1986 conocida principalmente por ser los creadores de las series Armored Core, Demon''s Souls, King''s Field, Otogi, Tenchu, Dark Souls, Bloodborne, Sekiro: Shadows Die Twice y Elden Ring')
GO
SET IDENTITY_INSERT [dbo].[Desarrolladores] OFF
GO
SET IDENTITY_INSERT [dbo].[Juegos] ON 
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (1, 2, N'Grand Theft  Auto V', N'Cuando un joven estafador callejero, un ladr�n de bancos retirado y un psic�pata aterrador se ven involucrados con lo peor y m�s desquiciado del mundo criminal, del gobierno de los EE. UU. y de la industria del espect�culo, tendr�n que llevar a cabo una serie de peligrosos golpes para sobrevivir en una ciudad implacable en la que no pueden confiar en nadie. Y mucho menos los unos en los otros.  Grand Theft Auto V para PC ofrece a los jugadores la opci�n de explorar el galardonado mundo de Los Santos y el condado de Blaine con una resoluci�n de 4K y disfrutar del juego a 60 fotogramas por segundo.  El juego cuenta con m�ltiples y variadas opciones de personalizaci�n espec�ficas para ordenadores, con m�s de 25 ajustes configurables distintos para la calidad de las texturas, shader, teselado, antialiasing y muchos otros elementos, adem�s de opciones de personalizaci�n del rat�n y el teclado. Tambi�n es posible modificar la densidad de poblaci�n para controlar el tr�fico de veh�culos y peatones, y es compatible con dos y tres monitores, 3D y mandos ""plug-and-play"".  Grand Theft Auto V para PC tambi�n incluye Grand Theft Auto Online, compatible con 30 jugadores y dos espectadores. Grand Theft Auto Online para PC incluir� todas las mejoras y contenidos creados por Rockstar desde la fecha de lanzamiento de Grand Theft Auto Online, incluidos los golpes y los modos Adversario.  La versi�n para PC de Grand Theft Auto V y Grand Theft Auto Online incluye la vista en primera persona, que ofrece a los jugadores la posibilidad de explorar todos los detalles del mundo de Los Santos y el condado de Blaine de una forma totalmente nueva.  Grand Theft Auto V para PC tambi�n cuenta con el nuevo editor Rockstar, un conjunto de herramientas que permite grabar, editar y compartir v�deos de Grand Theft Auto V y Grand Theft Auto Online de manera r�pida y sencilla. Gracias al modo director del editor Rockstar, los jugadores pueden dar vida a sus ideas y crear escenas con personajes del juego, peatones e incluso animales. El editor cuenta con t�cnicas avanzadas de movimiento de c�mara, efectos de edici�n como im�genes a c�mara lenta o r�pida, varios filtros de c�mara, la posibilidad de a�adir canciones de las emisoras de radio de GTA V o controlar de forma din�mica la intensidad de la m�sica del juego. Los v�deos terminados pueden subirse directamente a YouTube y al Social Club de Rockstar Games desde el editor Rockstar para compartirlos de manera sencilla.', CAST(N'2015-04-14' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (2, 1, N'FIFA22', N'EA SPORTS� FIFA 22 acerca a�n m�s el juego a la realidad gracias a mejoras significativas en la jugabilidad y una nueva temporada de novedades en todos los modos.  �Qu� es FIFA?  Juega al juego del mundo con m�s de 17 000 jugadores, m�s de 700 equipos, m�s de 90 estadios y m�s de 30 ligas de todo el mundo.  MODOS DE JUEGO Modo Carrera :vive tus sue�os con FIFA 22, ya sea como m�nager o como futbolista. Crea el club m�s nuevo de FIFA, dise�a tus equipaciones y tu estadio y decide si quieres competir con la �lite o ascender desde las divisiones inferiores mientras encaminas a tu club hacia la gloria. Tambi�n puedes probar tus habilidades como futbolista con un modo Carrera de jugador m�s inmersivo, que te dar� m�s formas de progresar, alcanzar tus objetivos y sumergirte en tu viaje Pro mediante el juego.  VOLTA FOOTBALL: vuelve a conquistar las calles con VOLTA FOOTBALL. Crea tu futbolista, elige tu equipaci�n y expr�sate a tu manera, por tu cuenta o con tu plantilla, en las calles y pistas de f�tbol de todo el mundo. Consigue recompensas por tu habilidad con el bal�n gracias al nuevo estilo de juego redise�ado y juega cada temporada a eventos �nicos que tienen lugar en emplazamientos especiales, al tiempo que desbloqueas nuevo equipamiento mediante un nuevo sistema de progreso en la temporada, que te permite ganar XP en todas las recompensas que se ofrecen en VOLTA FOOTBALL sin importar el modo al que juegues.  FIFA Ultimate Team : Participa en el modo m�s popular de FIFA, FIFA Ultimate Team. Crea el equipo de tus sue�os con miles de futbolistas del mundo del f�tbol. Crea tu propio club dentro y fuera del campo y dales equipamiento personalizado, insignias y un estadio de FUT completo en el que poder dejar tu huella, y haz que equipo juegue partidos contra la IA u otros jugadores de la comunidad FUT. Adem�s, da la bienvenida a algunos de los jugadores m�s memorables del f�tbol en forma de nuevos h�roes de FUT: �algunas de estas leyendas del f�tbol ahora regresan al campo!  Autenticidad sin rival: juega con los mejores jugadores del mundo en las competiciones mundiales m�s importantes, como la ic�nica UEFA Champions League, la UEFA Europa League, la nueva UEFA Europa Conference League, la CONMEBOL Libertadores, la CONMEBOL Sudamericana, la Premier League, la Bundesliga, LaLiga Santander y otras muchas m�s.', CAST(N'2021-10-01' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (3, 4, N'Far Cry 6', N'Far Cry llega a Estados Unidos en la �ltima entrega de la exitosa franquicia.  Bienvenido a Hope County, Montana, la tierra de los valientes y de la libertad, pero tambi�n de la secta apocal�ptica conocida como "Puerta del Ed�n". Enfr�ntate a Joseph Seed, el l�der de la secta, y a sus hermanos para prender la llama de la resistencia y liberar a la comunidad.  ENFR�NTATE A LA SECTA LETAL Libera el condado de Hope solo o en en cooperativo de 2 jugadores. Recluta pistoleros y animales salvajes para derrotar a la secta.  UN MUNDO AGRESIVO Destruye la secta, y prep�rate para sufrir la ira de Joseph Seed y sus fieles.  ELIGE TU CAMINO �Crea tu personaje y elige tu aventura en el Far Cry m�s personalizable!  JUGUETES DIN�MICOS Controla b�lidos m�ticos, quads, aviones y mucho m�s.  MEC�NICAS DE JUEGO RE-DISE�ADAS Mejora tu experiencia de juego con tus ojos. Marca enemigos usando tu visi�n para mostrarle a tus aliados las potenciales amenazas. Compatible con cualquier componente de seguimiento ocular de Tobii Gaming.', CAST(N'2018-03-27' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (4, 1, N'Battlefield2042', N'Battlefield� 2042 es un shooter en primera persona que marca el regreso a la emblem�tica guerra total de la franquicia. Ad�ptate y sobrevive en un mundo en un futuro cercano transformado por el desorden. Forma tu patrulla y utiliza un arsenal de vanguardia en campos de batalla en constante cambio con 128 jugadores, una escala sin precedentes y una destrucci�n �pica.', CAST(N'2021-11-19' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (5, 3, N'COD: WARZONE', N'Call of Duty: Warzone fue desarrollado por Infinity Ward y Raven Software y publicado por Activision. Warzone permite el combate multijugador en l�nea entre 150 jugadores, aunque algunos modos de juego por tiempo limitado admiten 200 jugadores. El juego presenta tanto un juego multiplataforma como una progresi�n multiplataforma entre tres juegos.  El juego presenta tres modos principales: Saqueo (bot�n), resurgimiento y Battle royale. Warzone introduce un nuevo sistema de moneda en el juego que se puede utilizar en "Estaciones de compra" en Verdansk, isla de renacimiento y sus alrededores. Las entregas de "armamento" son un ejemplo de d�nde se puede intercambiar efectivo por acceso limitado a las clases de armas personalizadas de los jugadores (antes las clases se compart�an con las del modo multijugador de Modern Warfare, pero en el parche v1.29 de la temporada 6 las separaron, y ahora son diferentes los de Warzone con los de Modern Warfare y Call of Duty: Black Ops Cold War por la comodidad de los jugadores). Los jugadores tambi�n pueden usar dinero para comprar art�culos como "Rachas de bajas" y m�scaras Anti gas. Se puede encontrar dinero en efectivo saqueando edificios y matando a jugadores que tienen dinero en efectivo. En el lanzamiento, Warzone solo ofreci� el modo Tr�os, una capacidad de escuadr�n de tres jugadores. Sin embargo, en las actualizaciones de contenido gratuitas posteriores al lanzamiento, se han agregado al juego Solos (individual), D�os y Escuadrones.', CAST(N'2023-07-02' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (6, 2, N'Red Dead Redemption II', N'Am�rica, 1899.  Arthur Morgan y la banda de Van der Linde son forajidos en busca y captura. Mientras los agentes federales y los mejores cazarrecompensas de la naci�n les pisan los talones, la banda deber� abrirse camino por el abrupto territorio del coraz�n de Am�rica y sobrevivir a base de robos y peleas. Arthur deber� elegir entre sus propios ideales y la lealtad a la banda que lo vio crecer.  Con contenido adicional para el Modo Historia y un completo modo Foto, Red Dead Redemption 2 tambi�n incluye acceso gratuito al mundo multijugador compartido de Red Dead Online, en el que los jugadores asumen diversos roles para ganarse la vida a su manera en la frontera mientras persiguen a fugitivos buscados como cazarrecompensas, crean un negocio como comerciantes, descubren ex�ticos tesoros como coleccionistas, dirigen una destiler�a ilegal como licoristas y muchas cosas m�s.  Gracias a las nuevas mejoras gr�ficas y t�cnicas que permiten una mayor inmersi�n en el juego, Red Dead Redemption 2 para PC aprovecha al m�ximo la potencia de los equipos para conseguir que todos y cada uno de los aspectos de este gigantesco mundo lleno de detalles cobren vida. Incluye mayores distancias de dibujado; iluminaci�n global y oclusi�n ambiental de mayor calidad, para mejorar la luz tanto de d�a como de noche; reflejos mejorados y sombras m�s profundas y de mayor resoluci�n a todas las distancias; texturas de �rboles teseladas y texturas de hierba y pelaje mejoradas para aumentar el realismo de las plantas y animales.  Red Dead Redemption 2 para PC tambi�n ofrece compatibilidad con HDR, la posibilidad de utilizar pantallas de alta gama (con resoluciones 4K y superiores), configuraciones con varios monitores, con pantalla panor�mica, mayores tasas de fotogramas, etc.', CAST(N'2020-03-01' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (7, 5, N'Hitman: Absolution', N'HITMAN: ABSOLUTION sigue los pasos del asesino original mientras trabaja en su contrato m�s personal hasta la fecha. Traicionado por la Agencia y buscado por la polic�a, el Agente 47 se ve abocado a la b�squeda de la redenci�n en un mundo corrupto y retorcido.', CAST(N'2008-01-01' AS Date), 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (8, 5, N'Final Fantasy XV', N'', NULL, 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (9, 6, N'Elden Ring', N'', NULL, 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (10, 6, N'Bloodborne', N'', NULL, 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (11, 6, N'Sekiro: Shadows Die Twice', N'', NULL, 1)
GO
INSERT [dbo].[Juegos] ([IdJuego], [IdDesarrollador], [Nombre], [Descripcion], [FechaLanzamiento], [Activo]) VALUES (12, 1, N'Real Racing 3', N'Disfruta donde quieras de la experiencia automovil�stica definitiva, �incluida la F�rmula 1�! Coches reales. Circuitos reales. Gente real. Esto es Real Racing 3. �Lee la informaci�n tan importante que queremos contarte! Real Racing 3 es la reconocida franquicia que reinventa los juegos port�tiles de carreras: hay que vivirlo en persona. Esta aplicaci�n permite realizar compras integradas. Se puede desactivar esta funci�n en los ajustes del dispositivo. Esta aplicaci�n puede incluir contenidos de terceros. Electronic Arts no se hace responsable de esos contenidos. Con m�s de 500 millones de descargas, Real Racing 3 cuenta con 40 circuitos con licencia de 19 localizaciones reales, una parrilla de 43 coches y m�s de 250 veh�culos reproducidos al detalle de Porsche, Bugatti, Chevrolet, Aston Martin y Audi. El multijugador en tiempo real, los marcadores sociales, el centro dedicado a los campeonatos y Grand Prix� de Formula 1�, las contrarrelojes, la conducci�n nocturna y la innovadora tecnolog�a Time Shifted Multiplayer� (TSM) te permiten competir con quien quieras, donde quieras y cuando quieras.', CAST(N'2016-01-01' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'agusR-99', N'aa123', NULL, N'agus@user.com', 0, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'jorge', N'jj123', NULL, N'jorge@user.com', 0, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'NTTSalva', N'ss123', NULL, N'salva@user.com', 0, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'Pedro', N'pp123', N'Administrador, programador y gamer aficionado', N'pedro@user.com', 1, 1)
GO
INSERT [dbo].[Usuarios] ([Username], [Contrasena], [Descripcion], [Email], [Administrador], [Activo]) VALUES (N'superjuan', N'sj123', N'Administrador apasionado de nuestra web', N'sjuan@user.com', 1, 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (1, N'agusR-99', 5, N'Amoooo', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (1, N'Pedro', 5, N'Realmente lo que se dice un "Mundo Libre"', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (2, N'agusR-99', 5, N'', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (4, N'NTTSalva', 2, N'Esperaba m�s', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (6, N'NTTSalva', 4, N'', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (6, N'Pedro', 5, N'', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (9, N'agusR-99', 3, N'', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (12, N'jorge', 4, NULL, 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (12, N'Pedro', 5, N'Amo! Siempre am� este juego! Jugabilidad y realismo impresionante', 1)
GO
INSERT [dbo].[Opiniones] ([IdJuego], [Username], [Calificacion], [Comentario], [Activo]) VALUES (12, N'superjuan', 5, N'Me encanta', 1)
GO
SET IDENTITY_INSERT [dbo].[Plataformas] ON 
GO
INSERT [dbo].[Plataformas] ([IdPlataforma], [Nombre], [Activo]) VALUES (1, N'Play Station', 1)
GO
INSERT [dbo].[Plataformas] ([IdPlataforma], [Nombre], [Activo]) VALUES (2, N'XBOX', 1)
GO
INSERT [dbo].[Plataformas] ([IdPlataforma], [Nombre], [Activo]) VALUES (3, N'PC', 1)
GO
INSERT [dbo].[Plataformas] ([IdPlataforma], [Nombre], [Activo]) VALUES (5, N'PlayStation', 1)
GO
INSERT [dbo].[Plataformas] ([IdPlataforma], [Nombre], [Activo]) VALUES (6, N'Android', 1)
GO
INSERT [dbo].[Plataformas] ([IdPlataforma], [Nombre], [Activo]) VALUES (7, N'IOs', 0)
GO
SET IDENTITY_INSERT [dbo].[Plataformas] OFF
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (1, 1, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (1, 2, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (1, 3, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (2, 2, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (2, 3, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (6, 2, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (6, 3, 1)
GO
INSERT [dbo].[JuegosXPlataformas] ([IdJuego], [IdPlataforma], [Activo]) VALUES (7, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Activo]) VALUES (1, N'Accion', 1)
GO
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Activo]) VALUES (2, N'Aventura', 1)
GO
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Activo]) VALUES (3, N'RPG', 1)
GO
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Activo]) VALUES (4, N'Deportes', 1)
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Tiendas] ON 
GO
INSERT [dbo].[Tiendas] ([IdTienda], [Nombre], [RutaImagen], [SitioWeb], [Activo]) VALUES (1, N'Epic Games', N'epic.png', N'https://store.epicgames.com/', 1)
GO
INSERT [dbo].[Tiendas] ([IdTienda], [Nombre], [RutaImagen], [SitioWeb], [Activo]) VALUES (2, N'Steam', N'steamlogo.jpg', N'https://store.steampowered.com/', 1)
GO
INSERT [dbo].[Tiendas] ([IdTienda], [Nombre], [RutaImagen], [SitioWeb], [Activo]) VALUES (3, N'Microsoft Store', N'msft.jpg', N'https://xbox.com/', 1)
GO
INSERT [dbo].[Tiendas] ([IdTienda], [Nombre], [RutaImagen], [SitioWeb], [Activo]) VALUES (4, N'Origin', N'origin.jpg', N'https://www.origin.com/', 1)
GO
INSERT [dbo].[Tiendas] ([IdTienda], [Nombre], [RutaImagen], [SitioWeb], [Activo]) VALUES (5, N'Google PlayStore', N'gpl.png', N'https://play.google.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Tiendas] OFF
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (1, 1, N'https://store.epicgames.com/es-MX/p/grand-theft-auto-v', 560, NULL, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (1, 2, N'https://store.steampowered.com/app/271590/Grand_Theft_Auto_V/?l=spanish', 560, NULL, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (1, 3, N'https://www.microsoft.com/en-il/p/grand-theft-auto-v/bpj686w6s0nh', 700, NULL, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (2, 2, N'https://store.steampowered.com/app/1506830/FIFA_22/', 5000, NULL, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (3, 2, N'https://store.steampowered.com/app/552520/Far_Cry_5/', 2500, NULL, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (4, 2, N'https://store.steampowered.com/app/1517290/Battlefield_2042/', 6500, 6300, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (6, 1, N'https://store.epicgames.com/es-ES/p/red-dead-redemption-2', 2400, NULL, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (6, 2, N'https://store.steampowered.com/app/1174180/Red_Dead_Redemption_2/', 2150, 1800, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (9, 2, N'https://store.steampowered.com/app/1245620/ELDEN_RING/', 10.2, 5.85, 1)
GO
INSERT [dbo].[JuegosXTiendas] ([IdJuego], [IdTienda], [SitioWeb], [Precio], [PrecioRebajado], [Activo]) VALUES (12, 5, N'https://play.google.com/store/apps/details?id=com.ea.games.r3_row&hl=es_AR&gl=US', 1, 0, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (1, N'gtaV.png', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (1, N'gtaV_2.png', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (1, N'gtaV_3.png', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (2, N'fifa22.jpeg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (2, N'fifa22_2.jpg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (2, N'fifa22_3.jpg', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (3, N'farcry6.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (3, N'farcry6_2.jpeg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (3, N'farcry6_3.jpg', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (4, N'battlefield2042.png', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (4, N'battlefield2042_2.png', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (4, N'battlefield2042_3.png', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (5, N'warzone.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (5, N'warzone_2.jpeg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (5, N'warzone_3.jpg', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (6, N'reddead2.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (6, N'reddead2_2.jpg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (6, N'reddead2_3.png', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (7, N'Hitmanabs.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (7, N'Hitmanabs_2.png', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (7, N'Hitmanabs_3.jpg', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (8, N'finalfantasyXV.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (8, N'finalfantasyXV_2.jpg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (8, N'finalfantasyXV_3.png', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (9, N'eldenring.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (9, N'eldenring_2.jpg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (9, N'eldenring_3.png', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (10, N'bloodborne.png', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (10, N'bloodborne_2.jpg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (10, N'bloodborne_3.jpg', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (11, N'sekiro.jpg', 1, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (11, N'sekiro_2.jpg', 2, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (11, N'sekiro_3.jpg', 3, 1)
GO
INSERT [dbo].[JuegosImagenes] ([IdJuego], [NombreArchivo], [Orden], [Activo]) VALUES (12, N'RealRacing3.png', 1, 1)
GO
