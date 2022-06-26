using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class AdminDashboardMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!NegocioUsuario.IsLoggedInAsAdmin(Session)) Response.Redirect("~/Home.aspx");
            GetStats();
            if (!IsPostBack) { }
        }

        public void SetUpdatePanelControlVisibility(bool visible)
        {
            updatepanelanalytics.Visible = visible;
        }

        public void UpdatePanelUpdate()
        {
            updatepanelanalytics.Update();
        }

        // TODO -> LLAMAR A ESTE METODO CADA VEZ QUE AGREGUEN FILAS A LAS GRIDVIEWS DE USUARIO O JUEGO
        public void GetStats()
        {
            var ds = NegocioUsuario.ObtenerCantidadUsuarios();
            lblUsuariosStat.Text = ds.Tables[0].Rows[0][0].ToString();

            ds = NegocioJuego.ObtenerCantidadJuegos();
            lblJuegosStat.Text = ds.Tables[0].Rows[0][0].ToString();

            ds = NegocioOpinion.ObtenerCantidadOpiniones();
            lblOpinionesStat.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }
}