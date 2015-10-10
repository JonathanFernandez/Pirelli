using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
namespace Negocio
{
    public class ConexionFacturasPromo
    {
        public DataSet ListadoDeFacturas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES");

            return ds;
        }
    }
}