using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.AdminDashboard
{
    public partial class DesarrolladoresDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDesarrolladores();
            }

        }
        protected void CargarDesarrolladores()
        {

            var tablaDesarrolladores = NegocioDesarrollador.ListarDesarrolladores();
            Session["DesarrolladoresSession"] = tablaDesarrolladores;
            GridViewDevs.DataSource = tablaDesarrolladores;
            GridViewDevs.DataBind();
        }
        
       

        protected void GridViewDevs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearchDevs.Text = "";
            GridViewDevs.EditIndex = e.NewEditIndex;
            GridViewDevs.DataSource = (DataTable)Session["DesarrolladoresSession"];
            GridViewDevs.DataBind();
        }

        protected void GridViewDevs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchDevs.Text = "";
            GridViewDevs.DataSource = (DataTable)Session["DesarrolladoresSession"];
            GridViewDevs.EditIndex = -1;
            GridViewDevs.DataBind();
        }
        
        protected void GridViewDevs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            var editedRow = GridViewDevs.Rows[e.RowIndex];
            Desarrollador desarrollador = new Desarrollador(
                    Convert.ToInt32((((Label)editedRow.FindControl("lblGVDevsIDDesarrollador")).Text)),
                    ((TextBox)editedRow.FindControl("txtGVDevsNombre")).Text,
                    ((TextBox)editedRow.FindControl("txtGVDevsSitioWeb")).Text,
                    ((TextBox)editedRow.FindControl("txtGVDevsUbicacionSede")).Text,
                    ((TextBox)editedRow.FindControl("txtGVDevsHistoria")).Text
                   );
            var erroresActualizar = NegocioDesarrollador.ActualizarDesarrollador(desarrollador);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<br>";
                lblMsg.Visible = true;
            }
            else
            {
                GridViewDevs.EditIndex = -1;
                CargarDesarrolladores();
            }
        }
        
        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            Desarrollador desarrollador = new Desarrollador(
                    txtGVDevsNombre.Text,
                    txtGVDevsSitioWeb.Text,
                    txtGVDevsUbicacionSede.Text,
                    txtGVDevsHistoria.Text
                );

            var erroresAgregar = NegocioDesarrollador.AgregarDesarrollador(desarrollador);
            if (erroresAgregar.Any())
            {
                foreach (string msg in erroresAgregar)
                    lblMsg.Text += msg + "<div>";
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.Text = "Registro agregado con exito";
                lblMsg.Visible = true;
                ///txtSearchCategory.Text = "";
                GridViewDevs.EditIndex = -1;
                LimpiarControlesDeCarga();
                CargarDesarrolladores();
            }
        }

        protected void BtnSearch_Click(Object sender, EventArgs e)
        {
            var dt = NegocioDesarrollador.ListarDesarrolladoresPorNombre(txtSearchDevs.Text);
            GridViewDevs.DataSource = dt;
            Session["DesarrolladoresSession"] = dt;
            GridViewDevs.DataBind();
        }

        protected void LimpiarControlesDeCarga()
        {
            txtGVDevsNombre.Text = "";
            txtGVDevsSitioWeb.Text = "";
            txtGVDevsUbicacionSede.Text = "";
            txtGVDevsHistoria.Text = "";
        }
    }
}