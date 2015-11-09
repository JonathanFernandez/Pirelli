using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DBLayer;
using Entidades;
using System.Collections;

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

        public bool InsertarProductoTemp(Zoprodu arg)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(arg.IP);
            parametros.Add(arg.Descrip);
            parametros.Add(arg.Pais);
            parametros.Add(arg.Otro);
            parametros.Add(arg.Familia);
            parametros.Add(arg.Marca);
            parametros.Add(arg.Rango);

            ds = ado.ExecuteStoredProcedureDS("SP_INSERT_PRODUC1_TEMP", parametros);

            //if (ds.Tables[0].Rows.Count > 0)
            //    return true;
            //else
            //    return false;
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

            

            //if (ds.Tables[0].Rows.Count > 0)
            //    return true;
            //else
            //    return false;
            return true;
        }

        public bool borrarProductos()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_DELETE_ALL_PRODUC1_TEMP");

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
            //if (ds.Tables[0].Rows.Count > 0)
            //    return true;
            //else
            //    return false;
        }
    }
}