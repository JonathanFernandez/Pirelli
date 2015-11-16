using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controles;
using Entidades;
using Negocio;
using System.Web.Configuration;

namespace PirelliReports.Site
{
    public partial class SincronizarClientes : PirelliMaster
    {
        
    	ConexionZoClienteTemp conClienteTemp = new ConexionZoClienteTemp();
        List<ZoCliente> clientes = new List<ZoCliente>();

        protected void Page_Load(object sender, EventArgs e)
        {
        	if (!IsPostBack)
            {
                // Se agrega los clientes de la tabla temporal a la grilla
                gvListadoClientes.DataSource = conClienteTemp.ListadoDeClientesTemp();
                gvListadoClientes.DataBind();
            }
        }

        protected void btnCargar_Click(object sender, EventArgs e)
        {
            conClienteTemp.DeleteClientesTemp();
            // Se obtiene la ruta completa al archivo de clientes que genera SAP
            string rutaClientes = WebConfigurationManager.AppSettings["rutaClientes"];
            // Se consulta si el archivo existe
            if (File.Exists(rutaClientes))
            {
                FileInfo fi = new FileInfo(rutaClientes);
                // Se consulta el tamaño del archivo en bytes
                if (fi.Length > 0)
                {
                    try
                    {
                        using (StreamReader lector = new StreamReader(rutaClientes))
                        {
                            // Se comienza a leer el archivo
                            while (lector.Peek() > -1)
                            {
                                string linea = lector.ReadLine();
                                if (!String.IsNullOrEmpty(linea))
                                {
                                    ZoCliente cliente = new ZoCliente();

                                    cliente.Cod = linea.Substring(0, 10).Trim();
                                    cliente.Cuit = linea.Substring(12, 11).Trim();
                                    cliente.Tipo = linea.Substring(23, 2).Trim();
                                    cliente.RazSoc = linea.Substring(25, 45).Trim();
                                    cliente.DirSuc = linea.Substring(70, 40).Trim();
                                    cliente.Ciudad = linea.Substring(110, 31).Trim();
                                    cliente.Pais = linea.Substring(150, 2).Trim();
                                    cliente.TelefonoSuc = linea.Substring(155, 11).Trim();
                                    cliente.CodRegion = linea.Substring(169, 2).Trim();
                                    cliente.Latitud = float.Parse(linea.Substring(250, 12).Trim());
                                    cliente.Longitud = float.Parse(linea.Substring(263, 12).Trim());
                                    // Se borran espacios en blanco al principio y al final de la cadena
                                    cliente.Cod.Trim();
                                    cliente.Cuit.Trim();
                                    cliente.Tipo.Trim();
                                    cliente.RazSoc.Trim();
                                    cliente.Ciudad.Trim();
                                    cliente.Pais.Trim();
                                    cliente.TelefonoSuc.Trim();
                                    cliente.CodRegion.Trim();
                                    //conclienteTemp.InsertarclienteTemp(cliente);
                                    clientes.Add(cliente);
                                }
                            }
                            if(clientes.Count > 0)
                                conClienteTemp.InsertarClientesTemp(clientes);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Text = "Error: " + ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                        
                    }
                    // Se agregan los clientes de la tabla temporal a la grilla
                    gvListadoClientes.DataSource = conClienteTemp.ListadoDeClientesTemp();
                    gvListadoClientes.DataBind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                }
                else
                {
                    lblMensaje.Text = "El archivo no tiene ningun cliente";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    
                }
            }
            else
            {
                lblMensaje.Text = "El archivo no se encontro. Consulte con el administrador del sistema SAP";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                
            }
        }

        protected void btnSincronizar_Click(object sender, EventArgs e)
        {
            // Se consulta si la grilla tiene algun registro
            if (gvListadoClientes.Rows.Count > 0)
            {
                conClienteTemp.sincronizarClientesTemp();
                clientes.Clear();
                clientes.TrimExcess();
                gvListadoClientes.DataSource = null;
                gvListadoClientes.DataBind();
                lblMensaje.Text = "La sincronización ha finalizado con exito";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else
            {
                lblMensaje.Text = "No se encontraron clientes para sincronizar";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }
    }
}