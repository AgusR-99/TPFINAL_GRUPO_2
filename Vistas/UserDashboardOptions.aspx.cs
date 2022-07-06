using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Text.RegularExpressions;

namespace Vistas
{
    public partial class UserDashboardOptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            var ejemplo = Negocio.NegocioUsuario.ObtenerUsuarioEnUso(Session);
            string dat1 = txtUsername.Text;
            string dat2 = txtDescripcion.Text;
            string dat3 = txtEmail.Text;
            string dat4 = txtPassword.Text;
            Usuario usuario = new Usuario(ejemplo.getUsername(), dat1, dat4, dat2, dat3);
            if (Email_bien_escrito(txtEmail.Text) == true)
            {
                if (txtPassword.Text == txtPassword2.Text)
                {
                    if (txtPassword.Text.Length > 7)
                    {
                        var erroresActualizar = NegocioUsuario.ActualizarDatosUsuario(usuario);
                        if (erroresActualizar == "")
                        {
                            NegocioUsuario.Login(Session, dat3, dat4);
                            Response.Redirect("UserDashboardOptions.aspx");
                        }
                        else
                        {
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                            lblMsg.Text = erroresActualizar;
                        }
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "*Error. La Contraseña debe tener 8 o más caracteres";
                    }
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "*Error. No se repitió la Contraseña";
                }
            }
            else
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "*Error. Email no válido. Se debe usar el formato: nombre@dominio.com";
            }
        }

        private Boolean Email_bien_escrito(String email)
        {
            String expresion;
            expresion = "\\w+([-+.’]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            var datosUsuario = Negocio.NegocioUsuario.ObtenerUsuarioEnUso(Session);
            Usuario usuario = new Usuario(datosUsuario.getUsername());
            var Validacion = NegocioUsuario.EliminarUsuario(usuario);
            if (Validacion == "")
            {
                NegocioUsuario.Logout(Session);
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMsg2.ForeColor = System.Drawing.Color.Red;
                lblMsg2.Text = Validacion;
            }
        }
    }
}