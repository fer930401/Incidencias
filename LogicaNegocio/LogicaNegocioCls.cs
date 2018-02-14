using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccesoDatos;

namespace LogicaNegocio
{
    public class LogicaNegocioCls
    {
        AccesoDatos.AccesoDatosCls datos;
        public LogicaNegocioCls()
        {
            datos = new AccesoDatos.AccesoDatosCls();
        }

        public List<Entidades.sp_cons_datos_Result> consultaDatos(int? opc, string cve1, string cve2)
        {
            return datos.consultaDatos(opc,cve1,cve2);
        }

        public Entidades.sp_Adm_incidencias_Result insertaIncidencia(DateTime fec_registro, string no_STO, string cve_turno, string aut_coord, string cve_incidencia, string cve_familia, string cve_origen, string codigo, string PO, string factura, string lote, string descripcion, string cve_material, short? cantidad, string cve_udm, string nom_estiba, string transporte, string operador, string accion, DateTime fec_cierre, int? atendido, string cve_sts, string evidencia, string observacion, string filaFrontal, string filaPallet, string acercaPallet, string tarimaDanada, string sacosDanado,int? opc)
        {
            return datos.insertaIncidencia(fec_registro, no_STO, cve_turno, aut_coord, cve_incidencia, cve_familia, cve_origen, codigo, PO, factura, lote, descripcion, cve_material, cantidad, cve_udm, nom_estiba, transporte, operador, accion, fec_cierre, atendido, cve_sts, evidencia, observacion, filaFrontal,filaPallet,acercaPallet,tarimaDanada,sacosDanado, opc);
        }

        public List<Entidades.sp_cons_incidencias_Result> consultaIncidencias(int? opc)
        {
            return datos.consultaIncidencias(opc);
        }
        public Entidades.sp_Adm_incidencias_Result updateIncidencia(DateTime fec_registro, string no_STO, string cve_turno, string aut_coord, string cve_incidencia, string cve_familia, string cve_origen, string codigo, string PO, string factura, string lote, string descripcion, string cve_material, short? cantidad, string cve_udm, string nom_estiba, string transporte, string operador, string accion, DateTime fec_cierre, int? atendido, string cve_sts, string evidencia, string observacion, string filaFrontal, string filaPallet, string acercaPallet, string tarimaDanada, string sacosDanado, int? opc)
        {
            return datos.updateIncidencia(fec_registro, no_STO, cve_turno, aut_coord, cve_incidencia, cve_familia, cve_origen, codigo, PO, factura, lote, descripcion, cve_material, cantidad, cve_udm, nom_estiba, transporte, operador, accion, fec_cierre, atendido, cve_sts, evidencia, observacion, filaFrontal, filaPallet, acercaPallet, tarimaDanada, sacosDanado, opc);
        }

        public List<Entidades.sp_cons_img_Result> imgIncidencia(int? id, int? opc)
        {
            return (datos.imgIncidencia(id, opc)).ToList();
        }
        public Entidades.sp_adm_opciones_Result insertaOpcion(string nom_opc, int? opc, int? sub_opc)
        {
            return (datos.insertaOpcion(nom_opc, opc, sub_opc));
        }
    }
}
