using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;

namespace Negocio
{
    public class ConexionClientes
    {
        public DataSet ListadoGeoClientesDeFacturas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_GEO_CLIENTES_SOLICITUDES");

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
    }
}