using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Juego
    {
        private int ID;
        private string Nombre;
        private string Nombre_Desarrollador;
        private string Descripcion;
        private bool Activo;


        public int getID() { return ID; }
        public string getNombre() { return Nombre; }
        public string getNombreDesarrollador() { return Nombre_Desarrollador; }
        public string getDescripcion() { return Descripcion; }
        public bool getActivo() { return Activo; }

        public void setID(int id) { ID=id; }
        public void setNombre(string nombre) {Nombre=nombre; }
        public void setNombreDesarrollador(string nombre_desarrollador) {Nombre_Desarrollador=nombre_desarrollador; }
        public void getDescripcion(string descripcion) { Descripcion=descripcion; }
        public void getActivo(bool activo) {Activo=activo; }
    }
}
