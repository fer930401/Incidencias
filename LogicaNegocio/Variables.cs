using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio
{
    public class Variables
    {
        static string material;
        public static string Material
        {
            get { return Variables.material; }
            set { Variables.material = value; }
        }

        static string proveedor;
        public static string Proveedor
        {
            get { return Variables.proveedor; }
            set { Variables.proveedor = value; }
        }
    }
}
