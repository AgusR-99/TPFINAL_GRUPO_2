using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOTienda
    {
        public static DataTable ListarTiendas(string filtro)
        {
            var parametros = new List<SqlParameter>();
            if (filtro!=null)
                parametros.Add(new SqlParameter("filtro", filtro));

            return DB.ObtenerTabla("Tiendas","[SP_Tiendas_Obtener]", parametros, true);
        }

        public static DataTable ListarTiendasPorJuego(int idJuego)
        {
            return DB.ObtenerTabla("Tiendas", $"[SP_Tiendas_ObtenerPorJuego] {idJuego}");
        }

        public static int? ActualizarTienda(Tienda tienda)
        {
            var parametros = getParametrosTiendaId(tienda);
            parametros.AddRange(getParametrosTiendaContenido(tienda));
            return DB.NonQuery("[SP_Tiendas_Actualizar]", parametros, true);
        }

        public static int? AgregarTienda(Tienda tienda)
        {
            return DB.NonQuery("[SP_Tiendas_Agregar]", getParametrosTiendaContenido(tienda), true);
        }

        public static int? EliminarTienda(Tienda tienda)
        {
            return DB.NonQuery("[SP_Tiendas_Eliminar]", getParametrosTiendaId(tienda), true);
        }

        public static List<Tienda> ObtenerTiendasPorJuego(int idJuego)
        {
            return ArmarListaDeTiendas(ListarTiendasPorJuego(idJuego));
        }

        private static List<SqlParameter> getParametrosTiendaId(in Tienda tienda)
        {
            return new List<SqlParameter>() { new SqlParameter("IdTienda", tienda.getID_Tienda()) };
        }

        private static List<SqlParameter> getParametrosTiendaContenido(in Tienda tienda)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("Nombre", tienda.getNombre()),
                new SqlParameter("RutaImagen", tienda.getURL_img()),
                new SqlParameter("SitioWeb", tienda.getURL_web()),
                new SqlParameter("Activo", tienda.getActivo())
            };
        }

        private static List<Tienda> ArmarListaDeTiendas(in DataTable datatable)
        {
            var tiendas = new List<Tienda>();
            if (datatable == null) return tiendas;
            foreach (DataRow row in datatable?.Rows)
            {
                var tienda = ArmarTienda(row);
                if (tienda != null) tiendas.Add(tienda);
            }
            return tiendas;
        }

        private static Tienda ArmarTienda(in DataRow datarow)
        {
            try
            {
                return new Tienda(
                        (int)datarow["IdTienda"],
                        (string)datarow["Nombre"],
                        (string)datarow["RutaImagen"],
                        (string)datarow["SitioWeb"],
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
