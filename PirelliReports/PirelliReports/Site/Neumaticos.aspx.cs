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
    public partial class Neumaticos : PirelliMaster
    {
        ConexionZoProduct conZoProduct = new ConexionZoProduct();
        ConexionZonas conZonas = new ConexionZonas();

        PirelliMetodos pMetodos = new PirelliMetodos();

        protected void Page_Load(object sender, EventArgs e)
        {
            gvListadoNeumaticos.DataSource = conZoProduct.ListadoZoProduct();
            gvListadoNeumaticos.DataBind();
            cargarPaises();
            cargarFamilia();
        }

        private void cargarFamilia()
        {
            conZoProduct.cargarFamilia(ddlFiltrosFamilia);
        }

        private void cargarPaises()
        {
            conZonas.cargarPais(ddlFiltrosPais);
        }

        protected void gvListadoNeumaticos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadoNeumaticos,"Listado De IPs",Response);
        }

        protected void btnFiltrosBuscar_Click(object sender, EventArgs e)
        {
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(txtFiltrosIP.Text) ? "%" : txtFiltrosIP.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosDescripcion.Text) ? "%" : txtFiltrosDescripcion.Text));
            parametros.Add(ddlFiltrosPais.SelectedValue);
            parametros.Add((string.IsNullOrEmpty(txtFiltrosOtros.Text) ? "%" : txtFiltrosOtros.Text));
            parametros.Add(ddlFiltrosFamilia.SelectedValue);
            parametros.Add((string.IsNullOrEmpty(txtFiltrosMarca.Text) ? "%" : txtFiltrosMarca.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosRango.Text) ? "%" : txtFiltrosRango.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosRodado.Text) ? 0.0 : Convert.ToDouble(txtFiltrosRodado.Text)));
            parametros.Add(((chkFiltrosBajaLogica.Checked) ? "1" : "0"));


            gvListadoNeumaticos.DataSource = conZoProduct.ListadoZoProduct(parametros);
            gvListadoNeumaticos.DataBind();

        }
    }
}