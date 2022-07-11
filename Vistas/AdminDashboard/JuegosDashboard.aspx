<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="JuegosDashboard.aspx.cs" Inherits="Vistas.JuegosDashboard" %>
<%@ MasterType VirtualPath="~/Masters/AdminDashboardMain.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group ctrl-category input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearchGame" placeholder="Buscar juegos"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlJuegosFiltrar" runat="server" OnSelectedIndexChanged="ddlJuegosFiltrar_SelectedIndexChanged">
            <asp:ListItem Selected="True">All</asp:ListItem>
            <asp:ListItem>Activo</asp:ListItem>
            <asp:ListItem>No Activo</asp:ListItem>
            <asp:ListItem>Recently</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnfiltrajuegos" runat="server" OnClick="btnfiltrajuegos_Click" Text="Busqueda por filtro" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <asp:GridView 
        ID="GridViewGames"
        runat="server"
        CssClass="grd grd-user w-100 bg-dark-carbon ctrl-game"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowDataBound="GridViewGames_RowDataBound"
        OnRowCancelingEdit="GridViewGames_RowCancelingEdit"
        OnRowEditing="GridViewGames_RowEditing"
        OnRowUpdating="GridViewGames_RowUpdating">
        <Columns>
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
            <asp:TemplateField HeaderText="IDJuego">
                <EditItemTemplate>
                    <asp:Label ID="lblGVGamesIDJuego" runat="server" Text='<%# Bind("IdJuego")%>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesIDJuego" runat="server" Text='<%# Bind("IdJuego") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IDDesarrollador">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGVGamesIDDesarrollador" runat="server">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblGVGamesIDDesarrollador" runat="server" Enabled="False" Text='<%# Bind("IdDesarrollador") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="FechaLanzamiento">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVGamesDia" Text=<%# Eval("FechaLanzamiento").ToString()!="" ? Convert.ToDateTime(Eval("FechaLanzamiento")).Day.ToString() : "" %> runat="server" MaxLength="2" Width="30px" Height="20px" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>/
                    <asp:TextBox ID="txtGVGamesMes" Text=<%# Eval("FechaLanzamiento").ToString()!="" ? Convert.ToDateTime(Eval("FechaLanzamiento")).Month.ToString() : "" %> runat="server" MaxLength="2" Width="30px" Height="20px" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>/
                    <asp:TextBox ID="txtGVGamesAño" Text=<%# Eval("FechaLanzamiento").ToString()!="" ? Convert.ToDateTime(Eval("FechaLanzamiento")).Year.ToString() : "" %> runat="server" MaxLength="4" Width="45px" Height="20px" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                    <asp:Label ID="lblGVGamesFechaLanzamiento" runat="server" Enabled="False" Text='<%# Eval("FechaLanzamiento", "{0:dd/MM/yyyy}") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVGamesFechaLanzamiento" Text='<%# Eval("FechaLanzamiento", "{0:dd/MM/yyyy}") %>' runat="server"></asp:Label>
                    <br />
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

<FooterStyle CssClass="grd-footer"></FooterStyle>

<PagerStyle CssClass="grd-pager"></PagerStyle>
    </asp:GridView>

    <div class="grd-control-wrapper d-flex justify-content-evenly">
        <div class="grd-control">
            <span><strong>Desarrollador</strong></span>
            <asp:DropDownList ID="ddlGVGamesIDDesarrollador" runat="server"></asp:DropDownList>
        </div> 
        <div class="grd-control">
            <span><strong>Nombre</strong></span>
            <asp:TextBox ID="txtGVGamesNombre" runat="server"></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Descripción</strong></span>
            <asp:TextBox ID="txtGVGamesDescripcion" runat="server"></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Fecha</strong></span>
            <div>
                <asp:TextBox ID="txtGVGamesDia"  runat="server" MaxLength="2" Width="30px" Height="20px" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>/
                <asp:TextBox ID="txtGVGamesMes" runat="server" MaxLength="2" Width="30px" Height="20px" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>/
                <asp:TextBox ID="txtGVGamesAño" runat="server" MaxLength="4" Width="45px" Height="20px" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
            </div>
        </div>
        <div class="grd-control">
            <span><strong>Activo</strong></span>
            <asp:CheckBox ID="chkGVGamesActivo" runat="server" />
        </div>
        <div class="grd-control">
            <asp:LinkButton ID="btnInsert" CssClass="btn btn-primary" runat="server" CommandName="Insert" Text="Agregar" OnClick="BtnInsert_Click" />
        </div>
    </div>


    <script>
        $(function () {
            $(".selection-game").addClass("border-bottom-highlight")
        })
    </script>
</asp:Content>
