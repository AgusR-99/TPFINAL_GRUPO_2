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
            Session["UsuariosSession"] = tablaUsuarios;
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
            txtSearchUser.Text = "";
            GridViewUsers.DataSource = (DataTable)Session["UsuariosSession"];
            GridViewUsers.EditIndex = e.NewEditIndex;
            GridViewUsers.DataBind();
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

        //Deprecado -> No se pueden agregar usuarios desde el dashboard
        //protected void BtnInsert_Click(Object sender, EventArgs e)
        //{
        //    // Logica para agregar usuario
        //}

        protected void BtnSearch_Click(Object sender, EventArgs e)
        {
            var dt = NegocioUsuario.ListarUsuariosPorNombre(txtSearchUser.Text);
            GridViewUsers.EditIndex = -1;
            GridViewUsers.DataSource = dt;
            Session["UsuariosSession"] = dt;
            GridViewUsers.DataBind();
        }

        protected void ddlusuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnfiltrarusuario_Click(object sender, EventArgs e)
        {
            if (ddlusuarios.SelectedIndex == 0)
            {
                var tablaUsuarios = NegocioUsuario.ListarUsuarios();
                Session["UsuariosSession"] = tablaUsuarios;
                GridViewUsers.DataSource = tablaUsuarios;
                GridViewUsers.DataBind();
            }
            else
            {
                if (ddlusuarios.SelectedIndex == 1)
                {
                    var tablausuario = NegocioUsuario.ListarUsuariosActivos(true);
                    Session["UsuariosSession"] = tablausuario;
                    GridViewUsers.DataSource = tablausuario;
                    GridViewUsers.DataBind();
                }
                else
                {
                    if (ddlusuarios.SelectedIndex == 2)
                    {
                        var tablaUsuarios = NegocioUsuario.ListarUsuariosActivos(false);
                        Session["UsuariosSession"] = tablaUsuarios;
                        GridViewUsers.DataSource = tablaUsuarios;
                        GridViewUsers.DataBind();
                    }
                    else
                    {
                        if (ddlusuarios.SelectedIndex == 3)
                        {
                            var tablaUsuarios = NegocioUsuario.ListarUsuariosAdmin(true);
                            Session["UsuariosSession"] = tablaUsuarios;
                            GridViewUsers.DataSource = tablaUsuarios;
                            GridViewUsers.DataBind();
                        }
                        else
                        {
                            if (ddlusuarios.SelectedIndex == 4)
                            {
                                var tablaUsuarios = NegocioUsuario.ListarUsuariosAdmin(false);
                                Session["UsuariosSession"] = tablaUsuarios;
                                GridViewUsers.DataSource = tablaUsuarios;
                                GridViewUsers.DataBind();
                            }
                        }
                    }
                }
            }
        }
    }
}