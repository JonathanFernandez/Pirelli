﻿using System;
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
        ConexionUsuario conUsuario = new ConexionUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUsuarios.Enabled = false;
                conAdminstracion.CargarGrupos(chkListGrupos);
                cargarUsuario();
            }
        }

        private void cargarUsuario()
        {
            conUsuario.CargarUsuarios(ddlUsuarios);
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Site/AdministracionUsuarios.aspx", false);

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ddlUsuarios.Enabled = false;
            if (modo.Value == "ALTA")
            {
                if (conUsuario.ValidarUsuarioIDExistente(txtUsuarioID.Text))
                {
                    lblMensaje.Text = "Ya existe un usuario con el mismo ID";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                }
                else if (conUsuario.ValidarUsuarioLegajoExistente(txtLegajo.Text))
                {
                    lblMensaje.Text = "Ya existe un usuario con el mismo legajo";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                }
                else if (conUsuario.ValidarUsuarioMailExistente(txtMailUser.Text))
                {
                    lblMensaje.Text = "Ya existe un usuario con el mismo mail";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                }
                else
                {
                    Usuario u = new Usuario();
                    u.Usu_id = txtUsuarioID.Text;
                    u.Usu_desc = txtDescripcion.Text;
                    u.Legajo = txtLegajo.Text;
                    u.Mail = txtMailUser.Text;
                    u.Pass = txtPassUser.Text;
                    u.Activo = chkActivo.Checked ? true : false;
                    u.Grupos = new List<MDGrupos>();
                    MDGrupos mdg;
                    for (int i = 0; i < chkListGrupos.Items.Count; i++)
                    {
                        if (chkListGrupos.Items[i].Selected)
                        {
                            mdg = new MDGrupos();
                            mdg.Grupo_id = Convert.ToInt32(chkListGrupos.Items[i].Value);
                            mdg.Grupo_desc = chkListGrupos.Items[i].Text;
                            u.Grupos.Add(mdg);
                        }
                    }
                    conUsuario.InsertarUsuario(u);
                    lblMensaje.Text = "Usuario creado con exito!!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                }
            }
            else if (modo.Value == "EDITAR")
            {
                bool flag = true;
                if (hdCodigoUsuario.Value != txtUsuarioID.Text)
                {
                    if (conUsuario.ValidarUsuarioIDExistente(txtUsuarioID.Text))
                    {
                        flag = false;
                        lblMensaje.Text = "Ya existe un usuario con el mismo ID";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                    }
                }
                if (hdLegajo.Value != txtLegajo.Text)
                {
                    if (conUsuario.ValidarUsuarioLegajoExistente(txtLegajo.Text))
                    {
                        flag = false;
                        lblMensaje.Text = "Ya existe un usuario con el mismo legajo";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                    }
                }
                if (hdMail.Value != txtMailUser.Text)
                {
                    if (conUsuario.ValidarUsuarioMailExistente(txtMailUser.Text))
                    {
                        flag = false;
                        lblMensaje.Text = "Ya existe un usuario con el mismo mail";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                    }
                }
               if(flag)
                {
                    Usuario u = new Usuario();
                    u.Usu_id = txtUsuarioID.Text;
                    u.Usu_desc = txtDescripcion.Text;
                    u.Legajo = txtLegajo.Text;
                    u.Mail = txtMailUser.Text;
                    u.Pass = txtPassUser.Text;
                    u.Activo = chkActivo.Checked ? true : false;
                    u.Grupos = new List<MDGrupos>();
                    MDGrupos mdg;
                    for (int i = 0; i < chkListGrupos.Items.Count; i++)
                    {
                        if (chkListGrupos.Items[i].Selected)
                        {
                            mdg = new MDGrupos();
                            mdg.Grupo_id = Convert.ToInt32(chkListGrupos.Items[i].Value);
                            mdg.Grupo_desc = chkListGrupos.Items[i].Text;
                            u.Grupos.Add(mdg);
                        }
                    }
                    conUsuario.ModificarUsuario(u,hdCodigoUsuario.Value);
                    lblMensaje.Text = "Usuario modificado con exito!!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalMensaje();", true);
                }
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            ddlUsuarios.Enabled = true;
            txtDescripcion.Text = "";
            txtLegajo.Text = "";
            txtMailUser.Text = "";
            txtPassUser.Text = "";
            txtUsuarioID.Text = "";
            chkActivo.Checked = false;
            modo.Value = "EDITAR";

            //Usuario u = new Usuario();
            //u = conUsuario.TraerUsuario(ddlUsuarios.SelectedValue);
            ddlUsuarios_SelectedIndexChanged(sender, e);
        }

        protected void ddlUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            Usuario u = new Usuario();

            u = conUsuario.TraerUsuario(ddlUsuarios.SelectedValue);
            
            hdCodigoUsuario.Value = u.Usu_id;
            hdLegajo.Value = u.Legajo;
            hdMail.Value = u.Mail;

            txtDescripcion.Text = u.Usu_desc;
            txtLegajo.Text = u.Legajo;
            txtMailUser.Text = u.Mail;
            txtPassUser.Text = u.Pass;
            txtUsuarioID.Text = u.Usu_id;
            chkActivo.Checked = u.Activo;

            chkListGrupos.Items.Clear();

            conAdminstracion.CargarGrupos(chkListGrupos);

            for (int i = 0; i < chkListGrupos.Items.Count; i++)
            {
                for (int j = 0; j < u.Grupos.Count; j++)
                {
                    if (Convert.ToInt32(chkListGrupos.Items[i].Value) == u.Grupos[j].Grupo_id)
                        chkListGrupos.Items[i].Selected = true;
                }
            }

        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            ddlUsuarios.Enabled = false;

            hdCodigoUsuario.Value = "";
            hdLegajo.Value = "";
            hdMail.Value = "";
            txtDescripcion.Text = "";
            txtLegajo.Text = "";
            txtMailUser.Text = "";
            txtPassUser.Text = "";
            txtUsuarioID.Text = "";
            chkActivo.Checked = false;
            modo.Value = "ALTA";

            chkListGrupos.Items.Clear();

            conAdminstracion.CargarGrupos(chkListGrupos);
        }
    }
}