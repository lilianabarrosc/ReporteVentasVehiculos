using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;

using ReporteVentaVehiculos.Entidades;
using ReporteVentaVehiculos.Datos;

namespace ReporteVentaVehiculos.Negocio
{
    public class NegocioAuto
    {
        public NegocioAuto()
        {}

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

        //insertar
        public int addAuto(string marca, string modelo, string tipoCombustible, int anio)
        {
            AutoDatos autoDatos = new AutoDatos();
            return autoDatos.insertAuto(marca, modelo, tipoCombustible, anio);
        }

        //actualizar
        public int updateAuto(int idauto, string marca, string modelo, string tipoCombustible, int anio)
        {
            AutoDatos autoDatos = new AutoDatos();
            return autoDatos.actualizarAuto(idauto, marca, modelo, tipoCombustible, anio);
        }
    }
}