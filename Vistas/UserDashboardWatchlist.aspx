<%@ Page Title="" Language="C#" MasterPageFile="~/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardWatchlist.aspx.cs" Inherits="Vistas.UserDashboard" %>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="panelContent">
    <script>
        /*Poner numero de articulos a generar*/
        $(function () {
            for (var i = 0; i < 15; i++) {
                $('.dashboard-panel-content-wrapper').append(
                    `<article class="articulos-unit">
                    <img src="/Imagenes/placeholder-image.jpg" alt="portada" class="articulo-portada articulo-portada-w" />
                    <div class="articulo-body">
                    <p class="articulo-nombre">Nombre de juego</p>
                    <small><strong>Plataforma: </strong>Xbox</small>
                    <p class="articulo-descripcion"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum </p>
                    </div>
                    <div class="articulo-under">
                    <p class="articulo-precio">1234</p>
                    <p class="articulo-rating">9.5</p>
                    </div>
                    </article>`
                );
            }
        })
    </script>
</asp:Content>