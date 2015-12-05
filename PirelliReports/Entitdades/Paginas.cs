using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    public class Paginas
    {
        private int pagina_id;

        public int Pagina_id
        {
            get { return pagina_id; }
            set { pagina_id = value; }
        }
        private string pagina;

        public string Pagina
        {
            get { return pagina; }
            set { pagina = value; }
        }
    }
}