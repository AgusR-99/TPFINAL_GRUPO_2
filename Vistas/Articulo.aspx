<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="Articulo.aspx.cs" Inherits="Vistas.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="main">
    <div class="articulo-main-wrapper">
        <div class="articulo-main">
            <div class="articulo-top">
                <h2><asp:Label runat="server" ID="lblNombreJuego"></asp:Label></h2>
            </div>
            <div class="articulo-content-wrapper">
                <div class="articulo-portada">
                    <img src="/Imagenes/placeholder-image.jpg" alt="portada" />
                </div>
                <div class="articulo-score-wrapper">
                    <div class="articulo-score">
                        <aside class="articulo-score-left-wrapper">
                            <asp:Label runat="server" ID="lblRatingJuego"></asp:Label>
                        </aside>
                        <div class="articulo-score-right">
                            <p><strong><small>Puntuacion de usuarios</small></strong></p>
                            <p><small><asp:Label runat="server" ID="lblOpinionesPrefix"></asp:Label><strong><asp:Label runat="server" ID="lblOpinionesCantidad"></asp:Label></strong></small></p>
                        </div>
                    </div>
                </div>
                <div class="articulo-data">
                    <p><small><strong>Desarrollador: <asp:Label runat="server" ID="lblDesarrollador"></asp:Label></strong></small></p>
                    <p><small><strong>Categoria: <asp:Label runat="server" ID="lblCategoria"></asp:Label></strong></small></p>
                    <p><small><strong>Fecha de lanzamiento: <asp:Label runat="server" ID="lblFechaLanzamiento"></asp:Label></strong></small></p>
                    <p><small><strong>Plataformas: </strong><asp:Label runat="server" ID="lblPlataforma"></asp:Label></small></p>
                    <p><small><strong>Sitio web: </strong> <asp:HyperLink runat="server" ID="linkSitioWeb"></asp:HyperLink></small></p>
                    <p><small><strong>Precio: </strong><asp:Label runat="server" ID="lblPrecio"></asp:Label></small></p>
                    <p><small><strong>Tiendas:</strong></small></p>
                    <p><small><asp:BulletedList runat="server" ID="listTiendas" DisplayMode="HyperLink"></asp:BulletedList></small></p>
                </div>
            </div>
            <div class="articulo-summary">
                <small><strong>Resumen: </strong> <asp:Label runat="server" ID="lblDescripcion"></asp:Label></small>
            </div>
        </div>
        <div class="articulo-review-wrapper">
            <div class="articulo-review-heading">
                <h2>Reviews de usuarios</h2>
            </div>
             <%if (LoggedIn)
               {%>
                 <div class="review-prompt-wrapper">
                     <div class="review-prompt-heading">
                         <h5><asp:Label runat="server" ID="lblHeadingOpinion"></asp:Label>
                             <asp:Label runat="server" ID="lblNombreJuegoOpinion"></asp:Label></h5>
                         <asp:Label ID="lblMsg" runat="server"></asp:Label>
                     </div>
                     <div class="review-prompt-textarea">
                         <div class="review-prompt-icon-wrapper">
                             <div class="dashboard-element dashboard-username">
                                 <i class="fa-regular fa-user big"></i>
                             </div>
                         </div>
                         <div class="form-group">
                             <asp:TextBox runat="server" CssClass="form-control bg-dark text-light" ID="txtUserReview" TextMode="MultiLine"></asp:TextBox>
                             <p><small>Limite de 2000 caracteres por opinion</small></p>
                             <div class="review-bottom">
                                 <div class="rating-wrapper">
                                     <div class="input-group input-group-lg">
                                         <span class="input-group-text text-light glow-cyan"><small>Tu rating</small></span>
                                         <asp:DropDownList runat="server" ID="ddlUserRating" CssClass="bg-dark text-light form-control"></asp:DropDownList>
                                     </div>
                                 </div>
                                 <div class="btn-wrapper">
                                     <asp:Button runat="server" CssClass="btn glow-cyan text-light" ID="btnSend" OnClick="btnSend_Click" Text="Enviar" />
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             <%}%>
            <div class="articulo-review-categories">
                <p><small>Positivas: </small><strong><asp:Label ID="lblReviewPositivas" runat="server"></asp:Label></strong></p>
                <p><small>Variadas: </small><strong><asp:Label ID="lblReviewVariadas" runat="server"></asp:Label></strong></p>
                <p><small>Negativas: </small><strong><asp:Label ID="lblReviewNegativas" runat="server"></asp:Label></strong></p>
            </div>
            <div class="review-wrapper">
                <asp:Repeater ID="repReviews" runat="server" onitemdatabound="repReviews_ItemDataBound">
                    <ItemTemplate>
                        <article class="articulo-review">
                            <div class="articulo-rating-wrapper">
                                <asp:Label ID="lblCalificacion" runat="server" Text='<%# Eval("Calificacion") %>'></asp:Label>
                            </div>
                            <div class="articulo-body">
                                <strong><p> <asp:Label ID="lblUsername" runat="server" CssClass="articulo-puntuacion-media" Text='<%# Eval("Username") %>'></asp:Label></p></strong>
                                <asp:Label ID="lblComentario" runat="server" CssClass="articulo-descripcion" Text='<%# Eval("Comentario") %>'></asp:Label>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    </main>
</asp:Content>
