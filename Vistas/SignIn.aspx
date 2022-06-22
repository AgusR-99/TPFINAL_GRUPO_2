<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Vistas.SignIn" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="ingresar-wrapper text-center">
        <div class="form-signin w-100 m-auto neon-backlight backlight-orange">
            <div class="neon-sign sign-orange"><i class="fa-regular fa-user big"></i></div>
            <h1 class="h3 mb-3 fw-normal neon-sign sign-orange">Ingrese sus credenciales</h1>
            <div class="form-floating">
                <asp:TextBox TextMode="Email" class="form-control bg-dark text-light no-borders" ID="floatingInput" placeholder="name@example.com" runat="server"/>
                <label for="floatingInput" class="text-light">Email<asp:RequiredFieldValidator ID="vldRequiredEmail" ControlToValidate="floatingInput" runat="server" ErrorMessage="Debe ingresar su email" Text="*" ValidationGroup="Login" EnableClientScript="False" Display="Dynamic" /><asp:RegularExpressionValidator ID="vldEmailFormat" ControlToValidate="floatingInput" runat="server" ErrorMessage="El email no tiene un formato válido" Text="*" ValidationGroup="Login" EnableClientScript="False" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /></label>
            </div>
            <div class="form-floating">
                <asp:Textbox TextMode="password" class="form-control bg-dark text-light no-borders" ID="floatingPassword" placeholder="Password" runat="server"/>
                <label for="floatingPassword" class="text-light">Password<asp:RequiredFieldValidator ID="vldRequiredPwd" ControlToValidate="floatingPassword" runat="server" ErrorMessage="Debe ingresar una contraseña" Text="*" ValidationGroup="Login" EnableClientScript="False" Display="Dynamic" /></label>
            </div>

            <div>
                <asp:Label ID="lblErrorMsg" Visible="false" runat="server"></asp:Label>
                <asp:ValidationSummary ID="vldSummary" runat="server" DisplayMode="List" ValidationGroup="Login" EnableClientScript="False" />
            </div>

            <%--<div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div>--%>
            <asp:Button ID="btnIngresar" class="neon-button neon-orange" runat="server" Text="Ingresar" OnClick="Login" CausesValidation="true" ValidationGroup="Login"></asp:Button>
        </div>

        

    </main>
    <%--Override background--%>
    <script>
        $(document).ready(function () {
            $("body").addClass('bg-home-page');
        });
    </script>
</asp:Content>
