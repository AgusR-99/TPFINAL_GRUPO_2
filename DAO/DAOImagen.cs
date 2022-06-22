using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOImagen
    {
        public static DataTable ListarImagenes()
        {
            return DB.ObtenerTabla("Imagenes", "[SP_Imagenes_Obtener]", isSP: true);
        }

        public static int? ActualizarImagen(Imagenes imagen)
        {
            return DB.NonQuery("[SP_Imagenes_Actualizar]", getParametrosImagen(imagen, true), true);
        }

        public static int? AgregarImagen(Imagenes imagen)
        {
            return DB.NonQuery("[SP_Imagenes_Agregar]", getParametrosImagen(imagen, false), true);
        }

        public static List<SqlParameter> getParametrosImagen(in Imagenes imagen, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("IdJuego", imagen.getID_Juego()),
                new SqlParameter("NombreArchivo", imagen.getNombreArchivo()),
                new SqlParameter("Orden", imagen.getOrden()),
                new SqlParameter("Activo", imagen.getActivo())
            };
            return parametros;
        }
    }
}
