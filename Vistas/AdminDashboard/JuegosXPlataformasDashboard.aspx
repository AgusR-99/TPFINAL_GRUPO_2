<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="JuegosXPlataformasDashboard.aspx.cs" Inherits="Vistas.JuegosXPlataformasDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group input-cat">
        <asp:DropDownList ID="ddlJuegosBuscar" AppendDataBoundItems="True" runat="server">
            <asp:ListItem Text="Todos" Value="-1"/>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlPlataformasBuscar" AppendDataBoundItems="True" runat="server">
            <asp:ListItem Text="Todos" Value="-1"/>
        </asp:DropDownList>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView ID="GridViewGamesXPlatforms"
        runat="server"
        CssClass="grd-user w-100 bg-dark-carbon ctrl-GamesXPlatforms"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="GridViewGamesXPlatforms_RowCancelingEdit"
        OnRowEditing="GridViewGamesXPlatforms_RowEditing"
        OnRowDeleting="GridViewGamesXPlatforms_RowDeleting"
        ShowFooter="true"
        AllowPaging="True" 
        OnPageIndexChanging="GridViewGamesXPlatforms_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-outline-danger" runat="server" CommandName="Delete" Text="Eliminar" OnClientClick="return confirm('¿Está seguro que desea eliminar el registro?')" />
                    <asp:LinkButton ID="btnCancel" CssClass="btn btn-outline-warning" runat="server" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" CssClass="btn btn-outline-primary" runat="server" CommandName="Edit" Text="Editar" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Juego">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesXPlatformsJuego" runat="server" Text='<%# Bind("Juego") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXPlatformsJuego" runat="server" Value='<%# Bind("IdJuego") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXPlatformsJuego" runat="server" Text='<%# Bind("Juego") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXPlatformsJuego" runat="server" Value='<%# Bind("IdJuego") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Plataforma">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesXPlatformsPlataforma" runat="server" Text='<%# Bind("Plataforma") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXPlatformsPlataforma" runat="server" Value='<%# Bind("IdPlataforma") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesXPlatformsPlataforma" runat="server" Text='<%# Bind("Plataforma") %>'>
                    </asp:Label>
                    <asp:HiddenField ID="hfGVGamesXPlatformsPlataforma" runat="server" Value='<%# Bind("IdPlataforma") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <h2>Agregar Juego-Plataforma</h2>
        <table>
            <thead>
                <tr>
                    <th>Juego</th>
                    <th>Plataforma</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlJuego_new" CssClass="form-control bg-dark text-light" runat="server"></asp:DropDownList><br />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPlataforma_new" CssClass="form-control bg-dark text-light" runat="server"></asp:DropDownList><br />
                    </td>
                    <td>
                        <asp:Button ID="btnGameXPlatformAgregar" CssClass="btn btn-outline-success" runat="server" OnClick="btnGameXPlatformAgregar_Click" Text="Agregar" />
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
