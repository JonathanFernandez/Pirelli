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
        ConexionReportes conReportes = new ConexionReportes();
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
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "OpenPopUp('" + url + "');", true);
            ArrayList parametros = new ArrayList();

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ddlClientes.SelectedValue);
            parametros.Add(ctc);

            DataTable dt = conReportes.VentaTotalxCTCxCliente(parametros);
            gvListadoReporte.DataSource = dt;
            gvListadoReporte.DataBind();

            Chart1.Visible = true;

            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Bar;// SeriesChartType.Pie;
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            

        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadoReporte, "Mensual CTC x Cliente", Response);

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // this is required for avoid error (control must be placed inside form tag)

        }
        protected void ddlCTC_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlClientes.Items.Clear();
            conClientes.CargarClienteDeCTC(ddlClientes, ddlCTC.SelectedValue);
        }
    }
}