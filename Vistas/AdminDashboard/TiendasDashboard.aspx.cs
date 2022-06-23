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
    public partial class TiendasDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTiendas();
            }
        }

        protected void CargarTiendas()
        {

            var tablaTiendas = NegocioTienda.ListarTiendas();
            GridViewStores.DataSource = tablaTiendas;
            GridViewStores.DataBind();
        }

        protected void TiendaEdit(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridViewStores.EditIndex = e.NewEditIndex;
            CargarTiendas();
        }

        protected void TiendaUpdate(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewStores.Rows[e.RowIndex];
            Tienda tienda = new Tienda(
                    Convert.ToInt32((((Label)editedRow.FindControl("lblGVStoresID")).Text)),
                    ((TextBox)editedRow.FindControl("txtGVStoresTienda")).Text,
                    ((TextBox)editedRow.FindControl("txtGVStoresImagen")).Text,
                    ((TextBox)editedRow.FindControl("txtGVStoresSitioWeb")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVStoresActivo")).Checked
                );
            var erroresActualizar = NegocioTienda.ActualizarTienda(tienda);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<br>";
                lblMsg.Visible = true;
            }
            else
            {
                GridViewStores.EditIndex = -1;
                CargarTiendas();
            }
        }
        protected void TiendaCancelEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridViewStores.EditIndex = -1;
            CargarTiendas();
        }

        protected void TiendaDelete(object sender, GridViewDeleteEventArgs e)
        {
            Label lblIDTienda = (Label)GridViewStores.Rows[e.RowIndex].FindControl("lblGVStoresID");
            int idTienda = Convert.ToInt32(lblIDTienda.Text);
            var erroresEliminar = NegocioTienda.EliminarTienda(new Tienda(idTienda));
            if (erroresEliminar.Any())
            {
                foreach (string msg in erroresEliminar)
                    lblMsg.Text += msg + "<br>";
            }
            else
            {
                lblMsg.Text = $"Se eliminó la tienda {idTienda}";
            }
            lblMsg.Visible = true;
            CargarTiendas();
        }

        protected void btnAddStore_Click(object sender, EventArgs e)
        {
            var tablaTiendas = NegocioTienda.ListarTiendas();
            tablaTiendas.Rows.Add("0", "", "", "", false);
            GridViewStores.DataSource = tablaTiendas;
            //GridViewStores.EditIndex = tablaTiendas.Rows.Count-1;
            GridViewStores.DataBind();
            var addingRow = GridViewStores.Rows[tablaTiendas.Rows.Count - 1];
            ((Label)addingRow.FindControl("lblGVStoresID")).Text = "#";
        }

        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            // Logica para agregar
        }

        protected void BtnSearch_Click(Object sender, EventArgs e)
        {
            // Logica para buscar
        }
    }
}