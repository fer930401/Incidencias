using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppReporteIncidencias
{
    public partial class Incidencias : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocioCls logicaNegocio = new LogicaNegocio.LogicaNegocioCls();
        string mensaje = "";
        int? error = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenaTabla();
            }
        }

        public void llenaTabla()
        {
            GridView1.DataSource = logicaNegocio.consultaIncidencias(0);
            GridView1.DataBind();
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            Response.Write("<script type=\"text/javascript\">alert('Exportado'); window.location.href = 'Incidencias.aspx';</script>");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx", false);
        }

        protected void btnAtendida_Click(object sender, EventArgs e)
        {
            /* obtenemos el numero del renglon seleccionado del gridview */
            int row = ((sender as Button).NamingContainer as GridViewRow).RowIndex;
            /* asignamos el valor del id seleccionado */
            int idIncidencia = Int32.Parse(GridView1.Rows[row].Cells[0].Text);
            string no_STO = GridView1.Rows[row].Cells[2].Text;
            string codigo = GridView1.Rows[row].Cells[5].Text;
            string factura = GridView1.Rows[row].Cells[6].Text;
            string sts = "3";
            int opc = 2;
            DateTime dateUpdate = DateTime.Now;

            Entidades.sp_Adm_incidencias_Result updateSts = logicaNegocio.updateIncidencia(dateUpdate, no_STO, "", "", "", "", "", codigo, "", factura, "", "", "", 0, "", "", "", "", "", dateUpdate, idIncidencia, sts, "", "", "","","","","", opc);

            error = updateSts.error;
            mensaje = updateSts.mensaje;

            if (error == 0)
            {
                Response.Write("<script type=\"text/javascript\">alert('Incidencia: " + idIncidencia + " cerrada exitosamente'); window.location.href = 'Incidencias.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Ocurrio un error" + mensaje + "'); window.location.href = 'AltaIncidencia.aspx';</script>");
            }
        }
    }
}