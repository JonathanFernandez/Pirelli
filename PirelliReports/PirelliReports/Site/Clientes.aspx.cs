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
    public partial class Clientes : PirelliMaster
    {
        ConexionClientes conClientes = new ConexionClientes();
        ConexionZonas conZonas = new ConexionZonas();
        PirelliMetodos pMetodos = new PirelliMetodos();
        ArrayList clientesMap = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvListadoClientes.DataSource = conClientes.ListadoClientes();
                gvListadoClientes.DataBind();

                conZonas.cargarProvincia(ddlFiltrosProvincias);
                //cargarClientesEnMapa(clientesMap);

                ////me centro en argentina
                //GLatLng ubicacion = new GLatLng(-13.533406, -88.4127875);//(-35.3139685, -65.104704);//(40.381090863719436, -3.6222052574157715);
                //GMap1.setCenter(ubicacion, 4);

                ////Establecemos alto y ancho en px
                //GMap1.Height = 600;
                //GMap1.Width = 558;

                ////Adiciona el control de la parte izq superior (moverse, ampliar y reducir)
                //GMap1.Add(new GControl(GControl.preBuilt.LargeMapControl));

                ////GControl.preBuilt.MapTypeControl: permite elegir un tipo de mapa y otro.
                //GMap1.Add(new GControl(GControl.preBuilt.MapTypeControl));

                //cargarClientesEnMapa(clientesMap,null);

                //GMap1.enableHookMouseWheelToZoom = true;

                ////Tipo de mapa a mostrar
                //GMap1.mapType = GMapType.GTypes.Normal;

                ////Moverse con el cursor del teclado
                //GMap1.enableGKeyboardHandler = true;
                 
            }
        }

        private void cargarClientesEnMapa(ArrayList clientes, ArrayList parametros)
        {
            clientes.Clear();
            DataSet ds = new DataSet();
            ds = conClientes.ListadoClientes();
            ZoCliente c;
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[i]["LATITUD"].ToString()) || !string.IsNullOrEmpty(ds.Tables[0].Rows[i]["LONGITUD"].ToString()))
                    {
                        c = new ZoCliente();
                        c.Cod = ds.Tables[0].Rows[i]["COD"].ToString();
                        c.RazSoc = ds.Tables[0].Rows[i]["RAZSOC"].ToString();
                        c.DirSuc = ds.Tables[0].Rows[i]["DIRSUC"].ToString();
                        c.Latitud = Convert.ToDouble(ds.Tables[0].Rows[i]["LATITUD"].ToString());
                        c.Longitud = Convert.ToDouble(ds.Tables[0].Rows[i]["LONGITUD"].ToString());

                        clientes.Add(c);
                    }
                }
                
                //pMetodos.LlenarMapaConClientes(clientes, GMap1);
                //LlenarMapaConClientes(clientes);
            }
        }

        
        protected void gvListadoClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadoClientes, "ListadoClientes", Response);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // this is required for avoid error (control must be placed inside form tag)

        }

        protected void btnFiltrosBuscar_Click(object sender, EventArgs e)
        {
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(txtFiltrosCod.Text) ? "%" : txtFiltrosCod.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosRazSoc.Text) ? "%" : txtFiltrosRazSoc.Text));
            parametros.Add(ddlFiltrosProvincias.SelectedValue);
            parametros.Add(((chkBajaLogica.Checked) ? "1" : "0"));
            

            gvListadoClientes.DataSource = conClientes.ListadoClientes(parametros);
            gvListadoClientes.DataBind();

            //cargarClientesEnMapa(clientesMap, parametros);

        }

    }
}