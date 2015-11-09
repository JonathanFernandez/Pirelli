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

        public void cargarProvincia(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeProvincias();

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["ZODESC"].ToString(), ds.Tables[0].Rows[i]["ZOCOD"].ToString()));
                }
            }


        }
    }
}