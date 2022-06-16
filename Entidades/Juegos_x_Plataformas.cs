using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Juegos_x_Plataformas
    {
        private int ID_Juego;
        private int ID_Plataforma;

        public Juegos_x_Plataformas()
        { }


        public int getID_Juego() { return ID_Juego; }
        public int getID_Plataforma() { return ID_Plataforma; }


        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setID_Plataforma(int id_plataforma) { ID_Plataforma = id_plataforma; }
    }
}
