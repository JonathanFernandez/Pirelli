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

using CrystalDecisions.Web;
using System.Data.Odbc;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;



namespace PirelliReports.Site
{
    public partial class VentaMensualCTC : PirelliMaster
    {
        ConexionCTC conCTC = new ConexionCTC();
        ConexionReportes conReportes = new ConexionReportes();
        PirelliMetodos pMetodos = new PirelliMetodos();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conCTC.CargarCTC(ddlCTC);
            }
        }

       
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime desde = new DateTime();
            DateTime hasta = new DateTime();

            desde = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpDesde.Text));
            hasta = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpHasta.Text));

            string ctc = ddlCTC.SelectedValue;

            string url = "CrystalViewer.aspx?reporte=VentaTotalxCTC&ctc=" + ctc + "&desde=" + pMetodos.ConvertddmmyyyyToyyyymmdd(dpDesde.Text) + "&hasta=" + pMetodos.ConvertddmmyyyyToyyyymmdd(dpHasta.Text);
            
            ArrayList parametros = new ArrayList();
            dsReportes ds = new dsReportes();
                      
            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ctc);

            ds.tVentaTotalCTC.Merge(conReportes.VentaTotalxCTC(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/VentaTotalxCTC.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
            //rpt.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "ajdsfaklj");

            string fileName = ddlCTC.SelectedItem.Text;
            rpt.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("files/"+fileName+".pdf"));

            
            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var hidden = open('files/" + fileName + ".pdf', 'NewWindow', 'top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes');", true);

           /* parametros = new ArrayList();
            
            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ctc);

            DataTable dt = conReportes.VentaTotalxCTC(parametros);
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
            
            
            //Chart1.Legends[0].Enabled = true;
            */
        }
    }
}