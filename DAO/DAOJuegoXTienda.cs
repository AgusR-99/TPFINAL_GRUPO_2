using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOJuegoXTienda
    {
        public static DataTable ListarJuegosXTiendas()
        {
            return DB.ObtenerTabla("JuegosXTiendas", "[SP_JuegosXTiendas_Obtener]", isSP: true);
        }

        public static int? ActualizarJuegoXTienda(Juego_x_Tienda jxt)
        {
            var parametros = getParametrosJuegoXTiendaClave(jxt);
            parametros.AddRange(getParametrosJuegoXTiendaContenido(jxt));
            return DB.NonQuery("[SP_JuegosXTiendas_Actualizar]", parametros, true);
        }

        public static int? EliminarJuegoXTienda(Juego_x_Tienda jxt)
        {
            return DB.NonQuery("[SP_JuegosXTiendas_Eliminar]", getParametrosJuegoXTiendaClave(jxt), true);
        }

        public static int? AgregarJuegoXTienda(Juego_x_Tienda jxt)
        {
            var parametros = getParametrosJuegoXTiendaClave(jxt);
            parametros.AddRange(getParametrosJuegoXTiendaContenido(jxt));
            return DB.NonQuery("[SP_JuegosXTiendas_Agregar]", parametros, true);
        }

        private static List<SqlParameter> getParametrosJuegoXTiendaClave(in Juego_x_Tienda jxt)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("IDJuego", jxt.getID_Juego()),
                new SqlParameter("IDTienda", jxt.getID_Tienda())
            };
        }

        private static List<SqlParameter> getParametrosJuegoXTiendaContenido(in Juego_x_Tienda jxt)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("SitioWeb", jxt.getURL()),
                new SqlParameter("Precio", jxt.getPrecio()),
                new SqlParameter("Activo", jxt.getActivo())
            };

            if (jxt.getPrecioRebajado() == null)
                parametros.Add(new SqlParameter("PrecioRebajado", DBNull.Value));
            else
                parametros.Add(new SqlParameter("PrecioRebajado", jxt.getPrecioRebajado()));

            return parametros;
        }
    }
}
