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
    public partial class MensualXCliente : PirelliMaster
    {
        ConexionReportes conReportes = new ConexionReportes();
        PirelliMetodos pMetodos = new PirelliMetodos();
        ConexionClientes conclientes = new ConexionClientes();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conclientes.CargarClientes(ddlCliente);
                ddlCliente.SelectedIndex = 0;
            }

        }
        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadoReporte, "Mensual por Cliente", Response);

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // this is required for avoid error (control must be placed inside form tag)

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime desde = new DateTime();
            DateTime hasta = new DateTime();

            desde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
            hasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));

            //string url = "CrystalViewer.aspx?reporte=VentaTotalxCTC&ctc=" + ctc + "&desde=" + pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text) + "&hasta=" + pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text);
            //Response.Redirect(url, false);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "OpenPopUp('" + url + "');", true);
            
            ArrayList parametros = new ArrayList();

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ddlCliente.SelectedValue);

            DataTable dt = conReportes.MensualXCliente(parametros);
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
            Chart1.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Pie;// SeriesChartType.Pie;
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;


            //Chart1.Legends[0].Enabled = true;
        }
    }
}