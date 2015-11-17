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
    public partial class AdministracionPermisos : PirelliMaster
    {
        ConexionAdministracionGrupos conAdminstracion = new ConexionAdministracionGrupos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conAdminstracion.CargarPermisos(chklistPermisosAlta);
                cargarGrupos();
            }
        }

        private void cargarGrupos()
        {
            conAdminstracion.CargarGrupos(ddlGrupos);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            if (conAdminstracion.ValidarGrupoExistente(txtGrupoAlta.Text.ToUpper()))
            {
                lblMensaje.Text = "Ya existe un grupo con ese nombre";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
            else
            {

                List<EnumPermisos> permisos = new List<EnumPermisos>();

                for (int i = 0; i < chklistPermisosAlta.Items.Count; i++)
                {
                    if (chklistPermisosAlta.Items[i].Selected)
                    {
                        permisos.Add((EnumPermisos)(Convert.ToInt32(chklistPermisosAlta.Items[i].Value)));
                    }
                }

                conAdminstracion.InsertGrupoPermisos(permisos, txtGrupoAlta.Text.ToUpper());
                lblMensaje.Text = "Ya se creo el grupo";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
        }

        protected void ddlGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEditarNombre.Text = ddlGrupos.SelectedItem.Text;
            conAdminstracion.CargarPermisosCheckeados(chkListPermisosEditar, Convert.ToInt32(ddlGrupos.SelectedValue));

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            conAdminstracion.EliminarGrupoPermisos(Convert.ToInt32(ddlGrupos.SelectedValue));

            lblMensaje.Text = "Ya se elimino el grupo";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
        }

        protected void btnCambiarNombre_Click(object sender, EventArgs e)
        {
            if (conAdminstracion.ValidarGrupoExistente(txtEditarNombre.Text.ToUpper()))
            {
                lblMensaje.Text = "Ya existe un grupo con ese nombre";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
            else
            {
                conAdminstracion.ModificarNombreGrupoPermisos(Convert.ToInt32(ddlGrupos.SelectedValue), txtEditarNombre.Text.ToUpper());
                lblMensaje.Text = "El nombre se modifico correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            List<EnumPermisos> permisos = new List<EnumPermisos>();

            for (int i = 0; i < chkListPermisosEditar.Items.Count; i++)
            {
                if (chkListPermisosEditar.Items[i].Selected)
                {
                    permisos.Add((EnumPermisos)(Convert.ToInt32(chkListPermisosEditar.Items[i].Value)));
                }
            }

            conAdminstracion.ModificarGrupoPermisos(permisos, ddlGrupos.SelectedItem.Text.ToUpper());
            lblMensaje.Text = "Modificación correcta";
            //Response.Redirect(@"~/Site/AdministracionPermisos.aspx", false);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
            
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Site/AdministracionPermisos.aspx", false);
        }
    }
}