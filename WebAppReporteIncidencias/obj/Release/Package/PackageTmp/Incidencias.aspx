<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Incidencias.aspx.cs" Inherits="WebAppReporteIncidencias.Incidencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#<%=GridView1.ClientID%> [id='btnImg']").click(function () {
                var tr = $(this).parent().parent();
                var id_inc = $("td:eq(0)", tr).html();
                var sto = $("td:eq(2)", tr).html();
                var factura = $("td:eq(6)", tr).html();
                var opc = 0;
                var dWidth = $(window).width() * 0.9;
                var dHeight = $(window).height() * 0.9;
                $('<div>').dialog({
                    modal: true,
                    open: function () {
                        $(this).load('ImgIncidencias.aspx?id_inc=' + id_inc + '&opc=' + opc);
                    },
                    width: dWidth,
                    height: dHeight,
                    draggable: false,
                    responsive: true,
                    close: function (e, ui) {
                        window.location.href = 'Incidencias.aspx';
                    }
                }).prev(".ui-dialog-titlebar").css("background", "#363636");
            });
        });
    </script>
    <style>
        .ui-dialog {
            z-index: 1000000000;
            top: 0;
            left: 0;
            margin: auto;
            position: fixed;
            max-width: 100%;
            max-height: 100%;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        .ui-dialog .ui-dialog-content {
            flex: 1;
        }

        .ui-dialog .ui-dialog-buttonpane {
            background: white;
        }
        .ui-dialog .ui-dialog-titlebar {
            background:#042644;
            border-color:#042644;
        }
    </style>
    <div class="">
        <div class="">
            <br />
            <br />
            <br />
            <br />
            <% 
                for (int i=1; i <= GridView1.Rows.Count; i++)
                {
                        foreach (GridViewRow row in GridView1.Rows)
                        {
                            if (row.Cells[12].Text.TrimEnd(' ').Equals("En Proceso") == true)
                            {
                                //row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFD839");
                            }
                            else if (row.Cells[12].Text.Equals("Retrasada") == true)
                            {
                                row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFD839");
                            }
                            else if (row.Cells[12].Text.Equals("Cerrada") == true)
                            {
                                row.BackColor = System.Drawing.ColorTranslator.FromHtml("#009913");
                                row.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                                Button btnAtendido = (Button)row.Cells[12].FindControl("btnAtendida");
                                btnAtendido.Enabled = false;
                            }
                        }
                }
            %>
            <div class="" style="background-color: #FFEC9E;">
                <br />
                <div class="">
                    <div class="alert alert-warning text-center" role="alert">
                        <strong><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Consulta las incidencias reportadas" /></strong>
                    </div>
                </div>
                <div class="">
                    <div style="padding-left:10px;padding-right:10px;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                AllowPaging="True" BackColor="White"
                                HeaderStyle-BackColor="#363636" HeaderStyle-ForeColor="White"
                                CssClass="table table-responsive" HeaderStyle-Height="50px"
                                EmptyDataText="No hay incidencias registradas"
                                PageSize="5">
                                <PagerStyle CssClass="pagination-ys" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="fec_registro" HeaderText="Fecha Registro:" ItemStyle-Width="150" DataFormatString="{0:dd/M/yyyy}"  />
                                    <asp:BoundField DataField="no_STO" HeaderText="STO:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="turno" HeaderText="Turno:" ReadOnly="True" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="incidencia" HeaderText="Incidencia:" ReadOnly="True" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="codigo" HeaderText="Codigo:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="factura" HeaderText="Factura:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="lote" HeaderText="Lote:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="material" HeaderText="Material:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad:" ItemStyle-Width="150" DataFormatString="{0:F2}" />
                                    <asp:BoundField DataField="udm" HeaderText="UDM:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="sts" HeaderText="Status:" ItemStyle-Width="150" />
                                    <asp:BoundField DataField="fec_cierre" HeaderText="Fecha cierre:" ItemStyle-Width="150" DataFormatString="{0:dd/M/yyyy}" />
                                    <asp:BoundField DataField="observacion" HeaderText="Observacion:" ItemStyle-Width="150" />
                                    <asp:TemplateField HeaderText="Evidencias:" ItemStyle-Width="900">
                                        <ItemTemplate>
                                            <a id="btnImg" class="btn btn-success" <% Response.Write(Session["visible"]); %>>Evidencia</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ya fue atendida:" ItemStyle-Width="900">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAtendida" CssClass="btn btn-warning" runat="server" Text="Atendida" OnClick="btnAtendida_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
                        <hr />
                        <asp:Button ID="btnExportar" runat="server" Text="Exportar Incidencias" CssClass="btn btn-success" OnClick="btnExportar_Click" />
                        <%--<asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" /> --%>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" rel="Stylesheet" type="text/css" />
</asp:Content>
