using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppReporteIncidencias
{
    public partial class Login : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocioCls logicaNegocio = new LogicaNegocio.LogicaNegocioCls();
        string mensaje = "";
        int? error = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUsuarios.DataSource = logicaNegocio.consultaDatos(8,"","");
                ddlUsuarios.DataTextField = "dato";
                ddlUsuarios.DataValueField = "cve_dato";
                ddlUsuarios.DataBind();
                ddlUsuarios.Items.Insert(0, new ListItem("Selecciona a un usuario", "NA"));
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cve_user = ddlUsuarios.SelectedValue.ToString();
            string pass = txtContrasena.Text;
            string error = "";

            List<Entidades.sp_cons_datos_Result> userLogin = logicaNegocio.consultaDatos(9, cve_user, pass);

            if (userLogin.Count != 0)
            {
                Session["user"] = userLogin[0].cve_dato;
                string dato_user = userLogin[0].dato;
                string[] array = dato_user.Split(';');
                if(array[0].ToString().Length > 20)
                {
                    Session["nom_user"] = array[0].ToString().Remove(20);
                }
                else
                {
                    Session["nom_user"] = array[0].ToString();
                }
                //Session["nom_user"] = array[0].ToString().Remove(20);
                Session["rol_user"] = array[1].ToString();
                Session["cve_user"] = cve_user;
                Response.Write("<script type=\"text/javascript\">alert('Login Exitoso'); window.location.href = 'Index.aspx';</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Los datos son incorrectos'); window.location.href = 'Login.aspx';</script>");
            }
        }
    }
}