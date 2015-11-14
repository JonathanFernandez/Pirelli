using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Collections;
using DBLayer;
using Entidades;


namespace Negocio
{
    public class ConexionZoClienteTemp
    {
         public DataSet ListadoDeClientesTemp()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_CLIENTES_TEMP");

            return ds;
        }

        public bool InsertarClientesTemp(List <ZoCliente> clientes)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            
            foreach (ZoCliente item in clientes)
            {
                parametros = new ArrayList();
                parametros.Add(item.Cod);
                parametros.Add(item.Cuit);
                parametros.Add(item.Tipo);
                parametros.Add(item.RazSoc);
                parametros.Add(item.DirSuc);
                parametros.Add(item.Ciudad);
                parametros.Add(item.Pais);
                parametros.Add(item.TelefonoSuc);
                parametros.Add(item.CodRegion);
                parametros.Add(item.Latitud);
                parametros.Add(item.Longitud);

                ds = ado.ExecuteStoredProcedureDS("SP_INSERT_CLIEN1_TEMP", parametros);
            }
            return true;
        }

        public bool sincronizarClientesTemp()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();

            ado.ExecuteNonStoredProcedure("SP_SINCRONIZAR_CLIENTES");

            return true;
        }
        
    }
}