using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controles;
using Negocio;
using Entidades;

namespace PirelliReports.Site
{
    public partial class UsuarioEdit : PirelliMaster
    {
        ConexionUsuario conUsuario = new ConexionUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUsuId.Text = User.Usu_id;
                txtUsuDesc.Text = User.Usu_desc;
                txtLegajo.Text = User.Legajo.ToString();
                chkActivo.Checked = User.Activo == true ? true : false;
                chkActivo.Enabled = false;
                txtMail.Text = User.Mail;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (txtPassAnterior.Text != User.Pass)
            {
                lblMensaje.Text = "La clave ingresada es incorrecta";
                txtUsuId.Text = User.Usu_id;
                txtUsuDesc.Text = User.Usu_desc;
                txtLegajo.Text = User.Legajo.ToString();
                chkActivo.Checked = User.Activo == true ? true : false;
                chkActivo.Enabled = false;
                txtMail.Text = User.Mail;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else 
            {
                conUsuario.CambiarClave(txtClaveNueva.Text, User);
                User.Pass = txtClaveNueva.Text;
                txtUsuId.Text = User.Usu_id;
                txtUsuDesc.Text = User.Usu_desc;
                txtLegajo.Text = User.Legajo.ToString();
                chkActivo.Checked = User.Activo == true ? true : false;
                chkActivo.Enabled = false;
                txtMail.Text = User.Mail;
                lblMensaje.Text = "La clave se ha cambiado con exito!!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }
    }
}