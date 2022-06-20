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
    public static class DAODesarrollador
    {

        public static DataTable ListarDesarrolladores()
        {
            return DB.ObtenerTabla("Desarrolladores", "[SP_Desarrolladores_Obtener]", isSP: true);
        }

    }
}
