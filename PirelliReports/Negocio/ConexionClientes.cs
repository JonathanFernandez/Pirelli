using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;
using System.Web.UI.WebControls;
using Entidades;

namespace Negocio
{
    public class ConexionClientes
    {
        public ZoRegion RegionDelCliente(string codCliente)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(codCliente);

            ZoRegion reg = new ZoRegion();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_REGION_DEL_CLIENTE",parametros);
            if (ds.Tables[0].Rows.Count > 0)
            {
                reg.Reg_code = ds.Tables[0].Rows[0]["reg_cod"].ToString();
                reg.Descripcion = ds.Tables[0].Rows[0]["Descripcion"].ToString();
            }
            return reg;
        }
        public DataSet ListadoGeoClientesDeFacturas(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_GEO_CLIENTES_SOLICITUDES",parametros);

            return ds;
        }
        public DataSet ListadoClientesActivos()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_CLIENTES_ACTIVOS");

            return ds;
        }
        public DataSet ListadoClientes()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ZOCLIENTE");

            return ds;
        }
        public DataSet ListadoClientes(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ZOCLIENTE",parametros);

            return ds;
        }

        public ZoCliente TraerCliente(string cod)
        {
            ZoCliente cliente = new ZoCliente();
            ArrayList parametros = new ArrayList();
            parametros.Add(cod);
            parametros.Add("%");
            parametros.Add("%");
            parametros.Add("%");
            
            DataSet ds = new DataSet();
            ds = ListadoClientes(parametros);

            if (ds.Tables[0].Rows.Count > 0)
            {
                cliente.Cod = ds.Tables[0].Rows[0]["COD"].ToString();
                cliente.RazSoc = ds.Tables[0].Rows[0]["RAZSOC"].ToString();
                cliente.DirSuc = ds.Tables[0].Rows[0]["DIRSUC"].ToString();
                cliente.CodProv = ds.Tables[0].Rows[0]["CODPROV"].ToString();
                cliente.TelefonoSuc = ds.Tables[0].Rows[0]["TELEFONOSUC"].ToString();
                cliente.Ciudad = ds.Tables[0].Rows[0]["CIUDAD"].ToString();
            }

            return cliente;
        }
        public void CargarClientes(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            
            ds = ListadoClientes();

            if (ds.Tables[0].Rows.Count > 0)
            {
                string mostrar;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["COD"].ToString() +") "+ ds.Tables[0].Rows[i]["RAZSOC"].ToString();
                    ddl.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["COD"].ToString()));
                }
            }
        }
        public DataSet ListadoAlteraClientes()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ALTERA_CLIENTE");

            return ds;
        }

        public bool VerificarClienteExistente(string codigo)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(codigo);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICAR_CLIENTE_EXISTENTE",parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }

        public bool ModificarAlteraCliente(string codigo, string codigoNuevo, string usuario)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(codigo);
            parametros.Add(codigoNuevo);
            parametros.Add(usuario);
           
            ds = ado.ExecuteStoredProcedureDS("SP_UPDATE_ALTERA_CLIENTE", parametros);

            return true;
        }

        public bool ModificarAlteraCliente(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_MODIFICAR_ZOCLIEN", parametros);

            return true;
        }

        public void cargarClientesMatriz(CheckBoxList ckhList)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeClientesMatriz();
            
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ckhList.Items.Add(new ListItem(ds.Tables[0].Rows[i]["RAZSOC"].ToString(), ds.Tables[0].Rows[i]["CODCLIMATRIZ"].ToString()));
                }
            }
        }

        private DataSet ListadoDeClientesMatriz()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_LISTADO_CLIENTES_MATRIZ");

            return ds;
        }

        public void CargarClienteDeCTC(DropDownList ddl, string ctc)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeClientesDeCTC(ctc);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["RAZSOC"].ToString(), ds.Tables[0].Rows[i]["COD"].ToString()));
                }
            }
        }

        private DataSet ListadoDeClientesDeCTC(string ctc)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(ctc);
            ds = ado.ExecuteStoredProcedureDS("SP_LISTADO_CLIENTES_DE_CTC",parametros);

            return ds;
        }
    }
}