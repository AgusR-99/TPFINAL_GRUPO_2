using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected bool LoggedIn;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedIn = NegocioUsuario.IsLoggedIn(Session);
        }

    }
}