<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="DesarrolladoresDashboard.aspx.cs" Inherits="Vistas.AdminDashboard.DesarrolladoresDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group ctrl-category input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearchDevs" placeholder="Buscar desarrolladores"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView ID="GridViewDevs"
        runat="server"
        CssClass="grd grd-Devs w-100 bg-dark-carbon ctrl-devs"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="GridViewDevs_RowCancelingEdit"
        OnRowEditing="GridViewDevs_RowEditing"
        OnRowUpdating="GridViewDevs_RowUpdating">
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
            <asp:TemplateField HeaderText="IdDesarrollador">
                <EditItemTemplate>
                    <asp:Label ID="lblGVDevsIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador")%>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsNombre" runat="server" Text='<%# Bind("NombreDesarrollador")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsNombre" runat="server" Text='<%# Bind("NombreDesarrollador") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SitioWeb">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsSitioWeb" runat="server" Text='<%# Bind("SitioWeb")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsSitioWeb" runat="server" Text='<%# Bind("SitioWeb") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UbicacionSede">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsUbicacionSede" runat="server" Text='<%# Bind("UbicacionSede")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsUbicacionSede" runat="server" Text='<%# Bind("UbicacionSede") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Historia">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsHistoria" runat="server" Text='<%# Bind("Historia")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsHistoria" runat="server" Text='<%# Bind("Historia") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="grd-pager"></PagerStyle>
    </asp:GridView>
    <div class="grd-control-wrapper d-flex justify-content-evenly">
        <div class="grd-control">
            <span><strong>Nombre</strong></span>
            <asp:TextBox ID="txtGVDevsNombre" runat="server"></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Sitio Web</strong></span>
            <asp:TextBox ID="txtGVDevsSitioWeb" runat="server"></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Ubicación Sede</strong></span>
            <asp:TextBox ID="txtGVDevsUbicacionSede" runat="server"></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Historia</strong></span>
            <asp:TextBox ID="txtGVDevsHistoria" runat="server"></asp:TextBox>
        </div>
        <div class="grd-control">
            <asp:LinkButton ID="btnInsert" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="BtnInsert_Click" />
        </div>
    </div>

    <script>
        $(function () {
            $(".selection-dev").addClass("border-bottom-highlight")
        })
    </script>
</asp:Content>
