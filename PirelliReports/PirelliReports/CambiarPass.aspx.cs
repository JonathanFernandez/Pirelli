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
    public partial class CambiarPass : System.Web.UI.Page
    {
        ConexionUsuario connUsuario = new ConexionUsuario();
        public string mail = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(Page.Request["mail"]))
            {
                mail = Page.Request["mail"];
            }
        }

        protected void btnCambiarPass_Click(object sender, EventArgs e)
        {
            if (!connUsuario.VerificarMaiExistente(mail))
            {
                lblMailInexistente.Visible = true;
              
            }
            else
            {
                lblMailInexistente.Visible = false;

                if (connUsuario.ReestablecerMail(mail))
                {
                    btnLoginVolver.Visible = true;
                }
            }
        }

        protected void btnLoginVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}