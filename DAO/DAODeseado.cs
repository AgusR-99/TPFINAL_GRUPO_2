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
    public static class DAODeseado
    {
        public static DataTable ListarDeseadosPorUsuario(string user)
        {
            var parametros = new List<SqlParameter>() { new SqlParameter("Username", user) };
            return DB.ObtenerTabla("Deseados", "[SP_Deseados_ObtenerPorUsuario]", parametros, true);
        }

        public static List<Deseado> ObtenerDeseadosPorUsuarioComoLista(string user)
        {
            return ArmarListaDeOpiniones(ListarDeseadosPorUsuario(user));
        }

        private static List<Deseado> ArmarListaDeOpiniones(in DataTable datatable)
        {
            var deseados = new List<Deseado>();
            if (datatable == null) return deseados;
            foreach (DataRow row in datatable?.Rows)
            {
                var deseado = ArmarDeseado(row);
                if (deseado != null) deseados.Add(deseado);
            }
            return deseados;
        }

        private static Deseado ArmarDeseado(in DataRow datarow)
        {
            try
            {
                return new Deseado(
                       (string)datarow["Username"],
                       (int)datarow["IdJuego"]
                    );
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
