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
            var juegos = NegocioJuego.ObtenerJuegosComoLista();
            lblCantResultados.Text = $"{juegos.Count} resultados";
            rptResultados.DataSource = juegos;
            rptResultados.DataBind();

            SetCategoryChecks();
            SetPlatformChecks();
        }

        protected void SetCategoryChecks()
        {
            rptChecksCategoria.DataSource = NegocioCategorias.ObtenerCategoriasActivasComoLista();
            rptChecksCategoria.DataBind();
            
            var catQuery = Request.QueryString["cat"];
            if(!String.IsNullOrEmpty(catQuery) && int.TryParse(catQuery, out int catID))
            {
                foreach(RepeaterItem item in rptChecksCategoria.Items)
                {
                    var itemCat = (HiddenField)item.FindControl("hfCatId");
                    var checkbox = (HtmlInputCheckBox)item.FindControl($"flexCheckCategory");
                    checkbox.Checked = (itemCat.Value == catQuery);
                }
            }
        }

        protected void SetPlatformChecks()
        {
            rptChecksPlataforma.DataSource = NegocioPlataforma.ObtenerPlataformasActivasComoLista();
            rptChecksPlataforma.DataBind();

            var platQuery = Request.QueryString["plat"];
            if (!String.IsNullOrEmpty(platQuery) && int.TryParse(platQuery, out int catID))
            {
                foreach (RepeaterItem item in rptChecksPlataforma.Items)
                {
                    var itemPlat = (HiddenField)item.FindControl("hfPlatId");
                    var checkbox = (HtmlInputCheckBox)item.FindControl($"flexCheckPlatform");
                    checkbox.Checked = (itemPlat.Value == platQuery);
                }
            }

        }

        protected string ValueOrDefault(object value, string def)
        {
            return value == null ? def : value.ToString();
        }

        protected string FitText(string text, int length)
        {
            string suffix = "[...]";
            if(text.Length>length)
            {
                text = text.Substring(0, length - suffix.Length);
                text += suffix;
            }
            return text;
        }
    }
}