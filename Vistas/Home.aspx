<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vistas.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>Tp final</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Electrolize&family=Roboto&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="normalize.css" />
		<script src="https://kit.fontawesome.com/29a077070a.js" crossorigin="anonymous"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="styles.css" />
	</head>
	<body>
		<form id="form1" runat="server">
			<div id="root">
				<header class="header"><%--Props navbar--%> <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
						<div class="container-fluid"><%--Texto inicial--%> <a class="navbar-brand neon" href="#">Bienvenido</a><%--Boton colapsar--%> <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0"><%--Inicio--%> <li class="nav-item">
										<a class="nav-link active" aria-current="page" href="#">Inicio</a>
									</li><%--Ingresar--%> <li class="nav-item">
										<a class="nav-link" aria-current="page" href="#">Ingresar</a>
									</li><%--Registrarse--%> <li class="nav-item">
										<div class="btn-wrapper">
											<a class="nav-link active hover-effect" href="#">
												<span>Registrarme</span>
											</a>
										</div>
									</li><%--Dropdown categorias--%> <li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Categorias </a><%--Menu dropdown--%> <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li>
												<a class="dropdown-item" href="#">Accion</a>
											</li>
											<li>
												<a class="dropdown-item" href="#">Aventura</a>
											</li>
											<li>
												<a class="dropdown-item" href="#">RPG</a>
											</li>
											<li>
												<a class="dropdown-item" href="#">Deportes</a>
											</li>
										</ul>
									</li><%--Perfil--%> <li class="nav-item disabled">
										<a class="nav-link disabled">Perfil</a>
									</li>
								</ul><%--Searchbar--%> <div class="searchbar">
									<form class="d-flex" role="search">
										<input class="form-control me-2" type="search" placeholder="Buscar juegos" aria-label="Search">
										<button class="btn btn-outline-red btn-outline-success" type="submit">
											<i class="fas fa-search"></i>
										</button>
									</form>
								</div>
							</div>
						</div>
					</nav>
				</header>
				<main class="main">
                    <%--Heading principal--%>
					<div class="section-wrapper">
						<div class="bienvenida-wrapper">
							<div class="bienvenida-texto">
                                <h1>La base de datos de juegos mas grande del mundo</h1>
								<p>Descubre los juegos con la mayores puntuaciones, guarda los titulos de tus juegos deseados y obten ofertas lo antes posible</p>
                            </div>
                            <img src="Imagenes/welcome.png" alt="img bienvenida" />
                        </div>
                    </div>
					<div class="galeria-wrapper">
						<%--Carousel--%>
					<div class="section-wrapper">
						<section class="galeria">
                            <h1 class="neon-sign">Nuevos</h1>
							<div class="glass">
								<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
								<div class="carousel-wrapper">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="/Imagenes/placeholder-image.jpg" class="d-block w-50" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/Imagenes/placeholder-image.jpg" class="d-block w-50" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="/Imagenes/placeholder-image.jpg" class="d-block w-50" alt="...">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
							</div>
                            </div>
						</section>
					</div>
                    <%--Nuevos--%>
					<div class="section-wrapper">
						<section class="galeria">
							<h1 class="neon-sign">Populares</h1>
							<div class="producto-wrapper glass">
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
							</div>
						</section>
					</div>
                    <%--Populares--%>
					<div class="section-wrapper">
						<section class="galeria">
							<h1 class="neon-sign">Proximos</h1>
							<div class="producto-wrapper glass">
								<article class="producto-unit borders">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
								<article class="producto-unit">
									<img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
									<div class="producto-descripcion">
										<p class="producto-rating">Rating</p>
										<p class="producto-precio">$1234</p>
									</div>
								</article>
							</div>
						</section>
					</div>
                    <%--En rebaja--%>
					<div class="section-wrapper">
                        <section class="galeria">
                            <h1 class="neon-sign">En rebaja</h1>
                            <div class="producto-wrapper glass">
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                            </div>
                        </section>
                    </div>
                    <%--Baratos--%>
					<div class="section-wrapper">
                        <section class="galeria">
                            <h1 class="neon-sign">Baratos</h1>
                            <div class="producto-wrapper glass">
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                                <article class="producto-unit">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion">
                                        <p class="producto-rating">Rating</p>
                                        <p class="producto-precio">$1234</p>
                                    </div>
                                </article>
                            </div>
                        </section>
                    </div>
                    </div>
				</main>
				<footer class="footer">
					<div class="footer-wrapper">
						
					</div>
				</footer>
			</div>
		</form>
	</body>
</html>
