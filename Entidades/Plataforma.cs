using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Plataforma
    {
        private int ID_Plataforma;
        private string Nombre;
        private bool Activo;

        
         public Plataforma(int id_Plataforma, string nombre, bool activo)
        {
            ID_Plataforma = id_Plataforma;
            Nombre = nombre;
            Activo = activo;
        }

        public Plataforma(string nombre) { Nombre = nombre; }

         

        public int getID_Plataforma() { return ID_Plataforma; }
        public string getNombre() { return Nombre; }
        public bool getActivo() { return Activo; }


        public void setID_Plataforma(int id_plataforma) { ID_Plataforma = id_plataforma; }
        public void setNombre(string nombre) { Nombre = nombre; }
        public void setActivo(bool activo) { Activo = activo; }

        public override string ToString()
        {
            return Nombre;
        }
    }
}
