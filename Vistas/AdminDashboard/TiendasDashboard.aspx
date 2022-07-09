<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="TiendasDashboard.aspx.cs" Inherits="Vistas.TiendasDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearchStores" placeholder="Buscar Tiendas"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-secondary" Text="Limpiar" OnClick="BtnClearSearch_Click"></asp:Button>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView
        ID="GridViewStores"
        runat="server"
        CssClass="grd grd-user w-100 bg-dark-carbon ctrl-store"
        DataKeyNames="Id"
        AutoGenerateColumns="False"
        AllowPaging="true"
        OnRowEditing="TiendaEdit"
        OnRowCancelingEdit="TiendaCancelEdit"
        OnRowUpdating="TiendaUpdate"
        OnPageIndexChanging="GridViewStores_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" CssClass="btn btn-outline-success" runat="server" CommandName="Update" Text="Actualizar" OnClientClick="return confirm('¿Está seguro que desea actualizar la fila?')" />
                    <asp:LinkButton ID="btnCancel" CssClass="btn btn-outline-warning" runat="server" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" CssClass="btn btn-outline-primary" runat="server" CommandName="Edit" Text="Editar" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <EditItemTemplate>
                    <asp:Label ID="lblGVStoresID" runat="server" Text='<%# Eval("ID") %>'>
                    </asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVStoresID" runat="server" Text='<%# Eval("ID") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tienda">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVStoresTienda" runat="server" Text='<%# Eval("Tienda") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVStoresTienda" runat="server" Text='<%# Eval("Tienda") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Imagen">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVStoresImagen" runat="server" Text='<%# Eval("Imagen") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVStoresImagen" runat="server" Text='<%# Eval("Imagen") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sitio Web">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVStoresSitioWeb" runat="server" Text='<%# Eval("Sitio Web") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVStoresSitioWeb" runat="server" Text='<%# Eval("Sitio Web") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVStoresActivo" runat="server" Checked='<%# Eval("Activo") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVStoresActivo" runat="server" Checked='<%# Eval("Activo") %>'
                        Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <h2>Agregar Tienda</h2>
        <table>
            <thead>
                <tr>
                    <th>Tienda</th>
                    <th>Imagen</th>
                    <th>Sitio Web</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:TextBox ID="txtNombre_new" CssClass="form-control bg-dark text-light" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtImagen_new" CssClass="form-control bg-dark text-light" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtURL_new" CssClass="form-control bg-dark text-light" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnStoreAgregar" CssClass="btn btn-outline-success" runat="server" OnClick="btnStoreAgregar_Click" Text="Agregar" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script>
        $(function () {
            $(".selection-store").addClass("border-bottom-highlight")
        })
    </script>
</asp:Content>
