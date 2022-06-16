using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Imagenes
    {
        private int ID_Juego;
        private string URL_img;
        private int Orden;
        private bool Activo;

        public Imagenes() { }

        public int getID_Juego() { return ID_Juego; }
        public string getURL_img() { return URL_img; }
        public int getOrden() { return Orden; }
        public bool getActivo() { return Activo; }



        public void setID_Juego(int id_juego) {ID_Juego = id_juego; }
        public void setURL_img(string url_img) {URL_img = url_img; }
        public void setOrden(int orden) {Orden = orden; }
        public void setActivo(bool activo) {Activo = activo; }
    }
}
