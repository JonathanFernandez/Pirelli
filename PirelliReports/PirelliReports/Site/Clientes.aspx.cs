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

                //me centro en argentina
                GLatLng ubicacion = new GLatLng(-13.533406, -88.4127875);//(-35.3139685, -65.104704);//(40.381090863719436, -3.6222052574157715);
                GMap1.setCenter(ubicacion, 4);

                //Establecemos alto y ancho en px
                GMap1.Height = 600;
                GMap1.Width = 558;

                //Adiciona el control de la parte izq superior (moverse, ampliar y reducir)
                GMap1.Add(new GControl(GControl.preBuilt.LargeMapControl));

                //GControl.preBuilt.MapTypeControl: permite elegir un tipo de mapa y otro.
                GMap1.Add(new GControl(GControl.preBuilt.MapTypeControl));

                cargarClientesEnMapa(clientesMap);

                GMap1.enableHookMouseWheelToZoom = true;

                //Tipo de mapa a mostrar
                GMap1.mapType = GMapType.GTypes.Normal;

                //Moverse con el cursor del teclado
                GMap1.enableGKeyboardHandler = true;
                 
            }
        }

        private void cargarClientesEnMapa(ArrayList clientes)
        {
            clientes.Clear();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(txtFiltrosCod.Text) ? "%" : txtFiltrosCod.Text));
            parametros.Add((string.IsNullOrEmpty(txtFiltrosRazSoc.Text) ? "%" : txtFiltrosRazSoc.Text));
            parametros.Add(ddlFiltrosProvincias.SelectedValue);
            parametros.Add(((chkBajaLogica.Checked) ? "1" : "0"));

            ds = conClientes.ListadoClientes(parametros);

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

                        if (ds.Tables[0].Rows[i]["LATITUD"].ToString() != "")
                        {
                            c.Latitud = Convert.ToDouble(ds.Tables[0].Rows[i]["LATITUD"]);
                        }
                        else 
                        {
                            c.Latitud = 0;
                        }

                        if (ds.Tables[0].Rows[i]["LONGITUD"].ToString() != "")
                        {
                            c.Longitud= Convert.ToDouble(ds.Tables[0].Rows[i]["LONGITUD"].ToString());
                        }
                        else
                        {
                            c.Longitud = 0;
                        }
                        clientes.Add(c);
                    }
                }

                pMetodos.LlenarMapaConClientes(clientes, GMap1);
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

            GMap1.reset();
            //me centro en argentina
            GLatLng ubicacion = new GLatLng(-13.533406, -88.4127875);//(-35.3139685, -65.104704);//(40.381090863719436, -3.6222052574157715);
            GMap1.setCenter(ubicacion, 4);

            //Establecemos alto y ancho en px
            GMap1.Height = 600;
            GMap1.Width = 558;

            //Adiciona el control de la parte izq superior (moverse, ampliar y reducir)
            GMap1.Add(new GControl(GControl.preBuilt.LargeMapControl));

            //GControl.preBuilt.MapTypeControl: permite elegir un tipo de mapa y otro.
            GMap1.Add(new GControl(GControl.preBuilt.MapTypeControl));

            cargarClientesEnMapa(clientesMap);

            GMap1.enableHookMouseWheelToZoom = true;

            //Tipo de mapa a mostrar
            GMap1.mapType = GMapType.GTypes.Normal;

            //Moverse con el cursor del teclado
            GMap1.enableGKeyboardHandler = true;

            gvListadoClientes.DataSource = conClientes.ListadoClientes(parametros);
            gvListadoClientes.DataBind();

            //cargarClientesEnMapa(clientesMap, parametros);

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            lblCodigo.Text = CODIGO.Value;
            
            if (!string.IsNullOrEmpty(txtMatriz.Text) && !conClientes.VerificarClienteExistente(txtMatriz.Text))
            {
                lblMensaje2.Text = "Cliente Matriz no existe";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                return;
            }
            if (!string.IsNullOrEmpty(txtRefil.Text) && !conClientes.VerificarClienteExistente(txtRefil.Text))
            {
                lblMensaje2.Text = "Cliente refil no existe";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                return;
            }
            
            if((txtLongitud.Text.Length > 0 && txtLatitud.Text.Length == 0) || (txtLatitud.Text.Length > 0 && txtLongitud.Text.Length == 0))
            {
                lblMensaje2.Text = "Si completa la latitud o longitud ambos campos deben estar completados";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                return;
            }

            ArrayList parametos = new ArrayList();
            parametos.Add(CODIGO.Value);
            parametos.Add(txtMatriz.Text);
            parametos.Add(txtRefil.Text);
            parametos.Add(txtRazonSocial.Text);
            parametos.Add(txtDireccion.Text);
            parametos.Add(txtEmail.Text);
            parametos.Add(txtWeb.Text);

            if (txtLatitud.Text.Length > 0)
                parametos.Add(Convert.ToDouble(txtLatitud.Text.Replace(".",",")));
            else
                parametos.Add(DBNull.Value);
            if (txtLongitud.Text.Length > 0)
                parametos.Add(Convert.ToDouble(txtLongitud.Text.Replace(".", ",")));
            else
                parametos.Add(DBNull.Value);
            
            parametos.Add(chkBajaLogica.Checked ? '1' : '0');

            conClientes.ModificarAlteraCliente(parametos);

            gvListadoClientes.DataSource = conClientes.ListadoClientes();
            gvListadoClientes.DataBind();

            lblMensaje.Text = "El cliente " + CODIGO.Value + "se ha modificado correctamente";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);

            lblMensaje2.Text = string.Empty;
            CODIGO.Value = "";

        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Site/Clientes.aspx", false);
        }

    }
}