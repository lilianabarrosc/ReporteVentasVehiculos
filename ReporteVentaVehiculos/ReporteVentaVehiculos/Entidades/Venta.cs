using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReporteVentaVehiculos.Entidades
{
    public class Venta
    {
        //atributos de la entidad Venta
        private int _idVenta;
        private int _idauto;
        private int _idCliente;
        private int _monto;
        private DateTime _fecha;

        //contructor por defecto
        public Venta()
        {}

        //constructor con parametros
        public Venta(int idVenta, int idauto, int idCliente, int monto, DateTime fecha)
        {
            this._idVenta = idVenta;
            this._idauto = idauto;
            this._idCliente = idCliente;
            this._fecha = fecha;
        }

        public int IdVenta
        {
            get { return _idVenta; }
            set { _idVenta = value; }
        }

        public int Idauto
        {
            get { return _idauto; }
            set { _idauto = value; }
        }

        public int IdCliente
        {
            get { return _idCliente; }
            set { _idCliente = value; }
        }

        public int Monto
        {
            get { return _monto; }
            set { _monto = value; }
        }

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }
    }
}