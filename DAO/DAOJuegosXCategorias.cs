using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOJuegosXCategorias
    {
        public static DataTable Listar()
        {
            return DB.ObtenerTabla("JuegosXCategorias", "[SP_JuegosXCategorias_Obtener]", isSP: true);
        }

        public static DataSet ObtenerSiguienteID()
        {
            return DB.Query("[SP_JuegosXCategorias_Obtener_Siguiente_Id]", isSP: true);
        }

        public static DataTable ListarPorLink(string input)
        {
            var paramatros = new List<SqlParameter>() { new SqlParameter("@Input", input) };
            return DB.ObtenerTabla("JuegosXCategorias", $"[SP_JuegosXCategorias_Obtener_Por_Input]", paramatros, isSP: true);
        }

        public static int? Actualizar(Juegos_x_Categorias obj)
        {
            return DB.NonQueryReturnParameter("[SP_JuegosXCategorias_Actualizar]", getParametros(obj, true), true);
        }

        public static int? Agregar(Juegos_x_Categorias obj)
        {
            return DB.NonQueryReturnParameter("[SP_JuegosXCategorias_Agregar]", getParametros(obj, false), true);
        }

        public static List<SqlParameter> getParametros(in Juegos_x_Categorias obj, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Juego", obj.Juego),
                new SqlParameter("Categoria", obj.Categoria),
                new SqlParameter("Activo", obj.Activo)
            };
            if (includeID) parametros.Add(new SqlParameter("IdLink", obj.Id_Link));
            return parametros;
        }
    }
}
