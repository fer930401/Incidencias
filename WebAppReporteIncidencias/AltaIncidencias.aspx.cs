using LogicaNegocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppReporteIncidencias
{
    public partial class AltaIncidencias : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocioCls logicaNegocio = new LogicaNegocio.LogicaNegocioCls();
        string mensaje = "";
        int? error = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //llenado de fecha actual y del combo ddlTurno, ddlIncidencia, ddlFamilia, ddlProveedor,ddlMaterial,ddlUdm
            //status no atendida
            if (!IsPostBack)
            {
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
                llenaCombos();
            }
        }

        private void llenaCombos()
        {
            ddlTurno.DataSource = logicaNegocio.consultaDatos(6);
            ddlTurno.DataTextField = "dato";
            ddlTurno.DataValueField = "cve_dato";
            ddlTurno.DataBind();
            ddlTurno.Items.Insert(0, new ListItem("Selecciona un turno", "NA"));

            ddlIncidencia.DataSource = logicaNegocio.consultaDatos(2);
            ddlIncidencia.DataTextField = "dato";
            ddlIncidencia.DataValueField = "cve_dato";
            ddlIncidencia.DataBind();
            ddlIncidencia.Items.Insert(0, new ListItem("Selecciona una incidencia", "NA"));

            ddlFamilia.DataSource = logicaNegocio.consultaDatos(1);
            ddlFamilia.DataTextField = "dato";
            ddlFamilia.DataValueField = "cve_dato";
            ddlFamilia.DataBind();
            ddlFamilia.Items.Insert(0, new ListItem("Selecciona una familia", "NA"));

            ddlProveedor.DataSource = logicaNegocio.consultaDatos(4);
            ddlProveedor.DataTextField = "dato";
            ddlProveedor.DataValueField = "cve_dato";
            ddlProveedor.DataBind();
            ddlProveedor.Items.Insert(0, new ListItem("Selecciona un origen/Proveedor", "NA"));

            ddlMaterial.DataSource = logicaNegocio.consultaDatos(3);
            ddlMaterial.DataTextField = "dato";
            ddlMaterial.DataValueField = "cve_dato";
            ddlMaterial.DataBind();
            ddlMaterial.Items.Insert(0, new ListItem("Selecciona un material", "NA"));

            ddlUdm.DataSource = logicaNegocio.consultaDatos(7);
            ddlUdm.DataTextField = "dato";
            ddlUdm.DataValueField = "cve_dato";
            ddlUdm.DataBind();
            ddlUdm.Items.Insert(0, new ListItem("Selecciona un UDM", "NA"));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DateTime fec_registro = DateTime.Parse(txtFecha.Text.ToString());
            string no_STO = "";
            if(string.IsNullOrEmpty(txtSto.Text) == false){
                no_STO = txtSto.Text;
            }
            string cve_turno = ddlTurno.SelectedValue.ToString();
            string aut_coord = "";
            if (string.IsNullOrEmpty(txtCoordinador.Text) == false)
            {
                aut_coord = txtCoordinador.Text;
            }
            string cve_incidencia = ddlIncidencia.SelectedValue.ToString();
            string cve_familia = ddlFamilia.SelectedValue.ToString();
            string cve_origen = ddlProveedor.SelectedValue.ToString();
            string codigo = "";
            if (string.IsNullOrEmpty(txtCodigo.Text) == false)
            {
                codigo = txtCodigo.Text;
            }
            string PO = "";
            if (string.IsNullOrEmpty(txtPO.Text) == false)
            {
                PO = txtPO.Text;
            }
            string factura = "";
            if (string.IsNullOrEmpty(txtFactura.Text) == false)
            {
                factura = txtFactura.Text;
            }
            string lote = "";
            if (string.IsNullOrEmpty(txtLote.Text) == false)
            {
                lote = txtLote.Text;
            }
            string descripcion = "";
            if (string.IsNullOrEmpty(txtDescripcion.Text) == false)
            {
                descripcion = txtDescripcion.Text;
            }
            string cve_material = ddlMaterial.SelectedValue.ToString();
            short? cantidad = 0;
            if (string.IsNullOrEmpty(txtCantidad.Text) == false)
            {
                cantidad = short.Parse(txtCantidad.Text);
            }
            string cve_udm = ddlUdm.SelectedValue.ToString();
            string nom_estiba = "";
            if (string.IsNullOrEmpty(txtEstiba.Text) == false)
            {
                nom_estiba = txtEstiba.Text;
            }
            string transporte = "";
            if (string.IsNullOrEmpty(txtTransporte.Text) == false)
            {
                transporte = txtTransporte.Text;
            }
            string operador = "";
            if (string.IsNullOrEmpty(txtOperador.Text) == false)
            {
                operador = txtOperador.Text;
            }
            string accion = "";
            if (string.IsNullOrEmpty(txtContencion.Text) == false)
            {
                accion = txtContencion.Text;
            }
            DateTime fec_cierre;
            if (string.IsNullOrEmpty(txtCierre.Text) == false)
            {
                fec_cierre = DateTime.Parse(txtCierre.Text.ToString());
            }
            else
            {
                fec_cierre = DateTime.Now;
            }
            int? atendido = 0;
            string cve_sts = "sts1";
            string evidencia = "";
            string observacion = "";
            if (string.IsNullOrEmpty(txtObs.Text) == false)
            {
                observacion = txtObs.Text;
            }
            int? opc = 1;
            /*string filaFrontal = Convert.ToBase64String(upfFilaFrontal.FileBytes);
            string filaPallet = Convert.ToBase64String(upfFilaPallet.FileBytes);
            string acercaPallet = Convert.ToBase64String(upfAcercaPallet.FileBytes);
            string tarimaDanada = Convert.ToBase64String(upfTarimaDanada.FileBytes);
            string sacosDanado = Convert.ToBase64String(upfSacosDanado.FileBytes);*/
            string[] nombreImagenes = new string[5];
            HttpFileCollection files = Request.Files;
            for (int i = 0; i <= files.Count - 1; i++)
            {
                HttpPostedFile postedFile = files[i];
                if (postedFile.ContentLength > 0)
                {
                    postedFile.SaveAs(Server.MapPath(@"Images\upload\") + Path.GetFileName(postedFile.FileName));
                    nombreImagenes[i] = postedFile.FileName;
                }
            }

            string filaFrontal = "";
            if (string.IsNullOrEmpty(nombreImagenes[0].ToString()) == false)
            {
                filaFrontal = nombreImagenes[0].ToString();
            }
            string filaPallet = "";
            if (string.IsNullOrEmpty(nombreImagenes[1].ToString()) == false)
            {
                filaPallet = nombreImagenes[1].ToString();
            }
            string acercaPallet = "";
            if (string.IsNullOrEmpty(nombreImagenes[2].ToString()) == false)
            {
                acercaPallet = nombreImagenes[2].ToString();
            }
            string tarimaDanada = "";
            if (string.IsNullOrEmpty(nombreImagenes[3].ToString()) == false)
            {
                tarimaDanada = nombreImagenes[3].ToString();
            }
            string sacosDanado = "";
            if (string.IsNullOrEmpty(nombreImagenes[4].ToString()) == false)
            {
                sacosDanado = nombreImagenes[4].ToString();
            }
            
            Entidades.sp_Adm_incidencias_Result nuevaIncidencia = logicaNegocio.insertaIncidencia(fec_registro,no_STO,cve_turno,aut_coord,cve_incidencia,cve_familia,cve_origen,codigo,PO,factura,lote,descripcion,cve_material,cantidad,cve_udm,nom_estiba,transporte,operador,accion,fec_cierre,atendido,cve_sts,evidencia,observacion,filaFrontal,filaPallet,acercaPallet,tarimaDanada,sacosDanado,opc);

            error = nuevaIncidencia.error;
            mensaje = nuevaIncidencia.mensaje;

            if (error == 0)
            {
                Response.Write("<script type=\"text/javascript\">alert('Procesado Exitosamente'); window.location.href = 'Index.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Ocurrio un error" + mensaje + "'); window.location.href = 'AltaIncidencia.aspx';</script>");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx", false);
        }
    }
}