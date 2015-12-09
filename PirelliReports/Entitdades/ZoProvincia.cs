using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    //[Serializable]
    public class ZoProvincia
    {
        private string zocod;

        public string Zocod
        {
            get { return zocod; }
            set { zocod = value; }
        }
        private string zoDesc;

        public string ZoDesc
        {
            get { return zoDesc; }
            set { zoDesc = value; }
        }
    }
}