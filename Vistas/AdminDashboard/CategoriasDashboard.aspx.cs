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
            GVCategories.DataSource = dt;
            Session["CategoriasSession"] = dt;
            GVCategories.DataBind();
            ObtenerId();
        }
        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            var foo = Convert.ToInt32(lblGVCategoriesID.Text);
            var bar = txtGVCategoriesName.Text;
            var fooo = chkGVCategoriesActivo.Checked;
            Categoria categoria = new Categoria(
                foo,
                bar,
                fooo
                );

            var erroresAgregar = NegocioCategorias.AgregarCategoria(categoria);
            if (erroresAgregar != "") Msg(erroresAgregar);
            else
            {
                lblMsg.Text = "Registro agregado con exito";
                txtSearchCategory.Text = "";
                txtGVCategoriesName.Text = "";
                GVCategories.EditIndex = -1;
                CargarCategorias();
            }
        }

        protected void grdCategoriesData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVCategories.PageIndex = e.NewPageIndex;
            CargarCategorias();
        }
        protected void ObtenerId()
        {
            var ds = NegocioCategorias.ObtenerCategoriaSiguienteID();
            lblGVCategoriesID.Text = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void Category_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GVCategories.EditIndex = e.NewEditIndex;
            GVCategories.DataSource = (DataTable)Session["CategoriasSession"];
            GVCategories.DataBind();
        }

        protected void Category_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GVCategories.EditIndex = -1;
            GVCategories.DataSource = (DataTable)Session["CategoriasSession"];
            GVCategories.DataBind();
        }

        protected void Category_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GVCategories.Rows[e.RowIndex];
            Categoria categoria = new Categoria(
                    Convert.ToInt32(((Label)editedRow.FindControl("lblGVCategoriesID")).Text),
                    ((TextBox)editedRow.FindControl("txtGVCategoriesName")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVCategoriesActivo")).Checked
                );
            var erroresActualizar = NegocioCategorias.ActualizarCategoria(categoria);
            if (erroresActualizar != "") Msg(erroresActualizar);
            else
            {
                Msg("Registro modificado exitosamente");
                txtSearchCategory.Text = "";
                GVCategories.EditIndex = -1;
                CargarCategorias();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            var dt = NegocioCategorias.ListarCategoriasPorNombre(txtSearchCategory.Text);
            GVCategories.DataSource = dt;
            Session["CategoriasSession"] = dt;
            GVCategories.DataBind();
        }

        protected void Msg(string msg)
        {
            lblMsg.Text = msg;
            lblMsg.Visible = true;
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoria.SelectedIndex == 0)
            {
                var dt = NegocioCategorias.ListarCategorias();
                GVCategories.DataSource = dt;
                Session["CategoriasSession"] = dt;
                GVCategories.DataBind();
                ObtenerId();
            }
            else
            {
                if (ddlCategoria.SelectedIndex == 1)
                {
                    var tabla = NegocioCategorias.ListarCategoriasActivo(true);
                    GVCategories.DataSource = tabla;
                    GVCategories.DataBind();
                }
                else
                {
                    if (ddlCategoria.SelectedIndex == 2)
                    {
                        var tabla = NegocioCategorias.ListarCategoriasActivo(false);
                        GVCategories.DataSource = tabla;
                        GVCategories.DataBind();
                    }
                }
            }
        }

        protected void btnCategoria_Click(object sender, EventArgs e)
        {

        }
    }
}