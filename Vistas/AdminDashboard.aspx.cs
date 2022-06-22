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
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected string Active;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!NegocioUsuario.IsLoggedInAsAdmin(Session)) Response.Redirect("Home.aspx");
            lblMsg.Text = "";
            lblMsg.Visible = false;

            if (!IsPostBack)
            {
                Active = "";
                CargarTiendas();
                CargarUsuarios();
                CargarJuegos();
                CargarCategorias();
                CargarJuegosXTiendas();
            }
        }

        protected void CargarTiendas() 
        {
            
            var tablaTiendas = NegocioTienda.ListarTiendas();
            GridViewStores.DataSource = tablaTiendas;
            GridViewStores.DataBind();
        }
        protected void CargarUsuarios()
        {

            var tablaUsuarios = NegocioUsuario.ListarUsuarios();
            GridViewUsers.DataSource = tablaUsuarios;
            GridViewUsers.DataBind();
        }
        protected void CargarJuegos()
        {

            var tablaJuegos = NegocioJuego.ListarJuegos();
            GridViewGames.DataSource = tablaJuegos;
            GridViewGames.DataBind();
        }
        protected void CargarCategorias()
        {
            var tablaCategorias = NegocioCategorias.ListarCategorias();
            GridViewCategories.DataSource = tablaCategorias;
            GridViewCategories.DataBind();
        }

        protected void CargarJuegosXTiendas()
        {
            var tablaJuegosXTiendas = NegocioJuegoXTienda.ListarJuegosXTiendas();
            GridViewGamesXStores.DataSource = tablaJuegosXTiendas;
            GridViewGamesXStores.DataBind();
            CargarDDLJuegos(GridViewGamesXStores.FooterRow.FindControl("ddlGVGamesXStoresJuego"));
            CargarDDLTiendas(GridViewGamesXStores.FooterRow.FindControl("ddlGVGamesXStoresTienda"));
        }

        protected void AgregarImagenes(ref DataTable tabla, string colURL)
        {
            var columnaImagenes = new DataColumn("Imagen", typeof(byte[]));
        }

        protected void TiendaEdit(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridViewStores.EditIndex = e.NewEditIndex;
            CargarTiendas();
            Active = "store";
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
            }
            else
            {
                lblMsg.Text = $"Tienda {tienda.getID_Tienda()} - {tienda.getNombre()} actualizada correctamente";
                GridViewStores.EditIndex = -1;
                CargarTiendas();
            }
            lblMsg.Visible = true;
            Active = "store";
        }

        protected void TiendaCancelEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridViewStores.EditIndex = -1;
            CargarTiendas();
            Active = "store";
        }

        protected void GridViewGames_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow) 
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlGVGamesIDDesarrollador");
                if (ddl != null)
                {
                    ddl.DataSource = NegocioDesarrollador.ListarDesarrolladores();
                    ddl.DataTextField = "NombreDesarrollador";
                    ddl.DataValueField = "IdDesarrollador";
                    ddl.DataBind();
                }
            }

        }
        /*aca*/

        protected void GridViewGames_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewGames.EditIndex = e.NewEditIndex;
            CargarJuegos();
            Active = "game";
        }

        protected void GridViewGames_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewGames.EditIndex = -1;
            CargarJuegos();
            Active = "game";
        }

        protected void GridViewGames_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewGames.Rows[e.RowIndex];
            Juego juego = new Juego(
                    Convert.ToInt32((((Label)editedRow.FindControl("lblGVGamesIDJuego")).Text)),
                    Convert.ToInt32((((DropDownList)editedRow.FindControl("ddlGVGamesIDDesarrollador")).SelectedValue)),
                    ((TextBox)editedRow.FindControl("txtGVGamesNombre")).Text,
                    ((TextBox)editedRow.FindControl("txtGVGamesDescripcion")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVGamesActivo")).Checked
                   );
            var erroresActualizar = NegocioJuego.ActualizarJuego(juego);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<br>";
                    lblMsg.Visible = true;
            }
            else
            {
                GridViewGames.EditIndex = -1;
                CargarJuegos();
            }
            Active = "game";
        }

        protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            CargarUsuarios();
            Active = "user";
        }

        protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex;
            CargarCategorias();
            Active = "user";
        }

        protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewUsers.Rows[e.RowIndex];
            Usuario usuario = new Usuario(
                    ((((Label)editedRow.FindControl("lblGVUsersUsername")).Text)),
                    ((TextBox)editedRow.FindControl("txtGVUsersEmail")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVUsersAdministrador")).Checked,
                    ((TextBox)editedRow.FindControl("txtGVUsersDescripcion")).Text,
                    ((CheckBox)editedRow.FindControl("chkGVUsersActivo")).Checked
                );
            var erroresActualizar = NegocioUsuario.ActualizarUsuario(usuario);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<br>";
                lblMsg.Visible = true;
            }
            else
            {
                GridViewUsers.EditIndex = -1;
                CargarUsuarios();
            }
            Active = "user";
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
                txtSearchCategory.Text = "";
                GridViewCategories.EditIndex = -1;
                CargarCategorias();
            }
            Active = "category";
        }

        protected void grdCategoriesData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCategories.PageIndex = e.NewPageIndex;
            CargarCategorias();
        }
        protected string ObtenerId()
        {
            var ds = NegocioCategorias.ObtenerCategoriaSiguienteID();
            var test = ds.Tables[0].Rows[0][0].ToString();
            return test;
        }

        protected void Category_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GridViewCategories.EditIndex = e.NewEditIndex;
            CargarCategorias();
            Active = "category";
        }

        protected void Category_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GridViewCategories.EditIndex = -1;
            CargarCategorias();
            Active = "category";
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
                txtSearchCategory.Text = "";
                GridViewCategories.EditIndex = -1;
                CargarCategorias();
            }
            Active = "category";
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            var dt = NegocioCategorias.ListarCategoriasPorNombre(txtSearchCategory.Text);
            GridViewCategories.DataSource = dt;
            GridViewCategories.DataBind();
            Active = "category";
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
            Active = "store";
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

        protected void GridViewGamesXStores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            txtSearchCategory.Text = "";
            GridViewGamesXStores.EditIndex = -1;
            CargarJuegosXTiendas();
            Active = "gamesxstores";
        }

        protected void GridViewGamesXStores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            txtSearchGamesxstores.Text = "";
            GridViewGamesXStores.EditIndex = e.NewEditIndex;
            CargarJuegosXTiendas();
            Active = "gamesxstores";
        }

        protected void GridViewGamesXStores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var editedRow = GridViewGamesXStores.Rows[e.RowIndex];

            var txtPrecio = (TextBox)editedRow.FindControl("txtGVGamesXStoresPrecio");
            var txtPrecioRebajado = (TextBox)editedRow.FindControl("txtGVGamesXStoresPrecioRebajado");
            if(!double.TryParse(txtPrecio.Text, out double precio))
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
            Active = "gamesxstores";

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
                Active = "gamesxstores";
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
            var footer = GridViewGamesXStores.FooterRow;
            var txtPrecio = (TextBox)footer.FindControl("txtGVGamesXStoresPrecio");
            if (!double.TryParse(txtPrecio.Text, out double precio))
            {
                lblMsg.Text = "El valor del campo Precio debe ser numérico";
                lblMsg.Visible = true;
                return;
            }

            var jxt = new Juego_x_Tienda(
                    int.Parse(((DropDownList)footer.FindControl("ddlGVGamesXStoresJuego")).SelectedValue),
                    int.Parse(((DropDownList)footer.FindControl("ddlGVGamesXStoresTienda")).SelectedValue),
                    ((TextBox)footer.FindControl("txtGVGamesXStoresURL")).Text,
                    precio,
                    null,
                    true
                );

            var txtPrecioRebajado = (TextBox)footer.FindControl("txtGVGamesXStoresPrecioRebajado");
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
                GridViewGamesXStores.EditIndex = -1;
                CargarJuegosXTiendas();
            }
            Active = "gamesxstores";

        }


    }
}