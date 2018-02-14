<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaIncidencias.aspx.cs" Inherits="WebAppReporteIncidencias.AltaIncidencias" %>
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
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Por favor ingresa la informacion de las incidencias." /></strong>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Fecha:</label>
                            <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control" Width="170" ReadOnly></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Auditor/Coordinador:</label>
                            <asp:TextBox ID="txtCoordinador" runat="server" CssClass="form-control" TabIndex="3" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Origen/Proveedor:</label>
                            <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="form-control" TabIndex="6"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Factura:</label>
                            <asp:TextBox ID="txtFactura" runat="server" CssClass="form-control" Width="200" TabIndex="9" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Material Afectado:</label>
                            <asp:DropDownList ID="ddlMaterial" runat="server" CssClass="form-control" TabIndex="12"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Norma de estiba:</label>
                            <asp:TextBox ID="txtEstiba" runat="server" CssClass="form-control" Width="200" TabIndex="15" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Accion de Contencion:</label>
                            <asp:TextBox ID="txtContencion" runat="server" CssClass="form-control" TabIndex="18" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Evidencias:</label><br />
                            Contenedor e imágenes fila frontal 
                            <asp:FileUpload ID="upfFilaFrontal" runat="server" CssClass="form-control" TabIndex="22" accept=".gif,.jpg,.png" />
                            Fotografías de la fila de pallets en donde se encuentre el daño 
                            <asp:FileUpload ID="upfFilaPallet" runat="server" CssClass="form-control" TabIndex="23" accept=".gif,.jpg,.png"/>
                            Acercamiento al pallet específico marcando el sitio en donde se encuentra el material dañado 
                            <asp:FileUpload ID="upfAcercaPallet" runat="server" CssClass="form-control" TabIndex="24" accept=".gif,.jpg,.png" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>No. STO:</label>
                            <asp:TextBox ID="txtSto" runat="server" CssClass="form-control" Width="220" TabIndex="1" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Incidencia:</label>
                            <asp:DropDownList ID="ddlIncidencia" runat="server" CssClass="form-control" TabIndex="4" Width="250"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Codigo:</label>
                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" Width="200" TabIndex="7" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Lote:</label>
                            <asp:TextBox ID="txtLote" runat="server" CssClass="form-control" Width="200" TabIndex="10" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Cantidad:</label>
                            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" Width="170" TabIndex="13" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Transporte:</label>
                            <asp:TextBox ID="txtTransporte" runat="server" CssClass="form-control" Width="200" TabIndex="16" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Fecha de cierre:</label>
                            <asp:TextBox ID="txtCierre" runat="server" TextMode="Date" CssClass="form-control" Width="170" TabIndex="19" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label style="color:#FFEC9E;">.</label><br />
                            Foto de tarima dañada
                            <asp:FileUpload ID="upfTarimaDanada" runat="server" CssClass="form-control" TabIndex="25" accept=".gif,.jpg,.png"/>
                            Foto de los sacos dañados en donde sea visible la etiqueta del proveedor 
                            <asp:FileUpload ID="upfSacosDanado" runat="server" CssClass="form-control" TabIndex="26" accept=".gif,.jpg,.png"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Turno:</label>
                            <asp:DropDownList ID="ddlTurno" runat="server" CssClass="form-control" Width="170" TabIndex="2"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Familia:</label>
                            <asp:DropDownList ID="ddlFamilia" runat="server" CssClass="form-control" Width="200" TabIndex="5"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>PO:</label>
                            <asp:TextBox ID="txtPO" runat="server" CssClass="form-control" TextMode="Number" Width="200" TabIndex="8" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Descripcion:</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TabIndex="11" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>UDM:</label>
                            <asp:DropDownList ID="ddlUdm" runat="server" CssClass="form-control" Width="150" TabIndex="14"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Operador:</label>
                            <asp:TextBox ID="txtOperador" runat="server" CssClass="form-control" TabIndex="17" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Ya fue atendida?</label>
                            <asp:RadioButtonList ID="rblAtendido" runat="server"></asp:RadioButtonList>
                            <asp:RadioButton ID="rblSi" GroupName="rblAtendido" runat="server" Text="Si" TabIndex="20"></asp:RadioButton>
                            <asp:RadioButton ID="rblNo" GroupName="rblAtendido" runat="server" Text="No" TabIndex="21" Checked></asp:RadioButton>
                        </div>
                        <div class="form-group">
                            <label>Observaciones:</label>
                            <asp:TextBox ID="txtObs" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="7" TabIndex="27"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="container">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" />
                    </div>
                </div>
                <hr />
            </div>
        </div>
    </div>
</div>
</asp:Content>
