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
    public static class DAODesarrollador
    {

        public static DataTable ListarDesarrolladores()
        {
            return DB.ObtenerTabla("Desarrolladores", "[SP_Desarrolladores_Obtener]", isSP: true);
        }

        public static Desarrollador ObtenerDesarrolladorPorId(int id)
        {
            var parametros = new List<SqlParameter>() { new SqlParameter("idDesarrollador", id) };
            var datatable = DB.ObtenerTabla("Desarrollador", "[SP_Desarrolladores_Obtener]", parametros, true);
            if (datatable == null) return null;
            return ArmarDesarrollador(datatable.Rows[0]);
        }

        public static int? ActualizarDesarrollador(Desarrollador desarrollador)
        {
            return DB.NonQuery("[SP_Desarrolladores_Actualizar]", getParametrosDesarrollador(desarrollador, true), true);
        }

        public static int? AgregarDesarrollador(Desarrollador desarrollador)
        {
            return DB.NonQuery("[SP_Desarrolladores_Agregar]", getParametrosDesarrollador(desarrollador, false), true);
        }

        public static List<SqlParameter> getParametrosDesarrollador(in Desarrollador desarrollador, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Nombre", desarrollador.getNombre()),
                new SqlParameter("SitioWeb", desarrollador.getURL_web()),
                new SqlParameter("UbicacionSede", desarrollador.getUbicacion_sede()),
                new SqlParameter("Historia", desarrollador.getHistoria())
            };
            if (includeID) parametros.Add(new SqlParameter("IdDesarrollador", desarrollador.getID_Desarrollador()));
            return parametros;
        }

        private static Desarrollador ArmarDesarrollador(in DataRow datarow)
        {
            try
            {
                return new Desarrollador(
                        (int)datarow["IdDesarrollador"],
                        (string)datarow["Nombre"],
                        (string)datarow["SitioWeb"],
                        (string)datarow["UbicacionSede"],
                        (string)datarow["Historia"]
                    );
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
