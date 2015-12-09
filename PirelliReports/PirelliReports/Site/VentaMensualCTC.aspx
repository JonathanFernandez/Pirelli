<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="VentaMensualCTC.aspx.cs" Inherits="PirelliReports.Site.VentaMensualCTC" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
     <script>
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
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div style="display: none;">
        <CR:CrystalReportViewer ID="crviewer" runat="server" AutoDataBind="true" />
    </div> 
    <div id="page-wrapper">

            <div class="container-fluid form-pirelli">

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

                <!-- Page Heading -->
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
                            <label>Seleccione rango de fechas:</label>
                            <div class="control-group pull-right">
                                            <div class="controls">
                                                <div class="input-group margin-15">
                                                        <asp:TextBox runat="server" ID="dpDesde" class="date-picker form-control" placeholder="Desde"></asp:TextBox>
                                                        <label for="dpDesde" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                </div>

                                                <div class="input-group margin-15">
                                                        <asp:TextBox runat="server" ID="dpHasta" class="date-picker form-control" placeholder="Hasta"></asp:TextBox>
                                                        <label for="dpHasta" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
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
                            <asp:DropDownList runat="server" ID="ddlCTC" class="form-control pull-right" ></asp:DropDownList>
                            <p class="help-block"></p>
                        </div>
                    </div>  
                </div>
                               
                <!-- /.row -->
                <asp:Button runat="server" ID="btnAceptar" class="btn btn-warning" Text="Aceptar" OnClientClick="activarSpinner();" OnClick="btnAceptar_Click"/>
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
