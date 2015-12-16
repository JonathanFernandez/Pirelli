using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controles;
using System.Collections;
using Entidades;
using Negocio;
using Subgurim.Controles;
using System.Data;

namespace PirelliReports.Site
{
    public partial class EnvioASap : PirelliMaster
    {
        ConexionFacturasPromo conFacturas = new ConexionFacturasPromo();
        PirelliMetodos pMetodos = new PirelliMetodos();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarCantidadDeRegistros(ddlCantidadRegistros);
                gvListadoFacturasAgrupadas.DataSource = conFacturas.ListadoDeFacturasEnvioSAP();
                gvListadoFacturasAgrupadas.DataBind();
                conFacturas.CargarFamiliaAgrup(ddlFamiliaAgrup);
                conFacturas.CargarIPFilBusqueda(chklistIPFlgBus);
                conFacturas.CargarClienteFilBusqueda(chklistCliFlgBus);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            gvListadoFacturasAgrupadas.DataSource = conFacturas.ListadoDeFacturasEnvioSAP(txtCodigoCliente.Text, txtDescripcion.Text, txtPromo.Text, Convert.ToInt32(ddlCantidadRegistros.SelectedValue), ddlFamiliaAgrup.SelectedValue);
            gvListadoFacturasAgrupadas.DataBind();
        }

        private void cargarCantidadDeRegistros(DropDownList ddl)
        {
            ddl.Items.Add(new ListItem("1000", "1000"));
            ddl.Items.Add(new ListItem("2000", "2000"));
            ddl.Items.Add(new ListItem("3000", "3000"));
            ddl.Items.Add(new ListItem("4000", "4000"));
            ddl.Items.Add(new ListItem("5000", "5000"));
            ddl.Items.Add(new ListItem("10000", "10000"));
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadoFacturasAgrupadas, "Facturas Agrupadas", Response);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // this is required for avoid error (control must be placed inside form tag)

        }

        protected void btnFiltrosGrabar_Click(object sender, EventArgs e)
        {
            conFacturas.ModificarFiltroBusquedaCliente(chklistCliFlgBus);
            conFacturas.ModificarFiltroBusquedaIP(chklistIPFlgBus);
            Response.Redirect(@"~/Site/EnvioASap.aspx", false);
        }

        protected void btnEnviarSap_Click(object sender, EventArgs e)
        {
            gvListadoFacturasAgrupadas.DataSource = null;//conFacturas.ListadoDeFacturasEnvioSAP2();
            gvListadoFacturasAgrupadas.DataBind();
            lblMensaje.Text = "Error, no se puede establecer conexión";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true); 
        }

      
        protected void btnResfrescar_Click(object sender, EventArgs e)
        {
            //gvListadoFacturasAgrupadas.DataSource = conFacturas.ListadoDeFacturasEnvioSAP2();
            gvListadoFacturasAgrupadas.DataSource = conFacturas.ListadoDeFacturasEnvioSAP();
            gvListadoFacturasAgrupadas.DataBind();
        }
    }
}