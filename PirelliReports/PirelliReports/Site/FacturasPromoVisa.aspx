<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FacturasPromoVisa.aspx.cs" Inherits="PirelliReports.Site.FacturasPromoVisa" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script >
     $(window).load(function () {
         $(".btn-sticky").sticky({ topSpacing: 50 });
     });
     
     function OpenPopUp(url)
     {
         hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
         return false;
     }

     function btnLimpiar_OnClientClick()
     {
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtCodCliente").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtRazonSocial").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtCuotas").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtFlag").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescuento").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtUsuarioAlta").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtNumeroFactura").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtIP").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescripcion").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtAgrup").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtTicket").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_txtCodPromo").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_dpDesde").value = "";
         document.getElementById("PaginaCentral_ContentPlaceHolder_dpHasta").value = "";
         openModal();
         return false;
     }

     function chkFechas_OnChange()
     {
         if (document.getElementById("PaginaCentral_ContentPlaceHolder_chkFechas").checked) {
             document.getElementById("PaginaCentral_ContentPlaceHolder_dpDesde").disabled = false;
             document.getElementById("PaginaCentral_ContentPlaceHolder_dpHasta").disabled = false;
         }
         else {
             document.getElementById("PaginaCentral_ContentPlaceHolder_dpDesde").disabled = true;
             document.getElementById("PaginaCentral_ContentPlaceHolder_dpHasta").disabled = true;
         }
     }

     function openModal() {
         $('#modalFiltros').modal('show');
     }
 </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">

        <div class="container-fluid table-pirelli">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Facturas Promo Visa
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Index</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Facturas Promo Visa
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                       <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>
                        
                       <button type="button" class="btn btn-warning"><i class="fa fa-refresh"></i> Actualizar</button>

                       <asp:LinkButton runat="server" ID="btnExportar" onclick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-search"></i> Envio A Excel</asp:LinkButton>

                       <asp:LinkButton runat="server" ID="btnVerMapa" OnClientClick="return true;" class="btn btn-warning" data-toggle="modal" data-target="#modalMaps"><i class="fa fa-map-marker"></i> Ver Mapa</asp:LinkButton>
                                             
                    </div>
                    <%-- MODAL maps --%>
                       <div class="modal fade" id="modalMaps" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="page-header modal-title" id="myModalMaps">
                                    Maps
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
                                <h4 class="page-header modal-title" id="myModalLabel">
                                    Filtros
                                 </h4>
                              </div>
                              <div class="modal-body">
                                  <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <%--<label>IP:</label>--%>
                                            
                                            <asp:TextBox runat="server" id="txtIP" CssClass="form-control" placeholder="IP"></asp:TextBox>
                                            <%--<p class="help-block">Example block-level help text here.</p>--%>
                                            <p class="help-block"</p>
                                           
                                            <asp:TextBox runat="server" id="txtAgrup" CssClass="form-control" placeholder="Agrup"></asp:TextBox>
                                            <p class="help-block"></p>
                                         
                                            <asp:TextBox runat="server" id="txtDescripcion" CssClass="form-control" placeholder="Descripción IP"></asp:TextBox>
                                            <p class="help-block"</p>
                                            
                                            <asp:TextBox runat="server" id="txtCodCliente" CssClass="form-control" placeholder="Codigo de Cliente"></asp:TextBox>
                                            <p class="help-block"></p>
                                            
                                            <asp:TextBox runat="server" id="txtRazonSocial" CssClass="form-control" placeholder="Razon Social"></asp:TextBox>
                                            <p class="help-block"></p>
                                            
                                            <asp:TextBox runat="server" id="txtCodPromo" CssClass="form-control" placeholder="Codigo Promo"></asp:TextBox>
                                            <p class="help-block"></p>
                                            
                                            <asp:TextBox runat="server" id="txtCuotas" CssClass="form-control" placeholder="Cuotas"></asp:TextBox>
                                            <p class="help-block"></p>

                                            <label>Cantidad de Registros</label>
                                            <asp:DropDownList runat="server" ID="ddlCantidadRegistros" CssClass="form-control" placeholder="Cantidad de Registros"></asp:DropDownList>
                                            <p class="help-block"></p>
                                        
                                         </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                           
                                           <asp:TextBox runat="server" id="txtTicket" CssClass="form-control" placeholder="Ticket"></asp:TextBox>
                                           <p class="help-block"</p>
                                           
                                           <asp:TextBox runat="server" id="txtFlag" CssClass="form-control" placeholder="Flag Procesado"></asp:TextBox>
                                           <p class="help-block"></p>
                                           
                                           <asp:TextBox runat="server" id="txtDescuento" CssClass="form-control" placeholder="Descuento"></asp:TextBox>
                                           <p class="help-block"></p>
                                           
                                           <asp:TextBox runat="server" id="txtUsuarioAlta" CssClass="form-control" placeholder="Usuario de Alta"></asp:TextBox>
                                           <p class="help-block"></p>
                                           
                                           <asp:TextBox runat="server" id="txtNumeroFactura" CssClass="form-control" placeholder="Numero de Factura"></asp:TextBox>
                                           <p class="help-block"></p>
                                          
                                           <asp:DropDownList runat="server" ID="ddlFamilia" CssClass="form-control" placeholder="Familia"></asp:DropDownList>
                                           <p class="help-block"></p>
                                           
                                           <label> Filtrar por fecha de carga</label>
                                            <p class="help-block"></p>
                                           
                                                <label>Rango de fechas</label>
                                                    <div class="control-group">
                                                        <div class="controls">
                                                            <div class="input-group">
                                                                <p>
                                                                   <asp:TextBox runat="server" id="dpDesde" class="date-picker form-control" placeholder="Desde" ></asp:TextBox>
                                                                    <label for="dpDesde" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span>
                                                                    </label>
                                                               </p>
                                                            </div>

                                                            <div class="input-group">
                                                                <p>
                                                                   <asp:TextBox runat="server" id="dpHasta" class="date-picker form-control" placeholder="Hasta" ></asp:TextBox>
                                                                    <label for="dpHasta" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span>
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
                                  <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                                  <asp:LinkButton runat="server" ID="btnLimpiar" OnClientClick="btnLimpiar_OnClientClick()" CssClass="btn btn-warning" ><i class="fa fa-search"></i> Limpiar</asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <%-- Fin modal Filtrros --%>

                    <div class="col-lg-12">
                        <br />
                         <cc:GMap ID="GMap2" runat="server" />            
                        <br />
                        <asp:GridView ID="gvListadosFacturasVisa" class="table table-responsive table-bordered table-hover table-striped table-condensed" OnSelectedIndexChanged="gvListadosFacturasVisa_SelectedIndexChanged" AutoGenerateColumns="false"  runat="server">
                        <%-- <Columns>
                                <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning" DataTextField="Boton"  HeaderText="Boton"  />
                            </Columns>--%>
                            <Columns>
                                <asp:BoundField headertext="ID" DataField="ID"  />
                            </Columns>
                            <Columns>
                                <asp:hyperlinkfield headertext="Esker Link" datatextfield="Esker Link"  datanavigateurlformatstring="http://{0}" />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="IP" DataField="IP"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="LOTE" DataField="LOTE"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="CODCLIE" DataField="CODCLIE"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="FECHA" DataField="FECHA"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="CIUDAD" DataField="CIUDAD"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="CODPROV" DataField="CODPROV"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="DESCPROV" DataField="DESCPROV"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="DESCR" DataField="DESCR"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="Cod" DataField="Cod"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="Cuit" DataField="Cuit"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="DESCCLI" DataField="DESCCLI"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="TICKET" DataField="TICKET"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="FACTURA" DataField="FACTURA"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="codPromo" DataField="codPromo"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="FlgProcesado" DataField="FlgProcesado"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="Cantidad" DataField="Cantidad"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="NroTicket" DataField="NroTicket"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="NombreUsu" DataField="NombreUsu"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="Cuotas" DataField="Cuotas"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="Precio" DataField="Precio"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="Precio" DataField="Precio"  />
                            </Columns> 
                            <Columns>
                                <asp:BoundField headertext="FecAlta" DataField="FecAlta"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="UsuAlta" DataField="UsuAlta"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="Precio" DataField="Precio"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="FecSubSAP" DataField="FecSubSAP"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="CodAGRUP" DataField="CodAGRUP"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="FecUltAct" DataField="FecUltAct"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="UsuUltAct" DataField="UsuUltAct"  />
                            </Columns>
                             <Columns>
                                <asp:BoundField headertext="LOTE" DataField="LOTE"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="Nota" DataField="Nota"  />
                            </Columns>
                            <Columns>
                                <asp:BoundField headertext="Esker_ID" DataField="Esker_ID"  />
                            </Columns>			
                        </asp:GridView>
                    </div>
              
               </div>
            </div>
    <script>
        //window.setTimeout(function () { google.maps.event.trigger("googleMaps", 'resize') }, 0);
        
    </script>
</asp:Content>
