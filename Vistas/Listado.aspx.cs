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
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista();
            lblCantResultados.Text = $"{juegos.Count} resultados";
            rptResultados.DataSource = juegos;
            rptResultados.DataBind();
        }

        protected string ValueOrDefault(object value, string def)
        {
            return value == null ? def : value.ToString();
        }
    }
}