using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    //[Serializable]
    public class ZoRegion
    {
        private string reg_code;

        public string Reg_code
        {
            get { return reg_code; }
            set { reg_code = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
    }
}