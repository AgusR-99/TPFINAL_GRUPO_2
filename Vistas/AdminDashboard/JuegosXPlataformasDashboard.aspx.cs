using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class JuegosXPlataformasDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                CargarJuegosXPlataformas();
                CargarDDLJuegos(ddlJuegosBuscar);
                CargarDDLPlataformas(ddlPlataformasBuscar);
                CargarDDLJuegos(ddlJuego_new);
                CargarDDLPlataformas(ddlPlataforma_new);
            }
        }

        protected void CargarJuegosXPlataformas()
        {
            var tablaJuegosXPlataformas = NegocioJuegoXPlataforma.ListarJuegosXPlataformas();
            Session["JuegosXPlataformasSession"] = tablaJuegosXPlataformas;
            GridViewGamesXPlatforms.DataSource = tablaJuegosXPlataformas;
            GridViewGamesXPlatforms.DataBind();
        }

        protected void GridViewGamesXPlatforms_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewGamesXPlatforms.EditIndex = -1;
            GridViewGamesXPlatforms.DataSource = (DataTable)Session["JuegosXPlataformasSession"];
            GridViewGamesXPlatforms.DataBind();
        }

        protected void GridViewGamesXPlatforms_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewGamesXPlatforms.DataSource = Session["JuegosXPlataformasSession"];
            GridViewGamesXPlatforms.EditIndex = e.NewEditIndex;
            GridViewGamesXPlatforms.DataBind();
        }

        protected void GridViewGamesXPlatforms_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var rowToDelete = GridViewGamesXPlatforms.Rows[e.RowIndex];
                var jxp = new Juego_x_Plataforma(
                        Convert.ToInt32(((HiddenField)rowToDelete.FindControl("hfGVGamesXPlatformsJuego")).Value),
                        Convert.ToInt32(((HiddenField)rowToDelete.FindControl("hfGVGamesXPlatformsPlataforma")).Value)
                    );
                List<string> erroresEliminar = NegocioJuegoXPlataforma.EliminarJuegoXPlataforma(jxp);
                if (erroresEliminar.Any())
                {
                    lblMsg.Text = string.Join("<br/>", erroresEliminar);
                }
                else
                {
                    lblMsg.Text = "Se eliminó correctamente";
                    GridViewGamesXPlatforms.EditIndex = -1;
                    CargarJuegosXPlataformas();
                }
                lblMsg.Visible = true;
            }
            catch
            {
                lblMsg.Text = "Ocurrió un error al procesar la solicitud";
                lblMsg.Visible = true;
            }
        }

        protected void CargarDDLJuegos(in Control ddl)
        {
            ((DropDownList)ddl).DataSource = NegocioJuego.ListarJuegos();
            ((DropDownList)ddl).DataTextField = "Nombre";
            ((DropDownList)ddl).DataValueField = "IdJuego";
            ((DropDownList)ddl).SelectedIndex = 0;
            ((DropDownList)ddl).DataBind();
        }

        protected void CargarDDLPlataformas(in Control ddl)
        {
            ((DropDownList)ddl).DataSource = NegocioPlataforma.ListarPlataformas();
            ((DropDownList)ddl).DataTextField = "Nombre";
            ((DropDownList)ddl).DataValueField = "IdPlataforma";
            ((DropDownList)ddl).SelectedIndex = 0;
            ((DropDownList)ddl).DataBind();
        }

        protected void btnGameXPlatformAgregar_Click(object sender, EventArgs e)
        {

            var jxp = new Juego_x_Plataforma(
                    int.Parse(ddlJuego_new.SelectedValue),
                    int.Parse(ddlPlataforma_new.SelectedValue)
                );

            var erroresAgregar = NegocioJuegoXPlataforma.AgregarJuegoXPlataforma(jxp);
            if (erroresAgregar.Any())
            {
                lblMsg.Text = string.Join("<br/>", erroresAgregar);
            }
            else
            {
                lblMsg.Text = $"Se agregó correctamente la plataforma {ddlPlataforma_new.Text} al juego {ddlJuego_new.Text}";
                ddlJuegosBuscar.SelectedIndex = 0;
                ddlPlataformasBuscar.SelectedIndex = 0;
                LimpiarControlesAgregar();
                CargarJuegosXPlataformas();
            }

            lblMsg.Visible = true;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // Logica para buscar
            var dt = NegocioJuegoXPlataforma.ListarJuegosXPlataformas(Convert.ToInt32(ddlJuegosBuscar.SelectedValue), Convert.ToInt32(ddlPlataformasBuscar.SelectedValue));
            Session["JuegosXPlataformasSession"] = dt;
            GridViewGamesXPlatforms.DataSource = dt;
            GridViewGamesXPlatforms.EditIndex = -1;
            GridViewGamesXPlatforms.PageIndex = 0;
            GridViewGamesXPlatforms.DataBind();
        }

        protected void BtnClearSearch_Click(object sender, EventArgs e)
        {
            GridViewGamesXPlatforms.EditIndex = -1;
            GridViewGamesXPlatforms.PageIndex = 0;
            ddlJuegosBuscar.SelectedIndex = 0;
            ddlPlataformasBuscar.SelectedIndex = 0;
            CargarJuegosXPlataformas();
        }

        protected void GridViewGamesXPlatforms_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewGamesXPlatforms.DataSource = (DataTable)Session["JuegosXPlataformasSession"];
            GridViewGamesXPlatforms.PageIndex = e.NewPageIndex;
            GridViewGamesXPlatforms.EditIndex = -1;
            GridViewGamesXPlatforms.DataBind();
        }

        protected void LimpiarControlesAgregar()
        {
            ddlJuego_new.SelectedIndex = 0;
            ddlPlataforma_new.SelectedIndex = 0;
        }

    }
}