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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            bool valEmail;
           var usuariod = txtUsername.Text;
             var contrasena = txtPassword.Text;
             var email = txtEmail.Text;
             Usuario usuario = new Usuario(
                 usuariod,
             contrasena,
             email,
             false,
             true
                 );
            valEmail = ValidarEmail(txtEmail.Text);
            if (valEmail == true)
            {
                if (txtPassword.Text == txtPassword2.Text)
                {


                    if (txtPassword.Text.Length >= 8)
                    {
                        var erroresAgregar = NegocioUsuario.AgregarUsuario(usuario);
                        if (erroresAgregar == "")
                        {
                            lblMsg.ForeColor = System.Drawing.Color.GreenYellow;
                            lblMsg.Text = "Registro agregado con exito";
                            txtUsername.Text = "";
                            txtEmail.Text = "";
                            txtPassword.Text = "";
                            txtPassword2.Text = "";
                        }
                        else
                        {
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                            lblMsg.Text = erroresAgregar;
                        }
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Error. La Contraseña debe tener mas de 7 caracteres";
                    }

                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Error. No se repitió la contraseña";
                }
            }
            else
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Error. Email no valido.\n Debe tener el formato: nombre@dominio.com";
            }
        }
        private Boolean ValidarEmail(String email)
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
    }
}