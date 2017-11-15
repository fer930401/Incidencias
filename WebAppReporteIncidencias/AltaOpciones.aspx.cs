using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppReporteIncidencias
{
    public partial class AltaOpciones : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocioCls logicaNegocio = new LogicaNegocio.LogicaNegocioCls();
        string mensaje = "";
        int? error = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int? opc = 0;
            int? alta = 1;
            if (rdbFamilia.Checked == true)
            {
                opc = 1;
            }
            else if (rdbIncidencia.Checked == true)
            {
                opc = 2;
            }
            else if (rdbMatAfectado.Checked == true)
            {
                opc = 3;
            }
            else if (rdbOrigen.Checked == true)
            {
                opc = 4;
            }
            else if (rdbSts.Checked == true)
            {
                opc = 5;
            }
            else if (rdbUDM.Checked == true)
            {
                opc = 6;
            }

            string nom_opc = "";
            if (string.IsNullOrEmpty(txtNom_opc.Text) == false)
            {
                nom_opc = txtNom_opc.Text.ToUpper();
            }

            Entidades.sp_adm_opciones_Result nuevaOpcion = logicaNegocio.insertaOpcion(nom_opc, opc, alta);

            error = nuevaOpcion.error;
            mensaje = nuevaOpcion.mensaje;

            if (error == 0)
            {
                Response.Write("<script type=\"text/javascript\">alert('Nueva opción registrada Exitosamente'); window.location.href = 'Index.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Ocurrio un error" + mensaje + "'); window.location.href = 'AltaOpciones.aspx';</script>");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx", false);
        }
    }
}