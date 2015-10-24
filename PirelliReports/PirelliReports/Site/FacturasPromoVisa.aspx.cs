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


namespace PirelliReports.Site
{
    public partial class FacturasPromoVisa : System.Web.UI.Page
    {
        ConexionFacturasPromo conFacturas = new ConexionFacturasPromo();
        ConexionClientes conClientes = new ConexionClientes();
        PirelliMetodos pMetodos = new PirelliMetodos();
        ArrayList clientes = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                gvListadosFacturasVisa.DataSource = conFacturas.ListadoDeFacturas();
                gvListadosFacturasVisa.DataBind();


                cargarFamilia(ddlFiltrosFamilia);
                cargarCantidadDeRegistros(ddlFiltrosCantidadRegistros);

                //me centro en argentina
                GLatLng ubicacion = new GLatLng(-35.3139685, -65.104704);//(40.381090863719436, -3.6222052574157715);
                GMap1.setCenter(ubicacion, 4);

                //Establecemos alto y ancho en px
                GMap1.Height = 600;
                GMap1.Width = 558;

                //Adiciona el control de la parte izq superior (moverse, ampliar y reducir)
                GMap1.Add(new GControl(GControl.preBuilt.LargeMapControl));

                //GControl.preBuilt.MapTypeControl: permite elegir un tipo de mapa y otro.
                GMap1.Add(new GControl(GControl.preBuilt.MapTypeControl));

                cargarClientes(clientes);

                GMap1.enableHookMouseWheelToZoom = true;

                //Tipo de mapa a mostrar
                GMap1.mapType = GMapType.GTypes.Normal;

                //Moverse con el cursor del teclado
                GMap1.enableGKeyboardHandler = true;
            }
        }

        private void cargarClientes(ArrayList clientes)
        {
            clientes.Clear();
            DataSet ds = new DataSet();
            ds = conClientes.ListadoGeoClientesDeFacturas();
            ZoCliente c;
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    c = new ZoCliente();
                    c.Cod = ds.Tables[0].Rows[i]["COD"].ToString();
                    c.RazSoc = ds.Tables[0].Rows[i]["RAZSOC"].ToString();
                    c.DirSuc = ds.Tables[0].Rows[i]["DIRSUC"].ToString();
                    c.Latitud = Convert.ToDouble(ds.Tables[0].Rows[i]["LATITUD"].ToString());
                    c.Longitud = Convert.ToDouble(ds.Tables[0].Rows[i]["LONGITUD"].ToString());
                    
                    clientes.Add(c);
                }
                pMetodos.LlenarMapaConClientes(clientes,GMap1);
                //LlenarMapaConClientes(clientes);
            }
            
        }

        private void LlenarMapaConClientes(ArrayList clientes)
        {
            GLatLng ubicacion;
            GMarker marker;
            string strMarker;
            foreach (ZoCliente c in clientes)
            {
                ubicacion = new GLatLng(c.Latitud, c.Longitud);
                //Pone la marca de gota de agua con el nombre de la ubicacion
                marker = new GMarker(ubicacion);
                strMarker = "<div style='width: 250px; height: 185px'><b>" +
                                "<span style='color:#ff7e00'>es</span>ASP.NET</b><br>" +
                                 " C/ C/ " + c.RazSoc + " <br /> " + c.DirSuc + " <br />" +
                                 "</div>";
                GInfoWindow window = new GInfoWindow(marker, strMarker, false);
                GMap1.Add(window);


            }
        }

       

        
       

        private void cargarCantidadDeRegistros(DropDownList ddl)
        {
           ddl.Items.Add(new ListItem("1000", "1000"));
           ddl.Items.Add(new ListItem("2000", "2000"));
           ddl.Items.Add(new ListItem("3000", "3000"));
           ddl.Items.Add(new ListItem("4000", "4000"));
           ddl.Items.Add(new ListItem("5000", "5000"));
           ddl.Items.Add(new ListItem("10000", "10000"));
           
        }

        private void cargarFamilia(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = conFacturas.ListadoDeFamilia();
            ddl.Items.Add(new ListItem("TODOS", "%"));
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["FAMIAGRDESC"].ToString(), ds.Tables[0].Rows[i]["FAMIAGRCODI"].ToString()));
                }
            }


        }

       
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
       

        protected void btnFiltrosBuscar_Click(object sender, EventArgs e)
        {
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(txtFiltrosCodCliente.Text) ? "%%" : txtFiltrosCodCliente.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosRazonSocial.Text) ? "%%" : txtFiltrosRazonSocial.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosCuotas.Text) ? "%" : txtFiltrosCuotas.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosFlag.Text) ? "%" : txtFiltrosFlag.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosDescuento.Text) ? "%" : txtFiltrosDescuento.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosUsuarioAlta.Text) ? "%" : txtFiltrosUsuarioAlta.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosNumeroFactura.Text) ? "%" : txtFiltrosNumeroFactura.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosIP.Text) ? "%%%" : txtFiltrosIP.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosDescripcion.Text) ? "%" : txtFiltrosDescripcion.Text));

            if (!string.IsNullOrEmpty(dpFiltrosDesde.Text))
                parametros.Add(pMetodos.ConvertmmddyyyyToyyyymmdd(dpFiltrosDesde.Text));
            else
                parametros.Add("1900/1/1");
            if (!string.IsNullOrEmpty(dpFiltrosHasta.Text))
                parametros.Add(pMetodos.ConvertmmddyyyyToyyyymmdd(dpFiltrosHasta.Text));
            else
                parametros.Add("2900/1/1");

            parametros.Add(ddlFiltrosCantidadRegistros.SelectedValue.ToString());
            parametros.Add((string.IsNullOrEmpty(txtFiltrosAgrup.Text) ? "%" : txtFiltrosAgrup.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosTicket.Text) ? "%" : txtFiltrosTicket.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosCodPromo.Text) ? "%" : txtFiltrosCodPromo.Text));
            parametros.Add(ddlFiltrosFamilia.SelectedValue.ToString());
          

            gvListadosFacturasVisa.DataSource = conFacturas.ListadoDeFacturas(parametros);
            gvListadosFacturasVisa.DataBind();
            

        }
        protected void btnExportar_Click(object sender, EventArgs e)
        {
            pMetodos.ExportGridViewToExcel(gvListadosFacturasVisa, "FacturasVisa", Response);

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // this is required for avoid error (control must be placed inside form tag)

        }


        protected void gvListadosFacturasVisa_SelectedIndexChanged(object sender, EventArgs e)
        {
            string a = gvListadosFacturasVisa.SelectedRow.Cells[1].Text;
            a = a + gvListadosFacturasVisa.SelectedRow.Cells[2].Text;
            a = a + gvListadosFacturasVisa.SelectedRow.Cells[3].Text;
            txtEditCuota.Text = gvListadosFacturasVisa.SelectedRow.Cells[4].Text;
            txtEditPrecio.Text = gvListadosFacturasVisa.SelectedRow.Cells[5].Text;
            //Response.Write("<script type=\"text/javascript\">alert('"+a+"');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEdit();", true);


        }
    }
}