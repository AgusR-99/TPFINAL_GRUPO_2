using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        public bool LoggedIn { get; private set; }
        public bool LoggedInAsAdmin { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedIn = NegocioUsuario.IsLoggedIn(Session);
            LoggedInAsAdmin = NegocioUsuario.IsLoggedInAsAdmin(Session);
            if (!IsPostBack)
            {
                rptCategorias.DataSource = NegocioCategorias.ObtenerCategoriasActivasComoLista();
                rptCategorias.DataBind();
            }
        }

        protected void GoToAdminDashboard(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminDashboard/JuegosDashboard.aspx");
        }

        protected void Logout(object sender, EventArgs e)
        {
            Response.Redirect("~/Logout.aspx");
        }
    }


}