using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Desarrollador
    {
        private string Nombre;
        private string URL_web;
        private string Ubicacion_sede;
        private string Historia;


        public string getNombre() { return Nombre; }
        public string getURL_web() { return URL_web; }
        public string getUbicacion_sede() { return Ubicacion_sede; }
        public string getHistoria() { return Historia; }


        public void setNombre(string nombre) { Nombre=nombre; }
        public void setURL_web(string url_web) { URL_web=url_web; }
        public void setUbicacion_sede(string ubicacion) { Ubicacion_sede=ubicacion; }
        public void setHistroia(string historia) { Historia = historia; }
    }
}
