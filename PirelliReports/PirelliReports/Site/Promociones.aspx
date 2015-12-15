<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Promociones.aspx.cs" Inherits="PirelliReports.Site.Promociones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#PROMOCIONES").addClass("active");

            $.validator.addMethod("decimal", 
                                        function (value, element) {
                                            return this.optional(element) || /^\d{0,3}(\.\d{0,2})?$/i.test(value);
                                        }, "Incluya 2 decimales");

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
                        <%=txtDescTipoPromo.UniqueID %>: 
                        {
                            required: true,
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
                        <%=txtDescTipoPromo.UniqueID %>: 
                        {
                            required: "Ingrese la descripcion de la promocion"
                        },
                        <%=dpDesde.UniqueID %>: 
                        {                        
                            required: "Ingrese una fecha inicial"
                           
                        },
                        <%=dpHasta.UniqueID %>: 
                        {                        
                            required: "Ingrese una fecha final"
                        }  
                    }
                });

                $.validator.addClassRules({
                    cuota:
                    {
                        required: true,
                        digits: true,
                        range: [0, 18]
                    }
                });

            
                $.validator.addClassRules({
                    porcentaje:
                    {
                        required: true,
                        number: true,
                        range: [0, 100],
                        decimal: true
                    }
                });
        });
        
        function openModal() {
            $('#modalMensaje').modal('show');
        }

        function btnGuardarOnClientClick() {          
            var result = $('form').valid();
            return result;
        }

        function btnEditOnClientClick() {
            document.getElementById("PaginaCentral_ContentPlaceHolder_modo").value = "EDITAR";
            document.getElementById("PaginaCentral_ContentPlaceHolder_codigoPromo").value = document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').value;
            document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').disabled = false;
            //document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').selectedIndex = document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').selectedIndex + 1;
            //document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').selectedIndex = document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').selectedIndex - 1;
        }

        function btnAltaOnClientClick()
        {
            document.getElementById("PaginaCentral_ContentPlaceHolder_modo").value = "ALTA";
            document.getElementById("PaginaCentral_ContentPlaceHolder_codigoPromo").value = "";
            document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').disabled = true;
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescTipoPromo").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_chkBajaLogica").checked = false;
            document.getElementById("PaginaCentral_ContentPlaceHolder_dpDesde").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_dpHasta").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDomingo").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtLunes").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtMartes").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtMiercoles").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtJueves").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtViernes").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtSabado").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu1").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu2").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu3").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu4").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu5").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu6").value = "";
            document.getElementById("PaginaCentral_ContentPlaceHolder_txtDescu7").value = "";
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
                    <h1 class="page-header">Promociones
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-bar-chart-o"></i> Promociones
                        </li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 margin-15">
                    <asp:LinkButton runat="server" OnClientClick="btnAltaOnClientClick();return false;" ID="btnAlta" CssClass="btn btn-warning"><i class="fa fa-plus"></i> Alta</asp:LinkButton>
                    <%--<button class="btn btn-warning"><i class="fa fa-plus"></i>Alta</button>--%>
                    <%--<button class="btn btn-warning disabled"><i class="fa fa-trash"></i>Baja</button>--%>
                    <%--<button class="btn btn-warning"><i class="fa fa-edit"></i>Modificación</button>--%>
                    <asp:LinkButton runat="server" ID="btnEdit" OnClick="btnEdit_Click" OnClientClick="btnEditOnClientClick();" CssClass="btn btn-warning"><i class="fa fa-edit"></i> Modificación</asp:LinkButton>
                    <%--<button class="btn btn-warning pull-right disabled"><i class="fa fa-trash"></i>Baja Ĺógica</button>--%>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <label>Promoción:</label>
                    <asp:DropDownList runat="server" ID="ddlPromociones" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPromociones_SelectedIndexChanged"></asp:DropDownList>
                    <br />
                </div>

                <div class="col-lg-4">
                        <label>Nombre de promoción:</label>
                        <asp:TextBox runat="server" class="form-control" ID="txtDescTipoPromo"  placeholder="Promoción" MaxLength="30"></asp:TextBox>
                </div>
                <div class="col-lg-4">    
                        <label>Baja Lógica: </label>
                        <asp:CheckBox runat="server" ID="chkBajaLogica" />
                </div>
            </div>
          
            <div class="row">
                <div class="col-lg-4">
                    <label>Rango de fechas</label>
                    <div class="control-group">
                        <div class="controls">
                            <div class="input-group margin-15">
                                <asp:TextBox runat="server" class="date-picker form-control" ID ="dpDesde" placeholder="Desde" MaxLength="10"></asp:TextBox>
                                <label for="date-picker-1" class="input-group-addon btn">
                                    <span class="glyphicon glyphicon-calendar"></span>

                                </label>
                            </div>

                            <div class="input-group">
                                <asp:TextBox runat="server" class="date-picker form-control" ID="dpHasta" placeholder="Hasta" MaxLength="10"></asp:TextBox>
                                <label for="date-picker-2" class="input-group-addon btn">
                                    <span class="glyphicon glyphicon-calendar"></span>

                                </label>
                            </div>
                        </div>
                    </div>
                </div>
               <script type="text/javascript">
                   $(".date-picker").datepicker();
                   $(".date-picker").css("z-index", "9999");
                </script>
                <div class="col-lg-4">
                    <label>Cuotas</label>

                    <div class="col-lg-12">

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Domingo</label>
                                <asp:TextBox runat="server" class="form-control cuota" TextMode="Number" ID="txtDomingo" placeholder="0" MaxLength="2"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Lunes</label>
                                <asp:TextBox runat="server" class="form-control cuota" ID="txtLunes" placeholder="0" MaxLength="2"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Martes</label>
                                <asp:TextBox runat="server" class="form-control cuota" ID="txtMartes" placeholder="0" MaxLength="2"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Miércoles</label>
                                <asp:TextBox runat="server" class="form-control cuota" ID="txtMiercoles" placeholder="0" MaxLength="2"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Jueves</label>
                                <asp:TextBox runat="server" class="form-control cuota" ID="txtJueves" placeholder="0" MaxLength="2"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Viernes</label>
                                <asp:TextBox runat="server" class="form-control cuota" ID="txtViernes" placeholder="0" MaxLength="2" ></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Sábado</label>
                                <asp:TextBox runat="server" class="form-control cuota" ID="txtSabado" placeholder="0" ></asp:TextBox>
                        </div>
                    </div>
            </div>
            <div class="col-lg-4">
                <label>Descuentos</label>
                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu1" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu2" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu3" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu4" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu5" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu6" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control porcentaje" ID="txtDescu7" placeholder="%" MaxLength="5"></asp:TextBox>
                    </div>
                        <asp:LinkButton runat="server"  ID="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="return btnGuardarOnClientClick();" CssClass="btn btn-warning pull-right"><i class="fa fa-edit"></i> Guardar</asp:LinkButton>
            </div>
        </div>
    <!-- /.row -->

    </div>
           
    <!-- /.container-fluid -->
            <%-- MODAL mensaje --%>
        <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="page-header modal-title" id="myModalSincro">Promociones
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <h4><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>
                            <asp:LinkButton runat="server"  ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn btn-warning pull-right margin-right-15"><i class="fa fa-edit"></i> Aceptar</asp:LinkButton>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%-- Fin modal Sincronización --%>

    </div>
       
    <!-- /#page-wrapper -->

    <!-- /#wrapper -->
    <asp:HiddenField runat="server" ID="modo" value="EDITAR"/>
    <asp:HiddenField runat="server" ID="codigoPromo" value=""/>
    
</asp:Content>
