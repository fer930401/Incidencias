using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppReporteIncidencias
{
    public partial class ImgIncidencias : System.Web.UI.Page
    {
        LogicaNegocio.LogicaNegocioCls logicaNegocio = new LogicaNegocio.LogicaNegocioCls();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idInc = Int32.Parse(Request["id_inc"].ToString());
                int opcInc = Int32.Parse(Request["opc"].ToString());
                llenaImagenes(idInc, opcInc);
            }
        }

        public void llenaImagenes(int? id, int? opc)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            List<Entidades.sp_cons_img_Result> imgIncidencias = logicaNegocio.imgIncidencia(id, opc);
            dt.Columns.AddRange(new DataColumn[5] { 
                new DataColumn("fila_frontal"),
                new DataColumn("fila_pallet"),
                new DataColumn("acerca_pallet"),
                new DataColumn("tarima_danada"),
                new DataColumn("sacos_dana")
            });

            if (imgIncidencias != null)
            {
                int i = 0;
                foreach (var elemento in imgIncidencias)
                {
                    dr = dt.NewRow();
                    string fileName1 = Path.GetFileName(elemento.fila_frontal);
                    string fileName2 = Path.GetFileName(elemento.fila_pallet);
                    string fileName3 = Path.GetFileName(elemento.acerca_pallet);
                    string fileName4 = Path.GetFileName(elemento.tarima_dañada);
                    string fileName5 = Path.GetFileName(elemento.sacos_daña);
                    if (System.IO.File.Exists(Server.MapPath("~/Images/upload/" + fileName1)))
                    {
                        dr["fila_frontal"] = "~/Images/upload/" + fileName1;
                        dr["fila_pallet"] = "~/Images/upload/" + fileName2;
                        dr["acerca_pallet"] = "~/Images/upload/" + fileName3;
                        dr["tarima_danada"] = "~/Images/upload/" + fileName4;
                        dr["sacos_dana"] = "~/Images/upload/" + fileName5;
                        dt.Rows.Add(dr);
                    }
                    else
                    {
                        dr["fila_frontal"] = "~/Images/error.png";
                        dr["fila_pallet"] = "~/Images/error.png";
                        dr["acerca_pallet"] = "~/Images/error.png";
                        dr["tarima_danada"] = "~/Images/error.png";
                        dr["sacos_dana"] = "~/Images/error.png";
                        dt.Rows.Add(dr);
                        //dt.Rows.Add(fileName1, "~/Images/error.png");
                    }
                    /*dr["fila_frontal"] = String.Format("data:image/gif;base64,{0}", elemento.fila_frontal);
                    dr["fila_pallet"] = String.Format("data:image/gif;base64,{0}", elemento.fila_pallet);
                    dr["acerca_pallet"] = String.Format("data:image/gif;base64,{0}", elemento.acerca_pallet);
                    dr["tarima_danada"] = String.Format("data:image/gif;base64,{0}", elemento.tarima_dañada);*/
                    //dr["sacos_dana"] = String.Format("data:image/gif;base64,{0}", elemento.sacos_daña);
                    //dt.Rows.Add(dr);
                    i++;
                }
            }
            ViewState["dt"] = dt;
            BindGrid();
        }

        protected void BindGrid()
        {
            GridView1.DataSource = ViewState["dt"] as DataTable;
            GridView1.DataBind();
        }
    }
}