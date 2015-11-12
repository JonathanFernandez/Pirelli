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
            if (!IsPostBack)
            {
                gvListadoNeumaticos.DataSource = conZoProduct.ListadoZoProduct();
                gvListadoNeumaticos.DataBind();
                cargarPaises();
                cargarFamilia();
            }
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
            txtRango.Text = gvListadoNeumaticos.SelectedRow.Cells[7].Text;
            chkBajaLogica.Checked = gvListadoNeumaticos.SelectedRow.Cells[9].Text == "1" ? true : false;
            IP.Value = gvListadoNeumaticos.SelectedRow.Cells[1].Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadoNeumaticos,"ListadoIPs", Response);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // this is required for avoid error (control must be placed inside form tag)

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