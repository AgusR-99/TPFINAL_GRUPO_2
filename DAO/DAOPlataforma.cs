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

        public static DataSet ObtenerPlataformaSiguienteID()
        {
            var foo = DB.Query("[SP_Plataformas_Obtener_Siguiente_Id]", isSP: true);
            return foo;
        }

        public static DataTable ListarPlataformasPorNombre(string nombre)
        {
            return DB.ObtenerTabla("Plataformas", $"[SP_Plataformas_Obtener_Por_Nombre] N'{nombre}'");
        }

        public static int? ActualizarPlataforma(Plataforma plataforma)
        {
            return DB.NonQuery("[SP_Plataformas_Actualizar]", getParametrosPlataforma(plataforma, true), true);
        }

        public static int? AgregarPlataforma(Plataforma plataforma)
        {
            return DB.NonQuery("[SP_Plataforma_Agregar]", getParametrosPlataforma(plataforma, false), true);
        }


        public static List<SqlParameter> getParametrosPlataforma(in Plataforma plataforma, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Nombre", plataforma.getNombre()),
                new SqlParameter("Activo", plataforma.getActivo()),
            };
            if (includeID) parametros.Add(new SqlParameter("IdPlataforma", plataforma.getID_Plataforma()));
            return parametros;
        }
    }
}
