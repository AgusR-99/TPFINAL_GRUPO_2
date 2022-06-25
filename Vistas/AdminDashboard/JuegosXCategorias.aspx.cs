using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class JuegosXCategorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGamesXCat();
            }
        }
        protected void CargarGamesXCat()
        {
            var dt = NegocioJuegosXCategorias.Listar();
            if (dt.Rows.Count == 0) lblMsg.Text = "La tabla se encuentra vacia ¡Intenta agregar registros nuevos!";
            GVGamesXCat.DataSource = dt;
            Session["GamesXCatSession"] = dt;
            GVGamesXCat.DataBind();
            ObtenerId();
        }
        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            Juegos_x_Categorias obj = CargarObjeto();

            var estado = NegocioJuegosXCategorias.Agregar(obj);
            lblMsg.Text = estado;
            if (!estado.Contains("Error"))
            {
                GVGamesXCat.EditIndex = -1;
                CargarGamesXCat();
            }
        }

        protected void GamesXCatData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVGamesXCat.PageIndex = e.NewPageIndex;
            CargarGamesXCat();
        }
        protected void ObtenerId()
        {
            var ds = NegocioJuegosXCategorias.ObtenerSiguienteID();
            lblGVGamesXCat_IDLink.Text = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void GamesXCat_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearch.Text = "";
            GVGamesXCat.EditIndex = e.NewEditIndex;
            GVGamesXCat.DataSource = (DataTable)Session["GamesXCatSession"];
            GVGamesXCat.DataBind();
        }

        protected void GamesXCat_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearch.Text = "";
            GVGamesXCat.EditIndex = -1;
            GVGamesXCat.DataSource = (DataTable)Session["GamesXCatSession"];
            GVGamesXCat.DataBind();
        }

        protected void GamesXCat_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Juegos_x_Categorias obj = CargarObjeto_Edit(sender, e);

            var estado = NegocioJuegosXCategorias.Actualizar(obj);
            lblMsg.Text = estado;
            if (!estado.Contains("Error"))
            {
                GVGamesXCat.EditIndex = -1;
                CargarGamesXCat();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            var dt = NegocioJuegosXCategorias.ListarPorInput(txtSearch.Text);
            lblMsg.Text = "";
            if (dt.Rows.Count == 0) lblMsg.Text = $"Tu busqueda - {txtSearch.Text} - no encontro registros.";
            GVGamesXCat.DataSource = dt;
            Session["GamesXCatSession"] = dt;
            GVGamesXCat.DataBind();
        }

        protected void Msg(string msg)
        {
            lblMsg.Text = msg;
        }

        private Juegos_x_Categorias CargarObjeto()
        {
            Juegos_x_Categorias obj = new Juegos_x_Categorias (
                Convert.ToInt32(lblGVGamesXCat_IDLink.Text),
                txtGVGamesXCat_Game.Text,
                txtGVGamesXCat_Cat.Text,
                chkGVGamesXCat_Activo.Checked
                );
            return obj;
        }

        private Juegos_x_Categorias CargarObjeto_Edit(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GVGamesXCat.Rows[e.RowIndex];
            Juegos_x_Categorias obj = new Juegos_x_Categorias(
                Convert.ToInt32(((Label)editedRow.FindControl("lblGVGamesXCat_IDLink")).Text),
                ((TextBox)editedRow.FindControl("txtGVGamesXCat_Game")).Text,
                ((TextBox)editedRow.FindControl("txtGVGamesXCat_Cat")).Text,
                ((CheckBox)editedRow.FindControl("chkGVGamesXCat_Activo")).Checked
                );
            return obj;
        }
    }
}