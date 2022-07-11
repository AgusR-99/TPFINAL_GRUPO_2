<%@ Page Title="Listado" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="Vistas.Listado" %>
<%@ Import Namespace="Entidades" %>
<%@ Import Namespace="Vistas" %>

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
                                        <p class="articulo-rating circle-white"><%# VistasAux.ValueOrDefault(((Juego)GetDataItem()).getRating(), " - ")  %></p>
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
                                        <p id="orderedByText">Más populares</p>
                                    </div>
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">
                                    <div class="form-check">
                                        <input class="form-check-input order-radio" type="radio" name="flexRadioOrder" id="flexRadioOrder1" value="<%= (int)Negocio.NegocioJuego.Orden.MasPopular %>" <% if (Negocio.NegocioJuego.Orden.MasPopular == SelectedOrder()) {%>checked<%} %> />
                                        <label class="form-check-label" for="flexRadioOrder1">Más populares</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input order-radio" type="radio" name="flexRadioOrder" id="flexRadioOrder2" value="<%= (int)Negocio.NegocioJuego.Orden.MenosPopular %>" <% if (Negocio.NegocioJuego.Orden.MenosPopular == SelectedOrder()) { %>checked<%} %> />
                                        <label class="form-check-label" for="flexRadioOrder2">Menos populares</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input order-radio" type="radio" name="flexRadioOrder" id="flexRadioOrder3" value="<%= (int)Negocio.NegocioJuego.Orden.MayorPrecio %>" <% if(Negocio.NegocioJuego.Orden.MayorPrecio==SelectedOrder()) {%>checked<%} %> />
                                        <label class="form-check-label" for="flexRadioOrder3">Mayor precio</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input order-radio" type="radio" name="flexRadioOrder" id="flexRadioOrder4" value="<%= (int)Negocio.NegocioJuego.Orden.MenorPrecio %>" <% if(Negocio.NegocioJuego.Orden.MenorPrecio==SelectedOrder()) {%>checked<%} %> />
                                        <label class="form-check-label" for="flexRadioOrder4">Menor precio</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input order-radio" type="radio" name="flexRadioOrder" id="flexRadioOrder5" value="<%= (int)Negocio.NegocioJuego.Orden.Nuevos %>" <% if(Negocio.NegocioJuego.Orden.Nuevos==SelectedOrder()) {%>checked<%} %> />
                                        <label class="form-check-label" for="flexRadioOrder5">Nuevos</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input order-radio" type="radio" name="flexRadioOrder" id="flexRadioOrder6" value="<%= (int)Negocio.NegocioJuego.Orden.Proximos %>" <% if(Negocio.NegocioJuego.Orden.Proximos==SelectedOrder()) {%>checked<%} %> />
                                        <label class="form-check-label" for="flexRadioOrder6">Próximos</label>
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
                                    <div>
                                        <asp:button runat="server" class="btn btn-secondary" OnClientClick="checkAll('category'); return false;" Text="Seleccionar todos"/>
                                        <asp:button runat="server" class="btn btn-secondary" OnClientClick="uncheckAll('category'); return false;" Text="Deseleccionar todos"/>
                                    </div>
                                    <asp:Repeater ID="rptChecksCategoria" runat="server">
                                        <ItemTemplate>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input category-check" name="flexCheckCategory" id="flexCheckCategory" value="<%# ((Categoria)GetDataItem()).Id_Categoria %>" checked runat="server"/>
                                                <label class="form-check-label" for="flexCheckCategory"><%# ((Categoria)GetDataItem()).Nombre %> </label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
                                    <div>
                                        <asp:button runat="server" class="btn btn-secondary" OnClientClick="checkAll('platform'); return false;" Text="Seleccionar todos"/>
                                        <asp:button runat="server" class="btn btn-secondary" OnClientClick="uncheckAll('platform'); return false;" Text="Deseleccionar todos"/>
                                    </div>
                                    <asp:Repeater ID="rptChecksPlataforma" runat="server">
                                        <ItemTemplate>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input platform-check" name="flexCheckPlatform" id="flexCheckPlatform" value="<%# ((Plataforma)GetDataItem()).getID_Plataforma() %>" checked runat="server"/>
                                                <label class="form-check-label" for="flexCheckPlatform"><%# ((Plataforma)GetDataItem()).getNombre() %> </label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnBuscar" OnClientClick="return search()" CssClass="btn btn-primary" Text="Buscar" runat="server"/>
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
        $(function () {
            $("input[type=checkbox]").addClass("form-check-input");
            setOrderedBy();
            $('.order-radio').click(setOrderedBy);
        });

        function search() {
            let platforms = [], categories = [];
            if ($('.platform-check:not(:checked)').length!=0)
                for (let e of $('.platform-check:checked')) platforms.push($(e).attr("value"));
            if ($('.category-check:not(:checked)').length != 0)
                for (let e of $('.category-check:checked')) categories.push($(e).attr("value"));
            let order = $('.order-radio:checked').attr("value")

            window.location.href = `Listado.aspx?cat=${categories.join(',')}&plat=${platforms.join(',')}&ord=${order}`;
            return false;
        }

        function setOrderedBy() {
            var chkID = $('.order-radio:checked').attr("id");
            $('#orderedByText').text($(`.form-check-label[for=${chkID}]`).text());
        }

        function checkAll(type) {
            $(`.${type}-check`).prop('checked', true);
        }
        function uncheckAll(type) {
            $(`.${type}-check`).prop('checked', false);
        }


    </script>

</asp:Content>
