<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImgIncidencias.aspx.cs" Inherits="WebAppReporteIncidencias.ImgIncidencias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DHL</title>
    <link type="text/css" rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css")%>" /> 
    <script type="text/javascript" src="<%= ResolveUrl("~/Scripts/bootstrap.min.js") %>"></script>
    <script type="text/javascript" src="<%= ResolveUrl("~/Scripts/jquery-1.10.2.min.js") %>"></script>
    <link rel="shortcut icon" href="<%=ResolveUrl("~/Images/dhlA.ico") %>" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="col s12 card-panel grey lighten-5 z-depth-1">
            <div class="row">
                <div class="alert alert-warning text-center" role="alert">
                    <strong>
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <asp:Label runat="server" Text="Imagenes de las incidencias." /></strong>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m4 l2"><p>.</p></div>
                <div class="col s12 m4 l8">
                    <p>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" BackColor="White"
                                HeaderStyle-BackColor="#363636" HeaderStyle-ForeColor="White"
                                CssClass="table table-responsive" HeaderStyle-Height="50px"
                                EmptyDataText="No hay imagenes registradas">
                            <Columns>
                                <asp:TemplateField HeaderText="Contenedor e imágenes fila frontal" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <center><img src='<%# ResolveUrl(Eval("fila_frontal").ToString()) %>' height="300" /></center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fotografías de la fila de pallets en donde se encuentre el daño" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <center><img src='<%# ResolveUrl(Eval("fila_pallet").ToString()) %>' height="300" /></center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Acercamiento al pallet específico marcando el sitio en donde se encuentra el material dañado" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <center><img src='<%# ResolveUrl(Eval("acerca_pallet").ToString()) %>' height="300" /></center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Foto de tarima dañada" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <center><img src='<%# ResolveUrl(Eval("tarima_danada").ToString()) %>' height="300" /></center>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </p>
                </div>
                <div class="col s12 m4 l2"><p>.</p></div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
