﻿using System;
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
    public partial class IPxCliente : PirelliMaster
    {
        ConexionClientes conClientes = new ConexionClientes();
        PirelliMetodos pMetodos = new PirelliMetodos();
        string ip = string.Empty;
        //DateTime desde = new DateTime();
        //DateTime hasta = new DateTime();
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
            conClientes.cargarClientesMatriz(chklistFiltro);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ip = txtIP.Text;
            DateTime desde = new DateTime();
            DateTime hasta = new DateTime();

            //desde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
            //hasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));
            desde = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpDesde.Text));
            hasta = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpHasta.Text));

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
            string url = "CrystalViewer.aspx?reporte=IPxCliente&ip=" + ip + "&desde=" + pMetodos.ConvertddmmyyyyToyyyymmdd(dpDesde.Text) + "&hasta=" + pMetodos.ConvertddmmyyyyToyyyymmdd(dpHasta.Text)+"&filter="+filter;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "OpenPopUp('"+url+"');", true);
            //Response.Redirect(url,false);
        }
    }
    
}