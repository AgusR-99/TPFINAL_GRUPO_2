using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Imagenes
    {
        private int ID_Juego;
        private string NombreArchivo;
        private int Orden;
        private bool Activo;

        public Imagenes() { }

        public int getID_Juego() { return ID_Juego; }
        public string getNombreArchivo() { return NombreArchivo; }
        public int getOrden() { return Orden; }
        public bool getActivo() { return Activo; }



        public void setID_Juego(int id_juego) {ID_Juego = id_juego; }
        public void setNombreArchivo(string url_img) { NombreArchivo = url_img; }
        public void setOrden(int orden) {Orden = orden; }
        public void setActivo(bool activo) {Activo = activo; }
    }
}
