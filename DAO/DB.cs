using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Web;
using Entidades;

namespace DAO
{
    static class DB
    {
        private static string connString = "Data Source=localhost\\sqlexpress; Initial Catalog=TIF2022_PROG; Integrated Security=True";
        
        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connString);
        }

        private static SqlDataAdapter GetAdapter(SqlCommand cmd)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(cmd);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        private static SqlCommand GetCommand(in string query, in List<SqlParameter> parameters, bool isSP = false)
        {
            var cmd = new SqlCommand(query, GetConnection());
            cmd.CommandType = isSP ? CommandType.StoredProcedure : CommandType.Text;
            
            AddParameters(ref cmd, parameters);
            return cmd;
        }

        public static void AddParameters(ref SqlCommand cmd, in List<SqlParameter> parameters)
        {
            if (parameters!=null)
            {
                foreach(SqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }
            }
        }

        /// <summary> 
        /// Ejecuta consultas en la base de datos.
        /// </summary>
        /// <param name="query">Consulta a la base de datos</param>
        /// <param name="parameters">Valores de los parámetros</param>
        /// <returns>DataSet con los resultados de la consulta o null falla la operación.</returns>
        public static DataSet Query(string query, List<SqlParameter> parameters = null, bool isSP = false)
        {
            try
            {
                var cmd = GetCommand(query, parameters, isSP);
                var adapter = new SqlDataAdapter(cmd);
                var ds = new DataSet();
                adapter.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        /// <summary>
        /// Ejecuta operaciones en la base de datos que no sean de selección.
        /// </summary>
        /// <param name="query">Consulta a la base de datos</param>
        /// <param name="parameters">Valores de los parámetros</param>
        /// <returns>Cantidad de filas afectadas o null si falla la operación</returns>
        public static int? NonQuery(string query, List<SqlParameter> parameters = null, bool isSP = false)
        {
            try
            {
                var cmd = GetCommand(query, parameters, isSP);
                cmd.Connection.Open();
                int affected = cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return affected;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public static int? NonQueryReturnParameter(string query, List<SqlParameter> parameters = null, bool isSP = false)
        {
            /*try
            {*/
            var cmd = GetCommand(query, parameters, isSP);
            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close(); 
            return Convert.ToInt32(returnParameter.Value);
            /*}
            catch(Exception ex)
            {
                return null;
            }*/
        }

        public static List<string> ObtenerLista(string storedProcedure, string parametro, List<String> Lista, string termino, string campo)
        {
            using (SqlConnection con = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(storedProcedure, con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter()
                {
                    ParameterName = parametro,
                    Value = termino
                };

                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Lista.Add(rdr[campo].ToString());
                }
            }
            return Lista;
        }

        public static DataTable ObtenerTabla(String NombreTabla, String Sql, List<SqlParameter> parameters = null, bool isSP = false)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlCommand cmd = GetCommand(Sql, parameters, isSP);
                SqlDataAdapter adp = GetAdapter(cmd);
                adp.Fill(ds, NombreTabla);
                cmd.Connection.Close();
                return ds.Tables[NombreTabla];
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static object ValueOrNull(object obj)
        {
            return obj == DBNull.Value ? null : obj;
        }
    }
}