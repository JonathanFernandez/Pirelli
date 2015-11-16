using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controles;
using System.Collections;
using Entidades;
using Negocio;


namespace PirelliReports.Site
{
    public partial class AdministracionUsuarios : PirelliMaster
    {
        ConexionAdministracionGrupos conAdminstracion = new ConexionAdministracionGrupos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conAdminstracion.CargarGrupos(chkListGrupos);
                cargarUsuario();
            }
        }

        private void cargarUsuario()
        {
            conAdminstracion.CargarUsuarios(ddlUsuarios);
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Site/AdministracionUsuarios.aspx", false);

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (conAdminstracion.ValidarUsuarioIDExistente(txtUsuarioID.Text))
            {
                lblMensaje.Text = "Ya existe un usuario con el mismo ID";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
            else if (conAdminstracion.ValidarUsuarioLegajoExistente(txtLegajo.Text))
            {
                lblMensaje.Text = "Ya existe un usuario con el mismo legajo";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
            else if (conAdminstracion.ValidarUsuarioMailExistente(txtMail.Text))
            {
                lblMensaje.Text = "Ya existe un usuario con el mismo mail";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
        }
    }
}