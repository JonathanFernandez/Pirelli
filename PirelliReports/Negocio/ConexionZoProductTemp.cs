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
    public class ConexionZoProductTemp
    {
        public DataSet ListadoDeProductosTemp()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_PRODUCTOS_TEMP");

            return ds;
        }

        public bool DeleteProductTemp()
        {
            AdoConn ado = new AdoConn();
            ado.ExecuteNonStoredProcedure("SP_DELETE_PRODUC1_TEMP");
            return true;
        }

        public bool InsertarProductoTemp(List<Zoprodu> productos)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros;
           

            foreach (Zoprodu prod in productos)
            {
                parametros = new ArrayList();
                parametros.Add(prod.IP);
                parametros.Add(prod.Descrip);
                parametros.Add(prod.Pais);
                parametros.Add(prod.Otro);
                parametros.Add(prod.Familia);
                parametros.Add(prod.Marca);
                parametros.Add(prod.Rango);

                ds = ado.ExecuteStoredProcedureDS("SP_INSERT_PRODUC1_TEMP", parametros);
            }

            return true;
        }

        public bool sincronizarProductosTemp()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //ds = ado.ExecuteStoredProcedureDS("SP_SINCRONIZAR_PRODUCTOS");
            ado.ExecuteNonStoredProcedure("SP_SINCRONIZAR_PRODUCTOS");

            return true;
        }
    }
}