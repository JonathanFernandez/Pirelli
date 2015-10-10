using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Entidades;
using Negocio;



namespace PirelliReports
{
    public partial class Login : System.Web.UI.Page
    {
        Usuario user = new Usuario();
        ConexionUsuario connUsuario = new ConexionUsuario();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

      

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            if (!connUsuario.VerificarMaiExistente(lost_email.Text))
            {
                lblMailIncorrecto.Visible = true;
                //loginform.s
                //return false;
            }
            else
            {
                lblPassIncorrecta.Visible = false;

                connUsuario.EnviarCorreo(lost_email.Text);
                //return true;
            }
        }

        protected void lost_login_btn_Click(object sender, EventArgs e)
        {
            Response.Write("<script type=\"text/javascript\">alert('vuelvo al login!!!');</script>");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
              //Response.Write("<script type=\"text/javascript\">alert('aprete login!!!');</script>");
            if (!connUsuario.VerificarLogin(login_username.Text, login_password.Text))
            {
                lblPassIncorrecta.Visible = true;
                //login_modal.Style.Add("display", "block");
                //login_modal.Style.Add("visible", "true");
                
            }
            else
            {
                lblPassIncorrecta.Visible = false;

                FormsAuthentication.SetAuthCookie(login_username.Text, false);

                user = connUsuario.CargarUsuario(login_username.Text, login_password.Text);
                
                Session["Usuario"] = user; 
                Response.Redirect("Index.aspx");
                
            }

        }

       
       
       
    }
}