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

namespace PirelliReports.Site
{
    public partial class ActualizacionMasivaIP : PirelliMaster
    {
        ConexionZoSolicitudAlteraIP conSolicitud = new ConexionZoSolicitudAlteraIP();
        List<ZoSolicitud> solicitudes = new List<ZoSolicitud>();
        private string rutaArchivoSubido = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubirSolicitudes_Click(object sender, EventArgs e)
        {
            // Specify the path on the server to
            // save the uploaded file to.
            String savePath = @"c:\temp\";
            String fileName = "";

            // Before attempting to perform operations
            // on the file, verify that the FileUpload 
            // control contains a file.
            if (fuSubirArchivo.HasFile)
            {
                // Get the name of the file to upload.
                fileName = fuSubirArchivo.FileName;

                // Append the name of the file to upload to the path.
                savePath += fileName;

                try
                {
                    fuSubirArchivo.SaveAs(savePath);
                }
                catch (System.Web.HttpException ex)
                {
                    lblMensaje.Text = "Error: " + ex.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }

                // Notify the user of the name of the file
                // was saved under.
                lblMensaje.Text = "Se subio el archivo " + fileName;
                rutaArchivoSubido = savePath;
                HDrutaArchivoSubido.Value = savePath;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else
            {
                // Notify the user that a file was not uploaded.
                lblMensaje.Text = "No se pudo subir el archivo " + fileName;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }

        protected void btnLeerSolicitudes_Click(object sender, EventArgs e)
        {
            conSolicitud.BorrarSolicitudes();
            if (File.Exists(HDrutaArchivoSubido.Value))
            {
                FileInfo fi = new FileInfo(HDrutaArchivoSubido.Value);
                // Se consulta el tamaño del archivo en bytes
                if (fi.Length > 0)
                {
                    try
                    {
                        using (StreamReader lector = new StreamReader(HDrutaArchivoSubido.Value))
                        {
                            // Se comienza a leer el archivo
                            while (lector.Peek() > -1)
                            {
                                string linea = lector.ReadLine();
                                if (!String.IsNullOrEmpty(linea))
                                {
                                    ZoSolicitud solicitud = new ZoSolicitud();
                                    string[] componentes = linea.Split(',');
                                    solicitud.CodSolicitud = Convert.ToInt32(componentes[0]);
                                    solicitud.Ip = componentes[1];
                                    solicitud.Pais = componentes[2];
                                    solicitud.Nota = componentes[3];

                                    solicitudes.Add(solicitud);
                                }
                            }
                            if (solicitudes.Count > 0)
                                conSolicitud.InsertarSolicitudes(solicitudes);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Text = "Error: " + ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

                    }
                    // Se agregan las solicitudes de la tabla temporal a la grilla
                    gvListadoSolicitudes.DataSource = conSolicitud.ListadoDeSolicitudes();
                    gvListadoSolicitudes.DataBind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
                }
                else
                {
                    lblMensaje.Text = "No hay ninguna solicitud";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
        }

        protected void btnActualizarSolicitudes_Click(object sender, EventArgs e)
        {
            /* Si la grilla tiene registros*/
            if (gvListadoSolicitudes.Rows.Count > 0)
            {
                conSolicitud.actualizarSolicitudes();
                solicitudes.Clear();
                solicitudes.TrimExcess();
                gvListadoSolicitudes.DataSource = null;
                gvListadoSolicitudes.DataBind();
                lblMensaje.Text = "Se realizo la actualizacion masiva con exito";
            }
            else
            {
                lblMensaje.Text = "No se encontraron solicitudes para la actualizacion masiva";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "desactivarSpinner();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
    }
}