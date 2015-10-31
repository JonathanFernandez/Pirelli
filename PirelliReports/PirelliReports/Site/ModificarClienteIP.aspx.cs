using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using Controles;
using System.Data;
using System.Collections;
using System.IO;
using Subgurim.Controles;
using System.Drawing;
using System.Configuration;

namespace PirelliReports.Site
{
    public partial class ModificarClienteIP : System.Web.UI.Page
    {
        ConexionClientes conClientes = new ConexionClientes();
        ConexionZoProduct conZoProduct = new ConexionZoProduct();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (radioIP.Checked)
                    gvListadosCliente_Ip.DataSource = conZoProduct.ListadoAlteraIp();
                else
                    gvListadosCliente_Ip.DataSource = conClientes.ListaodAlteraClientes();

                gvListadosCliente_Ip.DataBind();
            }
        }

        protected void radioClienteIP_CheckedChanged(object sender, EventArgs e)
        {
            if (radioIP.Checked)
                gvListadosCliente_Ip.DataSource = conZoProduct.ListadoAlteraIp();
            else
                gvListadosCliente_Ip.DataSource = conClientes.ListaodAlteraClientes();

            gvListadosCliente_Ip.DataBind();
        }

        protected void gvListadosCliente_Ip_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtValorModificar.Text = gvListadosCliente_Ip.SelectedRow.Cells[1].Text;
        }

       
    }
}