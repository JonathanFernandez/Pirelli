<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VentaMensualCTC.aspx.cs" Inherits="PirelliReports.Site.VentaMensualCTC" %>
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
    </script>
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
                <asp:Button runat="server" ID="btnAceptar" class="btn btn-warning" Text="Aceptar" OnClick="btnAceptar_Click"/>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>
