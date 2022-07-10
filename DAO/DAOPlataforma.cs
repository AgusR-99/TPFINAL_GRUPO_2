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
    public static class DAOPlataforma
    {
        public static DataTable ListarPlataformas()
        {
            return DB.ObtenerTabla("Plataformas", "[SP_Plataformas_Obtener]", isSP: true);
        }

        public static DataTable ListarPlataformasActivos(bool Activo_NoActivo)
        {
            return DB.ObtenerTabla("Plataformas", "[SP_Plataformas_Activos]", getParametrosPlataformaActivo(Activo_NoActivo), isSP: true);
        }


        public static List<SqlParameter> getParametrosPlataformaActivo(bool ChequeoActivo)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Activo", ChequeoActivo)
            };
            return parametros;
        }

        public static DataSet ObtenerPlataformaSiguienteID()
        {
            var foo = DB.Query("[SP_Plataformas_Obtener_Siguiente_Id]", isSP: true);
            return foo;
        }

        public static DataTable ListarPlataformasPorNombre(string nombre)
        {
            return DB.ObtenerTabla("Plataformas", $"[SP_Plataformas_Obtener_Por_Nombre] N'{nombre}'");
        }

        public static DataTable ListarPlataformasPorJuego(int idJuego)
        {
            return DB.ObtenerTabla("Plataformas", $"[SP_Plataformas_ObtenerPorJuego] N'{idJuego}'");
        }

        public static int? ActualizarPlataforma(Plataforma plataforma)
        {
            return DB.NonQuery("[SP_Plataformas_Actualizar]", getParametrosPlataforma(plataforma, true), true);
        }

        public static int? AgregarPlataforma(Plataforma plataforma)
        {
            return DB.NonQuery("[SP_Plataforma_Agregar]", getParametrosPlataforma(plataforma, false), true);
        }

        public static List<Plataforma> ObtenerPlataformasPorJuegoComoLista(int idJuego)
        {
            return ArmarListaDePlataformas(ListarPlataformasPorJuego(idJuego));
        }

        private static List<SqlParameter> getParametrosPlataforma(in Plataforma plataforma, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Nombre", plataforma.getNombre()),
                new SqlParameter("Activo", plataforma.getActivo()),
            };
            if (includeID) parametros.Add(new SqlParameter("IdPlataforma", plataforma.getID_Plataforma()));
            return parametros;
        }

        public static List<Plataforma> ObtenerPlataformasComoLista()
        {
            return ArmarListaDePlataformas(ListarPlataformas());
        }

        private static List<Plataforma> ArmarListaDePlataformas(in DataTable datatable)
        {
            var plataformas = new List<Plataforma>();
            if (datatable == null) return plataformas;
            foreach (DataRow row in datatable?.Rows)
            {
                var plataforma = ArmarPlataforma(row);
                if (plataforma != null) plataformas.Add(plataforma);
            }
            return plataformas;
        }

        private static Plataforma ArmarPlataforma(in DataRow dataRow)
        {
            try
            {
                return new Plataforma(
                        (int)dataRow["IdPlataforma"],
                        (string)dataRow["Nombre"],
                        (bool)dataRow["Activo"]
                    );
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
