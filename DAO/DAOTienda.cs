using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOTienda
    {
        public static DataTable ListarTiendas()
        {
            return DB.ObtenerTabla("Tiendas","[SP_Tiendas_Obtener]", isSP: true);
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
    }
}
