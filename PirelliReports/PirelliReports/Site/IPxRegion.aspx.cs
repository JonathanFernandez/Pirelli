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
    public partial class IPxRegion : PirelliMaster
    {
        ConexionZonas conZonas = new ConexionZonas();
        PirelliMetodos pMetodos = new PirelliMetodos();
        string ip = string.Empty;
        DateTime desde = new DateTime();
        DateTime hasta = new DateTime();
        ArrayList codeFilter = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
         {
            if (!IsPostBack)
            {
                cargarFiltros();
            }
        }

        private void cargarFiltros()
        {
            conZonas.cargarRegiones(chklistFiltro);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ip = txtIP.Text;
            DateTime desde = new DateTime();
            DateTime hasta = new DateTime();

            desde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
            hasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));

            for (int i = 0; i < chklistFiltro.Items.Count; i++)
            {
                if(chklistFiltro.Items[i].Selected)
                {
                    codeFilter.Add(chklistFiltro.Items[i].Value);
                }
            }

            ip = (string.IsNullOrEmpty(txtIP.Text) ? "null" : txtIP.Text);
            string filter = string.Empty;

            for(int i = 0; i < codeFilter.Count; i++)
                filter = filter + "," + codeFilter[i];
            
            if  (String.IsNullOrEmpty(filter))
                filter = "null";
            else
               filter = filter.Substring(1, filter.Length - 1);
            string url = "CrystalViewer.aspx?reporte=IPxRegion&ip=" + ip + "&desde=" + pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text) + "&hasta=" + pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text)+"&filter="+filter;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "OpenPopUp('"+url+"');", true);
            //Response.Redirect(url,false);

        }
    }
}