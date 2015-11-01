using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Entidades;
using Negocio;
namespace Controles
{
    public class PirelliMaster : System.Web.UI.Page
    {
        public Usuario User
        {
            get
            {
                return (Usuario)Session["Usuario"];
            }
        }

    }
}