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

        public static int? AgregarOpinion(Opinion opinion)
        {
            return DB.NonQuery("[SP_Opiniones_Agregar]", getParametros(opinion), true);
        }

        public static int? ActualizarOpinion(Opinion opinion)
        {
            return DB.NonQuery("[SP_Opiniones_Actualizar]", getParametros(opinion), true);
        }

        public static List<Opinion> ObtenerOpinionesPorJuegoComoLista(int idJuego)
        {
            return ArmarListaDeOpiniones(ListarOpinionesPorJuego(idJuego));
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

        private static List<SqlParameter> getParametros(in Opinion opinion)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("IdJuego", opinion.getID_Juego()),
                new SqlParameter("Username", opinion.getUsername()),
                new SqlParameter("Calificacion", opinion.getCalificacion()),
                new SqlParameter("Comentario", opinion.getComentario()),
            };
            return parametros;
        }
    }
}
