using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;


namespace PirelliReports
{
    public partial class ReestablecerPass : System.Web.UI.Page
    {
        ConexionUsuario connUsuario = new ConexionUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Page.Request["mail"]))
            {
                string mail = Page.Request["mail"];
                connUsuario.ReestablecerPassword(mail);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx", false);
        }
    }
}