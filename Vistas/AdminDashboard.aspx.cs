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

        protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            CargarUsuarios();
            Active = "user";
        }

        protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex;
            CargarUsuarios();
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
            NegocioUsuario.ActualizarUsuario(usuario);
            GridViewUsers.EditIndex = -1;
            CargarUsuarios();
            Active = "user";
        }
    }
}