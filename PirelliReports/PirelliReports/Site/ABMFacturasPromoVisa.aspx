﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMFacturasPromoVisa.aspx.cs" Inherits="PirelliReports.Site.ABMFacturasPromoVisa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function openModal() {

            $('#modalMensaje').modal('show');
        }
        function btnCerrarOnClientClick()
        {
            window.close();
        }
        function btnEditarAceptarOnClientClick() {    
            
            var result = $('form').valid();
            return result;
        }
        $(document).ready(function () {
            $.validator.addMethod("decimal", 
                                        function (value, element) {
                                            return this.optional(element) || /^\d{0,2}(\.\d{0,2})?$/i.test(value);
                                        }, "Incluya 2 decimales");

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
                    <%=dpEditarFecha.UniqueID %>: 
                        {                        
                            required: true,
                            dateValid: true
                        },
                    <%=txtEditCuota.UniqueID %>: 
                        {                        
                            required: true                         
                        },
                    <%=txtDescuento.UniqueID %>: 
                        {                        
                            required: true,
                            number: true
                        },
                    <%=txtEditarCantidad.UniqueID %>: 
                        {                        
                            required: true,
                            digits: true
                        },
                    <%=txtEditarPrecio.UniqueID %>: 
                        {                        
                            required: true,
                            number: true
                        },
                     <%=txtEditarNumFactura.UniqueID %>: 
                        {                        
                            required: true
                        },
                    <%=txtEditarticket.UniqueID %>: 
                        {                        
                            required: true,
                            digits: true
                        },
                    <%=txtEditarTarjeta.UniqueID %>: 
                        {                        
                            required: true,
                            digits: true
                        },
                    <%=txtEditarNumCompra.UniqueID %>: 
                        {                        
                            required: true
                        }
                },
                messages: 
                {  
                    <%=dpEditarFecha.UniqueID %>: 
                        {
                            required: "Se requiere una fecha valida"
                        },
                    <%=txtEditCuota.UniqueID %>: 
                        {                        
                            required: "Seleccione promoción para completar cuota"                         
                        },
                    <%=txtDescuento.UniqueID %>: 
                        {                        
                            required: "Seleccione promoción para completar descuento",
                            number: "Ingrese un descuento valido 7.75"
                        },
                    <%=txtEditarCantidad.UniqueID %>: 
                        {                        
                            required: "Ingrese cantidad",
                            digits: "Solo caracteres numericos"
                        },
                    <%=txtEditarPrecio.UniqueID %>: 
                        {                        
                            required: "Ingrese precio",
                            number: "Ingrese precio en formato 12.56"
                        },
                    <%=txtEditarNumFactura.UniqueID %>: 
                        {                        
                            required: "Ingrese numero de factura"
                        },
                    <%=txtEditarticket.UniqueID %>: 
                        {                        
                            required: "Ingrese numero de ticket",
                            digits: "Solo caracteres numericos"
                        },
                    <%=txtEditarTarjeta.UniqueID %>: 
                        {                        
                            required: "Ingrese numero de tarjeta",
                            digits: "Solo caracteres numericos"
                        },
                    <%=txtEditarNumCompra.UniqueID %>: 
                        {                        
                            required: "Ingrese numero de compra"
                        }
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
        <div id="page-wrapper">

        <div class="container-fluid form-pirelli">

                     <!-- Page Heading -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Editar
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <%--<i class="fa fa-dashboard"></i><a href="index.html"> Index</a>--%>
                                        <asp:HyperLink runat="server" NavigateUrl="~/Index.aspx"><i class="fa fa-dashboard"></i> Index </asp:HyperLink>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-edit"></i> Editar Factura
                                        </li>
                                </ol>
                            </div>
                        </div>

                            <%-- Primera fila --%>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="input-group margin-15">
                                        <asp:TextBox runat="server" ID="dpEditarFecha" OnTextChanged="dpEditarFecha_TextChanged" AutoPostBack="true" class="date-picker form-control" placeholder="Fecha"></asp:TextBox>
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
                                        <asp:DropDownList runat="server" ID="ddlEditarTipoPromo" AutoPostBack="true" OnSelectedIndexChanged="ddlEditarTipoPromo_SelectedIndexChanged" CssClass="form-control form-small" placeholder="Promo"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="form-inline">
                                        <label>Cuotas: </label>
                                            <asp:TextBox runat="server" class="form-control input-medium" id="txtEditCuota" placeholder="Cuotas"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-inline">
                                        <label>Descuento: </label>
                                        <asp:TextBox runat="server" class="form-control input-medium" id="txtDescuento" placeholder="Descuento"></asp:TextBox>
                                        <%--<asp:DropDownList runat="server" ID="ddlDescuento" CssClass="form-control form-medium" placeholder="Descuento"></asp:DropDownList>--%>
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
                                <div class="col-lg-4">
                                    <h3 class="page-header modal-title margin-15">Neumatico</h3>
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Medida: </label>
                                                <%--<asp:TextBox runat="server" class="form-control pull-right" id="txtEditarMedida" placeholder="Medida"></asp:TextBox>--%>
                                                <asp:DropDownList runat="server" ID="ddlEditarMedida" AutoPostBack="true" OnSelectedIndexChanged="ddlEditarMedida_SelectedIndexChanged" CssClass="form-control pull-right form-medium" placeholder="Medida"></asp:DropDownList>
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
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarMarca"  placeholder="Marca"></asp:TextBox>
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
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarPrecio" placeholder="$"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Fac: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" MaxLength="13" id="txtEditarNumFactura" placeholder="Factura"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Ticket: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarticket" placeholder="Ticket"></asp:TextBox>
                                        </div>
                                    </div>

                                    <%--<div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Autor: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarAutor" placeholder="Autor"></asp:TextBox>
                                        </div>
                                    </div>--%>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Tarjeta: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarTarjeta" placeholder="Tarjeta"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro Comp: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" MaxLength="10" id="txtEditarNumCompra" placeholder="Num Compra"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <%-- /Segunda Columna Factura --%>

                                 <%-- Tercera Columna Clientes --%>

                                <div class="col-lg-4">
                                    <h3 class="page-header modal-title margin-15">Cliente</h3>
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Cliente: </label>
                                            <%--<asp:TextBox runat="server" class="form-control pull-right" id="txtEditarCliente" placeholder="Cliente"></asp:TextBox>--%>
                                            <asp:DropDownList runat="server" ID="ddlEditarCliente" AutoPostBack="true" OnSelectedIndexChanged="ddlEditarCliente_SelectedIndexChanged" CssClass="form-control pull-right form-medium" placeholder="Cliente"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <%--<div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                           <asp:DropDownList runat="server" ID="ddlEditarCliente" CssClass="form-control pull-right" placeholder="Cliente"></asp:DropDownList>
                                        </div>
                                    </div>--%>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <%--<label>Región: </label>--%>
                                            <%--<asp:TextBox runat="server" class="form-control pull-right" id="txtEditarRegion" placeholder="Región"></asp:TextBox>--%>
                                            <%--<asp:DropDownList runat="server" ID="ddlEditarRegion" CssClass="form-control pull-right form-medium" placeholder="Region"></asp:DropDownList>--%>
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
                                <div class="col-lg-4">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nombre: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarNombre"  placeholder="Nombre"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Dirección: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" id="txtEditarDireccion"  placeholder="Dirección"></asp:TextBox>
                                        </div>
                                    </div>

                                    
                                </div>
                                <%-- /Primera Columna Neumaticos --%>

                                <%-- Segunda Columna --%>
                                <div class="col-lg-4 borde-separador">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Provincia: </label>
                                            <asp:DropDownList runat="server" ID="ddlEditarProvincia" CssClass="form-control pull-right"  placeholder="Provincia"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Teléfono: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right"  id="txtEditarTelefono" placeholder="Telefono"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Nro: </label>
                                            <asp:TextBox runat="server" MaxLength="10" class="form-control pull-right" id="txtEditarNumero" placeholder="Número"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Piso: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" MaxLength="2" id="txtEditarPiso" placeholder="Piso"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <%-- /Segunda Columna--%>

                                <%-- Tercera Columna--%>
                                <div class="col-lg-4">
                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Ciudad: </label>
                                            <%--<asp:DropDownList runat="server" ID="ddlEditarCiudad" CssClass="form-control pull-right" placeholder="Ciudad"></asp:DropDownList>--%>
                                            <asp:TextBox runat="server" class="form-control pull-right" MaxLength="50" id="txtEditarCiudad"  placeholder="Ciudad"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Cod Postal: </label>
                                            <asp:TextBox runat="server" class="form-control input-medium pull-right" MaxLength="10" id="txtEditarCodigoPostal" placeholder="Codigo Postal"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 margin-15">
                                        <div class="form-inline">
                                            <label>Vehículo: </label>
                                            <asp:TextBox runat="server" class="form-control pull-right" MaxLength="30" id="txtEditarVehiculo" placeholder="Vehículo"></asp:TextBox>
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
                                        <asp:TextBox runat="server" MaxLength="200" TextMode="MultiLine" class="form-control input-full" rows="3" id="txtEditarNota" placeholder="Nota"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="form-inline">
                                        <br />
                                        <asp:LinkButton runat="server" ID="btnEditarAceptar" OnClientClick="return btnEditarAceptarOnClientClick();" OnClick="btnEditarAceptar_Click" CssClass="btn btn-success btn-block">Aceptar</asp:LinkButton>
                                        <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>

                            </div>
                            <%-- /Row Nota y botones --%>
                    </div>
            </div>     
        <%-- MODAL mensaje --%>
                    <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title" id="myModalSincro">
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h4><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>
                                    </div>
                                    <asp:LinkButton runat="server" OnClientClick="btnCerrarOnClientClick();" ID="btnCerrar" class="btn btn-warning">Aceptar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
         <%-- Fin modal mensaje --%>
      <%-- </div>--%>
    <asp:HiddenField runat="server" ID="HDModo" />
    <asp:HiddenField runat="server" ID="HDCodSolicitud" />
    <asp:HiddenField runat="server" ID="HDPais" />
    <asp:HiddenField runat="server" ID="HDCliente" />
    <asp:HiddenField runat="server" ID="HDMedida" />
    <asp:HiddenField runat="server" ID="HDProvincia" />
    <asp:HiddenField runat="server" ID="HDRegion" />
    <asp:HiddenField runat="server" ID="HDPromo" />
</asp:Content>
