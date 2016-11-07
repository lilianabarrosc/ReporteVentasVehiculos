using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ReporteVentaVehiculos.Negocio;
using System.Windows.Forms;

namespace ReporteVentaVehiculos.Presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //acciones del boton insertarAuto
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            NegocioAuto negAuto = new NegocioAuto();
            int resp = negAuto.addAuto(textMarca.Text, textModelo.Text, textTipoC.Text, int.Parse(textAnio.Text));
            if(resp > 0)
            {
                //mensaje de confirmacion
                MessageBox.Show("Auto Insertado");
            }
        }

        //metodo de lectura de parametros
        //private void loadGrid()
        //{
        //    NegocioAuto negAuto = new NegocioAuto();

        //}
    }
}