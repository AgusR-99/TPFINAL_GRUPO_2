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
                lblMsg.Visible = true;
            }
            else
            {
                GridViewStores.EditIndex = -1;
                CargarTiendas();
            }
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
    }
}