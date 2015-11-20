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


using System.Data.Odbc;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace PirelliReports.Site
{
    public partial class CrystalViewer : System.Web.UI.Page
    {
        ConexionReportes conReportes = new ConexionReportes();
        
        DateTime desde = new DateTime();
        DateTime hasta = new DateTime();
       
        ArrayList parametros = new ArrayList();
        dsReportes ds = new dsReportes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Request["reporte"] == "IPxRegion")
                IPxRegion();
            if (Page.Request["reporte"] == "RegionXIP")
                RegionXIP();
            if (Page.Request["reporte"] == "IPxCliente")
                IPxCliente();
            if (Page.Request["reporte"] == "ClienteXIP")
                ClienteXIP();
            if (Page.Request["reporte"] == "VentaTotalxCTC")
                VentaTotalxCTC();
            if (Page.Request["reporte"] == "VentaTotalxCTCxCliente")
                VentaTotalxCTCxCliente();
            
        }

        private void VentaTotalxCTCxCliente()
        {
            string ctc = string.Empty;
            string cliente = string.Empty;
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ctc = Page.Request["ctc"];
            cliente = Page.Request["cliente"];
            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(cliente);
            parametros.Add(ctc);            

            ds.tVentaTotalCTCxCliente.Merge(conReportes.VentaTotalxCTCxCliente(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/VentaTotalxCTCxCliente.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
        }

        private void ClienteXIP()
        {
            string ip = string.Empty;
            string filter;
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ip = Page.Request["ip"];
            filter = Page.Request["filter"];

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ip);
            parametros.Add(filter);



            ds.tIpXCliente.Merge(conReportes.IPXCliente(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/CLIENTExIP.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
        }

        private void IPxCliente()
        {
            string ip = string.Empty;
            string filter;
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ip = Page.Request["ip"];
            filter = Page.Request["filter"];

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ip);
            parametros.Add(filter);



            ds.tIpXCliente.Merge(conReportes.IPXCliente(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/IPxCLIENTE.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
        }

        private void RegionXIP()
        {
            string ip = string.Empty;
            string filter;
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ip = Page.Request["ip"];
            filter = Page.Request["filter"];

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ip);
            parametros.Add(filter);



            ds.tIpXRegion.Merge(conReportes.IPXRegion(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/REGIONxIP.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
        }

        private void IPxRegion()
        {
            string ip = string.Empty;
            string filter;
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ip = Page.Request["ip"];
            filter = Page.Request["filter"];

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ip);
            parametros.Add(filter);



            ds.tIpXRegion.Merge(conReportes.IPXRegion(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/IPxREGION.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
        }

        private void VentaTotalxCTC()
        {
            string ctc = string.Empty;
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ctc = Page.Request["ctc"];
            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ctc);

            ds.tVentaTotalCTC.Merge(conReportes.VentaTotalxCTC(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/VentaTotalxCTC.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault);

            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
        }
    }
}