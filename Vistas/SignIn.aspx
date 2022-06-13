<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vistas.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="ingresar-wrapper text-center">
        <div class="form-signin w-100 m-auto neon-backlight backlight-orange">
            <form>
                <div class="neon-sign sign-orange"><i class="fa-regular fa-user big"></i></div>
                <h1 class="h3 mb-3 fw-normal neon-sign sign-orange">Ingrese sus credenciales</h1>
                <div class="form-floating">
                    <input type="email" class="form-control bg-dark text-light no-borders" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput" class="text-light">Email</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control bg-dark text-light no-borders" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword" class="text-light">Password</label>
                </div>

                <%--<div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>--%>
                <button class="neon-button neon-orange" type="submit">Ingresar</button>
            </form>
        </div>
    </main>
    <%--Override background--%>
    <script>
        $(document).ready(function () {
            $("body").addClass('bg-home-page');
        });
    </script>
</asp:Content>