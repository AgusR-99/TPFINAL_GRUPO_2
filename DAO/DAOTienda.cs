﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOTienda
    {
        public static DataTable ListarTiendas()
        {
            return DB.ObtenerTabla("Tiendas","[SP_Tiendas_Obtener]", isSP: true);
        }

        public static int? ActualizarTienda(Tienda tienda)
        {
            return DB.NonQuery("[SP_Tiendas_Actualizar]", getParametrosTienda(tienda, true), true);
        }

        public static int? AgregarTienda(Tienda tienda)
        {
            return DB.NonQuery("[SP_Tiendas_Agregar]", getParametrosTienda(tienda, false), true);
        }

        public static List<SqlParameter> getParametrosTienda(in Tienda tienda, bool includeID)
        {
            var parametros = new List<SqlParameter>()
            {
                new SqlParameter("Nombre", tienda.getNombre()),
                new SqlParameter("RutaImagen", tienda.getURL_img()),
                new SqlParameter("SitioWeb", tienda.getURL_web()),
                new SqlParameter("Activo", tienda.getActivo())
            };
            if (includeID) parametros.Add(new SqlParameter("IdTienda", tienda.getID_Tienda()));
            return parametros;
        }
    }
}
