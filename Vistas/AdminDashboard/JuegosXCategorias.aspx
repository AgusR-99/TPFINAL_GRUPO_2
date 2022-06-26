<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="True" CodeBehind="JuegosXCategorias.aspx.cs" Inherits="Vistas.JuegosXCategorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <asp:Label runat="server" ID="test"></asp:Label>
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group ctrl-category input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearch" placeholder="Buscar por juego o categoria"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView
        ID="GVGamesXCat"
        runat="server"
        CssClass="grd w-100 bg-dark-carbon"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="GamesXCat_RowCancelingEdit"
        OnRowEditing="GamesXCat_RowEditing"
        OnRowUpdating="GamesXCat_RowUpdating"
        OnPageIndexChanging="GamesXCatData_PageIndexChanging"
        ShowFooter="true"
        AllowPaging="true">
        <Columns>
            <%--1ra col - botones--%>
            <asp:TemplateField>
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" CssClass="btn btn-outline-success" runat="server" CommandName="Update" Text="Actualizar" OnClientClick="return confirm('¿Esta seguro que desea actualizar la fila?')" />
                    <asp:LinkButton ID="btnCancel" CssClass="btn btn-outline-warning" runat="server" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" CssClass="btn btn-outline-primary" runat="server" CommandName="Edit" Text="Editar" />
                </ItemTemplate>
            </asp:TemplateField>
            <%--2da col - ID Link --%>
            <asp:TemplateField HeaderText="ID Link">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesXCat_IDLink" runat="server" Text='<%# Eval("IdLink") %>'></asp:Label>
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXCat_IDLink" runat="server" Text='<%# Eval("IdLink") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--3ra col - Nombre del juego --%>
            <asp:TemplateField HeaderText="Juego">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesXCat_Game" runat="server" Text='<%# Eval("NombreJuego") %>'></asp:TextBox>
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXCat_Game" runat="server" Text='<%# Eval("NombreJuego") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--4ta col - Nombre de categoria --%>
            <asp:TemplateField HeaderText="Categoria">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesXCat_Cat" runat="server" Text='<%# Eval("NombreCategoria") %>'></asp:TextBox>
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXCat_Cat" runat="server" Text='<%# Eval("NombreCategoria") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--5ta col - Check si activo--%>
            <asp:TemplateField HeaderText="Activo">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVGamesXCat_Activo" runat="server" Checked='<%# Eval("Activo") %>' />
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVGamesXCat_Activo" runat="server" Checked='<%# Eval("Activo") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="grd-control-wrapper d-flex justify-content-evenly">
        <div class="grd-control">
            <asp:LinkButton ID="btnInsert" CssClass="btn btn-primary" runat="server" CommandName="Insert" Text="Agregar" OnClick="BtnInsert_Click" />
        </div>
        <div class="grd-control">
            <span><strong>ID Link</strong></span>
            <asp:Label ID="lblGVGamesXCat_IDLink" runat="server" Text=''></asp:Label>
        </div>
        <div class="grd-control">
            <span><strong>Juego</strong></span>
            <asp:TextBox ID="txtGVGamesXCat_Game" runat="server" Text=''></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Categoria</strong></span>
            <asp:TextBox ID="txtGVGamesXCat_Cat" runat="server" Text=''></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Activo</strong></span>
            <asp:CheckBox ID="chkGVGamesXCat_Activo" runat="server" checked="true"/>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(InitializeRequest);
            prm.add_endRequest(EndRequest);

            //Inicializar funciones aca
            InitAutoCompl();

            $(".selection-game-cat").addClass("border-bottom-highlight")
        });

        function InitializeRequest(sender, args) {
        }

        //Reinicializar funciones aca despues de postback
        function EndRequest(sender, args) {
            InitAutoCompl();
        }

        function InitAutoCompl() {
            // Autocomplete de textbox de agregar categoria
            $("#<%= txtGVGamesXCat_Cat.ClientID %>").autocomplete({
                    source: '/CategoriaHandler.ashx'
            });

            // Autocomplete de textbox de editar categoria
            $("input[id*=txtGVGamesXCat_Cat]").autocomplete({
                source: '/CategoriaHandler.ashx'
            });

            // Autocomplete de textbox de agregar juego
            $("#<%= txtGVGamesXCat_Game.ClientID %>").autocomplete({
                source: '/JuegoHandler.ashx'
            });

            // Autocomplete de textbox de editar juego
            $("input[id*=txtGVGamesXCat_Game]").autocomplete({
                source: '/JuegoHandler.ashx'
            });
        }
    </script>    
</asp:Content>
