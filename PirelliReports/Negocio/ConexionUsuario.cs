using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLayer;
using System.Collections;
using System.Data;
using Entidades;
namespace Negocio
{
    public class ConexionUsuario
    {

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

            user.Legajo = Convert.ToInt32(ds.Tables[0].Rows[0]["LEGAJO"]);
            user.Mail = ds.Tables[0].Rows[0]["MAIL"].ToString();
            user.Pass = ds.Tables[0].Rows[0]["PASS"].ToString();
            user.Usu_desc = ds.Tables[0].Rows[0]["USU_DESC"].ToString();
            user.Usu_id = ds.Tables[0].Rows[0]["USU_ID"].ToString();
            user.Activo = Convert.ToInt32(ds.Tables[0].Rows[0]["ACTIVO"]);
            user.Pass = ds.Tables[0].Rows[0]["PASS"].ToString();

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