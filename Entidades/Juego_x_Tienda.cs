using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego_x_Tienda
    {
        public int ID_Juego;
        public int ID_Tienda;
        public string URL;
        public double Precio;
        public double? PrecioRebajado;
        public bool Activo;

        public Juego_x_Tienda()
        { }

        public Juego_x_Tienda(int id_juego, int id_tienda)
        {
            ID_Juego = id_juego;
            ID_Tienda = id_tienda;
        }

        public Juego_x_Tienda(int id_juego, int id_tienda, string url, double precio, double? precioRebajado, bool activo)
        {
            ID_Juego = id_juego;
            ID_Tienda = id_tienda;
            URL = url;
            Precio = precio;
            PrecioRebajado = precioRebajado;
            Activo = activo;
        }


        public int getID_Juego() { return ID_Juego; }
        public int getID_Tienda() { return ID_Tienda; }
        public string getURL() { return URL; }
        public double getPrecio() { return Precio; }
        public double? getPrecioRebajado() { return PrecioRebajado; } 
        public bool getActivo() { return Activo; }


        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setID_Tienda(int id_tienda) { ID_Tienda = id_tienda; }
        public void setURL(string url) { URL = url; }
        public void setPrecio(double precio) { Precio = precio; }
        public void setPrecioRebajado(double? precioRebajado) { PrecioRebajado = precioRebajado; }
        public void setActivo(bool activo) { Activo = activo; } 



    }


}
