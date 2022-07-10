using DAO;
using Entidades;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Negocio
{
    public static class NegocioOpinion
    {
        public static DataSet ObtenerCantidadOpiniones()
        {
            return DAOOpinion.ObtenerCantidadOpiniones();
        }

        public static string ActualizarOpinion(Opinion opinion)
        {
            // Validar input de usuario
            var status = Validar(opinion);
            if (status.Any()) return status;

            // Correr input sobre DB
            int? resultadoActualizar = DAOOpinion.ActualizarOpinion(opinion);
            if (resultadoActualizar == null) status = "Error al modificar opinion: ocurrió un error al actualizar la base de datos";
            if (resultadoActualizar == -1) status = "Error al modificar opinion: no se ha podido modificar la opinion";

            return status;
        }

        public static string AgregarOpinion(Opinion opinion)
        {
            // Validar input de usuario
            var status = Validar(opinion);
            if (status.Any()) return status;

            // Correr input sobre DB
            int? resultadoActualizar = DAOOpinion.AgregarOpinion(opinion);
            if (resultadoActualizar == null) status = "Error al agregar opinion: ocurrió un error al actualizar la base de datos";
            if (resultadoActualizar == -1)   status = "Error al agregar opinion: no puedes opinar varias veces sobre el mismo juego";

            return status;
        }

        public static string Validar(Opinion opinion)
        {
            var minRating = 1;
            var maxRating = 5;
            var maxLength = 2000;
            if (opinion.getCalificacion() < minRating || opinion.getCalificacion() > maxRating)
                return $"Error: la calificacion debe ser entre {minRating} y {maxRating}";
            if (opinion.getComentario().Length > maxLength)
                return $"Error: limite de {maxLength} caracteres alcanzado";
            return "";
        }
    }
}
