using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PirelliReports
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Write("<script type=\"text/javascript\">alert('aprete login!!!');</script>");
        }

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            Response.Write("<script type=\"text/javascript\">alert('aprete enviar!!!');</script>");
        }

        protected void lost_login_btn_Click(object sender, EventArgs e)
        {
            Response.Write("<script type=\"text/javascript\">alert('vuelvo al login!!!');</script>");
        }

       
       
       
    }
}