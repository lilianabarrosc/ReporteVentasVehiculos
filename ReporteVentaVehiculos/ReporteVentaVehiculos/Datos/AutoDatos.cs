using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.Common;
using System.Data;
using Npgsql;
using NpgsqlTypes;

using ReporteVentaVehiculos.Entidades;

namespace ReporteVentaVehiculos.Datos
{
    public class AutoDatos
    {
        //contructor de la clase
        public AutoDatos() 
        { }

        //conexion con la base de datos
        public static string constr
        {
            get { return ConfigurationManager.ConnectionStrings["conn"].ConnectionString; }
        }

        //cliente
        public static string Provider
        {
            get { return ConfigurationManager.ConnectionStrings["conn"].ProviderName; }
        }

        public static DbProviderFactory dpf
        {
            get
            {
                return DbProviderFactories.GetFactory(Provider);
            }
        }

        //ejecutar una query caso mySQL
        public static int ejecutanomQuery(string storeProcedure, List<DbParameter> parametros)
        {
            int id = 0;
            try
            {
                using (DbConnection con = dpf.CreateConnection())
                {
                    con.ConnectionString = constr; //abrir conexion con db
                    using (DbCommand cmd = dpf.CreateCommand())
                    {
                        cmd.Connection = con;
                        cmd.CommandText = storeProcedure; //procedimiento almacenado
                        cmd.CommandType = CommandType.StoredProcedure;
                        //recorrer la lista de parametros
                        foreach (DbParameter param in parametros)
                            cmd.Parameters.Add(param);
                        //abrir la conexion y ejecutar el procedimiento
                        con.Open();
                        id = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception e)
            {
                throw;
            }
            return id;
        }

        //insertar auto
        public int insertAuto(string marca, string modelo, string tipocombustible, int anio)
        {
            List<DbParameter> parametros = new List<DbParameter>();
            //agregar los parametros
            DbParameter param = dpf.CreateParameter();
            param.Value = marca;
            param.ParameterName = "marca";
            parametros.Add(param);

            DbParameter param1 = dpf.CreateParameter();
            param1.Value = modelo;
            param1.ParameterName = "modelo";
            parametros.Add(param1);

            DbParameter param2 = dpf.CreateParameter();
            param2.Value = tipocombustible;
            param2.ParameterName = "tipocombustible";
            parametros.Add(param2);

            DbParameter param3 = dpf.CreateParameter();
            param3.Value = anio;
            param3.ParameterName = "anio";
            parametros.Add(param3);

            return ejecutanomQuery("insertAuto", parametros);//nombre del procedimiento y parametros

        }

        //actualizar auto
        public int actualizarAuto(int idauto, string marca, string modelo, string tipocombustible, int anio)
        {
            List<DbParameter> parametros = new List<DbParameter>();
            //agregar los parametros
            DbParameter paramID = dpf.CreateParameter();
            paramID.Value = idauto;
            paramID.ParameterName = "idauto";
            parametros.Add(paramID);

            DbParameter param = dpf.CreateParameter();
            param.Value = marca;
            param.ParameterName = "marca";
            parametros.Add(param);

            DbParameter param1 = dpf.CreateParameter();
            param1.Value = modelo;
            param1.ParameterName = "modelo";
            parametros.Add(param1);

            DbParameter param2 = dpf.CreateParameter();
            param2.Value = tipocombustible;
            param2.ParameterName = "tipocombustible";
            parametros.Add(param2);

            DbParameter param3 = dpf.CreateParameter();
            param3.Value = anio;
            param3.ParameterName = "anio";
            parametros.Add(param3);

            return ejecutanomQuery("actualizarAuto", parametros);//nombre del procedimiento y parametros
        }

        //eliminar un auto
        public int eliminarAuto(int idauto)
        {
            List<DbParameter> parametros = new List<DbParameter>();
            //agregar los parametros
            DbParameter paramID = dpf.CreateParameter();
            paramID.Value = idauto;
            paramID.ParameterName = "idauto";
            parametros.Add(paramID);

            return ejecutanomQuery("eliminarAuto", parametros);//nombre del procedimiento y parametros
        }

        #region [Metodos Postgress]

        /// <summary>
        /// Establece las propiedades del Auto dado un NpgsqlDataReader
        /// </summary>
        /// <param name="dr">El NpgsqlDataReader que contiene los datos del auto</param>
        public Auto datosAuto(NpgsqlDataReader dr)
        {
            int ID = Convert.ToInt32(dr["idauto"]);
            string Marca = dr["marca"].ToString();
            string Modelo = dr["modelo"].ToString();
            string TipoCombustible = dr["tipoCombustible"].ToString();
            int Anio = Convert.ToInt32(dr["anio"]);

            return (new Auto(ID, Marca, Modelo, TipoCombustible, Anio));
        }

        /// <summary>
        /// Selecciona un auto dado el id que se entrega como parametro 
        /// </summary>
        /// <param name="id">el id del auto a seleccionar</param>
        /// <returns>True si el auto fue encontrado, false en caso contrario</returns>

        public Auto seleccionarAuto(long id)
        {
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

                var comando = new NpgsqlCommand() { CommandText = "auto_seleccionar", CommandType = CommandType.StoredProcedure };
                comando.Parameters.Add(new NpgsqlParameter("inIdauto", NpgsqlDbType.Integer));
                comando.Parameters[0].Value = id;

                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open();
                    comando.Connection = conn;
                    NpgsqlDataReader ds = comando.ExecuteReader();

                    if (ds.Read())
                    {
                        Auto a = this.datosAuto(ds);
                        conn.Close();
                        return a;
                    }
                    return null;
                }
            }
            catch (Exception ex) { }

            return null;
        }

        /// <summary>
        /// Selecciona los autos dada la pagina y cantidad de resultados por pagina
        /// </summary>
        /// <param name="cantidadResultados">Cantidad de resultado por pagina</param>
        /// <param name="pagina">Pagina que se necesita ver</param>
        /// <returns>La lista de autos</returns>
        public List<Auto> Todos(int cantidadResultados, int pagina)
        {

            var autos = new List<Auto>();
            int index = cantidadResultados * (pagina - 1);

            try
            {
                string connString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

                var comando = new NpgsqlCommand() { CommandText = "auto_todos", CommandType = CommandType.StoredProcedure };
                comando.Parameters.Add(new NpgsqlParameter("inIndex", NpgsqlDbType.Integer));
                comando.Parameters[0].Value = index;
                comando.Parameters.Add(new NpgsqlParameter("inNext", NpgsqlDbType.Integer));
                comando.Parameters[1].Value = cantidadResultados;

                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open();
                    comando.Connection = conn;
                    NpgsqlDataReader ds = comando.ExecuteReader();

                    while (ds.Read())
                    {
                        var auto = this.datosAuto(ds);
                        autos.Add(auto);
                    }
                    conn.Close();
                }
            }
            catch (Exception ex) { }

            return aircrafts;
        }

        #endregion
    }
}