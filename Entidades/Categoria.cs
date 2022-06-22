﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        public Categoria(int id_Categoria, string nombre, bool activo)
        {
            Id_Categoria = id_Categoria;
            Nombre = nombre;
            Activo = activo;
        }

        public Categoria(string nombre) { Nombre = nombre; }

        public int Id_Categoria { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
    }
}
