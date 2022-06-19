<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AdminDashboard.aspx.cs" Inherits="Vistas.AdminDashboard"%>
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
                    <div class="search-selection">
                        <button type="button" class="btn-store">
                            <i class="fa-solid fa-cart-arrow-down big icon-jquery-store"></i>
                            <p>Tiendas</p>
                        </button>
                    </div>
                </div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <div class="form-floating ctrl-game">
                    <input type="text" onchange="filter2(this, '<%=GridViewGames.ClientID %>')"  class="form-control bg-dark text-light no-borders" id="txtSearchGame" placeholder="Buscar juego">
                    <label for="floatingSearchGame" class="text-light">Buscar datos de juego</label>
                </div>
                <div class="form-floating ctrl-user">
                    <input type="text" onchange="filter2(this, '<%=GridViewUsers.ClientID %>')" class="form-control bg-dark text-light no-borders" id="txtSearchUser" placeholder="Buscar usuario">
                    <label for="floatingSearchUser" class="text-light">Buscar datos de usuario</label>
                </div>
                <div class="form-floating ctrl-store">
                    <input type="text" onkeyup="filter2(this, '<%=GridViewStores.ClientID %>')" class="form-control bg-dark text-light no-borders" id="txtSearchStore" placeholder="Buscar tienda">
                    <label for="floatingSearchStore" class="text-light">Buscar datos de tienda</label>
                </div>
                <asp:GridView ID="GridViewGames" runat="server" AutoGenerateEditButton="True" CssClass="grd-games w-100 bg-dark-carbon ctrl-game">
                </asp:GridView>
                <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateEditButton="True" CssClass="grd-user w-100 bg-dark-carbon ctrl-user" AutoGenerateColumns="False" OnRowCancelingEdit="GridViewUsers_RowCancelingEdit" OnRowEditing="GridViewUsers_RowEditing" OnRowUpdating="GridViewUsers_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Usuario">
                            <EditItemTemplate>
                                <asp:Label ID="lblGVUsersUsername" runat="server" Text='<%# Bind("Username") %>' ></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVUsersUsuario" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVUsersDescripcion" runat="server" Text='<%# Bind("Descripcion") %>' ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVUsersDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVUsersEmail" runat="server" T Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVUsersEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Administrador">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkGVUsersAdministrador" runat="server" Checked='<%# Bind("Administrador") %>'  />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkGVUsersAdministrador" runat="server" Checked='<%# Bind("Administrador") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Activo">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkGVUsersActivo" runat="server" Checked='<%# Bind("Activo") %>'  />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkGVUsersActivo" runat="server" Checked='<%# Bind("Activo") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridViewStores" CssClass="grd-user w-100 bg-dark-carbon ctrl-store" runat="server" AutoGenerateEditButton="True" DataKeyNames="Id" AutoGenerateColumns="False" OnRowEditing="TiendaEdit" OnRowCancelingEdit="TiendaCancelEdit" OnRowUpdating="TiendaUpdate">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <EditItemTemplate>
                                <asp:Label ID="lblGVStoresID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVStoresID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tienda">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVStoresTienda" runat="server" Text='<%# Eval("Tienda") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVStoresTienda" runat="server" Text='<%# Eval("Tienda") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Imagen">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVStoresImagen" runat="server" Text='<%# Eval("Imagen") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVStoresImagen" runat="server" Text='<%# Eval("Imagen") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sitio Web">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVStoresSitioWeb" runat="server" Text='<%# Eval("Sitio Web") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVStoresSitioWeb" runat="server" Text='<%# Eval("Sitio Web") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Activo">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkGVStoresActivo" runat="server" Checked='<%# Eval("Activo") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkGVStoresActivo" runat="server" Checked='<%# Eval("Activo") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </main>
    <script>
        var options = ["user", "game", "store"];
        var active;
        <%--Ocultar searchbars dependiendo que opcion se eliga--%>
        $(document).ready(function () {
            active = "<%=Active%>";
            for (let option of options) {
                $(`.ctrl-${option}`).hide();
            }
            $(`.btn-user`).click(() => { btnClick("user") });
            $(`.btn-game`).click(() => { btnClick("game") });
            $(`.btn-store`).click(() => { btnClick("store") });

            if (active != "")
                btnClick(active);
        });

        function btnClick(clicked) {
            let others = options.filter((val) => { return val != clicked; });
            for (let other of others) $(`.ctrl-${other}`).hide();
            if (active=="") { // Reproducir animacion en primer click
                active = clicked;
                $(`.ctrl-${clicked}`).slideDown();
            }
            else $(`.ctrl-${clicked}`).show();
            $(`.icon-jquery-${clicked}`).addClass('sign-red text-light');
            for (let other of others) $(`.icon-jquery-${other}`).removeClass('sign-red text-light');
        }
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

</asp:Content>
