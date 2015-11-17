using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    public class MDPermisos
    {
        private int permisoID;

        public int PermisoID
        {
            get { return permisoID; }
            set { permisoID = value; }
        }
        private EnumPermisos permisoDesc;

        public EnumPermisos PermisoDesc
        {
            get { return permisoDesc; }
            set { permisoDesc = value; }
        }
    }
}