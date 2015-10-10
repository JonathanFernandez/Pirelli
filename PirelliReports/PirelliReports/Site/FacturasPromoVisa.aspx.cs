using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace PirelliReports.Site
{
    public partial class FacturasPromoVisa : System.Web.UI.Page
    {
        ConexionFacturasPromo conFacturas = new ConexionFacturasPromo();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvListadosFacturasVisa.DataSource = conFacturas.ListadoDeFacturas();
            gvListadosFacturasVisa.DataBind();
        }
    }
}