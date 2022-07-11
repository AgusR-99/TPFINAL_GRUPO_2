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
            var dt = NegocioPlataforma.ListarPlataformas();
            GVPlataform.DataSource = dt;
            Session["PlataformasSession"] = dt;
            GVPlataform.DataBind();
            ObtenerIdPlataforma();
        }

        

        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            var foo = Convert.ToInt32(lblGVPlataformID.Text);
            var bar = txtGVPlataformName.Text;
            var fooo = chkGVPlataformActivo.Checked;
            Plataforma plataforma = new Plataforma(
                foo,
                bar,
                fooo
                );

            var erroresAgregar = NegocioPlataforma.AgregarPlataforma(plataforma);
            if (erroresAgregar.Any()) Msg(erroresAgregar);
            else
            {
                lblMsg.Text = "Registro agregado con exito";
                txtSearchPlataform.Text = "";
                txtGVPlataformName.Text = "";
                GVPlataform.EditIndex = -1;
                CargarPlataformas();
            }
        }

        protected void grdPlataformsData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVPlataform.PageIndex = e.NewPageIndex;
            CargarPlataformas();
        }

        protected void ObtenerIdPlataforma()
        {
            var ds = NegocioPlataforma.ObtenerPlataformaSiguienteID();
            lblGVPlataformID.Text = ds.Tables[0].Rows[0][0].ToString();
             
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
            Plataforma plataforma = new Plataforma(
                    Convert.ToInt32(((Label)editedRow.FindControl("lblGVPlataformID")).Text),
                    ((TextBox)editedRow.FindControl("txtGVPlataformName")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVPlataformActivo")).Checked
                );
            var erroresActualizar = NegocioPlataforma.ActualizarPlataforma(plataforma);
            if (erroresActualizar.Any()) Msg(erroresActualizar);
            else
            {
                lblMsg.Text= "Registro modificado exitosamente";
                txtSearchPlataform.Text = "";
                GVPlataform.EditIndex = -1;
                CargarPlataformas();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            var dt = NegocioPlataforma.ListarPlataformasPorNombre(txtSearchPlataform.Text);
            GVPlataform.DataSource = dt;
            Session["PlataformasSession"] = dt;
            GVPlataform.DataBind();
        }

        protected void Msg(List<string> msg)
        {
            lblMsg.Text = msg.ToString();
        }

        protected void ddlPlataform_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPlataform.SelectedIndex == 0)
            {
                var dt = NegocioPlataforma.ListarPlataformas();
                GVPlataform.DataSource = dt;
                Session["PlataformasSession"] = dt;
                GVPlataform.DataBind();
                ObtenerIdPlataforma();
            }
            else
            {
                if (ddlPlataform.SelectedIndex == 1)
                {
                    var tabla = NegocioPlataforma.ListarPlataformasActivo(true);
                    GVPlataform.DataSource = tabla;
                    GVPlataform.DataBind();
                }
                else
                {
                    if (ddlPlataform.SelectedIndex == 2)
                    {
                        var tabla = NegocioPlataforma.ListarPlataformasActivo(false);
                        GVPlataform.DataSource = tabla;
                        GVPlataform.DataBind();
                    }
                }
            }
        }

        protected void btnFiltrarPlataforma_Click(object sender, EventArgs e)
        {

        }
    }
}