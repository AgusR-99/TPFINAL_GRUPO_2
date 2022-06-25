using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juegos_x_Categorias
    {
        public Juegos_x_Categorias(int id_Link, string juego, string categoria, bool activo)
        {
            Categoria = categoria;
            Juego = juego;
            Activo = activo;
            Id_Link = id_Link;
        }
        public int Id_Link { get; set; }
        public string Categoria { get; set; }
        public string Juego { get; set; }
        public bool Activo { get; set; }
    }
}
