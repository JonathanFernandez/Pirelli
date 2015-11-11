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
        string ip = string.Empty;
        DateTime desde = new DateTime();
        DateTime hasta = new DateTime();
        string filter;
        ArrayList parametros = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            desde = Convert.ToDateTime(Page.Request["desde"]);
            hasta = Convert.ToDateTime(Page.Request["hasta"]);
            ip = Page.Request["ip"];
            filter = Page.Request["filter"];

            parametros.Add(desde);
            parametros.Add(hasta);
            parametros.Add(ip);
            parametros.Add(filter);

            dsReportes ds = new dsReportes();
            //IPxRegion rpt = new IPxRegion();

            ds.tIpXRegion.Merge(conReportes.IPXRegion(parametros));
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new ReportDocument();
            rpt.FileName = Server.MapPath("~/RPT/IPxREGION.rpt");
            rpt.Load(rpt.FileName, OpenReportMethod.OpenReportByDefault); 
            //rpt.Load(@"~/RPT/IPxREGION2.rpt", OpenReportMethod.OpenReportByDefault);
            rpt.SetDataSource(ds);
            crviewer.ReportSource = rpt;
            //crviewer.RefreshReport();
            //crviewer.Zoom(75);
        }
    }
}