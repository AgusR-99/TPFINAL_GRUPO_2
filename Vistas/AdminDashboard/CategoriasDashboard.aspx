<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Masters/AdminDashboardMain.master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="CategoriasDashboard.aspx.cs" Inherits="Vistas.CategoriasDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminDashboardContent" runat="server">
    <%-- Aca van mensajes --%>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <div class="input-group ctrl-category input-cat">
        <div class="form-outline">
            <asp:TextBox runat="server" class="form-control bg-dark text-light no-borders" ID="txtSearchCategory" placeholder="Buscar categoria"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="BtnSearch_Click"></asp:Button>
    </div>
    <asp:GridView
        ID="GVCategories"
        runat="server"
        CssClass="grd grd-category w-100 bg-dark-carbon ctrl-category"
        PagerStyle-CssClass="grd-pager"
        FooterStyle-CssClass="grd-footer"
        AutoGenerateColumns="False"
        OnRowCancelingEdit="Category_RowCancelingEdit"
        OnRowEditing="Category_RowEditing"
        OnRowUpdating="Category_RowUpdating"
        OnPageIndexChanging="grdCategoriesData_PageIndexChanging"
        ShowFooter="true"
        AllowPaging="true">
        <Columns>
            <%--1ra col - botones--%>
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
            <%--2da col - ID --%>
            <asp:TemplateField HeaderText="ID">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:Label ID="lblGVCategoriesID" runat="server" Text='<%# Eval("IdCategoria") %>'></asp:Label>
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:Label ID="lblGVCategoriesID" runat="server" Text='<%# Eval("IdCategoria") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--3ra col - Nombre categoria --%>
            <asp:TemplateField HeaderText="Categoria">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:TextBox ID="txtGVCategoriesName" runat="server" Text='<%# Eval("Nombre") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:Label ID="lblGVCategoriesName" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--4ta col - Check si activo--%>
            <asp:TemplateField HeaderText="Activo">
                <%--Cosas del edit--%>
                <EditItemTemplate>
                    <asp:CheckBox ID="chkGVCategoriesActivo" runat="server" Checked='<%# Eval("Activo") %>' />
                </EditItemTemplate>
                <%--Cosas de vista inicial--%>
                <ItemTemplate>
                    <asp:CheckBox ID="chkGVCategoriesActivo" runat="server" Checked='<%# Eval("Activo") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="grd-control-wrapper d-flex justify-content-evenly">
        <div class="grd-control">
            <asp:LinkButton ID="btnInsert" CssClass="btn btn-primary" runat="server" CommandName="Insert" Text="Agregar" OnClick="BtnInsert_Click" />
        </div>
        <div class="grd-control">
            <span><strong>ID</strong></span>
            <asp:Label ID="lblGVCategoriesID" runat="server" Text=''></asp:Label>
        </div>
        <div class="grd-control">
            <span><strong>Categoria</strong></span>
            <asp:TextBox ID="txtGVCategoriesName" runat="server" Text='<%# Eval("Nombre") %>'></asp:TextBox>
        </div>
        <div class="grd-control">
            <span><strong>Activo</strong></span>
            <asp:CheckBox ID="chkGVCategoriesActivo" runat="server" checked="true"/>
        </div>
    </div>
</asp:Content>
