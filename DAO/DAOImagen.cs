﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOImagen
    {
        public static DataTable ListarImagenes()
        {
            return DB.ObtenerTabla("Imagenes", "[SP_Imagenes_Obtener]", isSP: true);
        }
        public static DataTable ListarImagenesPorJuego(int idJuego, bool soloActivo)
        {
            var parametros = new List<SqlParameter>() { 
                new SqlParameter("idJuego", idJuego),
                new SqlParameter("SoloActivo", soloActivo)
            };
            return DB.ObtenerTabla("Imagenes", "[SP_Imagenes_Obtener]", parametros, soloActivo);
        }

        public static int? ActualizarImagen(Imagenes imagen, string nombreAnterior)
        {
            return DB.NonQuery("[SP_Imagenes_Actualizar]", getParametrosImagen(imagen, true, nombreAnterior), true);
        }

        public static int? AgregarImagen(Imagenes imagen)
        {
            return DB.NonQuery("[SP_Imagenes_Agregar]", getParametrosImagen(imagen, false), true);
        }

        public static List<Imagenes> ObtenerImagenesPorJuegoComoLista(int idJuego)
        {
            return ArmarListaDeImagenes(ListarImagenesPorJuego(idJuego, true));
        }

        public static List<SqlParameter> getParametrosImagen(in Imagenes imagen, bool includeID, string nombreAnterior=null)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("IdJuego", imagen.getID_Juego()),
                new SqlParameter("NombreArchivo", imagen.getNombreArchivo()),
                new SqlParameter("Orden", imagen.getOrden()),
                new SqlParameter("Activo", imagen.getActivo())
            };

            if (nombreAnterior != null)
                parametros.Add(new SqlParameter("NombreAnterior", nombreAnterior));
            return parametros;
        }

        private static List<Imagenes> ArmarListaDeImagenes(in DataTable datatable)
        {
            var imagenes = new List<Imagenes>();
            if (datatable == null) return imagenes;
            foreach (DataRow row in datatable?.Rows)
            {
                var imagen = ArmarImagen(row);
                if (imagen != null) imagenes.Add(imagen);
            }
            return imagenes;
        }

        private static Imagenes ArmarImagen(in DataRow datarow)
        {
            try
            {
                return new Imagenes(
                        (int)datarow["IdJuego"],
                        RutaImagen((string)datarow["NombreArchivo"]),
                        (int)datarow["Orden"],
                        (bool)datarow["Activo"]
                    );
            }
            catch (Exception e)
            {
                return null;
            }
        }

        private static string RutaImagen(string nombreArchivo)
        {
            return "/Imagenes/Juegos/" + nombreArchivo;
        }
    }
}
