using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using Controles;
using System.Data;
using System.Collections;
using System.IO;
using Subgurim.Controles;
using System.Drawing;
using System.Configuration;

namespace PirelliReports.Site
{
    public partial class ModificarClienteIP : PirelliMaster
    {
        ConexionClientes conClientes = new ConexionClientes();
        ConexionZoProduct conZoProduct = new ConexionZoProduct();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (radioIP.Checked)
                    gvListadosCliente_Ip.DataSource = conZoProduct.ListadoAlteraIp();
                else
                    gvListadosCliente_Ip.DataSource = conClientes.ListadoAlteraClientes();

                gvListadosCliente_Ip.DataBind();
            }
        }

        protected void radioClienteIP_CheckedChanged(object sender, EventArgs e)
        {
            if (radioIP.Checked)
            {
                gvListadosCliente_Ip.DataSource = conZoProduct.ListadoAlteraIp();
                txtNuevoValor.MaxLength = 7;
                txtValorModificar.MaxLength = 7;
            }
            else
            {
                gvListadosCliente_Ip.DataSource = conClientes.ListadoAlteraClientes();
                txtNuevoValor.MaxLength = 10;
                txtValorModificar.MaxLength = 10;
            }

            gvListadosCliente_Ip.DataBind();
        }

        protected void gvListadosCliente_Ip_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtValorModificar.Text = gvListadosCliente_Ip.SelectedRow.Cells[1].Text;
        }

        protected void btnAplicar_Click(object sender, EventArgs e)
        {
            
            
            if (radioIP.Checked)
            {
                if (conZoProduct.VerificarIpExistente(txtValorModificar.Text))
                {
                    if (conZoProduct.VerificarIpExistente(txtNuevoValor.Text))
                    {
                        conZoProduct.ModificarAlteraIp(txtValorModificar.Text, txtNuevoValor.Text, User.Usu_id);

                        lblMensage.Text = "Se realizo el cambio " + txtValorModificar.Text + " -> por " + txtNuevoValor.Text;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    }
                    else
                    {
                        lblMensage.Text = "El neumático " + txtNuevoValor.Text + " no existe";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    }

                }
                else
                {
                    lblMensage.Text = "El neumático " + txtValorModificar.Text + " no existe";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }

            }
            else
            {
                if (conClientes.VerificarClienteExistente(txtValorModificar.Text))
                {
                    if (conClientes.VerificarClienteExistente(txtNuevoValor.Text))
                    {
                        conClientes.ModificarAlteraCliente(txtValorModificar.Text, txtNuevoValor.Text, User.Usu_id);
                        lblMensage.Text = "Se realizo el cambio " + txtValorModificar.Text + " -> por " + txtNuevoValor.Text;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    }
                    else
                    {
                        lblMensage.Text = "El cliente " + txtNuevoValor.Text + " no existe";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    }
                   
                }
                else
                {
                    lblMensage.Text = "El cliente " + txtValorModificar.Text + " no existe";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                

            }
             

        }

       
    }
}