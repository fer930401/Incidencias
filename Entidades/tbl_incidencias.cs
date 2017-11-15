//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entidades
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_incidencias
    {
        public tbl_incidencias()
        {
            this.tbl_inc_img = new HashSet<tbl_inc_img>();
        }
    
        public int id_incidencia { get; set; }
        public System.DateTime fec_registro { get; set; }
        public string no_STO { get; set; }
        public string cve_turno { get; set; }
        public string aut_coord { get; set; }
        public string cve_incidiencia { get; set; }
        public string cve_familia { get; set; }
        public string cve_origen { get; set; }
        public string codigo { get; set; }
        public string PO { get; set; }
        public string factura { get; set; }
        public string lote { get; set; }
        public string descripcion { get; set; }
        public string cve_material { get; set; }
        public Nullable<double> cantidad { get; set; }
        public string cve_udm { get; set; }
        public string norma_estiba { get; set; }
        public string transporte { get; set; }
        public string operador { get; set; }
        public string accion_Contencion { get; set; }
        public Nullable<System.DateTime> fec_cierre { get; set; }
        public int atendido { get; set; }
        public string cve_sts { get; set; }
        public string evidencia { get; set; }
        public string observacion { get; set; }
        public System.DateTime fec_actualizacion { get; set; }
    
        public virtual tbl_cat_familia tbl_cat_familia { get; set; }
        public virtual tbl_cat_incidencia tbl_cat_incidencia { get; set; }
        public virtual tbl_cat_matAfectado tbl_cat_matAfectado { get; set; }
        public virtual tbl_cat_origen tbl_cat_origen { get; set; }
        public virtual tbl_cat_sts tbl_cat_sts { get; set; }
        public virtual tbl_cat_turno tbl_cat_turno { get; set; }
        public virtual tbl_cat_udm tbl_cat_udm { get; set; }
        public virtual ICollection<tbl_inc_img> tbl_inc_img { get; set; }
    }
}