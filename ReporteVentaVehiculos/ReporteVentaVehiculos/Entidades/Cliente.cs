using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReporteVentaVehiculos.Entidades
{
    public class Cliente
    {
        //atributos de la entidad Cliente
        int _idCliente;
        string _nombre;
        string _dirección;
        int _teléfono;

        //contructor por defecto
        public Cliente()
        { }

        //constructor con parametros
        public Cliente(int idCliente, string nombre, string dirección, int teléfono)
        {
            this._idCliente = idCliente;
            this._nombre = nombre;
            this._dirección = dirección;
            this._teléfono = teléfono;
        }

        public int IdCliente
        {
            get { return _idCliente; }
            set { _idCliente = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public string Dirección
        {
            get { return _dirección; }
            set { _dirección = value; }
        }

        public int Teléfono
        {
            get { return _teléfono; }
            set { _teléfono = value; }
        }
    }
}