using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    public class Usuario
    {
        private string usu_id;
        public string Usu_id
        {
            get { return usu_id; }
            set { usu_id = value; }
        }
        
        private string legajo;
        public string Legajo
        {
            get { return legajo; }
            set { legajo = value; }
        }
        
        private string usu_desc;
        public string Usu_desc
        {
            get { return usu_desc; }
            set { usu_desc = value; }
        }
        
        private string mail;

        public string Mail
        {
            get { return mail; }
            set { mail = value; }
        }

        private string pass;

        public string Pass
        {
            get { return pass; }
            set { pass = value; }
        }

        private bool activo;
        public bool Activo
        {
            get { return activo; }
            set { activo = value; }
        }

        private List<MDGrupos> grupos;

        public List<MDGrupos> Grupos
        {
            get { return grupos; }
            set { grupos = value; }
        }
    }
}