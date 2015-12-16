<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="EnvioASap.aspx.cs" Inherits="PirelliReports.Site.EnvioASap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script>
        function openModal() {
            $('#modalMensaje').modal('show');

        }
        function imgSap(){
            $(".div-trucho").hide();
            $(".div-piola h4").show();
        }
        setTimeout(imgSap, 5000);

        
        //setTimeout(imgSap, 10000);

        function activarSpinner() {

        }

        function desactivarSpinner() {
            //$(".spinner-container").css({ display: "none" });
        }

        $(document).ready(function () {
            $("#ENVIOASAP").addClass("active");

            $('form').validate({
                rules: 
                {
                    <%=txtCodigoCliente.UniqueID %>: 
                    {
                        digits: true,
                        maxlength: 10
                    },
                    <%=txtDescripcion.UniqueID %>: 
                    {                        
                        maxlength: 45   
                    },
                    <%=txtPromo.UniqueID %>: 
                    {                        
                       digits: true
                    }  
                },
                messages: 
                {  
                    <%=txtCodigoCliente.UniqueID %>: 
                    {
                        digits: "Solo se permiten digitos de [0-9] para el codigo de cliente",
                        maxlength: "Se permiten 10 digitos como maximo para el codigo de cliente"  
                    },
                    <%=txtDescripcion.UniqueID %>: 
                    {
                        maxlength: "Se permiten 45 caracteres como maximo para la descripcion"
                    },
                    <%=txtPromo.UniqueID %>: 
                    {
                        digits: "Solo se permiten digitos de [0-9] para el codigo de la promocion"
                    }, 
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div id="page-wrapper">
    <div class="container-fluid form-pirelli">
        <!-- Page Heading -->
        <div class="spinner-container">
                <div class="sk-circle">
                    <div class="sk-circle1 sk-child"></div>
                    <div class="sk-circle2 sk-child"></div>
                    <div class="sk-circle3 sk-child"></div>
                    <div class="sk-circle4 sk-child"></div>
                    <div class="sk-circle5 sk-child"></div>
                    <div class="sk-circle6 sk-child"></div>
                    <div class="sk-circle7 sk-child"></div>
                    <div class="sk-circle8 sk-child"></div>
                    <div class="sk-circle9 sk-child"></div>
                    <div class="sk-circle10 sk-child"></div>
                    <div class="sk-circle11 sk-child"></div>
                    <div class="sk-circle12 sk-child"></div>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Envio a SAP
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Index.aspx"><i class="fa fa-dashboard"></i> Index </asp:HyperLink>
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

                        <asp:TextBox runat="server" ID="txtCodigoCliente" CssClass="form-control" placeholder="Código de Cliente" MaxLength="10"></asp:TextBox>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" placeholder="Descripción de Cliente" MaxLength="45"></asp:TextBox>
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
         <div class="row margin-15">
                <div class="col-lg-12">
                    <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnEnviarSap" OnClientClick="imgSap();" OnClick="btnEnviarSap_Click" class="btn btn-warning"><i class="fa fa-upload"></i> Envio A SAP</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnResfrescar" OnClick="btnResfrescar_Click" class="btn btn-warning"><i class="fa fa-refresh"></i> Refrescar</asp:LinkButton>
                </div>
         </div>
            <%-- /ROW Form--%>
            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">

                <asp:GridView ID="gvListadoFacturasAgrupadas" class="table table-responsive table-bordered table-hover table-striped table-condensed table-black"  AutoGenerateColumns="false" runat="server">
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
                            <h4 class="page-header modal-title" id="myModalSincro">Envio a SAP
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="div-trucho">
                                    <img class="img-sap" src="../Content/img/sap.png" />
                                      <div class="spinner-container">
                                        <div class="sk-circle">
                                            <div class="sk-circle1 sk-child"></div>
                                            <div class="sk-circle2 sk-child"></div>
                                            <div class="sk-circle3 sk-child"></div>
                                            <div class="sk-circle4 sk-child"></div>
                                            <div class="sk-circle5 sk-child"></div>
                                            <div class="sk-circle6 sk-child"></div>
                                            <div class="sk-circle7 sk-child"></div>
                                            <div class="sk-circle8 sk-child"></div>
                                            <div class="sk-circle9 sk-child"></div>
                                            <div class="sk-circle10 sk-child"></div>
                                            <div class="sk-circle11 sk-child"></div>
                                            <div class="sk-circle12 sk-child"></div>
                                        </div>
                                    </div>
                                    <h4 class="text-center">Estableciendo conexión...</h4>
                                </div>

                                <div class="div-piola">
                                    <h4 style="display: none"><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         <%-- Fin modal mensaje --%>

             <%-- MODAL SAP --%>
            <div class="modal fade" id="modalSap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         <%-- Fin modal SAP --%>
</asp:Content>
