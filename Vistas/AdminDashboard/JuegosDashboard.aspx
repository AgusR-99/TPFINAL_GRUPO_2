<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="JuegosDashboard.aspx.cs" Inherits="Vistas.JuegosDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="form-floating ctrl-game">
        <input type="text" class="form-control bg-dark text-light no-borders" id="txtSearchGame" placeholder="Buscar juego">
        <label for="floatingSearchGame" class="text-light">Buscar datos de juego</label>
    </div>
    <asp:GridView ID="GridViewGames"
        runat="server"
        AutoGenerateEditButton="True"
        CssClass="grd-games w-100 bg-dark-carbon ctrl-game"
        AutoGenerateColumns="False"
        OnRowDataBound="GridViewGames_RowDataBound"
        OnRowCancelingEdit="GridViewGames_RowCancelingEdit"
        OnRowEditing="GridViewGames_RowEditing"
        OnRowUpdating="GridViewGames_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="IDJuego">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesIDJuego" runat="server" Text='<%# Bind("IdJuego")%>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesIDJuego" runat="server" Text='<%# Bind("IdJuego") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IDDesarrollador">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGVGamesIDDesarrollador" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesNombre" runat="server" Text='<%# Bind("Nombre") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Descripcion">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVGamesActivo" runat="server" Checked='<%# Bind("Activo") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVGamesImagen" runat="server" Checked='<%# Bind("Activo") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
