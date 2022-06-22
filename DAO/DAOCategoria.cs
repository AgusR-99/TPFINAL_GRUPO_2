using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;


namespace DAO
{
    public static class DAOCategoria
    {
        public static DataTable ListarCategorias()
        {
            return DB.ObtenerTabla("Categorias", "[SP_Categorias_Obtener]", isSP: true);
        }

        public static DataSet ObtenerCategoriaSiguienteID()
        {
            return DB.Query("[SP_Categorias_Obtener_Siguiente_Id]", isSP: true);
        }

        public static DataTable ListarCategoriasPorNombre(string nombre)
        {
            return DB.ObtenerTabla("Categorias", $"[SP_Categorias_Obtener_Por_Nombre] N'{nombre}'");
        }

        public static int? ActualizarCategoria(Categoria categoria)
        {
            return DB.NonQuery("[SP_Categorias_Actualizar]", getParametrosCategoria(categoria, true), true);
        }

        public static int? AgregarCategoria(Categoria categoria)
        {
            return DB.NonQuery("[SP_Categorias_Agregar]", getParametrosCategoria(categoria, false), true);
        }

        public static List<SqlParameter> getParametrosCategoria(in Categoria categoria, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Nombre", categoria.Nombre),
                new SqlParameter("Activo", categoria.Activo)
            };
            if (includeID) parametros.Add(new SqlParameter("IdCategoria", categoria.Id_Categoria));
            return parametros;
        }
    }
}
