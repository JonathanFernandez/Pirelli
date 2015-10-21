using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;

namespace Controles
{
    public class PirelliMetodos
    {
        public void ExportGridViewToExcel(GridView grid, string fileName, HttpResponse Hresponse)
        {
            Hresponse.Clear();
            Hresponse.Buffer = true;
            Hresponse.AddHeader("content-disposition", "attachment;fileName=" +fileName + ".xls");
            Hresponse.Charset = "";
            Hresponse.ContentType = "application/vnd.ms-excel";

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grid.RenderControl(hw);
            Hresponse.Output.Write(sw.ToString());
            Hresponse.Flush();
            Hresponse.Close();
            Hresponse.End();
        }
        public string ConvertmmddyyyyToyyyymmdd(string fecha)
        {
            return fecha.Substring(6, 4) + "/" + fecha.Substring(0, 2) + "/" + fecha.Substring(3, 2);
        }
    }
}