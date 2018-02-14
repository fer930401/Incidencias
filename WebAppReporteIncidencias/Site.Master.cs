using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppReporteIncidencias
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["visibleOpciones"] = "style = 'display:none'";
                Session["visibleLogin"] = "";
                Session["visibleLogout"] = "style = 'display:none'";
            }
            else
            {
                if (Session["rol_user"].Equals("GER") == true || Session["rol_user"].Equals("SUPOMS") == true || Session["rol_user"].Equals("SUPOPR") == true)
                {
                    Session["visibleConsulta"] = "";
                }
                else
                {
                    Session["visibleConsulta"] = "style = 'display:none'";
                }
                Session["visibleOpciones"] = "";
                Session["visibleLogin"] = "style = 'display:none'";
                Session["visibleLogout"] = "";
                lblUser.Text = Session["nom_user"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Index.aspx", false);
        }
    }
}