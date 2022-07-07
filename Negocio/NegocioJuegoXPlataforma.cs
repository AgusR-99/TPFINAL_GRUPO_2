using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAO;

namespace Negocio
{
    public static class NegocioJuegoXPlataforma
    {
        public static DataTable ListarJuegosXPlataformas(int idJuego = -1, int idPlataforma = -1)
        {
            return DAOJuegosXPlataformas.ListarJuegosXPlataformas(idJuego, idPlataforma);
        }

        public static List<string> EliminarJuegoXPlataforma(Juego_x_Plataforma jxp)
        {
            var errorReasons = new List<string>();
            int? resultadoEliminar = DAOJuegosXPlataformas.EliminarJuegoXPlataforma(jxp);
            if (resultadoEliminar == null) errorReasons.Add("Ocurrió un error al eliminar de la base de datos");
            if (resultadoEliminar == 0) errorReasons.Add("No se encontró el registro a elimnar");

            return errorReasons;
        }

        public static List<string> AgregarJuegoXPlataforma(Juego_x_Plataforma jxp)
        {
            var errorReasons = new List<string>();

            var existe = ExisteJuegoXPlataforma(jxp);
            if (existe == null) errorReasons.Add("Ocurrió un error al realizar las validaciones necesarias");
            if (existe == true) errorReasons.Add("Ya se ha registrado el juego la tienda indicada");
            if (errorReasons.Any()) return errorReasons;

            int? resultadoAgregar = DAOJuegosXPlataformas.AgregarJuegoXPlataforma(jxp);
            if (resultadoAgregar == null) errorReasons.Add("Ocurrió un error al agregar a la base de datos");
            if (resultadoAgregar == 0) errorReasons.Add("No se agregó el registro correctamente");

            return errorReasons;
        }

        public static bool? ExisteJuegoXPlataforma(Juego_x_Plataforma jxp)
        {
            var tablaResultado = DAOJuegosXPlataformas.ExisteJuegoXPlataforma(jxp);
            try
            {
                return ((int)tablaResultado.Rows[0][0]) > 0;
            }
            catch
            {
                return null;
            }
        }
    }

}
