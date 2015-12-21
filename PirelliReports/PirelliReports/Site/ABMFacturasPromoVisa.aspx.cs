using System;
using System.IO;
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

namespace PirelliReports.Site
{
    public partial class ABMFacturasPromoVisa : PirelliMaster
    {
        ConexionFacturasPromo conFacturas = new ConexionFacturasPromo();
        ConexionClientes conClientes = new ConexionClientes();
        ConexionZonas conZonas = new ConexionZonas();
        ConexionZoProduct conProduct = new ConexionZoProduct();
        PirelliMetodos pMetodos = new PirelliMetodos();

        ZoSolicitud solicitud;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Page.Request["CodSolicitud"]))
                {
                    HDCodSolicitud.Value = Page.Request["CodSolicitud"];
                    solicitud = new ZoSolicitud();
                    solicitud = conFacturas.TraerFactura(Convert.ToInt32(Page.Request["CodSolicitud"]));
                    HDCliente.Value = solicitud.CodClie;
                    HDMedida.Value = solicitud.Ip;
                    HDProvincia.Value = solicitud.CodProv;
                    HDPromo.Value = solicitud.CodPromo.ToString();

                    txtEditarCantidad.Text = solicitud.Cantidad.ToString();
                    txtEditarPrecio.Text = solicitud.Precio.ToString().Replace(",", "."); ;
                    txtEditarNumFactura.Text = solicitud.NroFactura.ToString();
                    txtEditarticket.Text = solicitud.NroTicket.ToString();
                    txtEditarTarjeta.Text = solicitud.NroTarjeta.ToString();
                    txtEditarNumCompra.Text = solicitud.NroCom.ToString();

                    txtEditarNombre.Text = solicitud.NombreUsu;
                    txtEditarDireccion.Text = solicitud.DirUsu;
                    txtEditarTelefono.Text = solicitud.Telefono;
                    txtEditarNumero.Text = solicitud.Nro.ToString();
                    txtEditarPiso.Text = solicitud.Piso;
                    txtEditarCiudad.Text = solicitud.Ciudad;
                    txtEditarCodigoPostal.Text = solicitud.CodPos;
                    txtEditarVehiculo.Text = solicitud.Vehiculo;
                    txtEditarNota.Text = solicitud.Nota;
                    dpEditarFecha.Text = solicitud.FechaCompra.ToString("dd/MM/yyyy");
                    dpEditarFecha_TextChanged(sender, e);
                    cargarCuotaDescuentoDePromo();
                    

                }
                cargarClientes(ddlEditarCliente);
                cargarMedidas(ddlEditarMedida);
                cargarProvincia(ddlEditarProvincia);
                //dpEditarFecha_TextChanged(sender, e);
                //cargarRegion(ddlEditarRegion);
                ddlEditarMedida_SelectedIndexChanged(sender, e);
                ddlEditarCliente_SelectedIndexChanged(sender, e);
                //ddlEditarCliente_SelectedIndexChanged(sender, e);
            }

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
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["FAMILIA"].ToString(), ds.Tables[0].Rows[i]["CODFAMILIA"].ToString()));
                }
            }


        }
        private void cargarTipoPromo(DropDownList ddl)
        {
            //string fecha = pMetodos.ConvertmmddyyyyToyyyymmdd(dpEditarFecha.Text);
            string fecha = pMetodos.ConvertddmmyyyyToyyyymmdd(dpEditarFecha.Text);
            DataSet ds = new DataSet();
            ds = conFacturas.CargarPromosVigentesDelDiaSeleccionado(ddlEditarTipoPromo,Convert.ToDateTime(fecha));
            string mostrar;
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["CodTipoPromo"].ToString() + ")" + ds.Tables[0].Rows[i]["DescTipoPromo"].ToString();
                    ddl.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["CodTipoPromo"].ToString()));
                    if (ds.Tables[0].Rows[i]["CodTipoPromo"].ToString() == HDPromo.Value)
                        ddl.Items[i].Selected = true;
                }
            }


        }
        private void cargarCuotaDescuentoDePromo()
        {
            //string fecha = pMetodos.ConvertmmddyyyyToyyyymmdd(dpEditarFecha.Text);
            string fecha = pMetodos.ConvertddmmyyyyToyyyymmdd(dpEditarFecha.Text);
            DataSet ds = new DataSet();
            ds = conFacturas.PromosVigentesDelDiaSeleccionado(Convert.ToDateTime(fecha), Convert.ToInt32(ddlEditarTipoPromo.SelectedValue));
            if (ds.Tables[0].Rows.Count > 0)
            {

                txtEditCuota.Text = ds.Tables[0].Rows[0]["CUOTA"].ToString();
                txtDescuento.Text = ds.Tables[0].Rows[0]["DESCUENTO"].ToString().Replace(",",".");
                
            }
        }
        private void cargarProvincia(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = conZonas.ListadoDeProvincias();

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["ZODESC"].ToString(), ds.Tables[0].Rows[i]["ZOCOD"].ToString()));
                    if (ds.Tables[0].Rows[i]["ZOCOD"].ToString() == HDProvincia.Value)
                        ddl.Items[i].Selected = true;
                }
            }


        }
        private void cargarRegion(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = conZonas.ListadoDeRegion();
            string mostrar;
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["REG_COD"].ToString() + ")" + ds.Tables[0].Rows[i]["Descripcion"].ToString();
                    ddl.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["REG_COD"].ToString()));
                }
            }


        }
        private void cargarClientes(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = conClientes.ListadoClientesActivos();
            string mostrar;
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["Cod"].ToString() + ") " + ds.Tables[0].Rows[i]["RazSoc"].ToString();
                    ddl.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["Cod"].ToString()));
                    if (ds.Tables[0].Rows[i]["Cod"].ToString() == HDCliente.Value)
                        ddl.Items[i].Selected = true;
                }
            }
        }
        private void cargarMedidas(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = conFacturas.ListadoDeMedidas();
            string mostrar;
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["CODIGO"].ToString() + ") " + ds.Tables[0].Rows[i]["DESCRIPCION"].ToString()
                        + " " + ds.Tables[0].Rows[i]["Rango"].ToString()
                        + " " + ds.Tables[0].Rows[i]["Marca"].ToString()
                        + " " + ds.Tables[0].Rows[i]["pais"].ToString()
                        + " " + ds.Tables[0].Rows[i]["DISEÑO"].ToString();
                    ddl.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["CODIGO"].ToString()));
                    if (ds.Tables[0].Rows[i]["CODIGO"].ToString() == HDMedida.Value)
                        ddl.Items[i].Selected = true;
                }
            }


        }
        protected void dpEditarFecha_TextChanged(object sender, EventArgs e)
        {
            ddlEditarTipoPromo.Items.Clear();
            cargarTipoPromo(ddlEditarTipoPromo);
            cargarCuotaDescuentoDePromo();
        }
        protected void ddlEditarTipoPromo_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarCuotaDescuentoDePromo();
        }
        protected void ddlEditarMedida_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(ddlEditarMedida.SelectedValue);
            parametros.Add("%");
            parametros.Add("%");
            parametros.Add("%");
            parametros.Add("%");
            parametros.Add("%");
            parametros.Add("%");
            parametros.Add(0.0);
            parametros.Add("%");

            ds = conProduct.ListadoZoProduct(parametros);
            if (ds.Tables[0].Rows.Count > 0)
            {

                txtEditarRango.Text = ds.Tables[0].Rows[0]["RANGO"].ToString();
                txtEditarDisenio.Text = ds.Tables[0].Rows[0]["OTRO"].ToString();
                txtEditarMarca.Text = ds.Tables[0].Rows[0]["MARCA"].ToString();
                HDPais.Value = ds.Tables[0].Rows[0]["PAIS"].ToString();
                    
            }
        }

        //protected void ddlEditarCliente_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DataSet ds = new DataSet();
        //    ZoRegion reg = new ZoRegion();
        //    reg = conClientes.RegionDelCliente(ddlEditarCliente.SelectedValue);
        //    txtEditarRegion.Text = "(" + reg.Reg_code + ") " + reg.Descripcion;

        //}
        protected void btnEditarAceptar_Click(object sender, EventArgs e)
        {
            solicitud = new ZoSolicitud();
                       
            solicitud.Ip = ddlEditarMedida.SelectedValue.ToString();
            solicitud.Pais = HDPais.Value;
            solicitud.CodClie = ddlEditarCliente.SelectedValue.ToString();
            //solicitud.FechaCompra = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpEditarFecha.Text));
            solicitud.FechaCompra = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpEditarFecha.Text));
            solicitud.Cantidad = Convert.ToInt32(txtEditarCantidad.Text);
            solicitud.NroFactura = txtEditarNumFactura.Text;
            solicitud.NombreUsu = txtEditarNombre.Text;
            solicitud.DirUsu = txtEditarDireccion.Text;
            solicitud.Nro = txtEditarNumero.Text;
            solicitud.Dpto = "";
            solicitud.Piso = txtEditarPiso.Text;
            solicitud.CodProv = ddlEditarProvincia.SelectedValue.ToString();
            solicitud.Ciudad = txtEditarCiudad.Text;
            solicitud.Vehiculo = txtEditarVehiculo.Text;
            solicitud.Cuotas = Convert.ToInt32(txtEditCuota.Text);
            solicitud.FlgProcesado = "0";
            solicitud.FecAlta = DateTime.Now;
            solicitud.UsuAlta = User.Usu_id;
            solicitud.Telefono = txtEditarTelefono.Text;
            solicitud.CodPos = txtEditarCodigoPostal.Text;
            solicitud.NroTicket = Convert.ToInt32(txtEditarticket.Text);
            solicitud.NroCom = txtEditarNumCompra.Text;
            solicitud.NroTarjeta = Convert.ToInt32(txtEditarTarjeta.Text);
            solicitud.NroAuto = 0;
            solicitud.Precio = Convert.ToDouble(txtEditarPrecio.Text.Replace(".", ","));
            solicitud.CodPromo = Convert.ToInt32(ddlEditarTipoPromo.SelectedValue);
            solicitud.Descuento = Convert.ToDouble(txtDescuento.Text.Replace(".", ","));
            solicitud.CodAux = "";
            solicitud.Nota = txtEditarNota.Text;

            if (string.IsNullOrEmpty(HDCodSolicitud.Value))
            {
                conFacturas.InsertarFactura(solicitud);
                lblMensaje.Text = "Facturas creada con exito";
            }
            else
            {
                solicitud.CodSolicitud = Convert.ToInt32(HDCodSolicitud.Value);
                conFacturas.ModificarFactura(solicitud);
                lblMensaje.Text = "Facturas modifica con exito";

            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true); 
        }

        protected void ddlEditarCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            ZoCliente cliente = new ZoCliente();
            cliente = conClientes.TraerCliente(ddlEditarCliente.SelectedValue);
            txtEditarNombre.Text = cliente.RazSoc;
            txtEditarDireccion.Text = cliente.DirSuc;
            txtEditarTelefono.Text = cliente.TelefonoSuc;
            txtEditarCiudad.Text = cliente.Ciudad;
            HDProvincia.Value = cliente.CodProv;
            ddlEditarProvincia.Items.Clear();
            cargarProvincia(ddlEditarProvincia);  
        }
    }
}