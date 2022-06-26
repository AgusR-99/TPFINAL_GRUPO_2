<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="JuegosXTiendasDashboard.aspx.cs" Inherits="Vistas.JuegosXTiendasDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearchGamesxstores" placeholder="Buscar juegosXTiendas"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-secondary" Text="Limpiar" OnClick="BtnClearSearch_Click"></asp:Button>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView ID="GridViewGamesXStores"
        runat="server"
        CssClass="grd-user w-100 bg-dark-carbon ctrl-gamesxstores"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="GridViewGamesXStores_RowCancelingEdit"
        OnRowEditing="GridViewGamesXStores_RowEditing"
        OnRowUpdating="GridViewGamesXStores_RowUpdating"
        OnRowDeleting="GridViewGamesXStores_RowDeleting"
        ShowFooter="true"
        AllowPaging="True" 
        OnPageIndexChanging="GridViewGamesXStores_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" CssClass="btn btn-outline-success" runat="server" CommandName="Update" Text="Actualizar" OnClientClick="return confirm('¿Está seguro que desea actualizar el registro?')" />
                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-outline-danger" runat="server" CommandName="Delete" Text="Eliminar" OnClientClick="return confirm('¿Está seguro que desea eliminar el registro?')" />
                    <asp:LinkButton ID="btnCancel" CssClass="btn btn-outline-warning" runat="server" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" CssClass="btn btn-outline-primary" runat="server" CommandName="Edit" Text="Editar" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Juego">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresJuego" runat="server" Text='<%# Bind("Juego") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXStoresJuego" runat="server" Value='<%# Bind("IdJuego") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresJuego" runat="server" Text='<%# Bind("Juego") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXStoresJuego" runat="server" Value='<%# Bind("IdJuego") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tienda">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresTienda" runat="server" Text='<%# Bind("Tienda") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXStoresTienda" runat="server" Value='<%# Bind("IdTienda") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresTienda" runat="server" Text='<%# Bind("Tienda") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXStoresTienda" runat="server" Value='<%# Bind("IdTienda") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="URL">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesXStoresURL" runat="server" Text='<%# Eval("URL") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresURL" runat="server" Text='<%# Eval("URL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Precio">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesXStoresPrecio" runat="server" Text='<%# Eval("Precio") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresPrecio" runat="server" Text='<%# Eval("Precio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PrecioRebajado">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesXStoresPrecioRebajado" runat="server" Text='<%# Eval("Precio Rebajado") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXStoresPrecioRebajado" runat="server" Text='<%# Eval("Precio Rebajado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVGamesXStoresActivo" runat="server" Checked='<%# Eval("Activo") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVGamesXStoresActivo" runat="server" Checked='<%# Eval("Activo") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <h2>Agregar Juego-Tienda</h2>
        <table>
            <thead>
                <tr>
                    <th>Juego</th>
                    <th>Tienda</th>
                    <th>Sitio Web</th>
                    <th>Precio</th>
                    <th>Precio rebajado</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlJuego_new" CssClass="form-control bg-dark text-light" runat="server"></asp:DropDownList><br />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTienda_new" CssClass="form-control bg-dark text-light" runat="server"></asp:DropDownList><br />
                    </td>
                    <td>
                        <asp:TextBox ID="txtURL_new" CssClass="form-control bg-dark text-light" runat="server"></asp:TextBox><br />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrecio_new" CssClass="form-control bg-dark text-light" runat="server"></asp:TextBox><br />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrecioRebajado_new" CssClass="form-control bg-dark text-light" runat="server"></asp:TextBox><br />
                    </td>
                    <td>
                        <asp:Button ID="btnGamesXStoresAgregar"  CssClass="btn btn-outline-success"  runat="server" OnClick="btnGVGamesXStoresAgregar_Click" Text="Agregar" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script>
        $(function () {
            $(".selection-game-store").addClass("border-bottom-highlight")
        })
    </script>
</asp:Content>
