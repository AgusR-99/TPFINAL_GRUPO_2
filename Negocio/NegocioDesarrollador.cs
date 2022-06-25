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
    public static class NegocioDesarrollador
    {
        public static DataTable ListarDesarrolladores()
        {
            return DAODesarrollador.ListarDesarrolladores();
        }

        public static DataTable ListarDesarrolladoresPorNombre(string Nombre)
        {
            return DAODesarrollador.ListarDesarrolladoresPorNombre(Nombre);
        }

        public static List<string> ActualizarDesarrollador(Desarrollador desarrollador)
        {
            var errorReasons = Validar(desarrollador);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAODesarrollador.ActualizarDesarrollador(desarrollador);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> AgregarDesarrollador(Desarrollador desarrollador)
        {
            var errorReasons = Validar(desarrollador);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAODesarrollador.AgregarDesarrollador(desarrollador);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> Validar(in Desarrollador desarrollador)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(desarrollador.getNombre())) errorReasons.Add("El campo Nombre no puede estar vacío");
            if (String.IsNullOrWhiteSpace(desarrollador.getURL_web())) errorReasons.Add("El campo URL no puede estar vacío");
            if (String.IsNullOrWhiteSpace(desarrollador.getUbicacion_sede())) errorReasons.Add("El campo Ubicacion no puede estar vacío");
            if (String.IsNullOrWhiteSpace(desarrollador.getHistoria())) errorReasons.Add("El campo Historia no puede estar vacío");
            return errorReasons;
        }
    }
}
