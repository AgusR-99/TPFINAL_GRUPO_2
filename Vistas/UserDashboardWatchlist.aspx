<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardWatchlist.aspx.cs" Inherits="Vistas.UserDashboard" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="panelContent">
    <h2 id="lblVacio" runat="server">Aún no has marcado ningún juego deseado.</h2>
    <asp:Repeater ID="rptResultados" runat="server">
        <ItemTemplate>
            <article class="articulos-unit" onclick="goToGame(<%# ((Entidades.Juego)GetDataItem()).getID() %>)">
                <img src="<%# ValueOrDefault(((Entidades.Juego)GetDataItem()).getPortada(), "/Imagenes/placeholder-image.jpg") %>" onclick="" alt="portada" class="articulo-portada articulo-portada-w" />
                <div class="articulo-body">
                    <p class="articulo-nombre"><%# ((Entidades.Juego)GetDataItem()).getNombre() %></p>
                    <small><strong>Plataforma: </strong><%# String.Join(", ", ((Entidades.Juego)GetDataItem()).GetPlataformas()) %></small>
                    <br />
                    <small><strong>Categorías: </strong><%# String.Join(", ", ((Entidades.Juego)GetDataItem()).GetCategorias()) %></small>
                    <p class="articulo-descripcion"><%# FitText(((Entidades.Juego)GetDataItem()).getDescripcion(), 125) %></p>
                </div>
                <div class="articulo-under">
                    <p class="articulo-precio">Precio: <%# ValueOrDefault(((Entidades.Juego)GetDataItem()).getPrecio(), "No disponible") %></p>
                    <p class="articulo-rating"><%# ValueOrDefault(((Entidades.Juego)GetDataItem()).getRating(), " - ")  %></p>
                </div>
            </article>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
