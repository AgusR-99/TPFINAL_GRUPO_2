<%@ Page Title="Listado" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="Vistas.Listado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="main bg-dark-carbon">
        <div class="box-flex">
            <div class="listado-wrapper">
                <div class="top-nav glow-red-under-nav">
                    <asp:Label ID="lblCantResultados" runat="server"></asp:Label>
                    <button class="btn glow-red text-light btn-filtrar" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Filtrar</button>
                </div>
                <div class="articulos-wrapper">
                    <asp:Repeater ID="rptResultados" runat="server">
                        <ItemTemplate>
                            <article class="articulos-unit">
                                <img src="/Imagenes/placeholder-image.jpg" alt="portada" class="articulo-portada articulo-portada-w" />
                                <div class="articulo-body">
                                    <p class="articulo-nombre"><%# ((Entidades.Juego)GetDataItem()).getNombre() %></p>
                                    <small><strong>Plataforma: </strong><%# String.Join(", ", ((Entidades.Juego)GetDataItem()).GetPlataformas()) %></small>
                                    <br />
                                    <small><strong>Categorías: </strong><%# String.Join(", ", ((Entidades.Juego)GetDataItem()).GetCategorias()) %></small>
                                    <p class="articulo-descripcion"><%# ((Entidades.Juego)GetDataItem()).getDescripcion() %></p>
                                </div>
                                <div class="articulo-under">
                                    <p class="articulo-precio">Precio: <%# ValueOrDefault(((Entidades.Juego)GetDataItem()).getPrecio(), "No disponible") %></p>
                                    <p class="articulo-rating"><%# ValueOrDefault(((Entidades.Juego)GetDataItem()).getRating(), " - ")  %></p>
                                </div>
                            </article>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="offcanvas-end bg-dark" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header text-light">
                    <h5 class="offcanvas-title" id="offcanvasRightLabel">Filtrar por:</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item bg-dark text-light">
                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                <button class="accordion-button collapsed bg-dark text-light"
                                    type="button" data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseOne"
                                    aria-expanded="true"
                                    aria-controls="panelsStayOpen-collapseOne">
                                    <div>
                                        <p>Ordenar por:</p>
                                        <p>Mas populares</p>
                                    </div>
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioOrder" id="flexRadioOrder1" checked>
                                        <label class="form-check-label" for="flexRadioOrder1">Mas populares </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioOrder" id="flexRadioOrder2">
                                        <label class="form-check-label" for="flexRadioOrder2">Menos populares </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioOrder" id="flexRadioOrder3">
                                        <label class="form-check-label" for="flexRadioOrder3">Mayor precio </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioOrder" id="flexRadioOrder4">
                                        <label class="form-check-label" for="flexRadioOrder4">Menor precio </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item bg-dark text-light">
                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                <button class="accordion-button collapsed bg-dark text-light"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseTwo"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseTwo">
                                    Elegir categoria
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory0" checked>
                                        <label class="form-check-label" for="flexCheckCategory0">Accion </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory1">
                                        <label class="form-check-label" for="flexCheckCategory1">Aventura </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory2">
                                        <label class="form-check-label" for="flexCheckCategory2">RPG </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory3">
                                        <label class="form-check-label" for="flexCheckCategory3">Deportes </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item bg-dark text-light">
                            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                <button class="accordion-button collapsed bg-dark text-light"
                                    type="button" data-bs-toggle="collapse"
                                    data-bs-target="#panelsStayOpen-collapseThree"
                                    aria-expanded="false"
                                    aria-controls="panelsStayOpen-collapseTwo">
                                    Elegir plataforma
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory4" checked>
                                        <label class="form-check-label" for="flexCheckCategory4">Xbox </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory5">
                                        <label class="form-check-label" for="flexCheckCategory5">Playstation </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory6">
                                        <label class="form-check-label" for="flexCheckCategory6">PC </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="flexCheckCategory" id="flexCheckCategory7">
                                        <label class="form-check-label" for="flexCheckCategory7">Nintendo Switch </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
		<%--Usar JS media queries en vez de JQuery media queries ya que no toma scrollbar --%> function myFunction(x) {
            if (x.matches) { // Si se iguala media query
                $(".offcanvas-end").removeClass("offcanvas"); // Offcanvas pasa a ser sidebar
                $(".offcanvas-end").removeClass("bg-dark"); // Offcanvas pasa a ser sidebar
                $(".top-nav").removeClass("glow-red-under-nav");
            } else {
                $(".offcanvas-end").addClass("offcanvas"); // Offcanvas cumple su rol
                $(".offcanvas-end").addClass("bg-dark"); // Offcanvas pasa a ser sidebar
            }
        }
        var x = window.matchMedia("(min-width: 992px)");
        myFunction(x);
        x.addListener(myFunction);
    </script>
    <script>
    </script>

</asp:Content>
