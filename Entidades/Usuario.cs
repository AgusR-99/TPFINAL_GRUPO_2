using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private string Username;
        private string Contraseña;
        private string Email;
        private string Descripcion;
        private bool Administrador;
        private bool Activo;

        private List<Opinion> Opinion;

        public Usuario(string email, string contraseña) { 
            Email = email;
            Contraseña = contraseña;
        }
        public Usuario(string username, string email, bool administrador, string descripcion, bool activo = true)
        {
            Username = username;
            Email = email;
            Administrador = administrador;
            Descripcion = descripcion;
            Activo = activo;
        }

        public Usuario(string username, string contrasena, string email, bool admin, bool activo)
        {
            Username = username;
            Contraseña = contrasena;
            Email = email;
            Administrador = admin;
            Activo = activo;
        }
        public string getUsername() { return Username; }
        public string getContraseña() { return Contraseña; }
        public string getEmail() { return Email; }
        public string getDescripcion() { return Descripcion; }
        public bool getAdministrador() { return Administrador; }
        public bool getActivo() { return Activo; }
        public List<Opinion> getOpinion() { return Opinion; }

        public void setUsername(string username) { Username = username; }
        public void setContraseña(string contraseña) { Contraseña = contraseña; }
        public void setEmail(string email) { Email = email; }
        public void setDescripcion(string descripcion) { Descripcion = descripcion; }
        public void setAdiministrador(bool administrador) { Administrador = administrador; }
        public void setActivo(bool activo) { Activo = activo; }
        public void setOpinion(List<Opinion> opinion) { Opinion = opinion; }
    }
}
