using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Opinion
    { 
        private int ID_Juego;
        private string Username;
        private byte Calificacion;
        private string Comentario;
        private bool Activo;

        public Opinion(int idJuego, string username, byte calificacion, string comentario, bool activo)
        {
            ID_Juego = idJuego;
            Username = username;
            Calificacion = calificacion;
            Comentario = comentario;
            Activo = activo;
        }

        public int getID_Juego() { return ID_Juego; }
        public string getUsername() { return Username; }
        public byte getCalificacion() { return Calificacion; }
        public string getComentario() { return Comentario; }
        public bool getActivo() { return Activo; }



        public void setID_Juego(int id_juego) { ID_Juego = id_juego; }
        public void setUsername(string username) { Username = username; }
        public void setCalificacion(byte calificacion) { Calificacion = calificacion; }
        public void setComentario(string comentario) { Comentario = comentario; }
        public void setActivo(bool activo) { Activo = activo; }
    }
}
