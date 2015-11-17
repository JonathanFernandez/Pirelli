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

        public DataTable VentaTotalxCTC(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataTable dt = new DataTable();
            //DataTable dt = new DataTable();
            dt = ado.ExecuteStoredProcedureDT("VENTATOTALXCTC", parametros);

            return dt;
        }
    }
}