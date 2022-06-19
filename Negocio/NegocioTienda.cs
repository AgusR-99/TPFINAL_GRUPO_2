using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using Entidades;
using DAO;

namespace Negocio
{
    public static class NegocioTienda
    {
        public static DataTable ListarTiendas()
        {
            return DAOTienda.ListarTiendas();
        }

        public static List<string> ActualizarTienda(Tienda tienda)
        {
            var errorReasons = Validar(tienda);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOTienda.ActualizarTienda(tienda);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> AgregarTienda(Tienda tienda)
        {
            var errorReasons = Validar(tienda);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOTienda.AgregarTienda(tienda);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> Validar(in Tienda tienda)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(tienda.getNombre())) errorReasons.Add("El campo Nombre no puede estar vacío");
            if (String.IsNullOrWhiteSpace(tienda.getURL_img())) errorReasons.Add("El campo Imagen no puede estar vacío");
            if (String.IsNullOrWhiteSpace(tienda.getURL_web())) errorReasons.Add("El campo Sitio Web no puede estar vacío");
            return errorReasons;
        }
    }
}
