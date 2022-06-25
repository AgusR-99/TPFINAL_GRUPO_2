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
    public partial class UsuariosDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }
        protected void CargarUsuarios()
        {
            var tablaUsuarios = NegocioUsuario.ListarUsuarios();
            GridViewUsers.DataSource = tablaUsuarios;
            GridViewUsers.DataBind();
        }
        protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            CargarUsuarios();
        }

        protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex;
            CargarUsuarios();
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
        }
        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            // Logica para agregar usuario
        }

        protected void BtnSearch_Click(Object sender, EventArgs e)
        {
            var dt = NegocioUsuario.ListarUsuariosPorNombre(txtSearchUser.Text);
            GridViewUsers.DataSource = dt;
            Session["UsuariosSession"] = dt;
            GridViewUsers.DataBind();
        }
    }
}