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
        private string UsernameComp;
        private string Contraseña;
        private string Email;
        private string Descripcion;
        private bool Administrador;
        private bool Activo;

        private List<Opinion> Opinion;
        private List<Deseado> Deseados;

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

        public Usuario(string username2, string username, string contrasena, string descripcion, string email)
        {
            UsernameComp = username2;
            Username = username;
            Contraseña = contrasena;
            Descripcion = descripcion;
            Email = email;
        }

        public Usuario(string username)
        {
            Username = username;
        }
        public string getUsername() { return Username; }
        public string getUsernameComp() { return UsernameComp; }
        public string getContraseña() { return Contraseña; }
        public string getEmail() { return Email; }
        public string getDescripcion() { return Descripcion; }
        public bool getAdministrador() { return Administrador; }
        public bool getActivo() { return Activo; }
        public List<Opinion> getOpinion() { return Opinion; }
        public List<Deseado> getDeseados() { return Deseados; }

        public void setUsername(string username) { Username = username; }
        public void setUsernameComp(string usernamecomp) { UsernameComp = usernamecomp; }
        public void setContraseña(string contraseña) { Contraseña = contraseña; }
        public void setEmail(string email) { Email = email; }
        public void setDescripcion(string descripcion) { Descripcion = descripcion; }
        public void setAdiministrador(bool administrador) { Administrador = administrador; }
        public void setActivo(bool activo) { Activo = activo; }
        public void setOpinion(List<Opinion> opinion) { Opinion = opinion; }
        public void setDeseados(List<Deseado> deseados) { Deseados = deseados; }
    }
}
