using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.Common;
using System.Data;

namespace ReporteVentaVehiculos.Datos
{
    public class Auto
    {
        //contructor de la clase
        public Auto() 
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

        //ejecutar una query
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
        public static int insertAuto(string marca, string modelo, string tipocombustible, int anio)
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

    }
}