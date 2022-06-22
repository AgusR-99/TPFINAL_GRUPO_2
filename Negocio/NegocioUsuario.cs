using System;
using System.Collections.Generic;
using System.Web.SessionState;
using System.Linq;
using Entidades;
using DAO;
using System.Data;

namespace Negocio
{
    public static class NegocioUsuario
    {
        public static int Login(in HttpSessionState Session, string email, string contraseña)
        {
            //Devuelve:
            //  1   - Si se pudo loguear satisfactoriamente
            //  0   - Si no se encontró un usuario con ese nombre de usuario y contraseña
            //  -1  - Si ocurrió un error inesperado en el camino
            var usuario = new Usuario(email,contraseña);
            int resultadoLogin = DAOUsuario.Login(ref usuario);

            if (resultadoLogin==1)
                Session["LoggedUser"] = usuario;

            return resultadoLogin;
        }

        public static bool IsLoggedIn(in HttpSessionState Session)
        {
            //Devuelve verdadero si el usuario se encuentra logueado
            object loggedUser = Session["LoggedUser"];
            return loggedUser != null && loggedUser.GetType() == typeof(Usuario);

        }

        public static bool IsLoggedInAsAdmin(in HttpSessionState Session)
        {
            //Devuelve verdadero si el usuario se encuentra logueado y tiene perfil de administrador
            return IsLoggedIn(Session) && ((Usuario)Session["LoggedUser"]).getAdministrador() == true;
        }

        public static void Logout(in HttpSessionState Session)
        {
            Session["LoggedUser"] = null;
        }

        public static DataTable ListarUsuarios()
        {
            return DAOUsuario.ListarUsuarios();
        }

        public static List<string> ActualizarUsuario(Usuario usuario)
        {
            var errorReasons = ActualizarValidarUsuario(usuario);
            DAOUsuario.ActualizarUsuario(usuario);
            if (errorReasons.Any()) return errorReasons;
            int? resultadoActualizar = DAOUsuario.ActualizarUsuario(usuario);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> ActualizarValidarUsuario(in Usuario usuario)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(usuario.getUsername())) errorReasons.Add("El campo Username no puede estar vacío");
            if (String.IsNullOrWhiteSpace(usuario.getEmail())) errorReasons.Add("El campo Email no puede estar vacío");
            return errorReasons;
        }

        public static DataSet ObtenerCantidadUsuarios()
        {
            return DAOUsuario.ObtenerCantidadUsuarios();
        }
    }
}
