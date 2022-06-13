<%@ Page Title="" Language="C#" MasterPageFile="~/NestedUserDashboard.master" AutoEventWireup="true" CodeBehind="UserDashboardOptions.aspx.cs" Inherits="Vistas.UserDashboardOptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="panelContent" runat="server">
    <div class="panel-content-options">
        <section class="options-section">
            <h2>Cambiar username</h2>
            <div class="options-content">
                <p>Cambiar el nombre de usuario, el cual se mostrara junto con las reviews.</p>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control bg-dark text-light" id="floatingInput" placeholder="Username">
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
                        <textarea class="form-control bg-dark text-light" id="exampleFormControlTextarea1" rows="3"></textarea>
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
                    <input type="email" class="form-control bg-dark text-light" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Direccion email</label>
                </div>
            </div>
        </section>
        <section class="options-section">
            <h2>Cambiar password</h2>
            <div class="options-content">
                <p>Cambiar el password utilizado para ingresar al sitio.</p>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control bg-dark text-light" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                <p>Confirmar password</p>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control bg-dark text-light" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
            </div>
        </section>
        <hr class="bg-light border-2 border-top border-light">
        <button type="button" class="btn btn-success">Actualizar</button><hr class="bg-light border-2 border-top border-light">
        <section class="options-section">
            <h2 class="text-danger">Eliminar cuenta</h2>
            <div class="options-content">
                <p>Una vez eliminada la cuenta, no hay marcha atras. Por favor tenga certeza.</p>
                <button type="button" class="btn btn-danger">Elimina tu cuenta</button>
            </div>
        </section>
    </div>
</asp:Content>
