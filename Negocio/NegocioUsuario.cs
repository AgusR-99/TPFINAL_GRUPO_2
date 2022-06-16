using System;
using System.Collections.Generic;
using DAO;

namespace Negocio
{
    public static class NegocioUsuario
    {
        public static int Login(string username, string contraseña)
        {
            //Devuelve:
            //  1   - Si se pudo loguear satisfactoriamente
            //  0   - Si no se encontró un usuario con ese nombre de usuario y contraseña
            //  -1  - Si ocurrió un error inesperado en el camino
            throw new NotImplementedException();
        }

        public static bool IsLoggedIn()
        {
            //Devuelve verdadero si el usuario se encuentra logueado
            throw new NotImplementedException();
        }

        public static bool IsLoggedInAsAdmin()
        {
            //Devuelve verdadero si el usuario se encuentra logueado y tiene perfil de administrador
            throw new NotImplementedException();
        }
    }
}
