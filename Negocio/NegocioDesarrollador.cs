using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using DAO;
using System.Data;

namespace Negocio
{
    public static class NegocioDesarrollador
    {
        public static DataTable ListarDesarrolladores()
        {
            return DAODesarrollador.ListarDesarrolladores();
        }
    }
}
