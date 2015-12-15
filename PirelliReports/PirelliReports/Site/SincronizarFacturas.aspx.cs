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
        ConexionFacturasPromo connFacturas = new ConexionFacturasPromo();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvListadoClientes.DataSource = connFacturas.ListadoDeZoDatosExternos();
            gvListadoClientes.DataBind();
        }

        protected void btnCargar_Click(object sender, EventArgs e)
        {
            string rutaProcesDB = WebConfigurationManager.AppSettings["rutaProcesDB"];
            
            Process.Start(rutaProcesDB);

            DirectoryInfo Carpeta = new DirectoryInfo(@"C:\Facturas");
            while (Carpeta.GetFiles().Count() > 0)
            {
               
            }

            gvListadoClientes.DataSource = connFacturas.ListadoDeZoDatosExternos();
            gvListadoClientes.DataBind();
            
            lblMensaje.Text = "Carga de datos finalizada";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true); 
        }

        protected void btnSincronizar_Click(object sender, EventArgs e)
        {
            connFacturas.ProcresarZoSolicitudDatosExternos();
            gvListadoClientes.DataSource = connFacturas.ListadoDeZoDatosExternos();
            gvListadoClientes.DataBind();

            lblMensaje.Text = "Sincronización finalizada";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
        }
    }
}