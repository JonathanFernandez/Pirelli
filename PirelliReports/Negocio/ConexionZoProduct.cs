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

        public bool VerificarIpExistente(string ip)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(ip);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICAR_IP_EXISTENTE", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
        public bool ModificarAlteraIp(string ip, string ipNuevo, string usuario)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(ip);
            parametros.Add(ipNuevo);
            parametros.Add(usuario);

            ds = ado.ExecuteStoredProcedureDS("SP_UPDATE_ALTERA_IP", parametros);

            return true;
        }

    }
}