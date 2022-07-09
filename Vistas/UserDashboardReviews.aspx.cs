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
    public partial class UserDashboardReviews : System.Web.UI.Page
    {
        public Type JuegoOpinion = typeof(KeyValuePair<Juego, Opinion>);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (NegocioUsuario.IsLoggedIn(Session))
            {
                var opiniones = NegocioUsuario.ObtenerUsuarioEnUso(Session).getOpinion();
                if (opiniones.Any())
                {
                    lblVacio.Visible = false;
                    var juegosOpiniones = NegocioJuego.ObtenerDiccionarioJuegosOpiniones(opiniones);
                    rptOpiniones.DataSource = juegosOpiniones;
                    rptOpiniones.DataBind();
                }
                else
                {
                    lblVacio.Visible = true;
                }
            }

        }
    }
}