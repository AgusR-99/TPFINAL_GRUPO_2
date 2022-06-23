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
    public partial class PlataformasDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPlataformas();
            }
        }
        protected void CargarPlataformas()
        {
            var dt = NegocioPlataformas.ListarPlataformas();
            GVPlataform.DataSource = dt;
            Session["PlataformasSession"] = dt;
            GVPlataform.DataBind();
            ObtenerId();
        }
        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            var foo = Convert.ToInt32(lblGVPlataformID.Text);
            var bar = txtGVPlataformName.Text;
            var fooo = chkGVPlataformActivo.Checked;
            Categoria categoria = new Categoria(
                foo,
                bar,
                fooo
                );

            var erroresAgregar = NegocioPlataformas.AgregarCategoria(categoria);
            if (erroresAgregar != "") Msg(erroresAgregar);
            else
            {
                lblMsg.Text = "Registro agregado con exito";
                txtSearchPlataform.Text = "";
                txtGVPlataformName.Text = "";
                GVPlataform.EditIndex = -1;
                CargarPlataformas();
            }
        }

        protected void grdPlataformData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVPlataform.PageIndex = e.NewPageIndex;
            CargarPlataformas();
        }

        protected void Plataform_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearchPlataform.Text = "";
            GVPlataform.EditIndex = e.NewEditIndex;
            GVPlataform.DataSource = (DataTable)Session["PlataformasSession"];
            GVPlataform.DataBind();
        }

        protected void Plataform_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchPlataform.Text = "";
            GVPlataform.EditIndex = -1;
            GVPlataform.DataSource = (DataTable)Session["PlataformasSession"];
            GVPlataform.DataBind();
        }

        protected void Plataform_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GVPlataform.Rows[e.RowIndex];
            Categoria categoria = new Categoria(
                    Convert.ToInt32(((Label)editedRow.FindControl("lblGVPlataformID")).Text),
                    ((TextBox)editedRow.FindControl("txtGVPlataformName")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVPlataformActivo")).Checked
                );
            var erroresActualizar = NegocioPlataformas.ActualizarCategoria(categoria);
            if (erroresActualizar != "") Msg(erroresActualizar);
            else
            {
                Msg("Registro modificado exitosamente");
                txtSearchPlataform.Text = "";
                GVPlataform.EditIndex = -1;
                CargarPlataformas();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            var dt = NegocioPlataformas.ListarPlataformasPorNombre(txtSearchPlataform.Text);
            GVPlataform.DataSource = dt;
            Session["PlataformasSession"] = dt;
            GVPlataform.DataBind();
        }

        protected void Msg(string msg)
        {
            lblMsg.Text = msg;
        }
    }
}