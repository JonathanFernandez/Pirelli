using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;

namespace Negocio
{
    public class ConexionZoProduct
    {
        public DataSet ListadoAlteraIp()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ALTERA_IP");

            return ds;
        }
    }
}