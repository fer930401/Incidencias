using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaNegocio;

namespace WebAppReporteIncidencias
{
    public partial class Estadisticas : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocioCls logicaNegocio = new LogicaNegocio.LogicaNegocioCls();
        string mensaje = "";
        int? error = 0;
        int y2 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            IncGraf();
        }
        public void IncGraf()
        {
            List<Entidades.sp_cons_datos_Result> contadorMaterial = logicaNegocio.consultaDatos(10, "", "");
            List<Entidades.sp_cons_datos_Result> contadorProveedor = logicaNegocio.consultaDatos(11, "", "");
            string datos = "";
            if (contadorMaterial.Count > 0)
            {
                for (int i = 0; i < contadorMaterial.Count; i++)
                {
                    datos = datos + "{ name: '" + contadorMaterial[i].cve_dato.Replace("\r\n", "") + "', y: " + contadorMaterial[i].dato + "},";
                }
                Variables.Material = datos;
            }
            else
            {
                Variables.Material = "{ name: '', y: 0 }";
            }
            
        }
    }
}