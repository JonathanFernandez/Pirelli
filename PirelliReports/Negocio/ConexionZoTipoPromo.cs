using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;
using Entidades;

namespace Negocio
{
    public class ConexionZoTipoPromo
    {
        public ArrayList ListadoPromociones()
        {
            ArrayList promosVisa = new ArrayList();
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ZoTipoPromo promo;
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_PROMOCIONES");

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    promo = new ZoTipoPromo();
                    promo.CodTipoPromo = Convert.ToInt32(ds.Tables[0].Rows[i]["CodTipoPromo"]);
                    promo.DescTipoPromo = ds.Tables[0].Rows[i]["DescTipoPromo"].ToString();
                    promo.FecDesde = Convert.ToDateTime(ds.Tables[0].Rows[i]["FecDesde"]);
                    promo.FecHasta = Convert.ToDateTime(ds.Tables[0].Rows[i]["FecHasta"]);
                    promo.FlgBajaLogica = ds.Tables[0].Rows[i]["FlgBajaLogica"].ToString();
                    promo.Cuota1 = Convert.ToInt32(ds.Tables[0].Rows[i]["Cuota1"]);
                    promo.Cuota2 = Convert.ToInt32(ds.Tables[0].Rows[i]["Cuota2"]);
                    promo.Cuota3 = Convert.ToInt32(ds.Tables[0].Rows[i]["Cuota3"]);
                    promo.Cuota4 = Convert.ToInt32(ds.Tables[0].Rows[i]["Cuota4"]);
                    promo.Cuota5 = Convert.ToInt32(ds.Tables[0].Rows[i]["Cuota5"]);
                    promo.Cuota6 = Convert.ToInt32(ds.Tables[0].Rows[i]["Cuota6"]);
                    promo.Cuota7 =Convert.ToInt32( ds.Tables[0].Rows[i]["Cuota7"]);
                    promo.Descu1 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu1"]);
                    promo.Descu2 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu2"]);
                    promo.Descu3 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu3"]);
                    promo.Descu4 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu4"]);
                    promo.Descu5 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu5"]);
                    promo.Descu6 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu6"]);
                    promo.Descu7 = Convert.ToDouble(ds.Tables[0].Rows[i]["Descu7"]);
                    promosVisa.Add(promo);
                }
            }

            return promosVisa;
        }

        public bool ModicarPromoVisa(ZoTipoPromo promo)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();

            parametros.Add(promo.CodTipoPromo);
            parametros.Add(promo.DescTipoPromo);
            parametros.Add(promo.FecDesde);
            parametros.Add(promo.FecHasta);
            parametros.Add(promo.Descu1);
            parametros.Add(promo.Descu2);
            parametros.Add(promo.Descu3);
            parametros.Add(promo.Descu4);
            parametros.Add(promo.Descu5);
            parametros.Add(promo.Descu6);
            parametros.Add(promo.Descu7);
            parametros.Add(promo.Cuota1);
            parametros.Add(promo.Cuota2);
            parametros.Add(promo.Cuota3);
            parametros.Add(promo.Cuota4);
            parametros.Add(promo.Cuota5);
            parametros.Add(promo.Cuota6);
            parametros.Add(promo.Cuota7);
            parametros.Add(promo.FlgBajaLogica);

            ado.ExecuteNonStoredProcedure("SP_MODIFICAR_ZOPROMO", parametros);

            return true;
        }
        public bool InsertarPromoVisa(ZoTipoPromo promo)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();

            parametros.Add(promo.DescTipoPromo);
            parametros.Add(promo.FecDesde);
            parametros.Add(promo.FecHasta);
            parametros.Add(promo.Descu1);
            parametros.Add(promo.Descu2);
            parametros.Add(promo.Descu3);
            parametros.Add(promo.Descu4);
            parametros.Add(promo.Descu5);
            parametros.Add(promo.Descu6);
            parametros.Add(promo.Descu7);
            parametros.Add(promo.Cuota1);
            parametros.Add(promo.Cuota2);
            parametros.Add(promo.Cuota3);
            parametros.Add(promo.Cuota4);
            parametros.Add(promo.Cuota5);
            parametros.Add(promo.Cuota6);
            parametros.Add(promo.Cuota7);
            parametros.Add(promo.FlgBajaLogica);

            ado.ExecuteNonStoredProcedure("SP_INSERTAR_ZOPROMO", parametros);

            return true;
        }
    }
}