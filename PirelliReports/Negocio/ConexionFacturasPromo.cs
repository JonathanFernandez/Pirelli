using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;
namespace Negocio
{
    public class ConexionFacturasPromo
    {
        public DataSet ListadoDeFacturas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES");

            return ds;
        }
        public DataSet ListadoDeFacturas(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES", parametros);

            return ds;
        }
        public DataSet ListadoDeFamilia()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_FAMILIA");

            return ds;
        }
    }
}