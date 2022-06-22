<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="TiendasDashboard.aspx.cs" Inherits="Vistas.TiendasDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="form-floating ctrl-store">
        <input type="text" class="form-control bg-dark text-light no-borders" id="txtSearchStore" placeholder="Buscar tienda">
        <label for="floatingSearchStore" class="text-light">Buscar datos de tienda</label>
    </div>
    <asp:GridView
        ID="GridViewStores"
        runat="server"
        CssClass="grd grd-user w-100 bg-dark-carbon ctrl-store"
        AutoGenerateEditButton="True"
        DataKeyNames="Id"
        AutoGenerateColumns="False"
        OnRowEditing="TiendaEdit"
        OnRowCancelingEdit="TiendaCancelEdit"
        OnRowUpdating="TiendaUpdate">
        <Columns>
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

</asp:Content>
