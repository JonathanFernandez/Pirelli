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
        PirelliMetodos pMetodos = new PirelliMetodos();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                gvListadosFacturasVisa.DataSource = conFacturas.ListadoDeFacturas();
                gvListadosFacturasVisa.DataBind();
                

                cargarFamilia(ddlFamilia);
                cargarCantidadDeRegistros(ddlCantidadRegistros);

                GLatLng ubicacion = new GLatLng(-34.667070, -58.649490);//(40.381090863719436, -3.6222052574157715);
                GMap1.setCenter(ubicacion, 15);

                //Establecemos alto y ancho en px
                GMap1.Height = 400;
                GMap1.Width = 558;

                //Adiciona el control de la parte izq superior (moverse, ampliar y reducir)
                GMap1.addControl(new GControl(GControl.preBuilt.LargeMapControl));

                //GControl.preBuilt.MapTypeControl: permite elegir un tipo de mapa y otro.
                GMap1.addControl(new GControl(GControl.preBuilt.MapTypeControl));

                //Con esto podemos definir el icono que se mostrara en la ubicacion
                //#region Crear Icono
                //GIcon iconPropio = new GIcon();
                //iconPropio.image = "../images/iconBuilding.png";
                //iconPropio.shadow = "../images/iconBuildingS.png";
                //iconPropio.iconSize = new GSize(32, 32);
                //iconPropio.shadowSize = new GSize(29, 16);
                //iconPropio.iconAnchor = new GPoint(10, 18);
                //iconPropio.infoWindowAnchor = new GPoint(10, 9);
                //#endregion

                //Pone la marca de gota de agua con el nombre de la ubicacion
                GMarker marker = new GMarker(ubicacion);
                string strMarker = "<div style='width: 250px; height: 185px'><b>" +
                    "<span style='color:#ff7e00'>es</span>ASP.NET</b><br>" +
                    " C/ C/ Nombre de Calle, No X <br /> 28031 Madrid, España <br />" +
                    "Tel: +34 902 00 00 00 <br />Fax: +34 91 000 00 00<br />" +
                    "Web: <a href='http://www.esASP.net/' class='txtBKM' >www.esASP.net</a>" +
                    "<br />Email: <a href='mailto:derbis.corrales@gmail.com' class='txtBKM'>" +
                    "derbis.corrales@gmail.com</a><br><br></div>";
                GInfoWindow window = new GInfoWindow(marker, strMarker, false);
                GMap1.addInfoWindow(window);

                GMap1.enableHookMouseWheelToZoom = true;

                //Tipo de mapa a mostrar
                GMap1.mapType = GMapType.GTypes.Normal;

                //Moverse con el cursor del teclado
                GMap1.enableGKeyboardHandler = true;


                ubicacion = new GLatLng(-34.667070, -58.649490);
                GMap2.setCenter(ubicacion, 15);

                //Establecemos alto y ancho en px
                GMap2.Height = 400;
                GMap2.Width = 558;

                //Adiciona el control de la parte izq superior (moverse, ampliar y reducir)
                GMap2.addControl(new GControl(GControl.preBuilt.LargeMapControl));

                //GControl.preBuilt.MapTypeControl: permite elegir un tipo de mapa y otro.
                GMap2.addControl(new GControl(GControl.preBuilt.MapTypeControl));

                //Con esto podemos definir el icono que se mostrara en la ubicacion
                //#region Crear Icono
                //GIcon iconPropio = new GIcon();
                //iconPropio.image = "../images/iconBuilding.png";
                //iconPropio.shadow = "../images/iconBuildingS.png";
                //iconPropio.iconSize = new GSize(32, 32);
                //iconPropio.shadowSize = new GSize(29, 16);
                //iconPropio.iconAnchor = new GPoint(10, 18);
                //iconPropio.infoWindowAnchor = new GPoint(10, 9);
                //#endregion

                //Pone la marca de gota de agua con el nombre de la ubicacion
                marker = new GMarker(ubicacion);
                strMarker = "<div style='width: 250px; height: 185px'><b>" +
                          "<span style='color:#ff7e00'>es</span>ASP.NET</b><br>" +
                          " C/ C/ Nombre de Calle, No X <br /> 28031 Madrid, España <br />" +
                          "Tel: +34 902 00 00 00 <br />Fax: +34 91 000 00 00<br />" +
                          "Web: <a href='http://www.esASP.net/' class='txtBKM' >www.esASP.net</a>" +
                          "<br />Email: <a href='mailto:derbis.corrales@gmail.com' class='txtBKM'>" +
                          "derbis.corrales@gmail.com</a><br><br></div>";
                window = new GInfoWindow(marker, strMarker, false);
                GMap2.addInfoWindow(window);

                GMap2.enableHookMouseWheelToZoom = true;

                //Tipo de mapa a mostrar
                GMap2.mapType = GMapType.GTypes.Normal;

                //Moverse con el cursor del teclado
                GMap2.enableGKeyboardHandler = true;

                //if (chkFechas.Checked)
                //{
                //    dpDesde.Enabled = true;
                //    dpHasta.Enabled = true;
                //}
                //else
                //{
                //    dpDesde.Enabled = false;
                //    dpHasta.Enabled = false;
                //}
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
            DataSet dt = new DataSet();
            dt = conFacturas.ListadoDeFamilia();
            ddl.Items.Add(new ListItem("TODOS", "%"));
            if (dt.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(dt.Tables[0].Rows[i]["FAMIAGRDESC"].ToString(), dt.Tables[0].Rows[i]["FAMIAGRCODI"].ToString()));
                }
            }


        }

       
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
       

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(txtCodCliente.Text) ? "%%" : txtCodCliente.Text));
            parametros.Add((string.IsNullOrEmpty(txtRazonSocial.Text)? "%%" :txtRazonSocial.Text));
            parametros.Add((string.IsNullOrEmpty(txtCuotas.Text)? "%" : txtCuotas.Text));
            parametros.Add((string.IsNullOrEmpty(txtFlag.Text)? "%" :txtFlag.Text));
            parametros.Add((string.IsNullOrEmpty(txtDescuento.Text)? "%" :txtDescuento.Text));
            parametros.Add((string.IsNullOrEmpty(txtUsuarioAlta.Text)? "%" :txtUsuarioAlta.Text));
            parametros.Add((string.IsNullOrEmpty(txtNumeroFactura.Text)? "%" :txtNumeroFactura.Text));
            parametros.Add((string.IsNullOrEmpty(txtIP.Text)? "%%%" :txtIP.Text));
            parametros.Add((string.IsNullOrEmpty(txtDescripcion.Text)? "%" : txtDescripcion.Text));
            
            if (!string.IsNullOrEmpty(dpDesde.Text))
                parametros.Add(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
            else
                parametros.Add("1900/1/1");
            if (!string.IsNullOrEmpty(dpHasta.Text))
                parametros.Add(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));
            else
                parametros.Add("2900/1/1");

            parametros.Add(ddlCantidadRegistros.SelectedValue.ToString());
            parametros.Add((string.IsNullOrEmpty(txtAgrup.Text)? "%" :txtAgrup.Text));
            parametros.Add((string.IsNullOrEmpty(txtTicket.Text)? "%" :txtTicket.Text));
            parametros.Add((string.IsNullOrEmpty(txtCodPromo.Text)? "%" :txtCodPromo.Text));
            parametros.Add(ddlFamilia.SelectedValue.ToString());
          

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
            string a = "pepe";

        }
    }
}