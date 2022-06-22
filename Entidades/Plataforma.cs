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
        private string URL_img;


        public int getID_Plataforma() { return ID_Plataforma; }
        public string getNombre() { return Nombre; }
        public string getURL_img() { return URL_img; }


        public void setID_Plataforma(int id_plataforma) { ID_Plataforma = id_plataforma; }
        public void setNombre(string nombre) { Nombre = nombre; }
        public void setURL_img(string url_img) { URL_img = url_img; }
    }
}
