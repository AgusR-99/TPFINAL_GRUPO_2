using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Juegos_x_Tiendas
    {
        private int ID_Juego;
        private int ID_Tienda;

        public Juegos_x_Tiendas()
        { }


        public int getID_Juego() { return ID_Juego; }
        public int getID_Tienda() { return ID_Tienda; }


        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setID_Tienda(int id_tienda) { ID_Tienda = id_tienda; }

    }


}
