﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="VentaTotalxCTCxCliente.aspx.cs" Inherits="PirelliReports.Site.VentaTotalxCTCxCliente" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function btnAceptarOnClientClick() {          
            var result = $('form').valid();
            if (result) 
            {
                activarSpinner();
            }
            return result;
        }

        function OpenPopUp(url) {
            hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
            return false;
        }

        function activarSpinner() {
            $(".spinner-container").css({ display: "block" });
        }

        function desactivarSpinner() {
            $(".spinner-container").css({ display: "none" });
        }

        $(document).ready(function () {
            $("#REPORTESCOMERCIAL").addClass("active");

            $.validator.addMethod("greaterThan", 
                                    function(value, element) 
                                    {            
                                        var parametro = document.getElementById("PaginaCentral_ContentPlaceHolder_dpDesde").value;
                                        
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
                                   
                                    }, "La fecha final debe ser mayor que la fecha inicial");

            $.validator.addMethod("valido", 
                                    function(value, element) 
                                    { 
                                        if (value != "00") 
                                        {
                                            return true;
                                        }
                                        else
                                        {
                                            return false;
                                        }
                                    }, "Seleccione un CTC");      
            
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
                    <%=ddlCTC.UniqueID %>: 
                        {
                            required: true,
                            valido: true
                        },
                    <%=ddlClientes.UniqueID %>: 
                        {
                            required: true,
                            valido: true
                        },
                    <%=dpDesde.UniqueID %>: 
                        {                        
                            required: true,
                            dateValid: true
                        },
                    <%=dpHasta.UniqueID %>: 
                        {                        
                            required: true,
                            dateValid: true,
                            greaterThan: true
                        }  
                },
                messages: 
                {  
                    <%=ddlCTC.UniqueID %>: 
                        {
                            required: "Seleccione un CTC"
                        },
                    <%=ddlClientes.UniqueID %>: 
                        {
                            required: "Seleccione un cliente"
                        },
                    <%=dpDesde.UniqueID %>: 
                        {
                            required: "Se requiere una fecha inicial"
                        },
                    <%=dpHasta.UniqueID %>: 
                        {
                            required: "Se requiere una fecha final"
                        }, 
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div style="display: none;">
        <CR:CrystalReportViewer ID="crviewer" runat="server" AutoDataBind="true" />
    </div>

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
                        <h1 class="page-header">
                            Reportes
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html"> Index</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-line-chart"></i> Venta mensual CTC por Cliente
                            </li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label>Seleccione rango de fechas:</label>
                            <div class="control-group pull-right">
                                <div class="controls">
                                    <div class="input-group margin-15">
                                            <asp:TextBox runat="server" ID="dpDesde" class="date-picker form-control" placeholder="Desde" MaxLength="10"></asp:TextBox>
                                            <label for="dpDesde" class="input-group-addon btn">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </label>
                                    </div>

                                    <div class="input-group margin-15">
                                            <asp:TextBox runat="server" ID="dpHasta" class="date-picker form-control" placeholder="Hasta" MaxLength="10"></asp:TextBox>
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

                <%--<div class="row">
                    <div class="col-lg-6">
                        <div class="form-inline">
                            <div class="input-group pull-right">
                                        <input id="date-picker-1" type="text" class="date-picker form-control" placeholder="Desde" />
                                        <label for="date-picker-1" class="input-group-addon btn"><span class="glyphicon glyphicon-calendar"></span>

                                        </label>
                                <p class="help-block"></p>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-inline">
                            <label>Seleccione CTC: </label>
                            <%--<asp:TextBox runat="server" id="txtIP" class="form-control pull-right" ></asp:TextBox>--%>
                            <asp:DropDownList runat="server" ID="ddlCTC" AutoPostBack="true" OnSelectedIndexChanged="ddlCTC_SelectedIndexChanged" class="form-control pull-right" ></asp:DropDownList>
                            <br />
                        </div>
                    </div>  
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-inline">
                            <asp:DropDownList runat="server" ID="ddlClientes" class="form-control pull-right" ></asp:DropDownList>
                            <p class="help-block"></p>
                        </div>
                    </div>  
                </div>
                               
                <!-- /.row -->

                <asp:Button runat="server" ID="btnAceptar" class="btn btn-warning" Text="Aceptar" OnClick="btnAceptar_Click" OnClientClick="return btnAceptarOnClientClick();"/>
                <%--<asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</asp:LinkButton>

                <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">
                    <asp:GridView ID="gvListadoReporte" class="table table-responsive table-bordered table-hover table-striped table-condensed" runat="server">

                    </asp:GridView>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Chart ID="Chart1" runat="server" Width="1000px" Height="400px" Visible="false">
                            <Series>
                                <asp:Series Name="Series1"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                     </div>  
                </div>--%>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>
