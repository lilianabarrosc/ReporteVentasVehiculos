using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReporteVentaVehiculos.Entidades
{
    public class Stock
    {
        //atributos de la entidad Stock
        private int _idStock;
        private int _idauto;
        private int _cantidad;

        //contructor por defecto
        public Stock()
        {}

        //constructor con parametros
        public Stock(int idStock, int idauto, int cantidad)
        {
            this._idStock = idStock;
            this._idauto = idauto;
            this._cantidad = cantidad;
        }

        public int IdStock
        {
            get { return _idStock; }
            set { _idStock = value; }
        }

        public int Idauto
        {
            get { return _idauto; }
            set { _idauto = value; }
        }

        public int Cantidad
        {
            get { return _cantidad; }
            set { _cantidad = value; }
        }
    }
}