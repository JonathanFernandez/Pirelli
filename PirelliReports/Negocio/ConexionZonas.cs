using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;

namespace Negocio
{
    public class ConexionZonas
    {
        public DataSet ListadoDeProvincias()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_PROVINCIAS");

            return ds;
        }

        public DataSet ListadoDeRegion()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_REGION");

            return ds;
        }
    }
}