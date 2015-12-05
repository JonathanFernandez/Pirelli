using Controles;
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
    public partial class LogOut : PirelliMaster
    {
        ConexionUsuario connUsuario = new ConexionUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            connUsuario.SetearEstado(User, false);
            Session.Clear();
            Session.Abandon();            
            Response.Redirect("~/Login.aspx", false);
        }
    }
}