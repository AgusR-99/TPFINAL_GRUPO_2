<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" CodeBehind="ImagenesDashboard.aspx.cs" Inherits="Vistas.ImagenesDashboard" %>
<%@ MasterType VirtualPath="~/Masters/AdminDashboardMain.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group ctrl-category input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearchImage" placeholder="Buscar imagenes"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView 
        ID="GridViewImages"
        runat="server"
        CssClass="grd grd-user w-100 bg-dark-carbon ctrl-game"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowDataBound="GridViewImages_RowDataBound"
        OnRowCancelingEdit="GridViewImages_RowCancelingEdit"
        OnRowEditing="GridViewImages_RowEditing"
        OnRowUpdating="GridViewImages_RowUpdating"
        ShowFooter="True">
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
                    <asp:DropDownList ID="ddlGVImagesIDJuego" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlGVImagesIDJuego" runat="server">
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVImagesIDJuego" runat="server" Text='<%# Bind("IdJuego") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NombreArchivo">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVImagesNombre" runat="server" Text='<%# Bind("NombreArchivo") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVImagesNombre" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVImagesNombre" runat="server" Text='<%# Bind("NombreArchivo") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Orden">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVImagesOrden" runat="server" Text='<%# Bind("Orden") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGVImagesOrden" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGVImagesOrden" runat="server" Text='<%# Bind("Orden") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVImagesActivo" runat="server" Checked='<%# Bind("Activo") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox ID="chkGVImagesActivo" runat="server" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVImages" runat="server" Checked='<%# Bind("Activo") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="grd-footer"></FooterStyle>
        <PagerStyle CssClass="grd-pager"></PagerStyle>
    </asp:GridView>
    <script>
        $(function () {
            $(".selection-image").addClass("border-bottom-highlight")
        })
    </script>
</asp:Content>
