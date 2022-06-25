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
        public static DataTable ListarJuegosXTiendas(string filtro)
        {
            var parametros = new List<SqlParameter>();
            if (filtro != null)
                parametros.Add(new SqlParameter("filtro", filtro));
            return DB.ObtenerTabla("JuegosXTiendas", "[SP_JuegosXTiendas_Obtener]", parametros, true);
        }

        public static DataTable ListarJuegosXTiendasPorJuego(int idJuego)
        {
            return DB.ObtenerTabla("JuegosXTiendas", $"[SP_JuegosXTiendas_ObtenerPorJuego] {idJuego}");
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

        public static DataTable ExisteJuegoXTienda(Juego_x_Tienda jxt)
        {
            return DB.ObtenerTabla("Existe","[SP_JuegosXTiendas_Existe]", getParametrosJuegoXTiendaClave(jxt), true);
        }

        public static List<Juego_x_Tienda> ObtenerJuegosXTiendasPorJuegoComoLista(int idJuego)
        {
            return ArmarListaDeJuegosXTiendas(ListarJuegosXTiendasPorJuego(idJuego));
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

        private static List<Juego_x_Tienda> ArmarListaDeJuegosXTiendas(in DataTable datatable)
        {
            var juegosXTiendas = new List<Juego_x_Tienda>();
            if (datatable == null) return juegosXTiendas;
            foreach (DataRow row in datatable?.Rows)
            {
                var jxt = ArmarJuegoXTienda(row);
                if (jxt != null) juegosXTiendas.Add(jxt);
            }
            return juegosXTiendas;
        }

        private static Juego_x_Tienda ArmarJuegoXTienda(in DataRow datarow)
        {
            try
            {
                return new Juego_x_Tienda(
                        (int)datarow["IDJuego"],
                        (int)datarow["IDTienda"],
                        (string)datarow["SitioWeb"],
                        (double)datarow["Precio"],
                        (double?)DB.ValueOrNull(datarow["PrecioRebajado"]),
                        (bool)datarow["Activo"]
                    );
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
