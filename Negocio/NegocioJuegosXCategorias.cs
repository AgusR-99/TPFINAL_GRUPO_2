using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using Entidades;
using DAO;

namespace Negocio
{
    public static class NegocioJuegosXCategorias
    {
        public static DataTable Listar()
        {
            return DAOJuegosXCategorias.Listar();
        }

        public static DataTable ListarPorInput(string input)
        {
            return DAOJuegosXCategorias.ListarPorLink(input);
        }

        public static DataSet ObtenerSiguienteID()
        {
            return DAOJuegosXCategorias.ObtenerSiguienteID();
        }

        public static string Actualizar(Juegos_x_Categorias obj)
        {
            var estado = Validar(obj);
            if (estado != "") return $"Error de ingreso: {estado}";

            int? resultado = DAOJuegosXCategorias.Actualizar(obj);
            switch (resultado)
            {
                case 1:    estado = $"Enlace {obj.Juego}-{obj.Categoria} actualizado exitosamente";       break;
                case null: estado = "ocurrió un error al actualizar la base de datos";                    break;
                case  0:   estado = $"no se encontró el registro con ID Link {obj.Id_Link} a actualizar"; break;
                case -1:   estado = $"categoria - {obj.Categoria} - no existe en la tabla Categoria";     break;
                case -2:   estado = $"juego - {obj.Juego} - no existe en la tabla Juegos";                break;
                case -3:   estado = $"el enlace {obj.Juego}-{obj.Categoria} ya existe";                   break;
                case -4:   estado = "no se han registrado cambios en este registro";                      break;
            }
            if (resultado == null || resultado <= 0) estado = ($"Error al actualizar: {estado}");
            return estado;
        }

        public static string Agregar(Juegos_x_Categorias obj)
        {
            var estado = Validar(obj);
            if (estado != "") return $"Error de ingreso: {estado}";

            int? resultado = DAOJuegosXCategorias.Agregar(obj);
            switch (resultado)
            {
                case 1:    estado = $"Enlace {obj.Juego}-{obj.Categoria} creado exitosamente";   break;
                case null: estado = "ocurrió un error al insertar en la base de datos";            break;
                case  0:   estado = "no se ha insertado el registro";                              break;
                case -1:   estado = $"Categoria {obj.Categoria} no existe en la tabla Categorias"; break;
                case -2:   estado = $"Juego {obj.Juego} no existe en la tabla Juegos";             break;
                case -3:   estado = $"El enlace {obj.Juego}-{obj.Categoria} ya existe";            break;
            }
            if (resultado == null || resultado <= 0) estado = ($"Error al agregar: {estado}");
            return estado;
        }

        public static string Validar(Juegos_x_Categorias obj)
        {
            string str = "";
            if (String.IsNullOrWhiteSpace(Convert.ToString(obj.Juego))) str = ("el campo Juego no puede estar vacío");
            if (String.IsNullOrWhiteSpace(Convert.ToString(obj.Categoria))) str = ("el campo Categoria no puede estar vacío");
            return str;
        }
    }
}
