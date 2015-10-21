using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Subgurim.Controles;

namespace PirelliReports
{
    public partial class testmapa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GLatLng ubicacion = new GLatLng(40.381090863719436, -3.6222052574157715);
                GMap1.setCenter(ubicacion, 15);

                //Establecemos alto y ancho en px
                GMap1.Height = 560;
                GMap1.Width = 660;

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
                GInfoWindow window = new GInfoWindow(marker, strMarker, true);
                GMap1.addInfoWindow(window);

                GMap1.enableHookMouseWheelToZoom = true;

                //Tipo de mapa a mostrar
                GMap1.mapType = GMapType.GTypes.Normal;

                //Moverse con el cursor del teclado
                GMap1.enableGKeyboardHandler = true;
            }
        }
    }
}