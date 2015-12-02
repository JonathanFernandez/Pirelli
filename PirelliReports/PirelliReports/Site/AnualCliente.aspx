<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AnualCliente.aspx.cs" Inherits="PirelliReports.Site.AnualCliente" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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
                <asp:Button runat="server" ID="btnAceptar" class="btn btn-warning" Text="Aceptar" OnClick="btnAceptar_Click"/>
                <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</asp:LinkButton>

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
                

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>
