﻿using System;
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

        public static DataTable ListarUsuariosPorNombre(string Nombre)
        {
            return DAOUsuario.ListarUsuariosPorNombre(Nombre);
        }

        public static DataTable ListarUsuariosActivos(bool Activo_NoActivo)
        {
            return DAOUsuario.ListarUsuariosActivos(Activo_NoActivo);
        }

        public static DataTable ListarUsuariosAdmin(bool AdminNoAdmin)
        {
            return DAOUsuario.ListarUsuariosAdministradores(AdminNoAdmin);
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

        
        public static string AgregarUsuario(Usuario usuario)
        {
            string errorReasons = ValidarUsuarioRegistro(usuario);
            if (errorReasons!="") return errorReasons;
            var resultadoActualizar = DAOUsuario.AgregarUsuario(usuario);
            if (resultadoActualizar == null)
                errorReasons = "Ocurrió un error al actualizar la base de datos";
             if (resultadoActualizar == -1) errorReasons = "Error. Ya existe el Username o el Email";
            return errorReasons;
        }

        public static string ValidarUsuarioRegistro(in Usuario usuario)
        {
            string errorReasons="";
            if (String.IsNullOrWhiteSpace(usuario.getUsername()))
            {
                errorReasons = "El campo Username no puede estar vacío";
                return errorReasons;
            }
            if (String.IsNullOrWhiteSpace(usuario.getEmail()))
            {
                errorReasons = "El campo Email no puede estar vacío";
                return errorReasons;
            }
            if (String.IsNullOrWhiteSpace(usuario.getContraseña()))
            {
                errorReasons = "El campo Contraseña no puede estar vacío";
                return errorReasons;
            }
            return errorReasons;
        }

        public static Usuario ObtenerUsuarioEnUso(in HttpSessionState Session)
        {
            return (Usuario)Session["LoggedUser"];
        }

        public static string ActualizarDatosUsuario(Usuario usuario)
        {
            var ErrorReasons = ValidarActualizacionUsuario(usuario);
            if (ErrorReasons != "")
            {
                return ErrorReasons;
            }
            int? Actualizacion = DAOUsuario.ActualizarDatosUsuario(usuario);
            if (Actualizacion == null)
            {
                ErrorReasons = "Error en la base de datos";
            }
            if (Actualizacion == -1)
            {
                ErrorReasons = "Error. Ya existe el usuario";
            }
            return ErrorReasons;
        }

        public static string ValidarActualizacionUsuario(Usuario usuario)
        {
            string errorReasons = "";
            if (String.IsNullOrWhiteSpace(usuario.getUsername()))
            {
                errorReasons = "El campo Username no puede estar vacío";
                return errorReasons;
            }
            if (String.IsNullOrWhiteSpace(usuario.getEmail()))
            {
                errorReasons = "El campo Email no puede estar vacío";
                return errorReasons;
            }
            if (String.IsNullOrWhiteSpace(usuario.getContraseña()))
            {
                errorReasons = "El campo Contraseña no puede estar vacío";
                return errorReasons;
            }

            if (String.IsNullOrWhiteSpace(usuario.getDescripcion()))
            {
                errorReasons = "El campo Descripcion no puede estar vacío";
                return errorReasons;
            }

            return errorReasons;
        }

        public static string EliminarUsuario(Usuario usuario)
        {
            string errorReasons = "";
            var resultadoEliminar = DAOUsuario.EliminarUsuario(usuario);
            if (resultadoEliminar == null)
                errorReasons = "Ocurrió un error al eliminar en la base de datos";
            return errorReasons;
        }

    }
}
