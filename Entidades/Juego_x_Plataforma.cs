using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego_x_Plataforma
    {
        private int ID_Juego;
        private int ID_Plataforma;

        public Juego_x_Plataforma(int idJuego, int idPlataforma)
        {
            ID_Juego = idJuego;
            ID_Plataforma = idPlataforma;
        }


        public int getID_Juego() { return ID_Juego; }
        public int getID_Plataforma() { return ID_Plataforma; }


        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setID_Plataforma(int id_plataforma) { ID_Plataforma = id_plataforma; }
    }
}
