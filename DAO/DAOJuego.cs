using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOJuego
    {
        public static DataTable ListarJuegos()
        {
            return DB.ObtenerTabla("Juegos", "[SP_Juegos_Obtener]", isSP: true);
        }

        public static DataTable ListarJuegosPorNombre(string nombre)
        {
            return DB.ObtenerTabla("Juegos", $"[SP_Juegos_Obtener_Por_Nombre] N'{nombre}'");
        }

        public static int? ActualizarJuego(Juego juego)
        {
            return DB.NonQuery("[SP_Juegos_Actualizar]", getParametrosJuego(juego,true), true);
        }

        public static List<string> ObtenerListaNombres(List<string> Lista, string termino)
        {

            return DB.ObtenerLista("[SP_Juegos_Obtener_Por_Nombre]", "@Nombre", Lista, termino, "Nombre");
        }


        public static int? AgregarJuego(Juego juego)
        {
            return DB.NonQuery("[SP_Juegos_Agregar]", getParametrosJuego(juego, false), true);
        }

        public static List<SqlParameter> getParametrosJuego(in Juego juego, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("IDDesarrollador", juego.getIDDesarrollador()),
                new SqlParameter("Nombre", juego.getNombre()),
                new SqlParameter("Descripcion", juego.getDescripcion()),
                new SqlParameter("Activo", juego.getActivo())
            };
            if (includeID) parametros.Add(new SqlParameter("IdJuego", juego.getID()));
            return parametros;
        }

        public static DataSet ObtenerCantidadJuegos()
        {
            return DB.Query("[SP_Obtener_Cantidad_Juegos]", isSP: true);
        }

        public static List<Juego> ObtenerJuegosComoLista()
        {
            return ArmarListaDeJuegos(ListarJuegos());
        }

        private static List<Juego> ArmarListaDeJuegos(in DataTable datatable)
        {
            var juegos = new List<Juego>();
            if (datatable == null) return juegos;
            foreach (DataRow row in datatable?.Rows)
            {
                var juego = ArmarJuego(row);
                if (juego != null) juegos.Add(juego);
            }
            return juegos;
        }

        private static Juego ArmarJuego(in DataRow datarow)
        {
            try
            {
                var juego = new Juego(
                        (int)datarow["IdJuego"],
                        (int)datarow["IDDesarrollador"],
                        (string)datarow["Nombre"],
                        (string)datarow["Descripcion"],
                        (bool)datarow["Activo"]
                    );
                juego.setDesarrollador(DAODesarrollador.ObtenerDesarrolladorPorId(juego.getIDDesarrollador()));
                juego.setCategorias(DAOCategoria.ObtenerCategoriasPorJuegoComoLista(juego.getID()));
                juego.setPlataformas(DAOPlataforma.ObtenerPlataformasPorJuegoComoLista(juego.getID()));
                juego.setTiendas(DAOTienda.ObtenerTiendasPorJuego(juego.getID()));
                juego.setJuegosXTiendas(DAOJuegoXTienda.ObtenerJuegosXTiendasPorJuegoComoLista(juego.getID()));
                juego.setImagenes(DAOImagen.ObtenerImagenesPorJuegoComoLista(juego.getID()));
                juego.setOpiniones(DAOOpinion.ObtenerOpinionesPorJuegoComoLista(juego.getID()));
                
                return juego;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
