﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Tienda
    {
        private int ID_Tienda;
        private string Nombre;
        private string URL_img;
        private string URL_web;
        private bool Activo;

        public int getID_Tienda() { return ID_Tienda; }
        public string getNombre() { return Nombre; }
        public string getURL_img() { return URL_img; }
        public string getURL_web() { return URL_web; }
        public bool getActivo() { return Activo; }


        public void setID_Tienda(int id_tienda) {ID_Tienda=id_tienda; }
        public void setNombre(string nombre) {Nombre=nombre; }
        public void setURL_img(string url_img) {URL_img=url_img; }
        public void setURL_web(string url_web) {URL_web=url_web; }
        public void setActivo(bool activo) {Activo=activo; }
    }
}
