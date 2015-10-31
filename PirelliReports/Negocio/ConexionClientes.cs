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
        public DataSet ListaodAlteraClientes()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ALTERA_CLIENTE");

            return ds;
        }
    }
}