using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Opinion
    { 
        private int ID_Juego;
        private string Username;
        private int Calificacion;
        private string Comentario;
        private bool Activo;

         

        public int getID_Juego() { return ID_Juego; }
        public string getUsername() { return Username; }
        public int getCalificacion() { return Calificacion; }
        public string getComentario() { return Comentario; }
        public bool getActivo() { return Activo; }



        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setUsername(string username) { Username = username; }
        public void setCalificacion(int calificacion) { Calificacion = calificacion; }
        public void setComentario(string comentario) { Comentario = comentario; }
        public void setActivo(bool activo) { Activo = activo; }
    }
}
