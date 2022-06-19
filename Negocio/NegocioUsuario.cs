using System;
using System.Collections.Generic;
using System.Web.SessionState;
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

        public static void ActualizarUsuario(Usuario usuario)
        {
            DAOUsuario.ActualizarUsuario(usuario);
        }
    }
}
