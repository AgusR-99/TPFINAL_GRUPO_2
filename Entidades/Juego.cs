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
        private string Nombre;
        private string Descripcion;
        private bool Activo;

        private Desarrollador Desarrollador;
        private List<Imagenes> Imagenes;
        private List<Plataforma> Plataformas;
        private List<Categoria> Categorias;
        private List<Tienda> Tiendas;

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
        public List<Imagenes> getImagenes() { return Imagenes; }
        public List<Categoria> GetCategorias() { return Categorias; }
        public List<Plataforma> GetPlataformas() { return Plataformas; }
        public List<Tienda> GetTiendas() { return Tiendas; }
        public Desarrollador GetDesarrollador() { return Desarrollador; }

        public void setID(int id) { ID=id; }
        public void setNombre(string nombre) {Nombre=nombre; }
        public void setIDDesarrollador(int ID_desarrollador) { Desarrollador.setID_Desarrollador(ID_desarrollador); }
        public void getDescripcion(string descripcion) { Descripcion=descripcion; }
        public void getActivo(bool activo) {Activo=activo; }

        public void setImagenes(List<Imagenes> imagenes) { Imagenes = imagenes; }
        public void setCategorias(List<Categoria> categorias) {  Categorias = categorias; }
        public void setPlataformas(List<Plataforma> plataformas) {  Plataformas = plataformas; }
        public void setTiendas(List<Tienda> tiendas) {  Tiendas = tiendas; }
        public void setDesarrollador(Desarrollador desarrollador) { Desarrollador = desarrollador; }
    }
}
