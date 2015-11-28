using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using Entidades;
using System.Data;
using System.Collections;

namespace Negocio
{
    public class ConexionZoSolicitudAlteraStatus
    {
        public bool InsertarSolicitudes(List<ZoSolicitud> solicitudes)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros;

            foreach (ZoSolicitud solicitud in solicitudes)
            {
                parametros = new ArrayList();
                parametros.Add(solicitud.CodSolicitud);
                parametros.Add(solicitud.FlgProcesado);
                parametros.Add(solicitud.Nota);

                ds = ado.ExecuteStoredProcedureDS("SP_INSERT_SOLICITUD_ALTERA_STATUS", parametros);
            }

            return true;
        }

        public DataSet ListadoDeSolicitudes()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_SOLICITUD_ALTERA_STATUS");

            return ds;
        }

        public bool actualizarSolicitudes()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //ds = ado.ExecuteStoredProcedureDS("SP_SINCRONIZAR_PRODUCTOS");
            ado.ExecuteNonStoredProcedure("SP_ALTERA_STATUS_CODSOL");

            return true;
        }

        public bool BorrarSolicitudes()
        {
            AdoConn ado = new AdoConn();
            ado.ExecuteNonStoredProcedure("SP_DELETE_SOLICITUD_ALTERA_STATUS");
            return true;
        }

    }
}