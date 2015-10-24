<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="FacturasPromoVisa.aspx.cs" Inherits="PirelliReports.Site.FacturasPromoVisa" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(window).load(function () {
            $(".btn-sticky").sticky({ topSpacing: 50 });
        });

        function OpenPopUp(url) {
            hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
            return false;
        }

        function btnFiltrosLimpiar_OnClientClick() {
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosCodCliente").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosRazonSocial").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosCuotas").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosFlag").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosDescuento").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosUsuarioAlta").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosNumeroFactura").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosIP").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosDescripcion").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosAgrup").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosTicket").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosCodPromo").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosDesde").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosHasta").value = "";
            openModal();
            return false;
        }

        function chkFechas_OnChange() {
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_chkFechas").checked) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosDesde").disabled = false;
                document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosHasta").disabled = false;
            }
            else {
                document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosDesde").disabled = true;
                document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosHasta").disabled = true;
            }
        }



        function openModal() {
            $('#modalFiltros').modal('show');
        }

        function openModalEdit() {
            $('#modalEdit').modal('show');
        }

        function reDrawMaps() {

            $('#modalMaps').on('shown.bs.modal', function () {

                google.maps.event.trigger(document.getElementById("subgurim_GMap1"), "resize");

            });

        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">

    <div class="container-fluid table-pirelli">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Facturas Promo Visa
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i><a href="index.html">Index</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i>Facturas Promo Visa
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
                                    <cc:GMap ID="GMap1" runat="server" />
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

                                        <asp:TextBox runat="server" ID="txtFiltrosIP" CssClass="form-control" placeholder="IP"></asp:TextBox>
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosAgrup" CssClass="form-control" placeholder="Agrup"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescripcion" CssClass="form-control" placeholder="Descripción IP"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosCodCliente" CssClass="form-control" placeholder="Codigo de Cliente"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRazonSocial" CssClass="form-control" placeholder="Razon Social"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosCodPromo" CssClass="form-control" placeholder="Codigo Promo"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosCuotas" CssClass="form-control" placeholder="Cuotas"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <label>Cantidad de Registros</label>
                                        <asp:DropDownList runat="server" ID="ddlFiltrosCantidadRegistros" CssClass="form-control" placeholder="Cantidad de Registros"></asp:DropDownList>
                                        <p class="help-block"></p>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">

                                        <asp:TextBox runat="server" ID="txtFiltrosTicket" CssClass="form-control" placeholder="Ticket"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosFlag" CssClass="form-control" placeholder="Flag Procesado"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescuento" CssClass="form-control" placeholder="Descuento"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosUsuarioAlta" CssClass="form-control" placeholder="Usuario de Alta"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosNumeroFactura" CssClass="form-control" placeholder="Numero de Factura"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:DropDownList runat="server" ID="ddlFiltrosFamilia" CssClass="form-control" placeholder="Familia"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <label>Filtrar por fecha de carga</label>
                                        <p class="help-block"></p>

                                        <label>Rango de fechas</label>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-group">
                                                    <p>
                                                        <asp:TextBox runat="server" ID="dpFiltrosDesde" class="date-picker form-control" placeholder="Desde"></asp:TextBox>
                                                        <label for="dpDesde" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                    </p>
                                                </div>

                                                <div class="input-group">
                                                    <p>
                                                        <asp:TextBox runat="server" ID="dpFiltrosHasta" class="date-picker form-control" placeholder="Hasta"></asp:TextBox>
                                                        <label for="dpHasta" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <script>

                                            $(".date-picker").datepicker();

                                            //var date = $('#datepicker').datepicker({ dateFormat: 'dd-mm-yy' }).val();

                                            $(".date-picker").on("change", function () {

                                                var id = $(this).attr("id");
                                                var val = $("label[for='" + id + "']").text();
                                                $("#msg").text(val + " changed");
                                            });


                                            $(".date-picker").css("z-index", "9999");
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i>Close</button>
                                <asp:LinkButton runat="server" ID="btnLFiltrosimpiar" OnClientClick="btnFiltrosLimpiar_OnClientClick()" CssClass="btn btn-warning"><i class="fa fa-search"></i> Limpiar</asp:LinkButton>
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

                <%--<cc:GMap ID="GMap2" runat="server" />--%>

                <asp:GridView ID="gvListadosFacturasVisa" class="table table-responsive table-bordered table-hover table-striped table-condensed" OnSelectedIndexChanged="gvListadosFacturasVisa_SelectedIndexChanged" AutoGenerateColumns="false" runat="server">
                    <%-- <Columns>
                                <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning" DataTextField="Boton"  HeaderText="Boton"  />
                            </Columns>--%>
                    <Columns>
                        <asp:CommandField ControlStyle-CssClass="btn btn-warning btn-edit-modal" HeaderText="Edición" SelectText="Editar" ShowSelectButton="true" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" />
                    </Columns>
                    <Columns>
                        <asp:HyperLinkField HeaderText="Esker Link" DataTextField="Esker Link" DataNavigateUrlFormatString="http://{0}" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="IP" DataField="IP" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Cuotas" DataField="Cuotas" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Lote" DataField="LOTE" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Codigo Cliente" DataField="CODCLIE" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Fecha" DataField="FECHA" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Ciudad" DataField="CIUDAD" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Codigo Provincia" DataField="CODPROV" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Provincia" DataField="DESCPROV" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Descripción" DataField="DESCR" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Cod" DataField="Cod" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Cuit" DataField="Cuit" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Cliente" DataField="DESCCLI" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Ticket" DataField="TICKET" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Factura" DataField="FACTURA" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Promo" DataField="codPromo" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Flag Procesado" DataField="FlgProcesado" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Nro Ticket" DataField="NroTicket" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Usuario" DataField="NombreUsu" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FecAlta" DataField="FecAlta" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="UsuAlta" DataField="UsuAlta" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FecSubSAP" DataField="FecSubSAP" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CodAGRUP" DataField="CodAGRUP" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="FecUltAct" DataField="FecUltAct" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="UsuUltAct" DataField="UsuUltAct" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Lote" DataField="LOTE" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Nota" DataField="Nota" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Esker_ID" DataField="Esker_ID" />
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

                            <%-- Primera fila --%>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="input-group margin-15">
                                        <input id="date-picker-1" type="text" class="date-picker form-control" placeholder="Fecha" />
                                        <label for="date-picker-1" class="input-group-addon btn">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-inline">
                                        <label>Tipo promo:</label>
                                        <asp:DropDownList runat="server" ID="DropDownList1" CssClass="form-control" placeholder="Cantidad de Registros"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="form-inline">
                                        <label>Cuotas: </label>
                                        <%--<input type="text" class="form-control input-mini" id="txtEditPrecio" placeholder="1" />--%>
                                        <asp:TextBox runat="server" class="form-control input-mini" id="txtEditCuota" placeholder="1"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="form-inline">
                                        <label>Descuento: </label>
                                        <asp:DropDownList runat="server" ID="DropDownList2" CssClass="form-control" placeholder="Cantidad de Registros"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="form-inline">
                                        <button class="btn btn-warning">Limpiar Campos</button>
                                    </div>
                                </div>
                            </div>
                            <%-- Fin primera fila --%>

                            <%-- Row Columnas --%>
                            <div class="row">
                            <%-- Primera Columna Neumaticos --%>
                                <div class="col-lg-4 borde-separador">
                                    <h3 class="page-header modal-title margin-15">Neumatico</h3>
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Medida: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="Código" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <asp:DropDownList runat="server" ID="DropDownList5" CssClass="form-control pull-right" placeholder="Medida"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Rango: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="1" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Diseño: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="1" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Marca: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="1" />
                                        </div>
                                    </div>
                                </div>

                                <%-- /Primera Columna Neumaticos --%>

                                <%-- Segunda Columna Factura --%>

                                <div class="col-lg-4 borde-separador">
                                    <h3 class="page-header modal-title margin-15">Factura</h3>
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Cantidad: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="10" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Precio: </label>
                                            <%--<input type="text" class="form-control pull-right" id="" placeholder="$" />--%>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditPrecio" placeholder="$"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Fac: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="1234" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Ticket: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="4321" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Autor: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="4321" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Tarjeta: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="4321" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Comp: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="4321" />
                                        </div>
                                    </div>
                                </div>
                                <%-- /Segunda Columna Factura --%>

                                 <%-- Tercera Columna Clientes --%>

                                <div class="col-lg-4 borde-separador">
                                    <h3 class="page-header modal-title margin-15">Cliente</h3>
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Cliente: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="Código" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                           <asp:DropDownList runat="server" ID="DropDownList6" CssClass="form-control pull-right" placeholder="Medida"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Región: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="01" />
                                        </div>
                                    </div>
                                </div>

                                <%-- /Tercera Columna Clientes --%>

                            </div>
                            <%-- /Row Columnas--%>

                            <%-- Row Datos de usuario --%>
                            <div class="row">
                                <h3 class="page-header modal-title margin-15 margin-header">Datos de Usuario</h3>
                           
                                <%-- Primera Columna Neumaticos --%>
                                <div class="col-lg-4 borde-separador">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nombre: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="Juan Jose" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Dirección: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="Habana 1234" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Vehículo: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="Gol 1.6" />
                                        </div>
                                    </div>
                                </div>
                                <%-- /Primera Columna Neumaticos --%>

                                <%-- Segunda Columna --%>
                                <div class="col-lg-4 borde-separador">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Provincia: </label>
                                            <asp:DropDownList runat="server" ID="DropDownList3" CssClass="form-control pull-right" placeholder="Provincia"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Teléfono: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="3456-3456" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="1" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Piso: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="1" />
                                        </div>
                                    </div>
                                </div>
                                <%-- /Segunda Columna--%>

                                <%-- Tercera Columna--%>
                                <div class="col-lg-4 borde-separador">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Ciudad: </label>
                                            <asp:DropDownList runat="server" ID="DropDownList4" CssClass="form-control pull-right" placeholder="Provincia"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Cod Postal: </label>
                                            <input type="text" class="form-control input-medium pull-right" id="" placeholder="Habana 1234" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Vehículo: </label>
                                            <input type="text" class="form-control pull-right" id="" placeholder="Gol 1.6" />
                                        </div>
                                    </div>
                                </div>
                                <%-- /Tercera Columna--%>

                                </div>
                            <%-- /Row Datos de usuario --%>

                            <%-- Row Nota y botones --%>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-inline">
                                        <label>Nota: </label>
                                        <textarea class="form-control input-full" rows="3" placeholder="Nota"></textarea>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="form-inline">
                                        <br />
                                        <button class="btn btn-success btn-block">Aceptar</button>
                                        <button class="btn btn-danger btn-block">Cancelar</button>
                                    </div>
                                </div>

                            </div>
                            <%-- /Row Nota y botones --%>
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
