<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vistas.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="main bg-home-page">
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
                    <div class="glass carousel-data-wrapper">
                        <div id="carouselMain" class="carousel slide" data-bs-ride="true">
                            <div class="carousel-wrapper">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="2" aria-label="Slide 3"></button>
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
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselMain" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselMain" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                        <div class="data-slide">
                            <p data-bs-target="#carouselMain" data-bs-slide-to="0" class="glow-red">Nombre juego 1</p>
                            <p data-bs-target="#carouselMain" data-bs-slide-to="1">Nombre juego 2</p>
                            <p data-bs-target="#carouselMain" data-bs-slide-to="2">Nombre juego 3</p>
                        </div>
                    </div>
                </section>
            </div>
            <%--Populares--%>
            <div class="section-wrapper">
                <section class="galeria">
                    <h1 class="neon-sign">Populares</h1>
                    <div class="producto-wrapper glass">
                        <asp:Repeater ID="rptPopulares" runat="server">
                            <ItemTemplate>
                                <article class="producto-unit neon-backlight backlight-cyan">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion inset-glow-cyan">
                                        <p class="producto-rating text-glow-cyan"><%# ((Entidades.Juego)GetDataItem()).getRating() + "★"%></p>
                                        <p class="producto-precio text-glow-cyan"><%# "$" + ((Entidades.Juego)GetDataItem()).getPrecio() %></p>
                                    </div>
                                </article>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </section>
            </div>
            <%--Proximos--%>
            <div class="section-wrapper">
                <section class="galeria">
                    <h1 class="neon-sign">Proximos</h1>
                    <div class="producto-wrapper glass">
                        <asp:Repeater ID="rptProximos" runat="server">
                            <ItemTemplate>
                                <article class="producto-unit neon-backlight backlight-cyan">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion inset-glow-cyan">
                                        <p class="producto-rating text-glow-cyan"><%# ((Entidades.Juego)GetDataItem()).getRating() + "★"%></p>
                                        <p class="producto-precio text-glow-cyan"><%# "$" + ((Entidades.Juego)GetDataItem()).getPrecio() %></p>
                                    </div>
                                </article>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </section>
            </div>
            <%--En rebaja--%>
            <div class="section-wrapper">
                <section class="galeria">
                    <h1 class="neon-sign">En rebaja</h1>
                    <div class="producto-wrapper glass">
                        <asp:Repeater ID="rptRebaja" runat="server">
                            <ItemTemplate>
                                <article class="producto-unit neon-backlight backlight-cyan">
                                    <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                                    <div class="producto-descripcion inset-glow-cyan">
                                        <p class="producto-rating text-glow-cyan"><%# ((Entidades.Juego)GetDataItem()).getRating() + "★"%></p>
                                        <p class="producto-precio text-glow-cyan"><%# "$" + ((Entidades.Juego)GetDataItem()).getPrecioRebajado() %></p>
                                    </div>
                                </article>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </section>
            </div>
            <%--Baratos--%>
            <div class="section-wrapper">
                <section class="galeria">
                    <h1 class="neon-sign">Baratos</h1>
                    <div class="producto-wrapper glass">
                        <asp:Repeater ID="rptBaratos" runat="server">
							<ItemTemplate>
                        <article class="producto-unit neon-backlight backlight-cyan">
                            <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                            <div class="producto-descripcion inset-glow-cyan">
                                <p class="producto-rating text-glow-cyan"><%# ((Entidades.Juego)GetDataItem()).getRating() + "★"%></p>
                                <p class="producto-precio text-glow-cyan"><%# "$" + ((Entidades.Juego)GetDataItem()).getSoloPrecio() %></p>
                            </div>
                        </article>
                        </ItemTemplate>
						</asp:Repeater>
                    </div>
                </section>
            </div>
        </div>
    </main>
    <script>
        $("#carouselMain").on('slide.bs.carousel', function (e) {
            var slideTo = $(e.relatedTarget).index();
            console.log(slideTo);
            $('.data-slide p').removeClass('glow-red').eq(slideTo).addClass('glow-red');
        })
    </script>

    <script>
        /*Poner numero de articulos a generar*/
        /*$(function () {
            for (var i = 0; i < 8; i++) {
                $('.producto-wrapper').append(
                    `<article class="producto-unit neon-backlight backlight-cyan">
                            <img class="producto-portada" src="Imagenes/placeholder-image.jpg" alt="Portada producto" />
                            <div class="producto-descripcion inset-glow-cyan">
                                <p class="producto-rating text-glow-cyan">Rating</p>
                                <p class="producto-precio text-glow-cyan">$1234</p>
                            </div>
                        </article>`
                );
            }
        })*/
    </script>
</asp:Content>
