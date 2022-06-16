using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Juegos_x_Categorias
    {
        private int ID_Juego;
        private int ID_Categoria;

        public Juegos_x_Categorias()
        { }


        public int getID_Juego() { return ID_Juego; }
        public int getID_Categoria() { return ID_Categoria; }


        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setID_Categoria(int id_categoria) { ID_Categoria = id_categoria; }
    }
}
