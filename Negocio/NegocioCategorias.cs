using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using Entidades;
using DAO;

namespace Negocio
{
    public static class NegocioCategorias
    {
        public static DataTable ListarCategorias()
        {
            return DAOCategoria.ListarCategorias();
        }

        public static DataTable ListarCategoriasPorNombre(string Nombre)
        {
            return DAOCategoria.ListarCategoriasPorNombre(Nombre);
        }

        public static DataTable ListarCategoriasActivo(bool ActivoNoActivo)
        {
            return DAOCategoria.ListarCategoriasActivos(ActivoNoActivo);
        }

        public static DataSet ObtenerCategoriaSiguienteID()
        {
            return DAOCategoria.ObtenerCategoriaSiguienteID();
        }

        public static List<string> ObtenerListaNombres(string termino)
        {
            List<string> lista = new List<string>();
            return DAOCategoria.ObtenerListaNombres(lista, termino);
        }

        public static string ActualizarCategoria(Categoria categoria)
        {
            var error = Validar(categoria);
            if (error != "") return error;

            int? resultadoActualizar = DAOCategoria.ActualizarCategoria(categoria);
            if (resultadoActualizar == null) error = "Error al actualizar categoria: ocurrió un error al actualizar la base de datos";
            if (resultadoActualizar == 0) error = "Error al actualizar categoria: no se encontró el registro a actualizar";
            if (resultadoActualizar == -1) error = "Error al actualizar categoria: la categoria ya existe";
            return error;
        }

        public static string AgregarCategoria(Categoria categoria)
        {
            var error = Validar(categoria);
            if (error != "") return error;

            int? resultadoActualizar = DAOCategoria.AgregarCategoria(categoria);
            if (resultadoActualizar == null) error = ("Error al agregar categoria: ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) error = ("Error al agregar categoria: no se ha insertado el registro");
            if (resultadoActualizar == -1) error = ("Error al agregar categoria: la categoria ya existe en esta tabla");
            return error;
        }

        public static string Validar(Categoria categoria)
        {
            string str = "";
            if (String.IsNullOrWhiteSpace(categoria.Nombre)) str = ("Error: el campo Nombre no puede estar vacío");
            return str;
        }

        public static List<Categoria> ObtenerCategoriasActivasComoLista()
        {
            return DAOCategoria.ObtenerCategoriasComoLista().FindAll(x=>x.Activo);
        }
    }
}
