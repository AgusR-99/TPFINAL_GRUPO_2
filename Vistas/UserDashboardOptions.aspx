<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardOptions.aspx.cs" Inherits="Vistas.UserDashboardOptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="panelContent" runat="server">
    <div class="panel-content-options">
        <section class="options-section">
            <h2>Cambiar username</h2>
            <div class="options-content">
                <p>Cambiar el nombre de usuario, el cual se mostrara junto con las reviews.</p>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtUsername" runat="server"  class="form-control bg-dark text-light"  placeholder="Username"></asp:TextBox>
                    <label for="floatingInput">Username</label>
                </div>
            </div>
        </section>
        <hr class="bg-light border-2 border-top border-light">
        <section class="options-section">
            <h2>Cambiar descripcion sobre mi</h2>
            <div class="options-content">
                <p>Cambiar la descripcion que se muestra en tu perfil.</p>
                <div class="form-floating mb-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtDescripcion" runat="server" class="form-control bg-dark text-light" rows="3"></asp:TextBox>
                    </div>
                </div>
            </div>
        </section>
        <hr class="bg-light border-2 border-top border-light">
        <section class="options-section">
            <h2>Cambiar email</h2>
            <div class="options-content">
                <p>Cambiar el email utilizado para ingresar al sitio.</p>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control bg-dark text-light"  placeholder="name@example.com"></asp:TextBox>
                    <label for="floatingInput">Direccion email</label>
                </div>
            </div>
        </section>
        <section class="options-section">
            <h2>Cambiar password</h2>
            <div class="options-content">
                <p>Cambiar el password utilizado para ingresar al sitio.</p>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control bg-dark text-light"  placeholder="Password" TextMode="Password"></asp:TextBox>
                    <label for="floatingPassword">Password</label>
                </div>
                <p>Confirmar password</p>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtPassword2" runat="server" class="form-control bg-dark text-light"  placeholder="Password" TextMode="Password"></asp:TextBox>
                    <label for="floatingPassword">Password</label>
                </div>
            </div>
        </section>
        <hr class="bg-light border-2 border-top border-light">
        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" class="btn btn-success" OnClick="btnActualizar_Click"></asp:Button>&nbsp;&nbsp;
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
&nbsp;<hr class="bg-light border-2 border-top border-light">
        <section class="options-section">
            <h2 class="text-danger">Eliminar cuenta</h2>
            <div class="options-content">
                <p>Una vez eliminada la cuenta, no hay marcha atras. Por favor tenga certeza.</p>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Cuenta" class="btn btn-danger" OnClick="btnEliminar_Click"></asp:Button>
            &nbsp;
                <asp:Label ID="lblMsg2" runat="server"></asp:Label>
            </div>
        </section>
    </div>
</asp:Content>
