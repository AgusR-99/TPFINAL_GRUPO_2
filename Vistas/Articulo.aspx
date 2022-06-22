<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="Articulo.aspx.cs" Inherits="Vistas.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="main">
    <div class="articulo-main-wrapper">
        <div class="articulo-main">
            <div class="articulo-top">
                <h2>Nombre de juego</h2>
            </div>
            <div class="articulo-content-wrapper">
                <div class="articulo-portada">
                    <img src="/Imagenes/placeholder-image.jpg" alt="portada" />
                </div>
                <div class="articulo-score-wrapper">
                    <div class="articulo-score">
                        <aside class="articulo-score-left">
                            <h1>9.5</h1>
                        </aside>
                        <div class="articulo-score-right">
                            <p><strong><small>Puntuacion de usuarios</small></strong></p>
                            <p><small>Basado en <strong>6 criticas</strong></small></p>
                        </div>
                    </div>
                </div>
                <div class="articulo-data">
                    <p><small><strong>Desarrollador: Rockstar North</strong></small></p>
                    <p><small><strong>Plataformas: </strong>Playstation, Xbox, PC</small></p>
                    <p><small><strong>Sitio web: </strong> <a href="#">https://www.rockstargames.com/</a></small></p>
                    <p><small><strong>Precio: </strong> 1234</small></p>
                </div>
            </div>
            <div class="articulo-summary">
                <small><strong>Resumen: </strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</small>
            </div>
        </div>
        <div class="articulo-review-wrapper">
            <div class="articulo-review-heading">
                <h2>Reviews de usuarios</h2>
            </div>
            <div class="review-prompt-wrapper">
                <div class="review-prompt-heading">
                    <h5>Escribe una review para ::Nombre de juego::</h5>
                </div>
                <div class="review-prompt-textarea">
                    <div class="review-prompt-icon-wrapper">
                        <div class="dashboard-element dashboard-username">
                            <i class="fa-regular fa-user big"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control bg-dark text-light" id="exampleFormControlTextarea1" rows="3"></textarea>
                        <div class="review-bottom">
                            <div class="rating-wrapper">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-text text-light glow-cyan"><small>Tu rating</small></span>
                                    <input type="text" class="form-control bg-dark text-light" maxlength="2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                                </div>
                            </div>
                            <div class="btn-wrapper">
                                <button class="btn glow-cyan text-light" type="button">Enviar</button>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            <div class="articulo-review-categories">
                <p><small>Positivas: </small><strong>6</strong></p>
                <p><small>Variadas: </small><strong>0</strong></p>
                <p><small>Negativas: </small><strong>0</strong></p>
            </div>
            <div class="review-wrapper">
            </div>
        </div>
    </div>
    </main>
    <script>
        /*Poner numero de articulos a generar*/
        $(function() {
            for (var i = 0; i < 15; i++) {
                $('.review-wrapper').append(
                    `<article class="articulos-unit articulo-review">
                    <div class= "articulo-under articulo-rating-wrapper" >
                    <p class="articulo-rating">9.5</p>
                    </div >
                    <div class="articulo-body">
                    <strong class="articulo-puntuacion-media">someUserName</strong>
                    <p class="articulo-descripcion"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum </p>
                    </div>
                    </article >`
                );
            }
        })
    </script>
</asp:Content>
