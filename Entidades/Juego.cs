using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego
    {
        private int ID;
        public string Nombre { get; set; }
        private string Descripcion;
        private bool Activo;
        public DateTime FechaLanzamiento;

        private Desarrollador Desarrollador;
        private List<Imagenes> Imagenes;
        private List<Plataforma> Plataformas;
        private List<Categoria> Categorias;
        private List<Tienda> Tiendas;
        private List<Juego_x_Tienda> JuegosXTiendas;
        private List<Opinion> Opiniones;

        public Juego(int idjuego, int iddesarrollador, string nombre, string descripcion, bool activo) 
        {
            ID = idjuego;
            setIDDesarrollador(iddesarrollador);
            Nombre = nombre;
            Descripcion = descripcion;
            Activo = activo;
        }

        public Juego(int iddesarrollador, string nombre, string descripcion, bool activo)
        {
            setIDDesarrollador(iddesarrollador);
            Nombre = nombre;
            Descripcion = descripcion;
            Activo = activo;
        }

        public int getID() { return ID; }
        public string getNombre() { return Nombre; }
        public int getIDDesarrollador() { return Desarrollador.getID_Desarrollador(); }
        public string getDescripcion() { return Descripcion; }
        public bool getActivo() { return Activo; }
        public DateTime getFecha() { return FechaLanzamiento; }
        public List<Imagenes> getImagenes() { return Imagenes; }
        public List<Categoria> GetCategorias() { return Categorias; }
        public List<Plataforma> GetPlataformas() { return Plataformas; }
        public List<Tienda> GetTiendas() { return Tiendas; }
        public List<Juego_x_Tienda> GetJuegosXTiendas() { return JuegosXTiendas; }
        public Desarrollador GetDesarrollador() { return Desarrollador; }
        public List<Opinion> GetOpiniones() { return Opiniones; }
        public double? getPrecio() { return JuegosXTiendas?.FirstOrDefault() == null ? (double?)null  : JuegosXTiendas.AsQueryable().Min(x => x.getPrecioRebajado() ?? x.getPrecio()); }
        public double? getSoloPrecio() { return JuegosXTiendas?.FirstOrDefault() == null ? (double?)null : JuegosXTiendas.AsQueryable().Min(x => x.getPrecio()); }
        public double? getPrecioRebajado() { return JuegosXTiendas?.FirstOrDefault() == null ? (double?)null : JuegosXTiendas.AsQueryable().Min(x => x.getPrecioRebajado()); }
        public double? getRating() { return Opiniones?.FirstOrDefault() == null ? (double?)null : Math.Round(Opiniones.AsQueryable().Where(x => x.getActivo()).Average(x => x.getCalificacion()), 1); }
        public string getPortada() { return Imagenes?.FirstOrDefault()?.getNombreArchivo(); }

        public void setID(int id) { ID=id; }
        public void setNombre(string nombre) {Nombre=nombre; }
        public void setIDDesarrollador(int ID_desarrollador) {
            if (Desarrollador == null) Desarrollador = new Desarrollador();
            Desarrollador.setID_Desarrollador(ID_desarrollador); 
        }
        public void setDescripcion(string descripcion) { Descripcion=descripcion; }
        public void setFecha(int Dia=1, int Mes=1, int Año=1)
        {
            DateTime Fecha = new DateTime(Año, Mes, Dia);
            FechaLanzamiento = Fecha;
        }
        public void setActivo(bool activo) {Activo=activo; }


        public void setImagenes(List<Imagenes> imagenes) { Imagenes = imagenes; }
        public void setCategorias(List<Categoria> categorias) {  Categorias = categorias; }
        public void setPlataformas(List<Plataforma> plataformas) {  Plataformas = plataformas; }
        public void setTiendas(List<Tienda> tiendas) {  Tiendas = tiendas; }
        public void setDesarrollador(Desarrollador desarrollador) { Desarrollador = desarrollador; }
        public void setJuegosXTiendas(List<Juego_x_Tienda> juegosXTiendas) { JuegosXTiendas = juegosXTiendas; }
        public void setOpiniones(List<Opinion> opiniones) { Opiniones = opiniones; }

    }
}
