<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="DesarrolladoresDashboard.aspx.cs" Inherits="Vistas.AdminDashboard.DesarrolladoresDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="form-floating ctrl-devs">
        <input type="text" class="form-control bg-dark text-light no-borders" id="txtSearchDev" placeholder="Buscar Desarrollador">
        <label for="floatingSearchDev" class="text-light">Buscar datos de Desarrollador</label>
    </div>
    <asp:GridView ID="GridViewDevs"
        runat="server"
        CssClass="grd grd-Devs w-100 bg-dark-carbon ctrl-devs"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="GridViewDevs_RowCancelingEdit"
        OnRowEditing="GridViewDevs_RowEditing"
        OnRowUpdating="GridViewDevs_RowUpdating"
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
            <asp:TemplateField HeaderText="IdDesarrollador">
               <EditItemTemplate>
                    <asp:Label ID="lblGVDevsIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador")%>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblGVDevsID" runat="server"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsIDDesarrollador" runat="server" Text='<%# Bind("IdDesarrollador") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsNombre" runat="server" Text='<%# Bind("NombreDesarrollador")%>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVDevsNombre" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsNombre" runat="server" Text='<%# Bind("NombreDesarrollador") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SitioWeb">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsSitioWeb" runat="server" Text='<%# Bind("SitioWeb")%>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVDevsSitioWeb" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsSitioWeb" runat="server" Text='<%# Bind("SitioWeb") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UbicacionSede">
            <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsUbicacionSede" runat="server" Text='<%# Bind("UbicacionSede")%>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVDevsUbicacionSede" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsUbicacionSede" runat="server" Text='<%# Bind("UbicacionSede") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Historia">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVDevsHistoria" runat="server" Text='<%# Bind("Historia")%>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVDevsHistoria" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVDevsHistoria" runat="server" Text='<%# Bind("Historia") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

<FooterStyle CssClass="grd-footer"></FooterStyle>

<PagerStyle CssClass="grd-pager"></PagerStyle>
    </asp:GridView>
</asp:Content>
