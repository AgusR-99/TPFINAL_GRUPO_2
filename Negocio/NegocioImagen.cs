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
    public static class NegocioImagen
    {
        public static DataTable ListarImagenes()
        {
            return DAOImagen.ListarImagenes();
        }

        public static DataTable ListarImagenesPorJuego(int idJuego)
        {
            return DAOImagen.ListarImagenesPorJuego(idJuego);
        }

        public static List<string> ActualizarImagen(Imagenes imagen)
        {
            var errorReasons = Validar(imagen);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOImagen.ActualizarImagen(imagen);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> AgregarImagen(Imagenes imagen)
        {
            var errorReasons = Validar(imagen);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOImagen.AgregarImagen(imagen);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> Validar(in Imagenes imagen)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(imagen.getID_Juego().ToString())) errorReasons.Add("El campo IDJuego no puede estar vacío");
            if (String.IsNullOrWhiteSpace(imagen.getNombreArchivo())) errorReasons.Add("El campo Imagen no puede estar vacío");
            return errorReasons;
        }
    }
}
