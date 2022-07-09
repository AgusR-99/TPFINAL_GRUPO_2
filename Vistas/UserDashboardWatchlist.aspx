<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardWatchlist.aspx.cs" Inherits="Vistas.UserDashboard" %>
<%@ Import Namespace="Vistas" %> 
<%@ Import Namespace="Entidades" %> 

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="panelContent">
    <h2 id="lblVacio" runat="server">Aún no has agregado juegos a tu lista de deseados.</h2>
    <asp:Repeater ID="rptResultados" runat="server">
        <ItemTemplate>
            <article class="articulos-unit" onclick="goToGame(<%# ((Juego)GetDataItem()).getID() %>)">
                <img src="<%# VistasAux.ValueOrDefault(((Juego)GetDataItem()).getPortada(), "/Imagenes/placeholder-image.jpg") %>" onclick="" alt="portada" class="articulo-portada articulo-portada-w" />
                <div class="articulo-body">
                    <p class="articulo-nombre"><%# ((Juego)GetDataItem()).getNombre() %></p>
                    <small><strong>Plataforma: </strong><%# String.Join(", ", ((Juego)GetDataItem()).GetPlataformas()) %></small>
                    <br />
                    <small><strong>Categorías: </strong><%# String.Join(", ", ((Juego)GetDataItem()).GetCategorias()) %></small>
                    <p class="articulo-descripcion"><%# VistasAux.FitText(((Juego)GetDataItem()).getDescripcion(), 125) %></p>
                </div>
                <div class="articulo-under">
                    <p class="articulo-precio">Precio: <%# VistasAux.ValueOrDefault(((Juego)GetDataItem()).getPrecio(), "No disponible") %></p>
                    <p class="articulo-rating"><%# VistasAux.ValueOrDefault(((Juego)GetDataItem()).getRating(), " - ")  %></p>
                </div>
            </article>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
