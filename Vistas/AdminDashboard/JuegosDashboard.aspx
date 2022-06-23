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
        CssClass="grd grd-user w-100 bg-dark-carbon ctrl-game"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowDataBound="GridViewGames_RowDataBound"
        OnRowCancelingEdit="GridViewGames_RowCancelingEdit"
        OnRowEditing="GridViewGames_RowEditing"
        OnRowUpdating="GridViewGames_RowUpdating"
        ShowFooter="true">
        <Columns>
            <asp:TemplateField>
                <%--Cosas del footer--%>
                <FooterTemplate>
                    <asp:LinkButton ID="btnInsert" CssClass="btn btn-primary" runat="server" CommandName="Insert" Text="Agregar" OnClick="BtnInsert_Click" />
                </FooterTemplate>
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
            <asp:TemplateField HeaderText="IDJuego">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesIDJuego" runat="server" Text='<%# Bind("IdJuego")%>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblGVGamesID" runat="server"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesIDJuego" runat="server" Text='<%# Bind("IdJuego") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IDDesarrollador">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGVGamesIDDesarrollador" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlGVGamesIDDesarrollador" runat="server">
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVGamesNombre" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesNombre" runat="server" Text='<%# Bind("Nombre") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Descripcion">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVGamesDescripcion" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVGamesActivo" runat="server" Checked='<%# Bind("Activo") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox ID="chkGVGamesActivo" runat="server" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVGamesImagen" runat="server" Checked='<%# Bind("Activo") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="grd-footer"></FooterStyle>
        <PagerStyle CssClass="grd-pager"></PagerStyle>
    </asp:GridView>
</asp:Content>
