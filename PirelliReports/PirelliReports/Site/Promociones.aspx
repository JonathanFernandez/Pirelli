<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Promociones.aspx.cs" Inherits="PirelliReports.Site.Promociones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script>
        
            //$(".only-float").on("input", function () {
            //    this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
        //})
        $(document).ready(function () {
            $('.only-float').keypress(function (eve) {
                if ((eve.which != 46 || $(this).val().indexOf('.') != -1) && (eve.which < 48 || eve.which > 57) || (eve.which == 46 && $(this).caret().start == 0)) {
                    eve.preventDefault();
                }

                // this part is when left part of number is deleted and leaves a . in the leftmost position. For example, 33.25, then 33 is deleted
                $('.only-float').keyup(function (eve) {
                    if ($(this).val().indexOf('.') == 0) {
                        $(this).val($(this).val().substring(1));
                    }
                });
            });
        });
            

     
        function btnGuardarOnClientClick() {
            //document.getElementById("codigoPromo").value = document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').value;
            //document.getElementById('PaginaCentral_ContentPlaceHolder_ddlPromociones').disabled = false;
            //return false;
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
                    <asp:LinkButton runat="server" ID="btnEdit" OnClientClick="btnEditOnClientClick();" CssClass="btn btn-warning"><i class="fa fa-edit"></i> Modificación</asp:LinkButton>
                    <%--<button class="btn btn-warning pull-right disabled"><i class="fa fa-trash"></i>Baja Ĺógica</button>--%>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <label>Promoción:</label>
                    <asp:DropDownList runat="server" ID="ddlPromociones" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPromociones_SelectedIndexChanged"></asp:DropDownList>
                    <br />
                </div>

                <div class="col-lg-4">
                        <label>Nombre de promoción:</label>
                        <asp:TextBox runat="server" class="form-control" id="txtDescTipoPromo" placeholder="Promoción" ></asp:TextBox>
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
                                <asp:TextBox runat="server" class="date-picker form-control" id="dpDesde" placeholder="Desde" ></asp:TextBox>
                                <label for="date-picker-1" class="input-group-addon btn">
                                    <span class="glyphicon glyphicon-calendar"></span>

                                </label>
                            </div>

                            <div class="input-group">
                                <asp:TextBox runat="server" class="date-picker form-control" id="dpHasta" placeholder="Hasta" ></asp:TextBox>
                                <label for="date-picker-2" class="input-group-addon btn">
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

                <div class="col-lg-4">
                    <label>Cuotas</label>

                    <div class="col-lg-12">

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Domingo</label>
                                <asp:TextBox runat="server" class="form-control" TextMode="Number" id="txtDomingo" placeholder="0" ></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Lunes</label>
                                <asp:TextBox runat="server" class="form-control" id="txtLunes" placeholder="0" TextMode="Number" ></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Martes</label>
                                <asp:TextBox runat="server" class="form-control" id="txtMartes" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Miércoles</label>
                                <asp:TextBox runat="server" class="form-control" id="txtMiercoles" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Jueves</label>
                                <asp:TextBox runat="server" class="form-control" id="txtJueves" placeholder="0" TextMode="Number"></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Viernes</label>
                                <asp:TextBox runat="server" class="form-control" id="txtViernes" placeholder="0" TextMode="Number" ></asp:TextBox>
                        </div>

                        <div class="form-inline margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Sábado</label>
                                <asp:TextBox runat="server" class="form-control" id="txtSabado" placeholder="0" ></asp:TextBox>
                        </div>
                    </div>
            </div>
            <div class="col-lg-4">
                <label>Descuentos</label>
                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu1" placeholder="%" ></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu2" placeholder="%" ></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu3" placeholder="%" ></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu4" placeholder="%" ></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu5" placeholder="%" ></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu6" placeholder="%" ></asp:TextBox>
                    </div>

                    <div class="form-group margin-15">
                        <asp:TextBox runat="server" class="form-control only-float" id="txtDescu7" placeholder="%"  ></asp:TextBox>
                    </div>

                        <asp:LinkButton runat="server" ID="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="btnGuardarOnClientClick();" CssClass="btn btn-warning pull-right"><i class="fa fa-edit"></i> Guardar</asp:LinkButton>
            </div>

         
        </div>
    <!-- /.row -->

    </div>
           
    <!-- /.container-fluid -->

    </div>
       
    <!-- /#page-wrapper -->

    <!-- /#wrapper -->
    <asp:HiddenField runat="server" ID="modo" value="EDITAR"/>
    <asp:HiddenField runat="server" ID="codigoPromo" value=""/>
</asp:Content>
