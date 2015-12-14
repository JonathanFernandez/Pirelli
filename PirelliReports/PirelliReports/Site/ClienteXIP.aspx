﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ClienteXIP.aspx.cs" Inherits="PirelliReports.Site.ClienteXIP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OpenPopUp(url) {
            hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
            return false;
        }

        function btnAceptarOnClientClick() {          
            var result = $('form').valid();
            return result;
        }

        $(document).ready(function () {

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

            $.validator.addMethod("dateValid",
                                  function (value, element) {
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
                    <%=txtIP.UniqueID %>: 
                    {
<<<<<<< HEAD
                       
=======
>>>>>>> origin/master
                        digits: 7,
                        minlength: 7,
                        maxlength: 7
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
                    <%=txtIP.UniqueID %>: 
                    {
<<<<<<< HEAD
                        
=======
>>>>>>> origin/master
                        digits: "Ingrese solo digitos [0-9] para la IP",
                        minlength: "La IP debe tener 7 digitos como minimo",
                        maxlength: "La IP debe tener 7 digitos como maximo"
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
    <div id="page-wrapper">

        <div class="container-fluid form-pirelli">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Reportes
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-user"></i> Cliente por IP
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
                        <label>Seleccione IP: </label>
                        <asp:TextBox runat="server" ID="txtIP" class="form-control pull-right"></asp:TextBox>

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
            <asp:Button runat="server" ID="btnAceptar" class="btn btn-warning" Text="Aceptar"  OnClientClick="return btnAceptarOnClientClick();" OnClick="btnAceptar_Click" />

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->
</asp:Content>
