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
using System.Web.Services;

namespace PirelliReports.Site
{
    public partial class VentaTotalxCTCxCliente : PirelliMaster
    {
        ConexionCTC conCTC = new ConexionCTC();
        ConexionClientes conClientes = new ConexionClientes();
        PirelliMetodos pMetodos = new PirelliMetodos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conCTC.CargarCTC(ddlCTC);
                conClientes.CargarClienteDeCTC(ddlClientes,ddlCTC.SelectedValue);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime desde = new DateTime();
            DateTime hasta = new DateTime();

            desde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
            hasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));

            string ctc = ddlCTC.SelectedValue;

            string url = "CrystalViewer.aspx?reporte=VentaTotalxCTCxCliente&ctc=" + ctc + "&desde=" + pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text) + "&hasta=" + pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text) +"&cliente=" + ddlClientes.SelectedValue;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "OpenPopUp('" + url + "');", true);

        }

        protected void ddlCTC_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlClientes.Items.Clear();
            conClientes.CargarClienteDeCTC(ddlClientes, ddlCTC.SelectedValue);
        }
    }
}