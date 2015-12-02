using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Collections;
using System.Data;
using Entidades;
using System.Web.UI.WebControls;
namespace Negocio
{
    public class ConexionUsuario
    {
        public Usuario TraerUsuario(string codigo)
        {
            Usuario u = new Usuario();
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            DataSet ds = new DataSet();

            ds = ListadoDeUsuarios(codigo);
            if (ds.Tables[0].Rows.Count > 0)
            {
                u.Usu_id = ds.Tables[0].Rows[0]["USU_ID"].ToString();
                u.Usu_desc = ds.Tables[0].Rows[0]["USU_DESC"].ToString();
                u.Legajo = ds.Tables[0].Rows[0]["LEGAJO"].ToString();
                u.Mail = ds.Tables[0].Rows[0]["MAIL"].ToString();
                u.Pass = ds.Tables[0].Rows[0]["PASS"].ToString();
                u.Activo = Convert.ToBoolean(ds.Tables[0].Rows[0]["ACTIVO"]);
                 
            }
            u.Grupos = new List<MDGrupos>();
            parametros.Add(codigo);
            ds = new DataSet();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_GRUPOS_USUARIO", parametros);
            if (ds.Tables[0].Rows.Count > 0)
            {
                MDGrupos mdg;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    mdg = new MDGrupos();
                    mdg.Grupo_id = Convert.ToInt32(ds.Tables[0].Rows[i]["GRUPO_ID"]);
                    mdg.Grupo_desc = ds.Tables[0].Rows[i]["GRUPO_DESC"].ToString();
                    u.Grupos.Add(mdg);
                }
                
            }

            return u;
        }
        public bool InsertarUsuario(Usuario u)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(u.Usu_id);
            parametros.Add(u.Usu_desc);
            parametros.Add(u.Mail);
            parametros.Add(u.Pass);
            parametros.Add(u.Legajo);
            parametros.Add(u.Activo);

            ado.ExecuteStoredProcedureDS("SP_INSERTAR_USUARIO", parametros);

            foreach (MDGrupos grup in u.Grupos)
            {
                parametros = new ArrayList();
                parametros.Add(grup.Grupo_id);
                parametros.Add(u.Usu_id);
                ado.ExecuteStoredProcedureDS("SP_INSERTAR_GRUPOS_USUARIO", parametros);
            }

