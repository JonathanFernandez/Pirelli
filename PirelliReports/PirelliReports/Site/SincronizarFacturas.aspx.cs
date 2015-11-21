using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controles;
using Entidades;
using Negocio;
using System.Web.Configuration;
using System.Diagnostics;

namespace PirelliReports.Site
{
    public partial class SincronizarFacturas : PirelliMaster
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCargar_Click(object sender, EventArgs e)
        {
            Process.Start("C:\\Users\\Jonathan\\Documents\\SimuladorActividad.exe");
            
        }

        protected void btnSincronizar_Click(object sender, EventArgs e)
        {

        }
    }
}