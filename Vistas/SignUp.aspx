<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Masters/Navbar.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Vistas.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
	<main class="ingresar-wrapper text-center">
                <div class="form-signin w-100 m-auto neon-backlight backlight-cyan" style="height: 550px; margin-top: 94px">
                        <%--<div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>--%>
                    <br />
                       <h1 class="h3 mb-3 fw-normal neon-sign sign-cyan">Crea tu cuenta en cuatro sencillos pasos</h1>
                        <div class="form-floating">
                            </div>
                    <label for="floatingUsername" class="text-light">Username</label>
                    <asp:Textbox ID="txtUsername" runat="server" class="form-control bg-dark text-light no-borders"> 
                        </asp:Textbox>
                    <br />
                    <label for="floatingEmail" class="text-light">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control bg-dark text-light no-borders"></asp:TextBox>
                    <br />
                    <label for="floatingPassword" class="text-light">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control bg-dark text-light no-borders"></asp:TextBox>
                    <br />
                     <label for="floatingPassword2" class="text-light">Confirme password</label>
                    <asp:TextBox ID="txtPassword2" runat="server" class="form-control bg-dark text-light no-borders"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistrar" runat="server" class="neon-button neon-cyan" OnClick="btnRegistrar_Click" Text="Registrar" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </main>
    <%--Override background--%>
    <script>
        $(document).ready(function () {
            $("body").addClass('bg-home-page');
        });
    </script>
</asp:Content>