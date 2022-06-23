﻿using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class JuegosDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarJuegos();
            }
        }
        protected void CargarJuegos()
        {

            var tablaJuegos = NegocioJuego.ListarJuegos();
            GridViewGames.DataSource = tablaJuegos;
            GridViewGames.DataBind();
        }

        protected void AgregarImagenes(ref DataTable tabla, string colURL)
        {
            var columnaImagenes = new DataColumn("Imagen", typeof(byte[]));
        }

        protected void GridViewGames_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlGVGamesIDDesarrollador");
                if (ddl != null)
                {
                    ddl.DataSource = NegocioDesarrollador.ListarDesarrolladores();
                    ddl.DataTextField = "NombreDesarrollador";
                    ddl.DataValueField = "IdDesarrollador";
                    ddl.DataBind();
                }
            }

        }
        /*aca*/

        protected void GridViewGames_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewGames.EditIndex = e.NewEditIndex;
            CargarJuegos();
        }

        protected void GridViewGames_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewGames.EditIndex = -1;
            CargarJuegos();
        }

        protected void GridViewGames_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewGames.Rows[e.RowIndex];
            Juego juego = new Juego(
                    Convert.ToInt32((((Label)editedRow.FindControl("lblGVGamesIDJuego")).Text)),
                    Convert.ToInt32((((DropDownList)editedRow.FindControl("ddlGVGamesIDDesarrollador")).SelectedValue)),
                    ((TextBox)editedRow.FindControl("txtGVGamesNombre")).Text,
                    ((TextBox)editedRow.FindControl("txtGVGamesDescripcion")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVGamesActivo")).Checked
                   );
            var erroresActualizar = NegocioJuego.ActualizarJuego(juego);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<br>";
                lblMsg.Visible = true;
            }
            else
            {
                GridViewGames.EditIndex = -1;
                CargarJuegos();
            }
        }
    }
}