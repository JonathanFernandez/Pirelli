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
using Controles;
namespace PirelliReports.Site
{
    public partial class Promociones : PirelliMaster
    {
        public ArrayList promociones = new ArrayList();
        ConexionZoTipoPromo conZoTipoPromo = new ConexionZoTipoPromo();
        PirelliMetodos pMetodos = new PirelliMetodos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarPromociones(ddlPromociones);
            }
        }

        private void cargarPromociones(DropDownList ddl)
        {
            promociones = conZoTipoPromo.ListadoPromociones();

            foreach (ZoTipoPromo prom in promociones)
            {
                ddl.Items.Add(new ListItem(prom.DescTipoPromo,prom.CodTipoPromo.ToString()));
            }
            ddlPromociones.SelectedIndex = 0;
            codigoPromo.Value = ((ZoTipoPromo)promociones[0]).CodTipoPromo.ToString();
            txtDescTipoPromo.Text = ((ZoTipoPromo)promociones[0]).DescTipoPromo;
            chkBajaLogica.Checked = ((ZoTipoPromo)promociones[0]).FlgBajaLogica == "1" ? true : false;
            dpDesde.Text = ((ZoTipoPromo)promociones[0]).FecDesde.ToString("MM/dd/yyyy");
            dpHasta.Text = ((ZoTipoPromo)promociones[0]).FecHasta.ToString("MM/dd/yyyy");
            txtDomingo.Text = ((ZoTipoPromo)promociones[0]).Cuota1.ToString();
            txtLunes.Text = ((ZoTipoPromo)promociones[0]).Cuota2.ToString();
            txtMartes.Text = ((ZoTipoPromo)promociones[0]).Cuota3.ToString();
            txtMiercoles.Text = ((ZoTipoPromo)promociones[0]).Cuota4.ToString();
            txtJueves.Text = ((ZoTipoPromo)promociones[0]).Cuota5.ToString();
            txtViernes.Text = ((ZoTipoPromo)promociones[0]).Cuota6.ToString();
            txtSabado.Text = ((ZoTipoPromo)promociones[0]).Cuota7.ToString();
            txtDescu1.Text = ((ZoTipoPromo)promociones[0]).Descu1.ToString();
            txtDescu2.Text = ((ZoTipoPromo)promociones[0]).Descu2.ToString();
            txtDescu3.Text = ((ZoTipoPromo)promociones[0]).Descu3.ToString();
            txtDescu4.Text = ((ZoTipoPromo)promociones[0]).Descu4.ToString();
            txtDescu5.Text = ((ZoTipoPromo)promociones[0]).Descu5.ToString();
            txtDescu6.Text = ((ZoTipoPromo)promociones[0]).Descu6.ToString();
            txtDescu7.Text = ((ZoTipoPromo)promociones[0]).Descu7.ToString();
            
        }

        protected void ddlPromociones_SelectedIndexChanged(object sender, EventArgs e)
        {
            promociones = conZoTipoPromo.ListadoPromociones();
            ZoTipoPromo p = new ZoTipoPromo();

            foreach (ZoTipoPromo prom in promociones)
            {
                if (prom.CodTipoPromo == Convert.ToInt32(ddlPromociones.SelectedItem.Value))
                {
                    p = prom;
                }
            }
            //ddlPromociones.SelectedItem.Value;
            codigoPromo.Value = p.CodTipoPromo.ToString();
            txtDescTipoPromo.Text = p.DescTipoPromo;
            chkBajaLogica.Checked = p.FlgBajaLogica == "1" ? true:false;
            dpDesde.Text = p.FecDesde.ToString("MM/dd/yyyy");
            dpHasta.Text = p.FecHasta.ToString("MM/dd/yyyy");
            txtDomingo.Text = p.Cuota1.ToString();
            txtLunes.Text = p.Cuota2.ToString();
            txtMartes.Text = p.Cuota3.ToString();
            txtMiercoles.Text = p.Cuota4.ToString();
            txtJueves.Text = p.Cuota5.ToString();
            txtViernes.Text = p.Cuota6.ToString();
            txtSabado.Text = p.Cuota7.ToString();
            txtDescu1.Text = p.Descu1.ToString();
            txtDescu2.Text = p.Descu2.ToString();
            txtDescu3.Text = p.Descu3.ToString();
            txtDescu4.Text = p.Descu4.ToString();
            txtDescu5.Text = p.Descu5.ToString();
            txtDescu6.Text = p.Descu6.ToString();
            txtDescu7.Text = p.Descu7.ToString();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ZoTipoPromo p;
            if (modo.Value == "EDITAR")
            {
                promociones = conZoTipoPromo.ListadoPromociones();
                p = new ZoTipoPromo();

                foreach (ZoTipoPromo prom in promociones)
                {
                    if (prom.CodTipoPromo == Convert.ToInt32(ddlPromociones.SelectedItem.Value))
                    {
                        p = prom;
                    }
                }

                //p.CodTipoPromo = Convert.ToInt32 =
                p.DescTipoPromo = txtDescTipoPromo.Text;
                p.FlgBajaLogica = chkBajaLogica.Checked == true ? "1" : "0";
                p.FecDesde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
                p.FecHasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));
                p.Cuota1 = Convert.ToInt32(txtDomingo.Text);
                p.Cuota2 = Convert.ToInt32(txtLunes.Text);
                p.Cuota3 = Convert.ToInt32(txtMartes.Text);
                p.Cuota4 = Convert.ToInt32(txtMiercoles.Text);
                p.Cuota5 = Convert.ToInt32(txtJueves.Text);
                p.Cuota6 = Convert.ToInt32(txtViernes.Text);
                p.Cuota7 = Convert.ToInt32(txtSabado.Text);
                p.Descu1 = Convert.ToDouble(txtDescu1.Text);
                p.Descu2 = Convert.ToDouble(txtDescu2.Text);
                p.Descu3 = Convert.ToDouble(txtDescu3.Text);
                p.Descu4 = Convert.ToDouble(txtDescu4.Text);
                p.Descu5 = Convert.ToDouble(txtDescu5.Text);
                p.Descu6 = Convert.ToDouble(txtDescu6.Text);
                p.Descu7 = Convert.ToDouble(txtDescu7.Text);

                conZoTipoPromo.ModicarPromoVisa(p);
            }
            else
            {
                p = new ZoTipoPromo();
                //p.CodTipoPromo = Convert.ToInt32(codigoPromo.Value);
                p.DescTipoPromo = txtDescTipoPromo.Text;
                p.FlgBajaLogica = chkBajaLogica.Checked == true ? "1" : "0";
                p.FecDesde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
                p.FecHasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));
                p.Cuota1 = Convert.ToInt32(txtDomingo.Text);
                p.Cuota2 = Convert.ToInt32(txtLunes.Text);
                p.Cuota3 = Convert.ToInt32(txtMartes.Text);
                p.Cuota4 = Convert.ToInt32(txtMiercoles.Text);
                p.Cuota5 = Convert.ToInt32(txtJueves.Text);
                p.Cuota6 = Convert.ToInt32(txtViernes.Text);
                p.Cuota7 = Convert.ToInt32(txtSabado.Text);
                p.Descu1 = Convert.ToInt32(txtDescu1.Text);
                p.Descu2 = Convert.ToInt32(txtDescu2.Text);
                p.Descu3 = Convert.ToInt32(txtDescu3.Text);
                p.Descu4 = Convert.ToInt32(txtDescu4.Text);
                p.Descu5 = Convert.ToInt32(txtDescu5.Text);
                p.Descu6 = Convert.ToInt32(txtDescu6.Text);
                p.Descu7 = Convert.ToInt32(txtDescu7.Text);
            }
        }
        

       
    }
}