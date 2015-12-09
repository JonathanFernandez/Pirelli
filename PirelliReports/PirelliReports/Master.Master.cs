using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;


namespace PirelliReports
{
    public partial class Master : System.Web.UI.MasterPage
    {
        public Usuario userLog = new Usuario(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (((Usuario)Session["Usuario"]) != null)
            {
                userLog = ((Usuario)Session["Usuario"]);
                bool encontro = false;

                //si no tiene acceso a esa pagina lo mando al index
                string paginaActual = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1, Request.Url.AbsolutePath.Length - Request.Url.AbsolutePath.LastIndexOf("/") - 1);
                if (paginaActual != "Index")
                {
                    foreach (Paginas p in userLog.PaginasAccesibles)
                    {
                        if (paginaActual == p.Pagina.Substring(0, p.Pagina.IndexOf(".")))
                        {
                            encontro = true;
                            break;
                        }
                    }

                    if (!encontro)
                        Response.Redirect("~/Index.aspx", false);
                }
                //habilito los menues que pueden ver
                if (userLog.Permisos != null && userLog.Permisos.Count > 0)
                {
                    foreach (MDPermisos per in userLog.Permisos)
                    {
                        switch (per.PermisoDesc)
                        {
                            case EnumPermisos.FACTURASPROMOVISA:
                                FACTURASPROMOVISA.Visible = true;
                                FACTURASPROMOVISA.Disabled = false;
                                break;
                            case EnumPermisos.ENVIOASAP:
                                ENVIOASAP.Visible = true;
                                ENVIOASAP.Disabled = false;
                                break;
                            case EnumPermisos.CLIENTES:
                                CLIENTES.Visible = true;
                                CLIENTES.Disabled = false;
                                break;
                            case EnumPermisos.NEUMATICOS:
                                NEUMATICOS.Visible = true;
                                NEUMATICOS.Disabled = false;
                                break;
                            case EnumPermisos.PROMOCIONES:
                                PROMOCIONES.Visible = true;
                                PROMOCIONES.Disabled = false;
                                break;
                            case EnumPermisos.MODIFICARCLIENTEIP:
                                MODIFICARCLIENTEIP.Visible = true;
                                MODIFICARCLIENTEIP.Disabled = false;
                                break;
                            case EnumPermisos.SINZCRONIZACIONCOMERCIAL:
                                SINZCRONIZACIONCOMERCIAL.Visible = true;
                                SINZCRONIZACIONCOMERCIAL.Disabled = false;
                                break;
                            case EnumPermisos.REPORTESCOMERCIAL:
                                REPORTESCOMERCIAL.Visible = true;
                                REPORTESCOMERCIAL.Disabled = false;
                                break;
                            case EnumPermisos.ADMINISTRACION:
                                ADMINISTRACION.Visible = true;
                                ADMINISTRACION.Disabled = false;
                                break;
                            case EnumPermisos.MODIFICACIONESMASIVAS:
                                MODIFICACIONESMASIVAS.Visible = true;
                                MODIFICACIONESMASIVAS.Disabled = false;
                                break;
                            case EnumPermisos.PERFIL:
                                PERFIL.Visible = true;
                                PERFIL.Disabled = false;
                                break;
                        }
                    }
                }

                lblUsuario.Text = userLog.Usu_desc;

                LoadScripts();

                LoadStyles();
            }
            else
            {
                Response.Redirect("~/Login.aspx", false);
            }
        }

        private void LoadStyles()
        {
            HtmlHeaderStyleLink scriptStyle = new HtmlHeaderStyleLink("~/Content/css/bootstrap.min.css");
            scriptStyle.IncludeOn(Page.Header);

            scriptStyle = new HtmlHeaderStyleLink("~/Content/css/sb-admin.css");
            scriptStyle.IncludeOn(Page.Header);

            scriptStyle = new HtmlHeaderStyleLink("~/Content/css/plugins/morris.css");
            scriptStyle.IncludeOn(Page.Header);

            scriptStyle = new HtmlHeaderStyleLink("~/Content/font-awesome/css/font-awesome.min.css");
            scriptStyle.IncludeOn(Page.Header);

            scriptStyle = new HtmlHeaderStyleLink("~/Content/css/jquery-ui.min.css");
            scriptStyle.IncludeOn(Page.Header);

        }
        private void LoadScripts()
        {
            imgPirelli.Src = "~/Content/img/logo_pirelli_small.svg";
         
 
            HtmlHeaderJSLink scriptLink = new HtmlHeaderJSLink("~/Content/js/jquery.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/jquery-ui.min.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/bootstrap.min.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/jquery.sticky.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/jquery-validation-1.14.0/jquery.validate.min.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/jquery-validation-1.14.0/additional-methods.min.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/jquery-validation-1.14.0/localization/messages_es.min.js");
            scriptLink.IncludeOn(Page.Header);

            //scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/morris/morris.min.js");
            //scriptLink.IncludeOn(Page.Header);

            //scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/morris/morris-data.js");
            //scriptLink.IncludeOn(Page.Header);

            //scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/morris/raphael.min.js");
            //scriptLink.IncludeOn(Page.Header);
        }
    }
}