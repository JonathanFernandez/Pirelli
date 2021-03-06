﻿using System;
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
            lblMensaje.Visible = false;
            if (!connUsuario.VerificarMaiExistente(lost_email.Text))
            {
                lblMailIncorrecto.Visible = true;
           
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", " openModal();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mail", "darClick();", true);

            }
            else
            {
                lblPassIncorrecta.Visible = false;

                connUsuario.EnviarCorreo(lost_email.Text);
                lblMensaje.Visible = true;
                //return true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
              //Response.Write("<script type=\"text/javascript\">alert('aprete login!!!');</script>");
            lblMensaje.Visible = false;
            if (!connUsuario.VerificarLogin(login_username.Text, login_password.Text))
            {
                lblPassIncorrecta.Visible = true;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                
            }
            else
            {
                lblPassIncorrecta.Visible = false;

                //FormsAuthentication.SetAuthCookie(login_username.Text, false);

                user = connUsuario.CargarUsuario(login_username.Text, login_password.Text);
                connUsuario.SetearEstado(user, true);
                user.Activo = true;

                FormsAuthentication.SetAuthCookie(user.Usu_id, false);
                Session["Usuario"] = user;
                Response.Redirect("~/Index.aspx",false);
                
            }

        }
    }
}