using System;
using System.Collections.Generic;
using Negocio;

namespace Vistas
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMsg.Visible = false;
        }

        protected void Login(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int resultadoLogin = NegocioUsuario.Login(Session, floatingInput.Text, floatingPassword.Text);
                switch (resultadoLogin)
                {
                    case -1:
                        ShowError("Ocurrió un error al intentar ingresar"); break;
                    case 0:
                        ShowError("Usuario o contraseña erróneos"); break;
                    case 1:
                        Response.Redirect("Home.aspx"); break;
                }
            }
        }

        protected void ShowError(string msg)
        {
            lblErrorMsg.Text = msg;
            lblErrorMsg.Visible = true;
        }

    }
}