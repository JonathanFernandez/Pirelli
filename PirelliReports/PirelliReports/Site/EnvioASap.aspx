<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="EnvioASap.aspx.cs" Inherits="PirelliReports.Site.EnvioASap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div id="page-wrapper">
    <div class="container-fluid form-pirelli">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Envio a SAP
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-upload"></i> Envio a SAP
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page Heading /.row -->

            <%--ROW Form--%>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group form-pirelli">

                        <asp:TextBox runat="server" ID="txtCodigoCliente" CssClass="form-control" placeholder="Código de Cliente"></asp:TextBox>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" placeholder="Descripción de Cliente"></asp:TextBox>
                        <p class="help-block"></p>

                        <%--<asp:TextBox runat="server" ID="txtCantidadRegistro" CssClass="form-control" TextMode="Number" placeholder="Cantidad de Registro"></asp:TextBox>--%>
                        <asp:DropDownList runat="server" ID="ddlCantidadRegistros" CssClass="form-control" placeholder="Cantidad de Registros"></asp:DropDownList>
                        <p class="help-block"></p>

                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">

                        <asp:DropDownList runat="server" ID="ddlFamiliaAgrup" CssClass="form-control" placeholder="Familia Agrup"></asp:DropDownList>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtPromo" CssClass="form-control" placeholder="Promo"></asp:TextBox>
                        <p class="help-block"></p>

                        <%--<div class="form-inline">
                            <label>Seleccionar Todos: </label>
                                <asp:CheckBox runat="server" ID="chkSeleccionarTodos" />
                        </div>--%>

                        <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>

                        <asp:LinkButton runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" class="btn btn-warning" ><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                    </div>
                </div>
            </div>
         <div class="row">
                <div class="col-lg-12">
                <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</asp:LinkButton>
                </div>
         </div>
            <%-- /ROW Form--%>
            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">

                <asp:GridView ID="gvListadoFacturasAgrupadas" class="table table-responsive table-bordered table-hover table-striped table-condensed"  AutoGenerateColumns="false" runat="server">
                <Columns>
                        <asp:BoundField HeaderText="CODCLIE" DataField="CODCLIE" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="DESCCLI" DataField="DESCCLI" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CUIT" DataField="CUIT" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="IP" DataField="IP" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="DESCR" DataField="DESCR" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CANTIDAD" DataField="CANTIDAD" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="PROCESADO" DataField="PROCESADO" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="DESCUENTO" DataField="DESCUENTO" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CODPROMO" DataField="CODPROMO" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="DESCTIPOPROMO" DataField="DESCTIPOPROMO" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CLIREFILL" DataField="CLIREFILL" />
                    </Columns>
                </asp:GridView>

            </div>
          
        </div>
    </div>
                <%-- MODAL filtros --%>
            <div class="modal fade " id="modalFiltros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-full-width" role="document">
                    <div class="modal-content modal-full-height">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="page-header modal-title" id="myModalLabel">Filtros
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <%--<label>IP:</label>--%>

                                        <%--<asp:TextBox runat="server" ID="txtFiltrosIP" CssClass="form-control" placeholder="Código de Neumatico"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescripcion" CssClass="form-control" placeholder="Descripción"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:DropDownList runat="server" ID="ddlFiltrosPais" CssClass="form-control" placeholder="Pais"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosOtros" CssClass="form-control" placeholder="Otro"></asp:TextBox>
                                        <p class="help-block"></p>--%>
                                        <div class="checklist-container full-height">
                                             <asp:CheckBoxList runat="server" ID="chklistIPFlgBus"></asp:CheckBoxList>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <div class="checklist-container full-height">
                                            <asp:CheckBoxList runat="server" ID="chklistCliFlgBus"></asp:CheckBoxList>
                                         </div>
                                        <%-- <asp:DropDownList runat="server" ID="ddlFiltrosFamilia" CssClass="form-control" placeholder="familia"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosMarca" CssClass="form-control" placeholder="Marca"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRango" CssClass="form-control" placeholder="Rango"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRodado" CssClass="form-control" placeholder="Rodado"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <div class="form-inline">
                                            <label>Baja Lógica: </label>
                                             <asp:CheckBox runat="server" ID="chkFiltrosBajaLogica" />
                                        </div>--%>
                                   </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
                                <asp:LinkButton runat="server" OnClick="btnFiltrosGrabar_Click" ID="btnFiltrosGrabar" CssClass="btn btn-warning"><i class="fa fa-save"></i> Grabar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Fin modal Filtrros --%>


        <%-- MODAL EDIT --%>
       
        <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-full-width" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="page-header modal-title">Editar</h4>
                        <br />
                        <h2><asp:Label runat="server" ID="lblEdicion"></asp:Label> </h2>

                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <%--<label>IP:</label>--%>

                                    <asp:TextBox runat="server" ID="txtRango" MaxLength="1" CssClass="form-control" placeholder="Rango"></asp:TextBox>
                                    <p class="help-block"></p>

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">

                                    <div class="form-inline">
                                        <label>Baja Lógica: </label>
                                            <asp:CheckBox runat="server" ID="chkBajaLogica" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                                <asp:LinkButton runat="server" ID="btnAceptar" class="btn btn-warning">Aceptar</asp:LinkButton>
                        </div>
                </div>
            </div>
        </div>
    </div>
        <%-- Fin modal EDIT --%>
         <%-- MODAL mensaje --%>
                    <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title" id="myModalSincro">Edición de Neumatico
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h4><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
         <%-- Fin modal mensaje --%>
</asp:Content>
