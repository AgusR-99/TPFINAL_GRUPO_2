using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public static class DAOOpinion
    {
        public static DataSet ObtenerCantidadOpiniones()
        {
            return DB.Query("[SP_Obtener_Cantidad_Opiniones]", isSP: true);
        }
    }
}
