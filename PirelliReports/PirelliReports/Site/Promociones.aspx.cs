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
            //dpDesde.Text = ((ZoTipoPromo)promociones[0]).FecDesde.ToString("MM/dd/yyyy");
            //dpHasta.Text = ((ZoTipoPromo)promociones[0]).FecHasta.ToString("MM/dd/yyyy");
            dpDesde.Text = ((ZoTipoPromo)promociones[0]).FecDesde.ToString("dd/MM/yyyy");
            dpHasta.Text = ((ZoTipoPromo)promociones[0]).FecHasta.ToString("dd/MM/yyyy");
            txtDomingo.Text = ((ZoTipoPromo)promociones[0]).Cuota1.ToString();
            txtLunes.Text = ((ZoTipoPromo)promociones[0]).Cuota2.ToString();
            txtMartes.Text = ((ZoTipoPromo)promociones[0]).Cuota3.ToString();
            txtMiercoles.Text = ((ZoTipoPromo)promociones[0]).Cuota4.ToString();
            txtJueves.Text = ((ZoTipoPromo)promociones[0]).Cuota5.ToString();
            txtViernes.Text = ((ZoTipoPromo)promociones[0]).Cuota6.ToString();
            txtSabado.Text = ((ZoTipoPromo)promociones[0]).Cuota7.ToString();
            txtDescu1.Text = ((ZoTipoPromo)promociones[0]).Descu1.ToString().Replace(",", ".");
            txtDescu2.Text = ((ZoTipoPromo)promociones[0]).Descu2.ToString().Replace(",", ".");
            txtDescu3.Text = ((ZoTipoPromo)promociones[0]).Descu3.ToString().Replace(",", ".");
            txtDescu4.Text = ((ZoTipoPromo)promociones[0]).Descu4.ToString().Replace(",", ".");
            txtDescu5.Text = ((ZoTipoPromo)promociones[0]).Descu5.ToString().Replace(",", ".");
            txtDescu6.Text = ((ZoTipoPromo)promociones[0]).Descu6.ToString().Replace(",", ".");
            txtDescu7.Text = ((ZoTipoPromo)promociones[0]).Descu7.ToString().Replace(",", ".");
            
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
            //dpDesde.Text = p.FecDesde.ToString("MM/dd/yyyy");
            //dpHasta.Text = p.FecHasta.ToString("MM/dd/yyyy");
            dpDesde.Text = p.FecDesde.ToString("dd/MM/yyyy");
            dpHasta.Text = p.FecHasta.ToString("dd/MM/yyyy");
            txtDomingo.Text = p.Cuota1.ToString();
            txtLunes.Text = p.Cuota2.ToString();
            txtMartes.Text = p.Cuota3.ToString();
            txtMiercoles.Text = p.Cuota4.ToString();
            txtJueves.Text = p.Cuota5.ToString();
            txtViernes.Text = p.Cuota6.ToString();
            txtSabado.Text = p.Cuota7.ToString();
            txtDescu1.Text = p.Descu1.ToString().Replace(",", ".");
            txtDescu2.Text = p.Descu2.ToString().Replace(",", ".");
            txtDescu3.Text = p.Descu3.ToString().Replace(",", ".");
            txtDescu4.Text = p.Descu4.ToString().Replace(",", ".");
            txtDescu5.Text = p.Descu5.ToString().Replace(",", ".");
            txtDescu6.Text = p.Descu6.ToString().Replace(",", ".");
            txtDescu7.Text = p.Descu7.ToString().Replace(",", ".");

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
                //p.FecDesde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
                //p.FecHasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));
                p.FecDesde = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpDesde.Text));
                p.FecHasta = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpHasta.Text));
                p.Cuota1 = Convert.ToInt32(txtDomingo.Text);
                p.Cuota2 = Convert.ToInt32(txtLunes.Text);
                p.Cuota3 = Convert.ToInt32(txtMartes.Text);
                p.Cuota4 = Convert.ToInt32(txtMiercoles.Text);
                p.Cuota5 = Convert.ToInt32(txtJueves.Text);
                p.Cuota6 = Convert.ToInt32(txtViernes.Text);
                p.Cuota7 = Convert.ToInt32(txtSabado.Text);
                p.Descu1 = Convert.ToDouble(txtDescu1.Text.Replace(".", ","));
                p.Descu2 = Convert.ToDouble(txtDescu2.Text.Replace(".", ","));
                p.Descu3 = Convert.ToDouble(txtDescu3.Text.Replace(".", ","));
                p.Descu4 = Convert.ToDouble(txtDescu4.Text.Replace(".", ","));
                p.Descu5 = Convert.ToDouble(txtDescu5.Text.Replace(".", ","));
                p.Descu6 = Convert.ToDouble(txtDescu6.Text.Replace(".", ","));
                p.Descu7 = Convert.ToDouble(txtDescu7.Text.Replace(".", ","));

                conZoTipoPromo.ModicarPromoVisa(p);
                lblMensaje.Text = "La factura se modifico correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else
            {
                p = new ZoTipoPromo();
                //p.CodTipoPromo = Convert.ToInt32(codigoPromo.Value);
                p.DescTipoPromo = txtDescTipoPromo.Text;
                p.FlgBajaLogica = chkBajaLogica.Checked == true ? "1" : "0";
                //p.FecDesde = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpDesde.Text));
                //p.FecHasta = Convert.ToDateTime(pMetodos.ConvertmmddyyyyToyyyymmdd(dpHasta.Text));
                p.FecDesde = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpDesde.Text));
                p.FecHasta = Convert.ToDateTime(pMetodos.ConvertddmmyyyyToyyyymmdd(dpHasta.Text));
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

                conZoTipoPromo.InsertarPromoVisa(p);

                lblMensaje.Text = "La factura se creo correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Site/Promociones.aspx", false);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            ddlPromociones_SelectedIndexChanged(sender, e);
        }
        
                   
    }
}