            return true;
        }
        public bool ModificarUsuario(Usuario u, string codigoOriginal)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            parametros.Add(codigoOriginal);
            ado.ExecuteStoredProcedureDS("SP_DELETE_GRUPOS_USUARIO", parametros);
            

            parametros = new ArrayList();
            parametros.Add(codigoOriginal);
            parametros.Add(u.Usu_id);
            parametros.Add(u.Usu_desc);
            parametros.Add(u.Mail);
            parametros.Add(u.Pass);
            parametros.Add(u.Legajo);
            parametros.Add(u.Activo);
            ado.ExecuteStoredProcedureDS("SP_MODIFICAR_USUARIO", parametros);
            
            foreach (MDGrupos grup in u.Grupos)
            {
                parametros = new ArrayList();
                parametros.Add(grup.Grupo_id);
                parametros.Add(u.Usu_id);
                ado.ExecuteStoredProcedureDS("SP_INSERTAR_GRUPOS_USUARIO", parametros);
            }

            return true;
        }
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
        public DataSet ListadoDeUsuarios(string codigo)
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            ArrayList parametros = new ArrayList();
            parametros.Add(codigo);
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_USUARIOS",parametros);

            return ds;
        }
        public DataSet ListadoDeUsuarios()
        {
            AdoConn ado = new AdoConn();
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            ds = ado.ExecuteStoredProcedureDS("SP_SELECT_USUARIOS");

            return ds;
        }
        public bool VerificarLogin(string nombre, string password)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            DataSet ds = new DataSet();
            parametros.Add(nombre);
            parametros.Add(password);
            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICARLOGIN", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;

            
        }
        public Usuario CargarUsuario(string nombre, string password)
        {
            Usuario user = new Usuario();
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            DataSet ds = new DataSet();
            parametros.Add(nombre);
            parametros.Add(password);
            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICARLOGIN", parametros);

            user.Legajo = ds.Tables[0].Rows[0]["LEGAJO"].ToString();
            user.Mail = ds.Tables[0].Rows[0]["MAIL"].ToString();
            user.Pass = ds.Tables[0].Rows[0]["PASS"].ToString();
            user.Usu_desc = ds.Tables[0].Rows[0]["USU_DESC"].ToString();
            user.Usu_id = ds.Tables[0].Rows[0]["USU_ID"].ToString();
            user.Activo = Convert.ToBoolean(ds.Tables[0].Rows[0]["ACTIVO"]);
            user.Pass = ds.Tables[0].Rows[0]["PASS"].ToString();

            if (ds.Tables[1].Rows.Count > 0)
            {
                Paginas p;
                user.PaginasAccesibles = new List<Paginas>();
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                { 
                    p = new Paginas();
                    p.Pagina_id = Convert.ToInt32(ds.Tables[1].Rows[i]["PAGINA_ID"].ToString());
                    p.Pagina = ds.Tables[1].Rows[i]["PAGINA"].ToString();
                    user.PaginasAccesibles.Add(p);
                }
            }

            if (ds.Tables[2].Rows.Count > 0)
            {
                MDPermisos permiso;
                user.Permisos = new List<MDPermisos>();
                for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
                {
                    permiso = new MDPermisos();
                    permiso.PermisoID = Convert.ToInt32(ds.Tables[2].Rows[i]["PERMISO_ID"].ToString());
                    permiso.PermisoDesc = (EnumPermisos)Enum.Parse(typeof(EnumPermisos), ds.Tables[2].Rows[i]["PERMISO_DESC"].ToString());

                    user.Permisos.Add(permiso);
                }
            }
            return user;


        }

        public bool VerificarMaiExistente(string mail)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            DataSet ds = new DataSet();
            parametros.Add(mail);

            ds = ado.ExecuteStoredProcedureDS("SP_VERIFICAR_MAIL_EXISTENTE", parametros);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }

        public bool ReestablecerMail(string mail)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            DataSet ds = new DataSet();
            parametros.Add(mail);

            ds = ado.ExecuteStoredProcedureDS("SP_REESTABLECERCONTRASEÑA", parametros);

            return true;
        }

        public bool EnviarCorreo(string mail)
        {
            /*-------------------------MENSAJE DE CORREO----------------------*/

            //Creamos un nuevo Objeto de mensaje
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            //Direccion de correo electronico a la que queremos enviar el mensaje
            mmsg.To.Add(mail);
            //mmsg.To.Add("jonathan.fernandez.ex@pirelli.com");
            //mmsg.To.Add("walter.santucho.it@gmail.com ");
            //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

            //Asunto
            mmsg.Subject = "Probando envio de mail PIRELLI";
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;


            //Cuerpo del Mensaje



            mmsg.Body = "Solicitud de Contraseña, ingrese al siguiente link  ";
            mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML

            //Correo electronico desde la que enviamos el mensaje
            mmsg.From = new System.Net.Mail.MailAddress("jonathan_28_05@hotmail.com");


            /*-------------------------CLIENTE DE CORREO----------------------*/

            //Creamos un objeto de cliente de correo
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials = new System.Net.NetworkCredential("jonathan_28_05@hotmail.com", "chevrolet15");

            //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail

            cliente.Port = 587;
            cliente.EnableSsl = true;
            cliente.Host = "smtp.live.com";// "smtp-mail.outlook.com";
                //"smtp.live.com"

           // cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";
        

            /*-------------------------ENVIO DE CORREO----------------------*/

            try
            {
                //Enviamos el mensaje      
                cliente.Send(mmsg);

                return true;
            }
            catch (System.Net.Mail.SmtpException)
            {
                //Aquí gestionamos los errores al intentar enviar el correo
                return false;
            }
        }

        public bool CambiarClave(string claveNueva, Usuario usuario)
        {
            AdoConn ado = new AdoConn();
            ArrayList parametros = new ArrayList();
            DataSet ds = new DataSet();
            parametros.Add(claveNueva);
            parametros.Add(usuario.Usu_id);

            ds = ado.ExecuteStoredProcedureDS("SP_MODIFICAR_CLAVE", parametros);

            return true;
        }


      
    }
}