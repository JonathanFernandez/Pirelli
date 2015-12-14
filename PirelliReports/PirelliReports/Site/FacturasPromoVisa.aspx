<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="FacturasPromoVisa.aspx.cs" Inherits="PirelliReports.Site.FacturasPromoVisa" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(window).load(function () {
            $(".btn-sticky").sticky({ topSpacing: 50 });
        });

        function OpenPopUp(url) {
            hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
            return false;
        }

        function OpenNewTab(url) {
            hidden = open(url);
            return false;
        }

        function btnCrearOnClientClick() {
            url = "ABMFacturasPromoVisa.aspx";
            OpenNewTab(url);
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
            openModalFiltros();
            return false;
        }

        function btnEditarLimpiarCampos_OnClientClick()
        {
            document.getElementById("PaginaCentral_ContentPlaceHolder_dpEditarFecha").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditCuota").value = "0";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarMedida").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarRango").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarDisenio").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarMarca").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarCantidad").value = "1";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditPrecio").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarNumFactura").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarticket").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarAutor").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarTarjeta").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarNumCompra").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarNombre").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarDireccion").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarTelefono").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarNumero").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarPiso").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarNota").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarCiudad").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarCodigoPostal").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarVehiculo").value = "";
            openModalEdit();
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
        
        function openModalFiltros() {
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

        $(document).ready(function () {
            $.validator.addMethod("decimal", 
                                       function (value, element) {
                                           return this.optional(element) || /^\d{0,2}(\.\d{0,2})?$/i.test(value);
                                       }, "Incluya 2 decimales");

            $.validator.addMethod("greaterThan", 
                                   function(value, element) 
                                   {            
                                       if (value != "" && parametro != "") 
                                       {
                                           var parametro = document.getElementById("PaginaCentral_ContentPlaceHolder_dpFiltrosDesde").value;
                                        
                                           var partesFechaFinal = value.split('/');
                                           var partesFechaInicial = parametro.split('/')
                                           var diaFechaFinal = partesFechaFinal[0];
                                           var mesFechaFinal = partesFechaFinal[1];
                                           var anioFechaFinal = partesFechaFinal[2];
                                           var diaFechaInicial = partesFechaInicial[0];
                                           var mesFechaInicial = partesFechaInicial[1];
                                           var anioFechaInicial = partesFechaInicial[2];

                                           var fechaFinal = anioFechaFinal + "-" + mesFechaFinal + "-" + diaFechaFinal;
                                           var fechaInicial = anioFechaInicial + "-" + mesFechaInicial + "-" + diaFechaInicial;

                                           return new Date(fechaFinal) > new Date(fechaInicial); 
                                       
                                       }
                                       else
                                           return true;
                                   }, "La fecha final debe ser mayor que la fecha inicial");

            $.validator.addMethod("dateValid", 
                                  function(value, element) 
                                  {
                                      // Checks for the following valid date formats:
                                      // MM/DD/YYYY
                                      // Also separates date into month, day, and year variables
                                      var patron = /^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/;;
 
                                      var res = value.match(patron); // is the format ok?
                                      if (res != null) 
                                      {
                                          return true;
                                      }
                                      else
                                      {
                                          return false;
                                      }
                                  }, "Ingrese una fecha valida [dd/mm/yyyy]");

            $('form').validate({
                rules:
                {
                    <%=txtFiltrosIP.UniqueID %>: 
                    {                        
                        digits: true,
                        minlength: 7,
                        maxlength: 7
                    },
                    <%=txtFiltrosAgrup.UniqueID %>: 
                    {                        
                        digits: true
                    },
                    <%=txtFiltrosDescripcion.UniqueID %>: 
                    {                        
                        maxlength: 50
                    },
                    <%=txtFiltrosCodCliente.UniqueID %>: 
                    {                        
                        digits: true,
                        minlength: 10,
                        maxlength: 10
                    },
                     <%=txtFiltrosRazonSocial.UniqueID %>: 
                    {                        
                        maxlength: 45   
                    },
                     <%=txtFiltrosCodPromo.UniqueID %>: 
                    {                        
                        digits: true   
                    },
                     <%= txtFiltrosCuotas.UniqueID %>: 
                    {                        
                        digits: true,
                        maxlength: 2
                    },
                     <%=txtFiltrosTicket.UniqueID %>: 
                    {                        
                        digits: true   
                    },
                     <%=txtFiltrosFlag.UniqueID %>: 
                    {                        
                        digits: true,
                        maxlength: 1,
                        range: [0, 1]
                    },
                     <%=txtFiltrosDescuento.UniqueID %>: 
                    {                        
                        number: true,
                        decimal: true
                    },
                     <%=txtFiltrosUsuarioAlta.UniqueID %>: 
                    {                        
                       maxlength: 10
                    },
                     <%=txtFiltrosNumeroFactura.UniqueID %>: 
                    {                        
                        digits: true,
                        maxlength: 13
                    },
                     <%=dpFiltrosDesde.UniqueID %>: 
                    {                        
                        dateValid: true   
                    },
                     <%=dpFiltrosHasta.UniqueID %>: 
                    {                        
                        dateValid: true,
                        greaterThan: true   
                    },
                },
                messages:
                {
                       <%=txtFiltrosIP.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-9] en la IP",
                        minlength: "Se requieren 7 digitos como minimo para la IP",
                        maxlength: "Se permiten 7 digitos como maximo para la IP"
                    },
                    <%=txtFiltrosAgrup.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-9] en la agrupacion"
                    },
                    <%=txtFiltrosDescripcion.UniqueID %>: 
                    {                        
                        maxlength: "Se permiten 50 caracteres como maximo para la IP"
                    },
                    <%=txtFiltrosCodCliente.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-9] en el codigo de cliente",
                        minlength: "Se requieren 10 digitos como minimo para el codigo de cliente",
                        maxlength: "Se permiten 10 digitos como maximo para el codigo de cliente"
                    },
                    <%=txtFiltrosRazonSocial.UniqueID %>: 
                    {                        
                        maxlength: "Se permiten 45 caracteres como maximo para la razon social"
                    },
                    <%=txtFiltrosCodPromo.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-9] en el codigo de la promocion"
                    },
                    <%= txtFiltrosCuotas.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-9] para el numero de cuotas",
                        maxlength: "Se permiten 2 digitos como maximo para el numero de cuotas"
                    },
                    <%=txtFiltrosTicket.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-9] para el ticket"
                    },
                    <%=txtFiltrosFlag.UniqueID %>: 
                    {                        
                        digits: "Solo se permiten digitos de [0-1] para el flag",
                        maxlength: "Se permite 1 digito binario para el flag",
                        range: "Rango valido [0-1]"
                    },
                    <%=txtFiltrosDescuento.UniqueID %>: 
                    {                        
                        number: "Ingreso un numero. Puede incluir decimales"
                    },
                    <%=txtFiltrosUsuarioAlta.UniqueID %>: 
                    {                        
                        maxlength: "Se permiten 10 caracteres como maximo para usuario alta"
                    },
                    <%=txtFiltrosNumeroFactura.UniqueID %>: 
                    {                        
                        digits: "Se permiten digitos de [0-9] para el numero de factura",
                        maxlength: "Se permiten 13 caracteres como maximo para numero de factura"
                    },
                    <%=dpFiltrosDesde.UniqueID %>: 
                    {                        
                        dateValid: "Ingrese fecha inicial en formato [dd/mm/yyyy]"
                    },
                    <%=dpFiltrosHasta.UniqueID %>: 
                    {                        
                        dateValid:"Ingrese fecha final en formato [dd/mm/yyyy]",
                        greaterThan: "La fecha final debe ser mayor que la fecha inicial" 
                    },
                }
            });
        });
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
                        <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-credit-card"></i> Facturas Promo Visa
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page Heading /.row -->

        <div class="row">
            <div class="col-lg-12">
                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnVerMapa" OnClientClick="reDrawMaps();" class="btn btn-warning" data-toggle="modal" data-target="#modalMaps"><i class="fa fa-map-marker"></i> Ver Mapa</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnCrear" OnClientClick="btnCrearOnClientClick();" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Crear Factura</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnRefrescar" OnClick="btnRefrescar_Click" class="btn btn-warning"><i class="fa fa-refresh"></i> Refrescar</asp:LinkButton>
                
                <asp:TextBox runat="server" class="form-control input-mini inline" AutoPostBack="true" OnTextChanged="txtBuscarFactura_TextChanged" id="txtBuscarFactura" placeholder="Buscar con escáner"></asp:TextBox>
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

                                        <asp:TextBox runat="server" ID="txtFiltrosIP" CssClass="form-control" placeholder="IP" MaxLength="7"></asp:TextBox>
                                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosAgrup" CssClass="form-control" placeholder="Agrup"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescripcion" CssClass="form-control" placeholder="Descripción IP" MaxLength="50"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosCodCliente" CssClass="form-control" placeholder="Codigo de Cliente" MaxLength="10"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRazonSocial" CssClass="form-control" placeholder="Razon Social" MaxLength="45"></asp:TextBox>
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

                                        <asp:TextBox runat="server" ID="txtFiltrosFlag" CssClass="form-control" placeholder="Flag Procesado" MaxLength="1"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescuento" CssClass="form-control" placeholder="Descuento"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosUsuarioAlta" CssClass="form-control" placeholder="Usuario de Alta" MaxLength="10"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosNumeroFactura" CssClass="form-control" placeholder="Numero de Factura" MaxLength="13"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:DropDownList runat="server" ID="ddlFiltrosFamilia" CssClass="form-control" placeholder="Familia"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <label>Filtrar por fecha de carga</label>
                                        <p class="help-block"></p>

                                        <label>Rango de fechas</label>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="input-group margin-15">
                                                        <asp:TextBox runat="server" ID="dpFiltrosDesde" class="date-picker form-control" placeholder="Desde" MaxLength="10"></asp:TextBox>
                                                        <label for="dpDesde" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                </div>

                                                <div class="input-group">
                                                        <asp:TextBox runat="server" ID="dpFiltrosHasta" class="date-picker form-control" placeholder="Hasta" MaxLength="10"></asp:TextBox>
                                                        <label for="dpHasta" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                </div>
                                            </div>
                                        </div>
                                        <script type="text/javascript">
                                             $(".date-picker").datepicker();
                                             $(".date-picker").css("z-index", "9999");
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
                                <asp:LinkButton runat="server" ID="btnFiltrosimpiar" OnClientClick="btnFiltrosLimpiar_OnClientClick()" CssClass="btn btn-warning"><i class="fa fa-search"></i> Limpiar</asp:LinkButton>
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
                        <%--<asp:CommandField ControlStyle-CssClass="btn btn-warning btn-edit-modal" HeaderText="Edición" SelectText="Editar" ShowSelectButton="true" />--%>
                        <asp:HyperLinkField HeaderText="Editar" DataTextField="Editar" DataNavigateUrlFormatString="http://{0}" />
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
                                        <asp:TextBox runat="server" ID="dpEditarFecha" class="date-picker form-control" placeholder="Fecha"></asp:TextBox>
                                        <label for="date-picker-1" class="input-group-addon btn">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </label>
                                    </div>
                                </div>

                                <script type="text/javascript">
                                    $(".date-picker").datepicker();
                                    $(".date-picker").css("z-index", "9999");
                                </script>

                                <div class="col-lg-3">
                                    <div class="form-inline">
                                        <label>Tipo promo:</label>
                                        <asp:DropDownList runat="server" ID="ddlEditarTipoPromo" CssClass="form-control form-small" placeholder="Promo"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="form-inline">
                                        <label>Cuotas: </label>
                                            <asp:TextBox runat="server" class="form-control input-mini" id="txtEditCuota" placeholder="Cuotas"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="form-inline">
                                        <label>Descuento: </label>
                                        <asp:DropDownList runat="server" ID="ddlDescuento" CssClass="form-control form-medium" placeholder="Descuento"></asp:DropDownList>
                                    </div>
                                </div>

                                <%--<div class="col-lg-2">
                                    <div class="form-inline">
                                        <asp:LinkButton runat="server" ID="btnEditarLimpiarCampos" OnClientClick="btnEditarLimpiarCampos_OnClientClick()" CssClass="btn btn-warning"><i class="fa fa-search"></i> Limpiar</asp:LinkButton>
                                    </div>
                                </div>--%>
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
                                                <%--<asp:TextBox runat="server" class="form-control pull-right" id="txtEditarMedida" placeholder="Medida"></asp:TextBox>--%>
                                                <asp:DropDownList runat="server" ID="ddlEditarMedida" CssClass="form-control pull-right form-medium" placeholder="Medida"></asp:DropDownList>
                                        </div>
                                    </div>

                                   <%-- <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <asp:DropDownList runat="server" ID="ddlEditarMedida" CssClass="form-control pull-right" placeholder="Medida"></asp:DropDownList>
                                        </div>
                                    </div>--%>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Rango: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarRango" placeholder="Rango"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Diseño: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarDisenio" placeholder="Diseño"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Marca: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarMarca" placeholder="Marca"></asp:TextBox>
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
                                               <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarCantidad" placeholder="Cantidad"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Precio: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditPrecio" placeholder="$"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Fac: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarNumFactura" placeholder="Factura"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Ticket: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarticket" placeholder="Ticket"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Autor: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarAutor" placeholder="Autor"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Tarjeta: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarTarjeta" placeholder="Tarjeta"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Comp: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarNumCompra" placeholder="Num Compra"></asp:TextBox>
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
                                            <%--<asp:TextBox runat="server" class="form-control pull-right" id="txtEditarCliente" placeholder="Cliente"></asp:TextBox>--%>
                                            <asp:DropDownList runat="server" ID="ddlEditarCliente" CssClass="form-control pull-right form-medium" placeholder="Cliente"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <%--<div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                           <asp:DropDownList runat="server" ID="ddlEditarCliente" CssClass="form-control pull-right" placeholder="Cliente"></asp:DropDownList>
                                        </div>
                                    </div>--%>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Región: </label>
                                            <%--<asp:TextBox runat="server" class="form-control pull-right" id="txtEditarRegion" placeholder="Región"></asp:TextBox>--%>
                                            <asp:DropDownList runat="server" ID="ddlEditarRegion" CssClass="form-control pull-right form-medium" placeholder="Region"></asp:DropDownList>
                                        </div>
                                    </div>
                                     <%--<div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                           <asp:DropDownList runat="server" ID="ddlEditarRegion" CssClass="form-control pull-right" placeholder="Region"></asp:DropDownList>
                                        </div>
                                    </div>--%>
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
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarNombre" placeholder="Nombre"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Dirección: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarDireccion" placeholder="Dirección"></asp:TextBox>
                                        </div>
                                    </div>

                                    
                                </div>
                                <%-- /Primera Columna Neumaticos --%>

                                <%-- Segunda Columna --%>
                                <div class="col-lg-4 borde-separador">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Provincia: </label>
                                            <asp:DropDownList runat="server" ID="ddlEditarProvincia" CssClass="form-control pull-right" placeholder="Provincia"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Teléfono: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarTelefono" placeholder="Telefono"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarNumero" placeholder="Número"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Piso: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarPiso" placeholder="Piso"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <%-- /Segunda Columna--%>

                                <%-- Tercera Columna--%>
                                <div class="col-lg-4 borde-separador">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Ciudad: </label>
                                            <%--<asp:DropDownList runat="server" ID="ddlEditarCiudad" CssClass="form-control pull-right" placeholder="Ciudad"></asp:DropDownList>--%>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarCiudad" placeholder="Ciudad"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Cod Postal: </label>
                                            <asp:TextBox runat="server" class="form-control input-medium pull-right" id="txtEditarCodigoPostal" placeholder="Codigo Postal"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Vehículo: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarVehiculo" placeholder="Vehículo"></asp:TextBox>
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
                                        <%--<textarea class="form-control input-full" rows="3" id="txtEditarNota"placeholder="Nota"></textarea>--%>
                                        <asp:TextBox runat="server" TextMode="MultiLine" class="form-control input-full" rows="3" id="txtEditarNota" placeholder="Nota"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="form-inline">
                                        <br />
                                        <asp:LinkButton runat="server" ID="btnEditarAceptar" OnClientClick="btnEditarAceptar_OnClientClick()" CssClass="btn btn-success btn-block">Aceptar</asp:LinkButton>
                                        <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Cancelar</button>
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
  <%--  <script>
        window.setTimeout(function () { google.maps.event.trigger("googleMaps", 'resize') }, 0);

    </script>--%>
</asp:Content>
