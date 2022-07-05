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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarPopulares();
            CargarProximos();
            CargarRebaja();
            CargarBaratos();

        }

        public void CargarPopulares()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, orden:NegocioJuego.Orden.MasPopular);
            sctPopulares.Visible = juegos.Any();
            rptPopulares.DataSource = juegos.Take(4);
            rptPopulares.DataBind();
        }

        public void CargarProximos()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, orden:NegocioJuego.Orden.Proximos);
            sctProximos.Visible = juegos.Any();
            rptProximos.DataSource = juegos.Take(4);
            rptProximos.DataBind();
        }

        public void CargarRebaja()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, orden:NegocioJuego.Orden.Rebaja);
            sctRebaja.Visible = juegos.Any();
            rptRebaja.DataSource = juegos.Take(4);
            rptRebaja.DataBind();
        }

        public void CargarBaratos()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, orden:NegocioJuego.Orden.SoloMenorPrecio);
            sctBaratos.Visible = juegos.Any();
            rptBaratos.DataSource = juegos.Take(4);
            rptBaratos.DataBind();
        }

    }
}
