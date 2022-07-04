<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardReviews.aspx.cs" Inherits="Vistas.UserDashboardReviews" %>
<%@ Import Namespace="Entidades" %>
<%@ Import Namespace="Vistas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="panelContent" runat="server">
    <h2 id="lblVacio" runat="server">Aún no has dado tu opinión sobre ningún juego.</h2>
    <asp:Repeater ID="rptOpiniones" runat="server">
        <ItemTemplate>
            <article class="articulos-unit articulo-review <%# VistasAux.ReturnIf(!((KeyValuePair<Juego,Opinion>)GetDataItem()).Value.getActivo(), "text-secondary") %>" onclick="goToGame(<%# ((KeyValuePair<Juego,Opinion>)GetDataItem()).Key.getID() %>)">
                <img src="/Imagenes/placeholder-image.jpg" alt="portada" class="articulo-portada" />
                <div class="articulo-under articulo-rating-wrapper">
                    <p class="articulo-rating"><%# ((KeyValuePair<Juego,Opinion>)GetDataItem()).Value.getCalificacion() %></p>
                </div>
                <div class="articulo-body">
                    <p class="articulo-nombre"><%# ((KeyValuePair<Juego,Opinion>)GetDataItem()).Key.Nombre %> <%# VistasAux.ReturnIf(!((KeyValuePair<Juego, Opinion>)GetDataItem()).Value.getActivo(), "<span class=\"text-danger font-weight-bold\">Opinión oculta</span>") %></p>
                    <strong class="articulo-puntuacion-media">Puntuacion media: <%# ((KeyValuePair<Juego,Opinion>)GetDataItem()).Key.getRating() %></strong>
                    <p class="articulo-descripcion"><%# VistasAux.FitText( ((KeyValuePair<Juego,Opinion>)GetDataItem()).Key.getDescripcion(), 125) %></p>
                </div>
            </article>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
