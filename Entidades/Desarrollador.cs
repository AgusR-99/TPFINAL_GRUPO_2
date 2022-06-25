using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Desarrollador
    {
        private int ID_Desarrollador;
        private string Nombre;
        private string URL_web;
        private string Ubicacion_sede;
        private string Historia;
        public Desarrollador(){}

        public Desarrollador(int id_desarrollador, string nombre, string url_web, string ubicacion, string historia)
        {
            setID_Desarrollador(id_desarrollador);
            setNombre(nombre);
            setURL_web(url_web);
            setUbicacion_sede(ubicacion);
            setHistroia(historia);
        }
        public Desarrollador( string nombre, string url_web, string ubicacion, string historia)
        {
            setID_Desarrollador(0);
            setNombre(nombre);
            setURL_web(url_web);
            setUbicacion_sede(ubicacion);
            setHistroia(historia);
        }


        public int getID_Desarrollador() { return ID_Desarrollador; }
        public string getNombre() { return Nombre; }
        public string getURL_web() { return URL_web; }
        public string getUbicacion_sede() { return Ubicacion_sede; }
        public string getHistoria() { return Historia; }


        public void setID_Desarrollador(int id_desarrollador) { ID_Desarrollador=id_desarrollador; }
        public void setNombre(string nombre) { Nombre=nombre; }
        public void setURL_web(string url_web) { URL_web=url_web; }
        public void setUbicacion_sede(string ubicacion) { Ubicacion_sede=ubicacion; }
        public void setHistroia(string historia) { Historia = historia; }
    }
}
