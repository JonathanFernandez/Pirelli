<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AnualCliente.aspx.cs" Inherits="PirelliReports.Site.AnualCliente" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>


<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
        function activarSpinner() {
            $(".spinner-container").css({ display: "block" });
        }

        function desactivarSpinner() {
            $(".spinner-container").css({ display: "none" });
        }
        
        function btnAceptarOnClientClick() {          
            var result = $('form').valid();
            if (result) 
            {
                activarSpinner();
            }
            return result;
        }

        $(document).ready(function () {
           $.validator.addMethod("anioSiglo21", 
                                  function(value, element) 
                                  { 
                                        var anio = parseInt(value, 10);

                                        if (anio >= 2000) 
                                        {
                                            return true;
                                        }
                                        else
                                        {
                                            return false;      
                                        }  

                                  }, "Ingrese un año del siglo 21 o posterior");  
            
            $('form').validate({
                rules:
                {
                    <%= txtAnio.UniqueID %>: 
                    {
                        required: true,
                        digits: true,
                        minlength: true,
                        maxlength: 4,
                        anioSiglo21: true
                    },
                },
                messages:
                {
                    <%= txtAnio.UniqueID %>: 
                    {
                        required: "Ingrese un año [YYYY]",
                        digits: "Solo se permiten digitos [0-9]",
                        minlength: "Se exige un minimo de 4 digitos",
                        maxlength: "Se permite un maximo de 4 digitos",
                        anioSiglo21: true
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
                                <i class="fa fa-pie-chart"></i> Venta Mensual CTC
                            </li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label>Seleccione año:</label>
                             <asp:TextBox runat="server" ID="txtAnio" class="form-control pull-right" placeholder="año"></asp:TextBox>
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
                </div>
                --%>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>
