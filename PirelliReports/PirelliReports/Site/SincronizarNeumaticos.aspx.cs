using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controles;
using Negocio;
using Entidades;
using System.Web.Configuration;

namespace PirelliReports.Site
{
    public partial class SincronizarNeumaticos : PirelliMaster
    {
        ConexionZoProductTemp conProductoTemp = new ConexionZoProductTemp();
        List<Zoprodu> productos = new List<Zoprodu>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Se agrega los productos de la tabla temporal a la grilla
                gvListadoNeumaticos.DataSource = conProductoTemp.ListadoDeProductosTemp();
                gvListadoNeumaticos.DataBind();
            }
        }

        protected void btnCargar_Click(object sender, EventArgs e)
        {
            conProductoTemp.DeleteProductTemp();
            // Se obtiene la ruta completa al archivo de productos que genera SAP
            string rutaProductos = WebConfigurationManager.AppSettings["rutaProductos"];
            // Se consulta si el archivo existe
            if (File.Exists(rutaProductos))
            {
                FileInfo fi = new FileInfo(rutaProductos);
                // Se consulta el tamaño del archivo en bytes
                if (fi.Length > 0)
                {
                    try
                    {
                        using (StreamReader lector = new StreamReader(rutaProductos))
                        {
                            // Se comienza a leer el archivo
                            while (lector.Peek() > -1)
                            {
                                string linea = lector.ReadLine();
                                if (!String.IsNullOrEmpty(linea))
                                {
                                    Zoprodu producto = new Zoprodu();
                                    producto.IP = linea.Substring(0, 7).Trim();
                                    producto.Descrip = linea.Substring(9, 30).Trim();
                                    producto.Familia = linea.Substring(39, 2).Trim();
                                    producto.Pais = linea.Substring(90, 2).Trim();
                                    producto.Otro = linea.Substring(118, 6).Trim();
                                    producto.Marca = linea.Substring(142, 2).Trim();
                                    producto.Rango = linea.Substring(144, 1).Trim();
                                    producto.IP.Trim();
                                    producto.Descrip.Trim();
                                    producto.Familia.Trim();
                                    producto.Pais.Trim();
                                    producto.Otro.Trim();
                                    producto.Marca.Trim();
                                    producto.Rango.Trim();
                                    //conProductoTemp.InsertarProductoTemp(producto);
                                    productos.Add(producto);
                                }
                            }
                            if(productos.Count > 0)
                                conProductoTemp.InsertarProductoTemp(productos);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Text = "Error: " + ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                    }
                    // Se agregan los productos de la tabla temporal a la grilla
                    gvListadoNeumaticos.DataSource = conProductoTemp.ListadoDeProductosTemp();
                    gvListadoNeumaticos.DataBind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                }
                else
                {
                    lblMensaje.Text = "El archivo no tiene ningun producto";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
                }
            }
            else
            {
                lblMensaje.Text = "El archivo no se encontro. Consulte con el administrador del sistema SAP";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
            }
        }

        protected void btnSincronizar_Click(object sender, EventArgs e)
        {
            // Se consulta si la grilla tiene algun registro
            if (gvListadoNeumaticos.Rows.Count > 0)
            {
                conProductoTemp.sincronizarProductosTemp();
                productos.Clear();
                productos.TrimExcess();
                gvListadoNeumaticos.DataSource = null;
                gvListadoNeumaticos.DataBind();
                lblMensaje.Text = "La sincronización ha finalizado con exito";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else
            {
                lblMensaje.Text = "No se encontraron productos para sincronizar";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desctivarSpinner();", true);
        }
    }
}