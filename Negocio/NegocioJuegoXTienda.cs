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
    public static class NegocioJuegoXTienda
    {
        public static DataTable ListarJuegosXTiendas()
        {
            return DAOJuegoXTienda.ListarJuegosXTiendas();
        }

        public static List<string> ActualizarJuegoXTienda(Juego_x_Tienda jxt)
        {
            var errorReasons = Validar(jxt);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOJuegoXTienda.ActualizarJuegoXTienda(jxt);
            if (resultadoActualizar == null) errorReasons.Add("Ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == 0) errorReasons.Add("No se encontró el registro a actualizar");

            return errorReasons;
        }

        public static List<string> EliminarJuegoXTienda(Juego_x_Tienda jxt)
        {
            var errorReasons = new List<string>();
            int? resultadoEliminar = DAOJuegoXTienda.EliminarJuegoXTienda(jxt);
            if (resultadoEliminar == null) errorReasons.Add("Ocurrió un error al eliminar de la base de datos");
            if (resultadoEliminar == 0) errorReasons.Add("No se encontró el registro a elimnar");

            return errorReasons;
        }

        public static List<string> AgregarJuegoXTienda(Juego_x_Tienda jxt)
        {
            var errorReasons = Validar(jxt);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoAgregar = DAOJuegoXTienda.AgregarJuegoXTienda(jxt);
            if (resultadoAgregar == null) errorReasons.Add("Ocurrió un error al agregar a la base de datos");
            if (resultadoAgregar == 0) errorReasons.Add("No se agregó el registro correctamente");

            return errorReasons;
        }

        private static List<string> Validar(in Juego_x_Tienda jxt)
        {
            var errorReasons = new List<string>();
            if (jxt.getPrecio()<0) errorReasons.Add("El campo Precio no puede ser negativo");
            if ( (jxt.getPrecioRebajado()??0) < 0) errorReasons.Add("El campo Precio Rebajado no puede ser negativo");
            if (String.IsNullOrEmpty(jxt.getURL())) errorReasons.Add("El campo URL no puede estar vacío");
            return errorReasons;
        }

        //public static List<Juego_x_Tienda> ListaJuegosXTiendas()
        //{
        //    var juegosXTiendas = new List<Juego_x_Tienda>();
        //    var table = DAOJuegoXTienda.ListarJuegosXTiendas();
        //    foreach(DataRow row in table.Rows)
        //    {
        //        Juego_x_Tienda jxt = GetJuegoXTiendaFromRow(row);
        //        if (jxt != null)
        //            juegosXTiendas.Add(jxt);
        //    }
        //    return juegosXTiendas;
        //}

        //private static Juego_x_Tienda GetJuegoXTiendaFromRow(in DataRow row)
        //{
        //    try
        //    {
        //        return new Juego_x_Tienda(
        //                (int)row["IdJuego"],
        //                (int)row["IdTienda"],
        //                (string)row["SitioWeb"],
        //                (float)(double)row["Precio"],
        //                (float?) ((row["PrecioRebajado"] != DBNull.Value) ? (double?)row["PrecioRebajado"] : null),
        //                (bool)row["Activo"]
        //            );
        //    }
        //    catch(Exception ex)
        //    {
        //        return null;
        //    }
        //}
    }
}
