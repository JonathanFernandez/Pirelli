<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RegionXIP.aspx.cs" Inherits="PirelliReports.Site.RegionXIP" %>
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
        $(document).ready(function () {
            $.validator.addMethod("greaterThan",
                                     function (value, element) {
                                         var parametro = document.getElementById("PaginaCentral_ContentPlaceHolder_dpDesde").value;

                                         var partesFechaFinal = value.split('/');
                                         var partesFechaInicial = parametro.split('/')
                                         var diaFechaFinal = partesFechaFinal[1];
                                         var mesFechaFinal = partesFechaFinal[0];
                                         var anioFechaFinal = partesFechaFinal[2];
                                         var diaFechaInicial = partesFechaInicial[1];
                                         var mesFechaInicial = partesFechaInicial[0];
                                         var anioFechaInicial = partesFechaInicial[2];

                                         var fechaFinal = anioFechaFinal + "-" + mesFechaFinal + "-" + diaFechaFinal;
                                         var fechaInicial = anioFechaInicial + "-" + mesFechaInicial + "-" + diaFechaInicial;

                                         return new Date(fechaFinal) > new Date(fechaInicial);

                                     }, "La fecha final debe ser mayor que la fecha inicial");
            $('form').validate({
                rules:
                {

                },
                messages:
                {
                }
            });

            $.validator.addClassRules({
                fecha:
                {
                    required: true,
                    date: true,
                    greaterThan: true
                }
            });

            $.validator.addClassRules({
                ip:
                {
                    required: true,
                    digits: true,
                    minlength: 7
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
                        <h1 class="page-header">
                            Reportes
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html"> Index</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-flag"></i> Región por IP
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
                                                        <asp:TextBox runat="server" ID="dpDesde" class="date-picker form-control fecha" placeholder="Desde"></asp:TextBox>
                                                        <label for="dpDesde" class="input-group-addon btn">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </label>
                                                </div>

                                                <div class="input-group margin-15">
                                                        <asp:TextBox runat="server" ID="dpHasta" class="date-picker form-control fecha" placeholder="Hasta"></asp:TextBox>
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
                            <label>Seleccione IP: </label>
                            <asp:TextBox runat="server" id="txtIP" class="form-control pull-right ip" ></asp:TextBox>
                            
                            <p class="help-block"></p>
                        </div>
                    </div>  
                </div>

                <h4>Seleccione filtro:</h4>
                <div class="row">
                    <div class="col-md-offset-2">
                        <div class="form-inline">
                            <div class="checklist-container">
                                <asp:CheckBoxList runat="server" ID="chklistFiltro"></asp:CheckBoxList>
                            </div>
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
