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
    /// Summary description for JuegoHandler
    /// </summary>
    public class JuegoHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string term = context.Request["term"] ?? "";
            List<string> terms = NegocioJuego.ObtenerListaNombres(term);
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