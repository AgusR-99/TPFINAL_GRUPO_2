using System;
using Negocio;

namespace Vistas
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioUsuario.Logout(Session);
            Response.Redirect("Home.aspx");
        }
    }
}