using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using ReporteVentaVehiculos.Entidades;
using ReporteVentaVehiculos.Datos;

namespace ReporteVentaVehiculos.Negocio
{
    public class NegocioAuto
    {
        public NegocioAuto()
        {}

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