using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReporteVentaVehiculos.Entidades
{
    public class Auto
    {
        //atributos de la entidad Auto (ctrl+re para controladores)
        private int _idauto;
        private string _marca;
        private string _modelo;
        private string _tipoCombustible;
        private int _anio;

        //constructor vacio
        public Auto()
        { }

        //constructor para nuevo auto con sus atributos
        public Auto(int idauto, string marca, string modelo, string tipoCombustible, int anio)
        {
            this._idauto = idauto;
            this._marca = marca;
            this._modelo = modelo;
            this._tipoCombustible = tipoCombustible;
            this._anio = anio;
        }
        public int Idauto
        {
            get { return _idauto; }
            set { _idauto = value; }
        }

        public string Marca
        {
            get { return _marca; }
            set { _marca = value; }
        }

        public string Modelo
        {
            get { return _modelo; }
            set { _modelo = value; }
        }

        public string TipoCombustible
        {
            get { return _tipoCombustible; }
            set { _tipoCombustible = value; }
        }

        public int Año
        {
            get { return _anio; }
            set { _anio = value; }
        }
    }
}