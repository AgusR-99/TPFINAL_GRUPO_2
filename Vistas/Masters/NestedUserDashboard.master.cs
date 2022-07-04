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
    public partial class NestedUserDashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!NegocioUsuario.IsLoggedIn(Session)) 
                Response.Redirect("~/Home.aspx");
            if (!IsPostBack)
                CargarDatosDeUsuario();
        }
        
        public void CargarDatosDeUsuario()
        {
            var usuario = NegocioUsuario.ObtenerUsuarioEnUso(Session);
            lblUsername.InnerText = usuario.getUsername();
            lblEmail.InnerText = usuario.getEmail();
            lblDescripcion.InnerText = usuario.getDescripcion();
            lblCantJuegos.InnerText = usuario.getDeseados().Count.ToString();
            lblCantOpiniones.InnerText = usuario.getOpinion().Count.ToString();
            lblPuntuacionMedia.InnerText = usuario.getOpinion().Average(o => o.getCalificacion()).ToString();
        }
    }
}