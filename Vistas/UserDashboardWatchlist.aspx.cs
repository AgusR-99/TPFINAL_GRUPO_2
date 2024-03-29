﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Vistas
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (NegocioUsuario.IsLoggedIn(Session))
            {
                var deseados = NegocioUsuario.ObtenerUsuarioEnUso(Session).getDeseados();
                if (deseados.Any())
                {
                    lblVacio.Visible = false;
                    rptResultados.DataSource = NegocioJuego.ObtenerJuegosDeseados(deseados);
                    rptResultados.DataBind();
                }
                else
                {
                    lblVacio.Visible = true;
                }
            }
        }
    }
}