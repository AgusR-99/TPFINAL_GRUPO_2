using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Deseado
    {
        public string Username { get; set; }
        public int ID_Juego { get; set; }
        public Deseado(string user, int juego)
        {
            Username = user;
            ID_Juego = juego;
        }
    }
}
