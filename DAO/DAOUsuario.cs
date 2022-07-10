using System;
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

                usuario = ArmarUsuario(resultado.Rows[0]);
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

        public static DataTable ListarUsuariosActivos(bool Activo_NoActivo)
        {
            return DB.ObtenerTabla("Usuarios", "[SP_Usuarios_Activos]", getParametrosUsuarioActivo(Activo_NoActivo), isSP: true);
        }


        public static List<SqlParameter> getParametrosUsuarioActivo(bool ChequeoActivo)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Activos", ChequeoActivo)
            };
            return parametros;
        }


        public static DataTable ListarUsuariosAdministradores(bool AdminNoAdmin)
        {
            return DB.ObtenerTabla("Usuarios", "[SP_Usuarios_Administrador]", getParametrosUsuarioAdministrador(AdminNoAdmin), isSP: true);
        }


        public static List<SqlParameter> getParametrosUsuarioAdministrador(bool ChequeoAdministrador)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Administrador", ChequeoAdministrador)
            };
            return parametros;
        }

        private static Usuario ArmarUsuario(in DataRow row)
        {
            var usuario = new Usuario(
                (string)row["Username"],
                (string)row["Email"],
                (bool)row["Administrador"],
                (string)DB.ValueOrNull(row["Descripcion"])
            );
            usuario.setOpinion(DAOOpinion.ObtenerOpinionesPorUsuarioComoLista(usuario.getUsername()));
            usuario.setDeseados(DAODeseado.ObtenerDeseadosPorUsuarioComoLista(usuario.getUsername()));
            return usuario;
        }

        public static DataTable ListarUsuarios()
        {
            return DB.ObtenerTabla("Usuarios", "[SP_Usuarios_Obtener]", isSP: true);
        }

        public static DataTable ListarUsuariosPorNombre(string nombre)
        {
            return DB.ObtenerTabla("Usuarios", $"[SP_Usuarios_Obtener_Por_Nombre] N'{nombre}'");
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
        public static DataSet ObtenerCantidadUsuarios()
        {
            return DB.Query("[SP_Obtener_Cantidad_Usuarios]", isSP: true);
        }

        public static int? AgregarUsuario(Usuario usuario)
        {
            return DB.NonQuery("[SP_SignUp]", getParametrosUsuario2(usuario), true);
        }

        public static List<SqlParameter> getParametrosUsuario2(in Usuario usuario)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("Username", usuario.getUsername()),
                new SqlParameter("Contrasena", usuario.getContraseña()),
                new SqlParameter("Email", usuario.getEmail()),
                new SqlParameter("Administrador", usuario.getAdministrador()),
                new SqlParameter("Activo", usuario.getActivo())
            };
        }

        public static int? ActualizarDatosUsuario(Usuario usuario)
        {
            return DB.NonQuery("[SP_Usuarios_ActualizarDatos]", getParametrosUsuario3(usuario), true);
        }

        public static List<SqlParameter> getParametrosUsuario3(in Usuario usuario)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("usuariocomparacion", usuario.getUsernameComp()),
                new SqlParameter("usuario", usuario.getUsername()),
                new SqlParameter("contrasena", usuario.getContraseña()),
                new SqlParameter("descripcion", usuario.getDescripcion()),
                new SqlParameter("email", usuario.getEmail())
            };
        }

        public static int? EliminarUsuario(Usuario usuario)
        {
            return DB.NonQuery("[SP_Usuarios_Eliminar]", getParametrosUsuario4(usuario), true);
        }

        public static List<SqlParameter> getParametrosUsuario4(in Usuario usuario)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("Username", usuario.getUsername())
            };
        }

    }
}
