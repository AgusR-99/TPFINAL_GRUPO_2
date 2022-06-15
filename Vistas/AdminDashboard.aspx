<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Vistas.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="main bg-dark-carbon">
        <div class="dashboard-wrapper">
            <div class="analytics-main-wrapper">
                <h1>Dashboard administrador</h1>
                <div class="analytics-main bg-dark-carbon">
                    <div class="analytics-box">
                        <aside class="analytics-icon">
                            <i class="fa-solid fa-user big text-glow-pink"></i>
                        </aside>
                        <div class="analytics-description">
                            <p class="analytics-name">Usuarios</p>
                            <p class="analytics-number">9999</p>
                        </div>
                    </div>
                    <div class="analytics-box">
                        <aside class="analytics-icon">
                            <i class="fa-solid fa-gamepad big text-glow-orange"></i>
                        </aside>
                        <div class="analytics-description">
                            <p class="analytics-name">Juegos</p>
                            <p class="analytics-number">9999</p>
                        </div>
                    </div>
                    <div class="analytics-box">
                        <aside class="analytics-icon">
                            <i class="fa-solid fa-star-half-stroke big text-glow-cyan"></i>
                        </aside>
                        <div class="analytics-description">
                            <p class="analytics-name">Reviews</p>
                            <p class="analytics-number">9999</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="selection bg-dark-carbon">
                <h1 class="selection-heading">Administrar</h1>
                <div class="search-selection-wrapper">
                    <div class="search-selection">
                        <button type="button" class="btn-game">
                            <i class="fa-solid fa-gamepad big icon-jquery-game"></i>
                            <p>Juegos</p>
                        </button>
                    </div>
                    <div class="search-selection">
                        <button type="button" class="btn-user">
                            <i class="fa-solid fa-user big icon-jquery-user"></i>
                            <p>Usuarios</p>
                        </button>
                    </div>
                </div>
                <div class="form-floating ctrl-game">
                    <input type="text" onkeyup="filter2(this, '<%=GridViewGames.ClientID %>')"  class="form-control bg-dark text-light no-borders" id="txtSearchGame" placeholder="Buscar juego">
                    <label for="floatingSearchGame" class="text-light">Buscar datos de juego</label>
                </div>
                <div class="form-floating ctrl-user">
                    <input type="text" onkeyup="filter2(this, '<%=GridViewUsers.ClientID %>')" class="form-control bg-dark text-light no-borders" id="txtSearchUser" placeholder="Buscar usuario">
                    <label for="floatingSearchUser" class="text-light">Buscar datos de usuario</label>
                </div>
                <asp:GridView ID="GridViewGames" DataSourceID="SqlDataSourceGame" CssClass="grd-games w-100 bg-dark-carbon ctrl-game" runat="server"></asp:GridView>
                <asp:GridView ID="GridViewUsers" DataSourceID="SqlDataSourceUser" CssClass="grd-user w-100 bg-dark-carbon ctrl-user" runat="server"></asp:GridView>
            </div>
        </div>
    </main>
    <script>
        <%--Ocultar searchbars dependiendo que opcion se eliga--%>
        $(document).ready(function () {
            $(".ctrl-user").hide();
            $(".ctrl-game").hide();
            var active = false;
            $(".btn-game").click(function () {
                $(".ctrl-user").hide();
                if (!active) { // Reproducir animacion en primer click
                    active = true;
                    $(".ctrl-game").slideDown();
                }
                else $(".ctrl-game").show();
                $(".icon-jquery-game").addClass('sign-red text-light');
                $(".icon-jquery-user").removeClass('sign-red text-light');
            });
            $(".btn-user").click(function () {
                $(".ctrl-game").hide();
                if (!active) { // Reproducir animacion en primer click
                    active = true;
                    $(".ctrl-user").slideDown();
                }
                else $(".ctrl-user").show();
                $(".icon-jquery-user").addClass('sign-red text-light');
                $(".icon-jquery-game").removeClass('sign-red text-light');
            });
        });
    </script>
    <script>
        function filter2(phrase, id) {
            var words = phrase.value.toLowerCase().split(" ");
            var table = document.getElementById(id);
            var ele;
            for (var r = 1; r < table.rows.length; r++) {
                ele = table.rows[r].innerHTML.replace(/<[^>]+>/g, "");
                var displayStyle = 'none';
                for (var i = 0; i < words.length; i++) {
                    if (ele.toLowerCase().indexOf(words[i]) >= 0)
                        displayStyle = '';
                    else {
                        displayStyle = 'none';
                        break;
                    }
                }
                table.rows[r].style.display = displayStyle;
            }
        }
    </script>
     
    <asp:SqlDataSource
        id="SqlDataSourceGame"
        runat="server"
        >
    </asp:SqlDataSource>
    <asp:SqlDataSource
        id="SqlDataSourceUser"
        runat="server"
        DataSourceMode="DataSet"
        >
    </asp:SqlDataSource>
</asp:Content>
