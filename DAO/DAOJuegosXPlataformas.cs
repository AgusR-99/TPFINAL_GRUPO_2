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
    public static class DAOJuegosXPlataformas
    {
        public static DataTable ListarJuegosXPlataformas(int idJuego, int idPlataforma)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("IdJuego", idJuego),
                new SqlParameter("IdPlataforma", idPlataforma)
            };
            return DB.ObtenerTabla("JuegosXPlataformas", "[SP_JuegosXPlataformas_Obtener]", parametros, true);
        }

        public static int? EliminarJuegoXPlataforma(Juego_x_Plataforma jxp)
        {
            return DB.NonQuery("[SP_JuegosXPlataformas_Eliminar]", getParametrosJuegosXPlataformas(jxp), true);
        }

        public static int? AgregarJuegoXPlataforma(Juego_x_Plataforma jxp)
        {
            return DB.NonQuery("[SP_JuegosXPlataformas_Agregar]", getParametrosJuegosXPlataformas(jxp), true);
        }

        public static DataTable ExisteJuegoXPlataforma(Juego_x_Plataforma jxp)
        {
            return DB.ObtenerTabla("Existe","[SP_JuegosXPlataformas_Existe]", getParametrosJuegosXPlataformas(jxp), true);
        }

        private static List<SqlParameter> getParametrosJuegosXPlataformas(in Juego_x_Plataforma jxp)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("IdJuego", jxp.getID_Juego()),
                new SqlParameter("IdPlataforma", jxp.getID_Plataforma())
            };
        }
    }
}
