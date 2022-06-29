using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            
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
            if (txtPassword.Text == txtPassword2.Text)
            {

                    var erroresAgregar = NegocioUsuario.AgregarUsuario(usuario);
                    if (erroresAgregar == "")
                    {
                    if (txtPassword.Text.Length >= 8)
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
                        lblMsg.Text = "Error. La Contraseña debe tener mas de 8 caracteres";
                    }
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
                lblMsg.Text = "Error. No se repitió la contraseña";
            }
             
        }
    }
}