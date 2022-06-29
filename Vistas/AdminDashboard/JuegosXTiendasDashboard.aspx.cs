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
            Session["JuegosXTiendasSession"] = tablaJuegosXTiendas;
            GridViewGamesXStores.DataSource = tablaJuegosXTiendas;
            GridViewGamesXStores.DataBind();
        }

        protected void GridViewGamesXStores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewGamesXStores.EditIndex = -1;
            GridViewGamesXStores.DataSource = (DataTable)Session["JuegosXTiendasSession"];
            GridViewGamesXStores.DataBind();
        }

        protected void GridViewGamesXStores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewGamesXStores.DataSource = Session["JuegosXTiendasSession"];
            GridViewGamesXStores.EditIndex = e.NewEditIndex;
            GridViewGamesXStores.DataBind();
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
                lblMsg.Text = string.Join("<div>", erroresActualizar);
            }
            else
            {
                lblMsg.Text = "Se actualizó correctamente";
                txtSearchGamesxstores.Text = "";
                GridViewGamesXStores.EditIndex = -1;
                CargarJuegosXTiendas();
            }
            lblMsg.Visible = true;
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
                    lblMsg.Text = string.Join("<div>", erroresEliminar);
                }
                else
                {
                    lblMsg.Text = "Se eliminó correctamente";
                    GridViewGamesXStores.EditIndex = -1;
                    CargarJuegosXTiendas();
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
                lblMsg.Text = string.Join("<div>", erroresAgregar);
            }
            else
            {
                lblMsg.Text = $"Se agregó correctamente el juego {ddlJuego_new.SelectedItem.Text} a la tienda {ddlTienda_new.SelectedItem.Text}";
                txtSearchGamesxstores.Text = "";
                LimpiarControlesAgregar();
                CargarJuegosXTiendas();
            }

            lblMsg.Visible = true;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // Logica para buscar
            var dt = NegocioJuegoXTienda.ListarJuegosXTiendas(txtSearchGamesxstores.Text);
            Session["JuegosXTiendasSession"] = dt;
            GridViewGamesXStores.DataSource = dt;
            GridViewGamesXStores.EditIndex = -1;
            GridViewGamesXStores.PageIndex = 0;
            GridViewGamesXStores.DataBind();
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
            GridViewGamesXStores.DataSource = (DataTable)Session["JuegosXTiendasSession"];
            GridViewGamesXStores.PageIndex = e.NewPageIndex;
            GridViewGamesXStores.EditIndex = -1;
            GridViewGamesXStores.DataBind();
        }

        protected void LimpiarControlesAgregar()
        {
            ddlJuego_new.SelectedIndex = 0;
            ddlTienda_new.SelectedIndex = 0;
            txtURL_new.Text = "";
            txtPrecio_new.Text = "";
            txtPrecioRebajado_new.Text = "";
        }

    }
}