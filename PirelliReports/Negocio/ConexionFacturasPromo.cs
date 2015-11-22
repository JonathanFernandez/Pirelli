using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;
using System.Web.UI.WebControls;
namespace Negocio
{
    public class ConexionFacturasPromo
    {
        public bool ProcresarZoSolicitudDatosExternos()
        {
            AdoConn ado = new AdoConn();

            ado.ExecuteNonStoredProcedure("SP_PROCESA_ZOSOLICITUD_DATOSEXTERNOS");

            return true;
        }
        public DataSet ListadoDeZoDatosExternos()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ZOSOLICITUD_DATOSEXTERNOS");

            return ds;
        }
        
        public DataSet ListadoDeFacturas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES2");

            return ds;
        }
        public DataSet ListadoDeFacturasEnvioSAP(string CodigoCliente, string Descripcion, string Promo, int CantidadRegistro, string FamiliaAgrup)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(CodigoCliente) ? "%%" : CodigoCliente));
            //parametros.Add(CodigoCliente);
            parametros.Add((string.IsNullOrEmpty(Descripcion) ? "%%" : Descripcion));
           // parametros.Add(Descripcion);
            parametros.Add("%%");
            parametros.Add("0");

            parametros.Add((string.IsNullOrEmpty(Promo) ? "%%" : Promo));
           // parametros.Add(Promo);
            parametros.Add(CantidadRegistro);
            parametros.Add((string.IsNullOrEmpty(FamiliaAgrup) ? "%" : FamiliaAgrup));
           // parametros.Add(FamiliaAgrup);

            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES_SAP",parametros);

            return ds;
        }
        public DataSet ListadoDeFacturasEnvioSAP()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES_SAP");

            return ds;
        }
        public DataSet ListadoDeFacturas(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES2", parametros);

            return ds;
        }
        public void CargarFamiliaAgrup(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeFamiliaAgrup();
            ddl.Items.Add(new ListItem("TODOS", "%"));
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["FAMIAGRDESC"].ToString(), ds.Tables[0].Rows[i]["FAMIAGRCODI"].ToString()));
                }
            }
        }
        public DataSet ListadoDeFamiliaAgrup()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_FAMILIA_AGRUP");

            return ds;
        }
        public DataSet ListadoDeFamilia()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_FAMILIA");

            return ds;
        }

        public DataSet ListadoDeTipoPromo()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_TIPO_PROMO");

            return ds;
        }

        public DataSet ListadoDeMedidas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_MEDIDAS_ACTIVAS");

            return ds;
        }


        public DataSet ListadoDeIPFilBusqueda()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_IP_FLGFILBUSQ");

            return ds;
        }

        public void CargarIPFilBusqueda(CheckBoxList chklist)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeIPFilBusqueda();

            if (ds.Tables[0].Rows.Count > 0)
            {
                string mostrar;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["IP"].ToString() +") " +  ds.Tables[0].Rows[i]["DESCRIP"].ToString();
                    chklist.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["IP"].ToString()));
                    if (ds.Tables[0].Rows[i]["FLGFILBUSQ"].ToString() == "1")
                        chklist.Items[i].Selected = true;
                }
            }
        }
        public DataSet ListadoDeClienteFilBusqueda()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_CLIENTE_FLGFILBUSQ");

            return ds;
        }

        public void CargarClienteFilBusqueda(CheckBoxList chklist)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeClienteFilBusqueda();

            if (ds.Tables[0].Rows.Count > 0)
            {
                string mostrar;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["CODCLIE"].ToString() + ") " + ds.Tables[0].Rows[i]["RAZSOC"].ToString();
                    chklist.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["CODCLIE"].ToString()));
                    if (ds.Tables[0].Rows[i]["FLGFILBUSQ"].ToString() == "1")
                        chklist.Items[i].Selected = true;
                }
            }
        }

        public void ModificarFiltroBusquedaCliente(CheckBoxList chklist)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros;

            for (int i = 0; i < chklist.Items.Count; i++)
            {
                parametros = new ArrayList();
                parametros.Add(chklist.Items[i].Value);
                parametros.Add(chklist.Items[i].Selected ? "1" : "0");
                ado.ExecuteNonStoredProcedure("SP_MODIFICAR_CLIENTE_FLGFILBUSQ", parametros);
            }
        }

        public void ModificarFiltroBusquedaIP(CheckBoxList chklist)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros;

            for (int i = 0; i < chklist.Items.Count; i++)
            {
                parametros = new ArrayList();
                parametros.Add(chklist.Items[i].Value);
                parametros.Add(chklist.Items[i].Selected ? "1" : "0");
                ado.ExecuteNonStoredProcedure("SP_MODIFICAR_IP_FLGFILBUSQ", parametros);
            }
        }
    }
}