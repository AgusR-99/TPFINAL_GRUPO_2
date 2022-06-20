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

        public static List<string> ActualizarCategoria(Categoria categoria)
        {
            var errorReasons = Validar(categoria);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOCategoria.ActualizarCategoria(categoria);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> AgregarCategoria(Categoria categoria)
        {
            var errorReasons = Validar(categoria);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOCategoria.AgregarCategoria(categoria);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> Validar(Categoria categoria)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(categoria.Nombre)) errorReasons.Add("El campo Nombre no puede estar vacío");
            return errorReasons;
        }
    }
}
