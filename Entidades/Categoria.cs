using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Categoria
    {
        private int ID_Categoria;
        private string Nombre;


        public int getID_Categoria() { return ID_Categoria; }
        public string getNombre() { return Nombre; }


        public void setID_Categoria(int id_categoria) { ID_Categoria = id_categoria; }
        public void setID_Juego(string nombre) { Nombre = nombre; }
    }
}
