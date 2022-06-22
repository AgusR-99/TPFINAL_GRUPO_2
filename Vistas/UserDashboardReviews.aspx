<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardReviews.aspx.cs" Inherits="Vistas.UserDashboardReviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="panelContent" runat="server">
    <script>
        /*Poner numero de articulos a generar*/
        $(function () {
            for (var i = 0; i < 15; i++) {
                $('.dashboard-panel-content-wrapper').append(
                    `<article class="articulos-unit articulo-review">
        <img src="/Imagenes/placeholder-image.jpg" alt="portada" class="articulo-portada" />
        <div class="articulo-under articulo-rating-wrapper">
            <p class="articulo-rating">9.5</p>
        </div>
        <div class="articulo-body">
            <p class="articulo-nombre">Nombre de juego</p>
            <strong class="articulo-puntuacion-media">Puntuacion media: 9.5</strong>
            <p class="articulo-descripcion"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum </p>
        </div>
    </article>`
                );
            }
        })
    </script>
</asp:Content>
