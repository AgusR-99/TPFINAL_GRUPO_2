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
        public enum Orden
        {
            MasPopular,
            MenosPopular,
            MayorPrecio,
            MenorPrecio,
            Default
        }

        public static DataTable ListarJuegos()
        {
            return DAOJuego.ListarJuegos();
        }

        public static DataTable ListarJuegosPorNombre(string Nombre)
        {
            return DAOJuego.ListarJuegosPorNombre(Nombre);
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

        public static List<string> ObtenerListaNombres(string termino)
        {
            List<string> lista = new List<string>();
            return DAOJuego.ObtenerListaNombres(lista, termino);
        }

        public static List<string> AgregarJuego(Juego juego)
        {
            var errorReasons = Validar(juego);
            if (errorReasons.Any()) return errorReasons;

            int? resultadoActualizar = DAOJuego.AgregarJuego(juego);
            if (resultadoActualizar == null) errorReasons.Add("Error al agregar Juego: ocurrió un error al actualizar la base de datos");
            if (resultadoActualizar == -1) errorReasons.Add("Error al agregar Juego: el Juego ya existe");

            return errorReasons;
        }

        public static List<string> ActualizarValidarJuego(in Juego juego)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(juego.getNombre())) errorReasons.Add("El campo Nombre no puede estar vacío");
            if (String.IsNullOrWhiteSpace(juego.getDescripcion())) errorReasons.Add("El campo Descripcion no puede estar vacío");
            return errorReasons;
        }

        public static List<string> Validar(Juego juego)
        {
            var errorReasons = new List<string>();
            if (String.IsNullOrWhiteSpace(juego.getNombre())) errorReasons.Add("Error: el campo Nombre no puede estar vacío");
            if (String.IsNullOrWhiteSpace(juego.getDescripcion())) errorReasons.Add("Error: el campo Descripcion no puede estar vacío");
            return errorReasons;
        }

        public static DataSet ObtenerCantidadJuegos()
        {
            return DAOJuego.ObtenerCantidadJuegos();
        }

        public static List<Juego> ObtenerJuegosComoLista(bool soloActivo = true, List<int> categorias = null, List<int> plataformas = null, Orden orden = Orden.Default)
        {
            var juegos = DAOJuego.ObtenerJuegosComoLista();
            if (soloActivo) 
                juegos.RemoveAll(j => !j.getActivo());
            if (categorias != null)
                juegos.RemoveAll(j => 
                    !(j.GetCategorias().Any(c => categorias.Contains(c.Id_Categoria))));
            if(plataformas!=null)
                juegos.RemoveAll(j =>
                    !(j.GetPlataformas().Any(p => plataformas.Contains(p.getID_Plataforma()))));

            switch (orden)
            {
                case Orden.MenosPopular:
                    return juegos
                        .OrderBy(j => j.GetOpiniones().Count)
                        .ThenBy(j => j.getRating())
                        .ToList();
                case Orden.MasPopular:
                    return juegos
                        .OrderByDescending(j => j.GetOpiniones().Count)
                        .ThenByDescending(j => j.getRating())
                        .ToList();
                case Orden.MenorPrecio:
                    return juegos
                        .OrderBy(j => j.getPrecio() == null)
                        .ThenBy(j => j.getPrecio())
                        .ToList();
                case Orden.MayorPrecio:
                    return juegos
                        .OrderByDescending(j => j.getPrecio())
                        .ToList();
                default:
                    return juegos;
            }
        }

    }
}
