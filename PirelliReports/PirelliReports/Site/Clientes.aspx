<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="PirelliReports.Site.Clientes" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <script>

        function OpenPopUp(url) {
            hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
            return false;
        }

        function openModal() {
            $('#modalEdit').modal('show');
        }

        function reDrawMaps() {

            $('#modalMaps').on('shown.bs.modal', function () {

                google.maps.event.trigger(document.getElementById("subgurim_GMap1"), "resize");

            });

        }
    </script>

    <div class="container-fluid table-pirelli">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Clientes
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i><a href="index.html">Index</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-user"></i> Clientes
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page Heading /.row -->

        <div class="row">
            <div class="col-lg-12">
                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-search"></i> Envio A Excel</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnVerMapa" OnClientClick="reDrawMaps();" class="btn btn-warning" data-toggle="modal" data-target="#modalMaps"><i class="fa fa-map-marker"></i> Ver Mapa</asp:LinkButton>

            </div>
            <%-- MODAL maps --%>
            <div class="modal fade" id="modalMaps" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="page-header modal-title" id="myModalMaps">Maps
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" id="googleMaps">
                                    <%--<cc:GMap ID="GMap1" runat="server" />--%>
                                    <br />
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%-- Fin modal MAPS --%>

            <%-- MODAL filtros --%>
            <div class="modal fade" id="modalFiltros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
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

                                        <asp:TextBox runat="server" ID="txtFiltrosCod" CssClass="form-control" placeholder="Codigo Cliente"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRazSoc" CssClass="form-control" placeholder="Razón Social"></asp:TextBox>
                                        <p class="help-block"></p>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:DropDownList runat="server" ID="ddlFiltrosProvincias" CssClass="form-control" placeholder="Provincias"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <div class="form-inline">
                                            <label>Baja Lógica: </label>
                                             <asp:CheckBox runat="server" ID="chkFiltrosBajaLogica" />
                                        </div>
                                   </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
                                <asp:LinkButton runat="server" ID="btnLFiltrosimpiar" OnClientClick="btnFiltrosLimpiar_OnClientClick()" CssClass="btn btn-warning"><i class="fa fa-trash"></i> Limpiar</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnFiltrosBuscar" OnClick="btnFiltrosBuscar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Fin modal Filtrros --%>
            <br />
            <br />
            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">

                <asp:GridView ID="gvListadoClientes" class="table table-responsive table-bordered table-hover table-striped table-condensed" OnSelectedIndexChanged="gvListadoClientes_SelectedIndexChanged" AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:CommandField ControlStyle-CssClass="btn btn-warning btn-edit-modal"   HeaderText="Edición"  SelectText="Editar" ShowSelectButton="true" />
                    </Columns>
                   <%--  <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-edit-modal" CommandName="Editar" OnClientClick="alert();return false;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>--%>

                    <Columns>
                        <asp:BoundField HeaderText="Cod" DataField="Cod" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CodCliMatriz" DataField="CodCliMatriz" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CodCliRefill" DataField="CodCliRefill" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CUIT" DataField="CUIT" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CentroEmisor" DataField="CentroEmisor" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="RazSoc" DataField="RazSoc" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="NomFant" DataField="NomFant" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="DirSuc" DataField="DirSuc" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="DirFact" DataField="DirFact" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Barrio" DataField="Barrio" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Ciudad" DataField="Ciudad" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CodProv" DataField="CodProv" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Pais" DataField="Pais" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CodRegion" DataField="CodRegion" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="TelefonoSuc" DataField="TelefonoSuc" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="TelefonoFact" DataField="TelefonoFact" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="TerminalPOS" DataField="TerminalPOS" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="EMail" DataField="EMail" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="PaginaWEB" DataField="PaginaWEB" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CTC_CAR" DataField="CTC_CAR" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CTC_TRUCK" DataField="CTC_TRUCK" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="NOTA" DataField="NOTA" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FechaAlta" DataField="FechaAlta" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FechaUpd" DataField="FechaUpd" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FlgBajaLogica" DataField="FlgBajaLogica" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FlgFilBusq" DataField="FlgFilBusq" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Latitud" DataField="Longitud" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Longitud" DataField="Longitud" />
                    </Columns>
                    
                </asp:GridView>

            </div>

            <%-- MODAL EDIT --%>
            <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-full-width" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="page-header modal-title">Editar
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <%--<label>IP:</label>--%>

                                        <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Código" disabled="true"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" placeholder="Código Cliente Matriz"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Código Cliente Refil"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" placeholder="Razón social"></asp:TextBox>
                                        <p class="help-block"></p>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="TextBox5" CssClass="form-control" placeholder="Dirección"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="TextBox6" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="TextBox7" CssClass="form-control" placeholder="Página Web"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <div class="form-inline">
                                            <label>Baja Lógica: </label>
                                             <asp:CheckBox runat="server" ID="chkBajaLogica" />
                                        </div>
                                   </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Fin modal EDIT --%>
    </div>
    </div>
    <script>
        //window.setTimeout(function () { google.maps.event.trigger("googleMaps", 'resize') }, 0);

    </script>
</asp:Content>

