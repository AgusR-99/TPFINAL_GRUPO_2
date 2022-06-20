﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOJuego
    {
        public static DataTable ListarJuegos()
        {
            return DB.ObtenerTabla("Juegos", "[SP_Juegos_Obtener]", isSP: true);
        }

        public static int? ActualizarJuego(Juego juego)
        {
            return DB.NonQuery("[SP_Juegos_Actualizar]", getParametrosJuego(juego), true);
        }

        public static List<SqlParameter> getParametrosJuego(in Juego juego)
        {
            return new List<SqlParameter>()
            {
                new SqlParameter("IDDesarrollador", juego.getIDDesarrollador()),
                new SqlParameter("Nombre", juego.getNombre()),
                new SqlParameter("Descripcion", juego.getDescripcion()),
                new SqlParameter("Activo", juego.getActivo())
            };
        }

    }
}
