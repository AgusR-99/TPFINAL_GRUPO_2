using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var catIDs = SetCategoryChecks();
            var platIDs = SetPlatformChecks();

            var juegos = NegocioJuego.ObtenerJuegosComoLista(true,
                                                            categorias: catIDs,
                                                            plataformas: platIDs,
                                                            texto: Request.QueryString["txt"],
                                                            orden: SelectedOrder()); ;
            lblCantResultados.Text = $"{juegos.Count} resultados";
            rptResultados.DataSource = juegos;
            rptResultados.DataBind();
        }

        protected List<int> SetCategoryChecks()
        {
            rptChecksCategoria.DataSource = NegocioCategorias.ObtenerCategoriasActivasComoLista();
            rptChecksCategoria.DataBind();
            
            var catQuery = Request.QueryString["cat"];
            if(!String.IsNullOrEmpty(catQuery))
            {
                var requestedIDs = catQuery.Split(',').ToList().FindAll(id => int.TryParse(id, out int n));
                foreach (RepeaterItem item in rptChecksCategoria.Items)
                {
                    var checkbox = (HtmlInputCheckBox)item.FindControl($"flexCheckCategory");
                    checkbox.Checked = requestedIDs.Contains(checkbox.Value);
                }
                return requestedIDs.Select(int.Parse).ToList();
            }
            return null;
        }

        protected List<int> SetPlatformChecks()
        {
            rptChecksPlataforma.DataSource = NegocioPlataforma.ObtenerPlataformasActivasComoLista();
            rptChecksPlataforma.DataBind();

            var platQuery = Request.QueryString["plat"];
            if (!string.IsNullOrEmpty(platQuery))
            {
                var requestedIDs = platQuery.Split(',').ToList().FindAll(id => int.TryParse(id, out int n));
                foreach (RepeaterItem item in rptChecksPlataforma.Items)
                {
                    var checkbox = (HtmlInputCheckBox)item.FindControl($"flexCheckPlatform");
                    checkbox.Checked = requestedIDs.Contains(checkbox.Value);
                }
                return requestedIDs.Select(int.Parse).ToList();
            }
            return null;
        }

        protected NegocioJuego.Orden SelectedOrder()
        {
            if (Enum.TryParse(Request.QueryString["ord"], out NegocioJuego.Orden orden)
                && Enum.IsDefined(orden.GetType(), orden))
                return orden;
            else
                return NegocioJuego.Orden.MasPopular;
        }
    }
}