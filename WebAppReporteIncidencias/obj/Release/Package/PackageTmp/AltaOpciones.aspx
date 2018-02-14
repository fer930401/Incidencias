<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaOpciones.aspx.cs" Inherits="WebAppReporteIncidencias.AltaOpciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container body-content">
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <br />
            <br />
            <div class="col-md-12" style="background-color: #FFEC9E;">
                <br />
                <div class="alert alert-warning text-center" role="alert">
                    <strong>
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Por favor ingresa la informacion de las opciones nuevas." /></strong>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Tipo de opción:</label>
                            <br />
                            <asp:RadioButton ID="rdbFamilia" Text="Familia" runat="server" GroupName="opc" Checked />
                            <asp:RadioButton ID="rdbIncidencia" Text="Incidencia" runat="server" GroupName="opc" />
                            <asp:RadioButton ID="rdbMatAfectado" Text="Material Afectado" runat="server" GroupName="opc" />
                            <br />
                            <asp:RadioButton ID="rdbOrigen" Text="Origen" runat="server" GroupName="opc" />
                            <asp:RadioButton ID="rdbSts" Text="Status" runat="server" GroupName="opc" />
                            <asp:RadioButton ID="rdbUDM" Text="UDM" runat="server" GroupName="opc" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Opción:</label>
                            <asp:TextBox ID="txtNom_opc" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</div>
</asp:Content>
