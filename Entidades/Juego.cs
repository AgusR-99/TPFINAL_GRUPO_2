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
        private int ID_Desarrollador;
        private string Descripcion;
        private bool Activo;

        public Juego(int idjuego, int iddesarrollador, string nombre, string descripcion, bool activo) 
        {
            ID = idjuego;
            ID_Desarrollador = iddesarrollador;
            Nombre = nombre;
            Descripcion = descripcion;
            Activo = activo;
        }

        public Juego(int iddesarrollador, string nombre, string descripcion, bool activo)
        {
            ID_Desarrollador = iddesarrollador;
            Nombre = nombre;
            Descripcion = descripcion;
            Activo = activo;
        }

        public int getID() { return ID; }
        public string getNombre() { return Nombre; }
        public int getIDDesarrollador() { return ID_Desarrollador; }
        public string getDescripcion() { return Descripcion; }
        public bool getActivo() { return Activo; }

        public void setID(int id) { ID=id; }
        public void setNombre(string nombre) {Nombre=nombre; }
        public void setIDDesarrollador(int ID_desarrollador) {ID_Desarrollador=ID_desarrollador; }
        public void getDescripcion(string descripcion) { Descripcion=descripcion; }
        public void getActivo(bool activo) {Activo=activo; }
    }
}
