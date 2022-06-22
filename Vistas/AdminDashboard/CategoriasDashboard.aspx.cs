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
    public partial class CategoriasDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
            }
        }
        protected void CargarCategorias()
        {

            var dt = NegocioCategorias.ListarCategorias();
            GridViewCategories.DataSource = dt;
            Session["CategoriasSession"] = dt;
            GridViewCategories.DataBind();
        }
        protected void BtnInsert_Click(Object sender, EventArgs e)
        {

            Categoria categoria = new Categoria(
                Convert.ToInt32(((Label)GridViewCategories.FooterRow.FindControl("lblGVCategoriesID")).Text),
                ((TextBox)GridViewCategories.FooterRow.FindControl("txtGVCategoriesName")).Text,
                ((CheckBox)GridViewCategories.FooterRow.FindControl("chkGVCategoriesActivo")).Checked
                );

            var erroresAgregar = NegocioCategorias.AgregarCategoria(categoria);
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
                txtSearchCategory.Text = "";
                GridViewCategories.EditIndex = -1;
                CargarCategorias();
            }
        }

        protected void grdCategoriesData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCategories.PageIndex = e.NewPageIndex;
            CargarCategorias();
        }
        protected string ObtenerId()
        {
            var ds = NegocioCategorias.ObtenerCategoriaSiguienteID();
            return ds.Tables[0].Rows[0][0].ToString();
        }

        protected void Category_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GridViewCategories.EditIndex = e.NewEditIndex;
            GridViewCategories.DataSource = (DataTable)Session["CategoriasSession"];
            GridViewCategories.DataBind();
        }

        protected void Category_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GridViewCategories.EditIndex = -1;
            GridViewCategories.DataSource = (DataTable)Session["CategoriasSession"];
            GridViewCategories.DataBind();
        }

        protected void Category_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewCategories.Rows[e.RowIndex];
            Categoria categoria = new Categoria(
                    Convert.ToInt32(((Label)editedRow.FindControl("lblGVCategoriesID")).Text),
                    ((TextBox)editedRow.FindControl("txtGVCategoriesName")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVCategoriesActivo")).Checked
                );
            var erroresActualizar = NegocioCategorias.ActualizarCategoria(categoria);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<div>";
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.Text = "Registro modificado con exito";
                lblMsg.Visible = true;
                txtSearchCategory.Text = "";
                GridViewCategories.EditIndex = -1;
                CargarCategorias();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            var dt = NegocioCategorias.ListarCategoriasPorNombre(txtSearchCategory.Text);
            GridViewCategories.DataSource = dt;
            Session["CategoriasSession"] = dt;
            GridViewCategories.DataBind();
        }
    }
}