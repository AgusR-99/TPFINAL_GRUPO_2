using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using DAO;
using System.Data;

namespace Negocio
{
    public static class NegocioJuego
    {

        public static DataTable ListarJuegos()
        {
            return DAOJuego.ListarJuegos();
        }

        public static List<string> ActualizarJuego(Juego juego)
        {
            var errorReasons = ActualizarValidarJuego(juego);
            DAOJuego.ActualizarJuego(juego);
            if (errorReasons.Any()) return errorReasons;
            int? resultadoActualizar = DAOJuego.ActualizarJuego(juego);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> ActualizarValidarJuego(in Juego juego)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(juego.getNombre())) errorReasons.Add("El campo Nombre no puede estar vacío");
            if (String.IsNullOrWhiteSpace(juego.getDescripcion())) errorReasons.Add("El campo Descripcion no puede estar vacío");
            return errorReasons;
        }

        public static DataSet ObtenerCantidadJuegos()
        {
            return DAOJuego.ObtenerCantidadJuegos();
        }
    }
}
