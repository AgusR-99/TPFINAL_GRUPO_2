﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOUsuario
    {
        public static int Login(ref Usuario usuario)
        {
            try
            {
                var parameters = GetLoginParameters(usuario);
                DataTable resultado = DB.ObtenerTabla("Usuario", "SP_Login", parameters, true);

                if (resultado == null) return -1;
                if (resultado.Rows.Count == 0) return 0;

                usuario = GetUsuarioFromDataRow(resultado.Rows[0]);
                return 1;
            }
            catch
            {
                return -1;
            }

        }

        private static List<SqlParameter> GetLoginParameters(in Usuario usuario)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("email", usuario.getEmail()),
                new SqlParameter("contrasena", usuario.getContraseña())
            };
        }

        private static Usuario GetUsuarioFromDataRow(in DataRow row)
        {
            return new Usuario(
                (string)row["Username"],
                (string)row["Email"],
                (bool)row["Administrador"],
                row["Descripcion"] == DBNull.Value ? null : (string)row["Descripcion"]);
        }

        public static DataTable ListarUsuarios()
        {
            return DB.ObtenerTabla("Usuarios", "[SP_Usuarios_Obtener]", isSP: true);
        }

        public static int? ActualizarUsuario(Usuario usuario)
        {
            return DB.NonQuery("[SP_Usuarios_Actualizar]", getParametrosUsuario(usuario), true);
        }

        public static List<SqlParameter> getParametrosUsuario(in Usuario usuario)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("Username", usuario.getUsername()),
                new SqlParameter("Descripcion", usuario.getDescripcion()),
                new SqlParameter("Email", usuario.getEmail()),
                new SqlParameter("Administrador", usuario.getAdministrador()),
                new SqlParameter("Activo", usuario.getActivo())
            };
        }
    }
}
