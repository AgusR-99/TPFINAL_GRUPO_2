﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego
    {
        private int ID;
        public string Nombre { get; set; }
        private string Descripcion;
        private bool Activo;

        private Desarrollador Desarrollador;
        private List<Imagenes> Imagenes;
        private List<Plataforma> Plataformas;
        private List<Categoria> Categorias;
        private List<Tienda> Tiendas;
        private List<Juego_x_Tienda> JuegosXTiendas;

        public Juego(int idjuego, int iddesarrollador, string nombre, string descripcion, bool activo) 
        {
            ID = idjuego;
            setIDDesarrollador(iddesarrollador);
            Nombre = nombre;
            Descripcion = descripcion;
            Activo = activo;
        }

        public Juego(int iddesarrollador, string nombre, string descripcion, bool activo)
        {
            setIDDesarrollador(iddesarrollador);
            Nombre = nombre;
            Descripcion = descripcion;
            Activo = activo;
        }

        public int getID() { return ID; }
        public string getNombre() { return Nombre; }
        public int getIDDesarrollador() { return Desarrollador.getID_Desarrollador(); }
        public string getDescripcion() { return Descripcion; }
        public bool getActivo() { return Activo; }
        public List<Imagenes> getImagenes() { return Imagenes; }
        public List<Categoria> GetCategorias() { return Categorias; }
        public List<Plataforma> GetPlataformas() { return Plataformas; }
        public List<Tienda> GetTiendas() { return Tiendas; }
        public List<Juego_x_Tienda> GetJuegosXTiendas() { return JuegosXTiendas; }
        public Desarrollador GetDesarrollador() { return Desarrollador; }
        public double? getPrecio() { return !JuegosXTiendas.Any() ? (double?)null  : JuegosXTiendas.AsQueryable().Min(x => x.getPrecioRebajado() ?? x.getPrecio()); }

        public void setID(int id) { ID=id; }
        public void setNombre(string nombre) {Nombre=nombre; }
        public void setIDDesarrollador(int ID_desarrollador) {
            if (Desarrollador == null) Desarrollador = new Desarrollador();
            Desarrollador.setID_Desarrollador(ID_desarrollador); 
        }
        public void setDescripcion(string descripcion) { Descripcion=descripcion; }
        public void setActivo(bool activo) {Activo=activo; }


        public void setImagenes(List<Imagenes> imagenes) { Imagenes = imagenes; }
        public void setCategorias(List<Categoria> categorias) {  Categorias = categorias; }
        public void setPlataformas(List<Plataforma> plataformas) {  Plataformas = plataformas; }
        public void setTiendas(List<Tienda> tiendas) {  Tiendas = tiendas; }
        public void setDesarrollador(Desarrollador desarrollador) { Desarrollador = desarrollador; }
        public void setJuegosXTiendas(List<Juego_x_Tienda> juegosXTiendas) { JuegosXTiendas = juegosXTiendas; }
    }
}
