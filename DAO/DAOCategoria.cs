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

        public static DataTable ListarCategoriasPorJuego(int idJuego)
        {
            return DB.ObtenerTabla("Categorias", $"[SP_Categorias_ObtenerPorJuego] {idJuego}");
        }

        public static List<string> ObtenerListaNombres(List<string> Lista, string termino)
        {

            return DB.ObtenerLista("[SP_Categorias_Obtener_Nombres_Por_Nombre]", "@Nombre", Lista, termino, "Nombre");
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

        public static List<Categoria> ObtenerCategoriasComoLista()
        {
            return ArmarListaDeCategorias(ListarCategorias());
        }

        public static List<Categoria> ObtenerCategoriasPorJuegoComoLista(int idJuego)
        {
            return ArmarListaDeCategorias(ListarCategoriasPorJuego(idJuego));
        }

        private static List<Categoria> ArmarListaDeCategorias(in DataTable datatable)
        {
            var categorias = new List<Categoria>();
            if (datatable == null) return categorias;
            foreach (DataRow row in datatable?.Rows)
            {
                var categoria = ArmarCategoria(row);
                if (categoria != null) categorias.Add(categoria);
            }
            return categorias;
        }

        private static Categoria ArmarCategoria(in DataRow dataRow)
        {
            try
            {
                return new Categoria(
                    (int)dataRow["IdCategoria"],
                    (string)dataRow["Nombre"],
                    (bool)dataRow["Activo"]
                    );
            }
            catch
            {
                return null;
            }
        }
    }
}
