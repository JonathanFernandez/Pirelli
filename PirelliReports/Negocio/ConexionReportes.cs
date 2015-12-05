using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;


namespace Negocio
{
    public class ConexionReportes
    {
        public DataTable IPXRegion(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("IpXRegion", parametros);

            return dt;
        }
        public DataTable IPXCliente(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("IPXCLIENTE", parametros);

            return dt;
        }

        public DataTable MensualXCliente(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("SP_MENSUAL_POR_CLIENTE", parametros);

            return dt;
        }
        public DataTable AnualCliente(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("SP_ANUAL_CLIENTE",parametros);

            return dt;
        }
        public DataTable VentaTotalxCTC(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("VENTATOTALXCTC", parametros);

            return dt;
        }

        public DataTable VentaTotalxCTCxCliente(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("VENTATOTALXCTCXCLIENTE", parametros);

            return dt;
        }
    }
}