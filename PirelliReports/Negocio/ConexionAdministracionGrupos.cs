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
    public class ConexionAdministracionGrupos
    {
        public bool ValidarUsuarioIDExistente(string usuID)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(usuID);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICA_USUARIO_ID", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;

        }
        public bool ValidarUsuarioMailExistente(string mail)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(mail);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICA_USUARIO_MAIL", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;

        }
        public bool ValidarUsuarioLegajoExistente(string legajo)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(legajo);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICA_USUARIO_LEGAJO", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;

        }
        public void CargarPermisos(CheckBoxList chklist)
        {
            DataSet ds = new DataSet();
            ds = ListadoDePermisos();



            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    chklist.Items.Add(new ListItem(ds.Tables[0].Rows[i]["Permiso_desc"].ToString(), ds.Tables[0].Rows[i]["Permiso_id"].ToString()));
                }
            }


        }
        public void CargarUsuarios(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeUsuarios();



            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["USU_DESC"].ToString(), ds.Tables[0].Rows[i]["USU_ID"].ToString()));
                }
            }


        }
        public DataSet ListadoDeUsuarios()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_USUARIOS");

            return ds;
        }
        public void CargarGrupos(DropDownList ddl)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeGrupos();



            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddl.Items.Add(new ListItem(ds.Tables[0].Rows[i]["GRUPO_DESC"].ToString(), ds.Tables[0].Rows[i]["GRUPO_ID"].ToString()));
                }
            }


        }
        public DataSet ListadoDeGrupos()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_GRUPOS");

            return ds;
        }
        public DataSet ListadoDePermisos()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_PERMISOS");

            return ds;
        }
        public DataSet ListadoDePermisos(int id)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(id);
            ds = ado.ExecuteStoredProcedureDS("SELECT_PERMISOS_POR_ID",parametros);

            return ds;
        }
        public bool ValidarGrupoExistente(string nombre)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(nombre);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICA_GRUPO_EXISTENTE", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
        public bool EliminarGrupoPermisos(int id)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(id);
            ado.ExecuteNonStoredProcedure("SP_ELIMINAR_GRUPOS_PERMISOS", parametros);

            return true;
        }
        public bool ModificarNombreGrupoPermisos(int id, string nombre)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(id);
            parametros.Add(nombre);
            ado.ExecuteNonStoredProcedure("SP_MODIFICAR_NOMBRE_GRUPOS_PERMISOS", parametros);

            return true;
        }
        public bool InsertGrupoPermisos(List<EnumPermisos> permisos, string nombre)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(nombre);
            ado.ExecuteNonStoredProcedure("SP_INSERTAR_GRUPOS", parametros);


            foreach (EnumPermisos per in permisos)
            {
                parametros = new ArrayList();
                parametros.Add(nombre);
                parametros.Add((int)per);
                ado.ExecuteNonStoredProcedure("INSERT_GRUPOS_PERMISOS", parametros);
            }
            return true;
        }

        public void CargarPermisosCheckeados(CheckBoxList chklist, int id)
        {
            DataSet ds = new DataSet();
            ds = ListadoDePermisos();

            chklist.Items.Clear();


            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    chklist.Items.Add(new ListItem(ds.Tables[0].Rows[i]["Permiso_desc"].ToString(), ds.Tables[0].Rows[i]["Permiso_id"].ToString()));
                    
                }
                
                ds = new DataSet();
                ds = ListadoDePermisos(id);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < chklist.Items.Count; i++)
                    {
                        for (int j = 0; j < ds.Tables[0].Rows.Count; j++)
                        {
                            if (chklist.Items[i].Value == ds.Tables[0].Rows[j]["PERMISO_ID"].ToString())
                            {
                                chklist.Items[i].Selected = true;
                            }
                        }
                    }
                }


            }

            


        }

        public void ModificarGrupoPermisos(List<EnumPermisos> permisos, string nombre)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(nombre);
            ado.ExecuteNonStoredProcedure("ELIMINAR_GRUPOS_PERMISOS", parametros);

            foreach (EnumPermisos per in permisos)
            {
                parametros = new ArrayList();
                parametros.Add(nombre);
                parametros.Add((int)per);
                ado.ExecuteNonStoredProcedure("INSERT_GRUPOS_PERMISOS", parametros);
            }
        }

        public void CargarGrupos(CheckBoxList chklist)
        {
            DataSet ds = new DataSet();
            ds = ListadoDeGrupos();

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    chklist.Items.Add(new ListItem(ds.Tables[0].Rows[i]["GRUPO_DESC"].ToString(), ds.Tables[0].Rows[i]["GRUPO_ID"].ToString()));
                }
            }
        }
    }
}