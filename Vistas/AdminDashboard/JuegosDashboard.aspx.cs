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
            lblMsg.Text = "";
        }

        protected void CargarJuegos()
        {

            var tablaJuegos = NegocioJuego.ListarJuegos();
            GridViewGames.DataSource = tablaJuegos;
            GridViewGames.DataBind();
            DropDownList ddl = ddlGVGamesIDDesarrollador;
            ddl.DataSource = NegocioDesarrollador.ListarDesarrolladores();
            ddl.DataTextField = "NombreDesarrollador";
            ddl.DataValueField = "IdDesarrollador";
            ddl.DataBind();

            AdminDashboardMain masterPage = (AdminDashboardMain)this.Page.Master;
            masterPage.SetUpdatePanelControlVisibility(true);
            masterPage.GetStats();
            masterPage.UpdatePanelUpdate();
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
            juego.setFecha(Convert.ToInt32((((TextBox)editedRow.FindControl("txtGVGamesDia")).Text)),
                Convert.ToInt32((((TextBox)editedRow.FindControl("txtGVGamesMes")).Text)),
                Convert.ToInt32((((TextBox)editedRow.FindControl("txtGVGamesAño")).Text)));
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

        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            Juego juego = new Juego(
                    Convert.ToInt32(ddlGVGamesIDDesarrollador.Text),
                    txtGVGamesNombre.Text,
                    txtGVGamesDescripcion.Text,
                    chkGVGamesActivo.Checked
                );

            if(!(
                    int.TryParse(txtGVGamesDia.Text, out int dia) &&
                    int.TryParse(txtGVGamesMes.Text, out int mes) &&
                    int.TryParse(txtGVGamesAño.Text, out int año)
                ))
            {
                lblMsg.Text = "Por favor, complete el campo fecha con datos válidos.";
                lblMsg.Visible = true;
                return;
            }

            juego.setFecha(dia, mes, año);

            var erroresAgregar = NegocioJuego.AgregarJuego(juego);
            if (erroresAgregar.Any())
            {
                lblMsg.Text = string.Join("<br>", erroresAgregar);
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.Text = "Registro agregado con exito";
                lblMsg.Visible = true;
                /*txtSearchCategory.Text = "";*/
                GridViewGames.EditIndex = -1;
                CargarJuegos();
            }
        }

        protected void BtnSearch_Click(Object sender, EventArgs e)
        {
            var dt = NegocioJuego.ListarJuegosPorNombre(txtSearchGame.Text);
            GridViewGames.DataSource = dt;
            Session["JuegosSession"] = dt;
            GridViewGames.DataBind();     
        }

        protected void LimpiarControles()
        {
            ddlGVGamesIDDesarrollador.SelectedIndex = 0;
            txtGVGamesNombre.Text = "";
            txtGVGamesDescripcion.Text = "";
            txtGVGamesNombre.Text = "";
            txtGVGamesAño.Text = "";
            txtGVGamesMes.Text = "";
            txtGVGamesDia.Text = "";
        }
    }
}