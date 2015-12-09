using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    //[Serializable]
    public class MDGrupos
    {
        private int grupo_id;

        public int Grupo_id
        {
            get { return grupo_id; }
            set { grupo_id = value; }
        }
        private string grupo_desc;

        public string Grupo_desc
        {
            get { return grupo_desc; }
            set { grupo_desc = value; }
        }
    }
}