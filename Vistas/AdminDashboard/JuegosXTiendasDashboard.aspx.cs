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
    public partial class JuegosXTiendasDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            if (!IsPostBack)
            {
                CargarJuegosXTiendas();
                CargarDDLJuegos(ddlJuego_new);
                CargarDDLTiendas(ddlTienda_new);
            }
        }

        protected void CargarJuegosXTiendas()
        {
            var tablaJuegosXTiendas = NegocioJuegoXTienda.ListarJuegosXTiendas(txtSearchGamesxstores.Text);
            GridViewGamesXStores.DataSource = tablaJuegosXTiendas;
            GridViewGamesXStores.DataBind();
        }

        protected void SetEditingIndexById(string editingIdJuego, string editingIdTienda)
        {
            var table = ((DataTable)GridViewGamesXStores.DataSource);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                string idJuego = table.Rows[i]["IdJuego"].ToString();
                string idTienda = table.Rows[i]["IdTienda"].ToString();
                if (idJuego == editingIdJuego && idTienda == editingIdTienda)
                {
                    GridViewGamesXStores.PageIndex = i / GridViewGamesXStores.PageSize;
                    GridViewGamesXStores.EditIndex = i % GridViewGamesXStores.PageSize;
                    GridViewGamesXStores.DataBind();
                    return;
                }
            }
            GridViewGamesXStores.EditIndex = -1;
            GridViewGamesXStores.DataBind();
        }



        protected void GridViewGamesXStores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchGamesxstores.Text = "";
            GridViewGamesXStores.EditIndex = -1;
            CargarJuegosXTiendas();
        }

        protected void GridViewGamesXStores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var editingIdJuego = ((HiddenField)GridViewGamesXStores.Rows[e.NewEditIndex].FindControl("hfGVGamesXStoresJuego")).Value;
            var editingIdTienda = ((HiddenField)GridViewGamesXStores.Rows[e.NewEditIndex].FindControl("hfGVGamesXStoresTienda")).Value;
            BtnClearSearch_Click(null, null);
            SetEditingIndexById(editingIdJuego, editingIdTienda);
            CargarJuegosXTiendas();
        }

        protected void GridViewGamesXStores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewGamesXStores.Rows[e.RowIndex];

            var txtPrecio = (TextBox)editedRow.FindControl("txtGVGamesXStoresPrecio");
            var txtPrecioRebajado = (TextBox)editedRow.FindControl("txtGVGamesXStoresPrecioRebajado");
            if (!double.TryParse(txtPrecio.Text, out double precio))
            {
                lblMsg.Text = "El valor del campo Precio debe ser numérico";
                lblMsg.Visible = true;
                return;
            }


            var jxt = new Juego_x_Tienda(
                    Convert.ToInt32(((HiddenField)editedRow.FindControl("hfGVGamesXStoresJuego")).Value),
                    Convert.ToInt32(((HiddenField)editedRow.FindControl("hfGVGamesXStoresTienda")).Value),
                    ((TextBox)editedRow.FindControl("txtGVGamesXStoresURL")).Text,
                    precio,
                    null,
                    ((CheckBox)editedRow.FindControl("chkGVGamesXStoresActivo")).Checked
                );


            if (!String.IsNullOrEmpty(txtPrecioRebajado.Text))
            {
                if (double.TryParse(txtPrecioRebajado.Text, out double precioRebajado))
                    jxt.setPrecioRebajado(precioRebajado);
                else
                {
                    lblMsg.Text = "El valor del campo Precio Rebajado debe ser numérico";
                    lblMsg.Visible = true;
                    return;
                }
            }

            var erroresActualizar = NegocioJuegoXTienda.ActualizarJuegoXTienda(jxt);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<div>";
                lblMsg.Visible = true;
            }
            else
            {
                txtSearchGamesxstores.Text = "";
                GridViewGamesXStores.EditIndex = -1;
            }
            CargarJuegosXTiendas();

        }

        protected void GridViewGamesXStores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var rowToDelete = GridViewGamesXStores.Rows[e.RowIndex];
                var jxtKey = new Juego_x_Tienda();
                jxtKey.setID_Juego(int.Parse(((HiddenField)rowToDelete.FindControl("hfGVGamesXStoresJuego")).Value));
                jxtKey.setID_Tienda(int.Parse(((HiddenField)rowToDelete.FindControl("hfGVGamesXStoresTienda")).Value));
                List<string> erroresEliminar = NegocioJuegoXTienda.EliminarJuegoXTienda(jxtKey);
                if (erroresEliminar.Any())
                {
                    foreach (string msg in erroresEliminar)
                        lblMsg.Text += msg + "<div>";
                    lblMsg.Visible = true;
                }
                else
                {
                    txtSearchGamesxstores.Text = "";
                    GridViewGamesXStores.EditIndex = -1;
                }
                CargarJuegosXTiendas();
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
            ((DropDownList)ddl).DataBind();
        }

        protected void CargarDDLTiendas(in Control ddl)
        {
            ((DropDownList)ddl).DataSource = NegocioTienda.ListarTiendas();
            ((DropDownList)ddl).DataTextField = "Tienda";
            ((DropDownList)ddl).DataValueField = "Id";
            ((DropDownList)ddl).SelectedValue = "1";
            ((DropDownList)ddl).DataBind();
        }

        protected void btnGVGamesXStoresAgregar_Click(object sender, EventArgs e)
        {
            if (!double.TryParse(txtPrecio_new.Text, out double precio))
            {
                lblMsg.Text = "El valor del campo Precio debe ser numérico";
                lblMsg.Visible = true;
                return;
            }

            var jxt = new Juego_x_Tienda(
                    int.Parse(ddlJuego_new.SelectedValue),
                    int.Parse(ddlTienda_new.SelectedValue),
                    txtURL_new.Text,
                    precio,
                    null,
                    true
                );

            if (!String.IsNullOrEmpty(txtPrecioRebajado_new.Text))
            {
                if (double.TryParse(txtPrecioRebajado_new.Text, out double precioRebajado))
                    jxt.setPrecioRebajado(precioRebajado);
                else
                {
                    lblMsg.Text = "El valor del campo Precio Rebajado debe ser numérico";
                    lblMsg.Visible = true;
                    return;
                }
            }

            var erroresAgregar = NegocioJuegoXTienda.AgregarJuegoXTienda(jxt);
            if (erroresAgregar.Any())
            {
                foreach (string msg in erroresAgregar)
                    lblMsg.Text += msg + "<div>";
                lblMsg.Visible = true;
            }
            else
            {
                txtSearchGamesxstores.Text = "";
                CargarJuegosXTiendas();
            }

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // Logica para buscar
            GridViewGamesXStores.EditIndex = -1;
            GridViewGamesXStores.PageIndex = 0;
            CargarJuegosXTiendas();
        }

        protected void BtnClearSearch_Click(object sender, EventArgs e)
        {
            GridViewGamesXStores.EditIndex = -1;
            GridViewGamesXStores.PageIndex = 0;
            txtSearchGamesxstores.Text = "";
            CargarJuegosXTiendas();
        }

        protected void GridViewGamesXStores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewGamesXStores.PageIndex = e.NewPageIndex;
            CargarJuegosXTiendas();
        }
    }
}