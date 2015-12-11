using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Data;
using System.Collections;
using System.Web.UI.WebControls;
using Entidades;
namespace Negocio
{
    public class ConexionFacturasPromo
    {
        public ZoSolicitud TraerFactura(int codigo)
        {
            ZoSolicitud solicitud = new ZoSolicitud();
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(codigo);
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ZOSOLICITUD", parametros);
            if (ds.Tables[0].Rows.Count > 0)
            { 
                solicitud.CodSolicitud = Convert.ToInt32(ds.Tables[0].Rows[0]["CodSolicitud"]);
                solicitud.CodAgrup = Convert.ToInt32(ds.Tables[0].Rows[0]["CodAgrup"]);
                solicitud.Ip = ds.Tables[0].Rows[0]["Ip"].ToString();
                solicitud.Pais = ds.Tables[0].Rows[0]["Pais"].ToString();
                solicitud.CodClie = ds.Tables[0].Rows[0]["CodClie"].ToString();
                solicitud.FechaCompra = Convert.ToDateTime(ds.Tables[0].Rows[0]["FechaCompra"]);
                solicitud.Cantidad = Convert.ToInt32(ds.Tables[0].Rows[0]["Cantidad"]);
                solicitud.NroFactura = ds.Tables[0].Rows[0]["NroFactura"].ToString();
                solicitud.NroTicket = Convert.ToInt32(ds.Tables[0].Rows[0]["NroTicket"]);
                solicitud.NroCom = ds.Tables[0].Rows[0]["NroCom"].ToString();
                solicitud.NroTarjeta = Convert.ToInt32(ds.Tables[0].Rows[0]["NroTarjeta"]);
                solicitud.NroAuto = Convert.ToInt32(ds.Tables[0].Rows[0]["NroAuto"]);
                solicitud.NombreUsu = ds.Tables[0].Rows[0]["NombreUsu"].ToString();
                solicitud.DirUsu = ds.Tables[0].Rows[0]["DirUsu"].ToString();
                solicitud.Nro = ds.Tables[0].Rows[0]["Nro"].ToString();
                solicitud.Dpto = ds.Tables[0].Rows[0]["Dpto"].ToString();
                solicitud.Piso = ds.Tables[0].Rows[0]["Piso"].ToString();
                solicitud.Ciudad = ds.Tables[0].Rows[0]["Ciudad"].ToString();
                solicitud.CodProv = ds.Tables[0].Rows[0]["CodProv"].ToString();
                solicitud.Vehiculo = ds.Tables[0].Rows[0]["Vehiculo"].ToString();
                solicitud.Cuotas = Convert.ToInt32(ds.Tables[0].Rows[0]["Cuotas"]);
                solicitud.Telefono = ds.Tables[0].Rows[0]["Telefono"].ToString();
                solicitud.CodPos = ds.Tables[0].Rows[0]["CodPos"].ToString();
                solicitud.Precio = Convert.ToDouble(ds.Tables[0].Rows[0]["Precio"]);
                solicitud.FlgProcesado = ds.Tables[0].Rows[0]["FlgProcesado"].ToString();
                solicitud.CodPromo = Convert.ToInt32(ds.Tables[0].Rows[0]["CodPromo"]);
                solicitud.Descuento = Convert.ToInt32(ds.Tables[0].Rows[0]["Descuento"]);
                solicitud.CodAux = ds.Tables[0].Rows[0]["CodAux"].ToString();
                if (ds.Tables[0].Rows[0]["FecAlta"] != DBNull.Value)
                    solicitud.FecAlta = Convert.ToDateTime(ds.Tables[0].Rows[0]["FecAlta"]);
                solicitud.UsuAlta = ds.Tables[0].Rows[0]["UsuAlta"].ToString();
                if (ds.Tables[0].Rows[0]["FecUltAct"] != DBNull.Value)
                    solicitud.FecUltAct = Convert.ToDateTime(ds.Tables[0].Rows[0]["FecUltAct"]);
                solicitud.UsuUltAct = ds.Tables[0].Rows[0]["UsuUltAct"].ToString();
                if (ds.Tables[0].Rows[0]["FecSubSAP"] != DBNull.Value)
                    solicitud.FecSubSAP = Convert.ToDateTime(ds.Tables[0].Rows[0]["FecSubSAP"]);
                solicitud.Nota = ds.Tables[0].Rows[0]["Nota"].ToString();
                solicitud.Esker_Link = ds.Tables[0].Rows[0]["Esker_Link"].ToString();
                solicitud.Esker_ID = ds.Tables[0].Rows[0]["Esker_ID"].ToString();
                
            }

            return solicitud;
        }
        public void ModificarFactura(ZoSolicitud solicitud)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(solicitud.CodSolicitud);
            parametros.Add(solicitud.Ip);
            parametros.Add(solicitud.Pais);
            parametros.Add(solicitud.CodClie);
            parametros.Add(solicitud.FechaCompra);
            parametros.Add(solicitud.Cantidad);
            parametros.Add(solicitud.NroFactura);
            parametros.Add(solicitud.NombreUsu);
            parametros.Add(solicitud.DirUsu);
            parametros.Add(solicitud.Nro);
            parametros.Add(solicitud.Dpto);
            parametros.Add(solicitud.Piso);
            parametros.Add(solicitud.CodProv);
            parametros.Add(solicitud.Ciudad);
            parametros.Add(solicitud.Vehiculo);
            parametros.Add(solicitud.Cuotas);
            parametros.Add(solicitud.FlgProcesado);
            parametros.Add(solicitud.FecAlta);
            parametros.Add(solicitud.UsuAlta);
            parametros.Add(solicitud.Telefono);
            parametros.Add(solicitud.CodPos);
            parametros.Add(solicitud.NroTicket);
            parametros.Add(solicitud.NroCom);
            parametros.Add(solicitud.NroTarjeta);
            parametros.Add(solicitud.NroAuto);
            parametros.Add(solicitud.Precio);
            parametros.Add(solicitud.CodPromo);
            parametros.Add(solicitud.Descuento);
            parametros.Add(solicitud.CodAux);
            parametros.Add(solicitud.Nota);
            ado.ExecuteNonStoredProcedure("SP_UPDATE_ZOSOLICITUD", parametros);
        }
        public void InsertarFactura(ZoSolicitud solicitud)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(solicitud.Ip);
            parametros.Add(solicitud.Pais);
            parametros.Add(solicitud.CodClie);
            parametros.Add(solicitud.FechaCompra);
            parametros.Add(solicitud.Cantidad);
            parametros.Add(solicitud.NroFactura);
            parametros.Add(solicitud.NombreUsu);
            parametros.Add(solicitud.DirUsu);
            parametros.Add(solicitud.Nro);
            parametros.Add(solicitud.Dpto);
            parametros.Add(solicitud.Piso);
            parametros.Add(solicitud.CodProv);
            parametros.Add(solicitud.Ciudad);
            parametros.Add(solicitud.Vehiculo);
            parametros.Add(solicitud.Cuotas);
            parametros.Add(solicitud.FlgProcesado);
            parametros.Add(solicitud.FecAlta);
            parametros.Add(solicitud.UsuAlta);
            parametros.Add(solicitud.Telefono);
            parametros.Add(solicitud.CodPos);
            parametros.Add(solicitud.NroTicket);
            parametros.Add(solicitud.NroCom);
            parametros.Add(solicitud.NroTarjeta);
            parametros.Add(solicitud.NroAuto);
            parametros.Add(solicitud.Precio);
            parametros.Add(solicitud.CodPromo);
            parametros.Add(solicitud.Descuento);
            parametros.Add(solicitud.CodAux);
            parametros.Add(solicitud.Nota);
            ado.ExecuteNonStoredProcedure("SP_INSERT_ZOSOLICITUD", parametros);
        }
        public DataSet CargarPromosVigentesDelDiaSeleccionado(DropDownList dll, DateTime fecha)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(fecha);
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_PROMOVIGENTES_PORDIA", parametros);

            return ds;
        }
        public DataSet PromosVigentesDelDiaSeleccionado(DateTime fecha, int codPromo)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(fecha);
            parametros.Add(codPromo);
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_PROMODELDIA", parametros);

            return ds;
        }
        public bool ProcresarZoSolicitudDatosExternos()
        {
            AdoConn ado = new AdoConn();

            ado.ExecuteNonStoredProcedure("SP_PROCESA_ZOSOLICITUD_DATOSEXTERNOS");

            return true;
        }
        public DataSet ListadoDeZoDatosExternos()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_ZOSOLICITUD_DATOSEXTERNOS");

            return ds;
        }
        public DataSet ListadoDeFacturas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES2");

            return ds;
        }
        public DataSet ListadoDeFacturasEnvioSAP(string CodigoCliente, string Descripcion, string Promo, int CantidadRegistro, string FamiliaAgrup)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add((string.IsNullOrEmpty(CodigoCliente) ? "%%" : CodigoCliente));
            //parametros.Add(CodigoCliente);
            parametros.Add((string.IsNullOrEmpty(Descripcion) ? "%%" : Descripcion));
           // parametros.Add(Descripcion);
            parametros.Add("%%");
            parametros.Add("0");

            parametros.Add((string.IsNullOrEmpty(Promo) ? "%%" : Promo));
           // parametros.Add(Promo);
            parametros.Add(CantidadRegistro);
            parametros.Add((string.IsNullOrEmpty(FamiliaAgrup) ? "%" : FamiliaAgrup));
           // parametros.Add(FamiliaAgrup);

            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES_SAP",parametros);

            return ds;
        }
        public DataSet ListadoDeFacturasEnvioSAP()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES_SAP");

            return ds;
        }
        public DataSet ListadoDeFacturas(ArrayList parametros)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("ST_SOLICITUDES2", parametros);

            return ds;
        }
        public void CargarFamiliaAgrup(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeFamiliaAgrup();
            ddl.Items.Add(new ListItem("TODOS", "%"));
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["FAMIAGRDESC"].ToString(), ds.Tables[0].Rows[i]["FAMIAGRCODI"].ToString()));
                }
            }
        }
        public DataSet ListadoDeFamiliaAgrup()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_FAMILIA_AGRUP");

            return ds;
        }
        public DataSet ListadoDeFamilia()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_FAMILIA");

            return ds;
        }
        public DataSet ListadoDeTipoPromo()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_TIPO_PROMO");

            return ds;
        }
        public DataSet ListadoDeMedidas()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_MEDIDAS_ACTIVAS");

            return ds;
        }
        public DataSet ListadoDeIPFilBusqueda()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_IP_FLGFILBUSQ");

            return ds;
        }
        public void CargarIPFilBusqueda(CheckBoxList chklist)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeIPFilBusqueda();

            if (ds.Tables[0].Rows.Count > 0)
            {
                string mostrar;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["IP"].ToString() +") " +  ds.Tables[0].Rows[i]["DESCRIP"].ToString();
                    chklist.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["IP"].ToString()));
                    if (ds.Tables[0].Rows[i]["FLGFILBUSQ"].ToString() == "1")
                        chklist.Items[i].Selected = true;
                }
            }
        }
        public DataSet ListadoDeClienteFilBusqueda()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();

            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_CLIENTE_FLGFILBUSQ");

            return ds;
        }
        public void CargarClienteFilBusqueda(CheckBoxList chklist)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeClienteFilBusqueda();

            if (ds.Tables[0].Rows.Count > 0)
            {
                string mostrar;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mostrar = "(" + ds.Tables[0].Rows[i]["CODCLIE"].ToString() + ") " + ds.Tables[0].Rows[i]["RAZSOC"].ToString();
                    chklist.Items.Add(new ListItem(mostrar, ds.Tables[0].Rows[i]["CODCLIE"].ToString()));
                    if (ds.Tables[0].Rows[i]["FLGFILBUSQ"].ToString() == "1")
                        chklist.Items[i].Selected = true;
                }
            }
        }
        public void ModificarFiltroBusquedaCliente(CheckBoxList chklist)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros;

            for (int i = 0; i < chklist.Items.Count; i++)
            {
                parametros = new ArrayList();
                parametros.Add(chklist.Items[i].Value);
                parametros.Add(chklist.Items[i].Selected ? "1" : "0");
                ado.ExecuteNonStoredProcedure("SP_MODIFICAR_CLIENTE_FLGFILBUSQ", parametros);
            }
        }
        public void ModificarFiltroBusquedaIP(CheckBoxList chklist)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros;

            for (int i = 0; i < chklist.Items.Count; i++)
            {
                parametros = new ArrayList();
                parametros.Add(chklist.Items[i].Value);
                parametros.Add(chklist.Items[i].Selected ? "1" : "0");
                ado.ExecuteNonStoredProcedure("SP_MODIFICAR_IP_FLGFILBUSQ", parametros);
            }
        }
    }
}