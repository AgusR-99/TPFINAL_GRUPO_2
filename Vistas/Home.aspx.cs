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
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true,null,null,NegocioJuego.Orden.MasPopular);
            rptPopulares.DataSource = juegos;
            rptPopulares.DataBind();
        }

        public void CargarProximos()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, null, null, NegocioJuego.Orden.MasPopular);
            rptProximos.DataSource = juegos;
            rptProximos.DataBind();
        }

        public void CargarRebaja()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, null, null, NegocioJuego.Orden.Rebaja);
            juegos.RemoveAll(j => j.getPrecioRebajado() == null);
            rptRebaja.DataSource = juegos;
            rptRebaja.DataBind();
        }

        public void CargarBaratos()
        {
            var juegos = NegocioJuego.ObtenerJuegosComoLista(true, null, null, NegocioJuego.Orden.SoloMenorPrecio);
            juegos.RemoveAll(j => j.getPrecioRebajado() != null);
            rptBaratos.DataSource = juegos;
            rptBaratos.DataBind();
        }

    }
}
