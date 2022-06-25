using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using Negocio;

namespace Vistas
{
    /// <summary>
    /// Summary description for CategoriaHandler
    /// </summary>
    public class CategoriaHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string term = context.Request["term"] ?? "";
            List<string> terms = NegocioCategorias.ObtenerListaNombres(term);
            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(terms));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}