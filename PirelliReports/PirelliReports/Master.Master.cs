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
            string a = Request.Url.LocalPath;

            userLog  = ((Usuario)Session["Usuario"]);

            lblUsuario.Text = userLog.Usu_desc;
            
            LoadScripts();

            LoadStyles();
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

            scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/morris/raphael.min.js");
            scriptLink.IncludeOn(Page.Header);
            
            scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/morris/morris.min.js");
            scriptLink.IncludeOn(Page.Header);

            scriptLink = new HtmlHeaderJSLink("~/Content/js/plugins/morris/morris-data.js");
            scriptLink.IncludeOn(Page.Header);

            
        }
    }
}