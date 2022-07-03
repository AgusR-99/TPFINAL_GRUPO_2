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
    public static class DAOOpinion
    {
        public static DataSet ObtenerCantidadOpiniones()
        {
            return DB.Query("[SP_Obtener_Cantidad_Opiniones]", isSP: true);
        }

        public static DataTable ListarOpinionesPorJuego(int idJuego)
        {
            var parametros = new List<SqlParameter>() { new SqlParameter("IdJuego", idJuego) };
            return DB.ObtenerTabla("Opiniones", $"[SP_Opiniones_ObtenerPorJuego]", parametros, true);
        }

        public static List<Opinion> ObtenerOpinionesPorJuegoComoLista(int idJuego)
        {
            return ArmarListaDeOpiniones(ListarOpinionesPorJuego(idJuego));
        }

        public static List<Opinion> ObtenerOpinionesPorUsuarioComoLista(string username)
        {
            return ArmarListaDeOpiniones(null); //TODO -> Implementar
        }

        private static List<Opinion> ArmarListaDeOpiniones(in DataTable datatable)
        {
            var opiniones = new List<Opinion>();
            if(datatable == null) return opiniones;
            foreach (DataRow row in datatable?.Rows)
            {
                var opinion = ArmarOpinion(row);
                if (opinion != null) opiniones.Add(opinion);
            }
            return opiniones;
        }

        private static Opinion ArmarOpinion(in DataRow datarow)
        {
            try
            {
                return new Opinion(
                        (int)datarow["IdJuego"], 
                        (string)datarow["Username"], 
                        (byte)datarow["Calificacion"], 
                        (string)DB.ValueOrNull(datarow["Comentario"]), 
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
