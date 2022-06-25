using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using DAO;

namespace Negocio
{
    public static class NegocioPlataforma
    {
        public static DataTable ListarPlataformas()
        {
            return DAOPlataforma.ListarPlataformas();
        }

        public static DataSet ObtenerPlataformaSiguienteID()
        {
            return DAOPlataforma.ObtenerPlataformaSiguienteID();
        }

        public static DataTable ListarPlataformasPorNombre(string Nombre)
        {
            return DAOPlataforma.ListarPlataformasPorNombre(Nombre);
        }
        public static List<string> ActualizarPlataforma(Plataforma plataforma)
        {
            var errorReasons = Validar(plataforma);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOPlataforma.ActualizarPlataforma(plataforma);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        
         public static List<string> AgregarPlataforma(Plataforma plataforma)
        {
            var errorReasons = Validar(plataforma);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOPlataforma.AgregarPlataforma(plataforma);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");
            if (resultadoActualizar == -1) errorReasons.Add("Error al agregar: la categoria ya existe");
            return errorReasons;
        }

        
         public static List<string> Validar(Plataforma plataforma)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(plataforma.getNombre())) errorReasons.Add("El campo Nombre no puede estar vacío");
            return errorReasons;
        }
         
    }
}
