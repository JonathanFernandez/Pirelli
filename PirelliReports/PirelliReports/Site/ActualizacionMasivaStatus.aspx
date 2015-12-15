<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ActualizacionMasivaStatus.aspx.cs" Inherits="PirelliReports.Site.ActualizacionMasivaStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
<script>
    $(document).ready(function () {
        $("#MODIFICACIONESMASIVAS").addClass("active");
    });

    function openModal() {
       
        $('#modalSincro').modal('show');
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
                    <h1 class="page-header">Actualización masiva de status
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-refresh"></i> Actualización masiva de status
                            </li>
                    </ol>
                </div>

                <div class="col-lg-12 margin-15">
                    <%--<button class="btn btn-warning" onclick="#"><i class="fa fa-refresh"></i> Sincronizar</button>--%>
                    <%--<asp:TextBox runat="server" ID="txtNombreArchivo" Enabled="False"></asp:TextBox>
                    <asp:LinkButton runat="server" ID="btnExaminar" OnClick="btnExaminar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Examinar...</asp:LinkButton>--%>
                    <asp:FileUpload ID="fuSubirArchivo" CssClass="form-pirelli" runat="server" />
                </div>

                <div class="col-lg-12 margin-15">
                    <%--<button class="btn btn-warning" onclick="#"><i class="fa fa-refresh"></i> Sincronizar</button>--%>
                    <asp:LinkButton runat="server" ID="btnSubirSolicitudes" OnClientClick="activarSpinner();" OnClick="btnSubirSolicitudes_Click" CssClass="btn btn-warning"><i class="fa fa-cloud-upload"></i> Subir solicitudes</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnLeerSolicitudes" OnClientClick="activarSpinner();" OnClick="btnLeerSolicitudes_Click" CssClass="btn btn-warning"><i class="fa fa-cloud-download"></i> Leer solicitudes</asp:LinkButton> 
                    <asp:LinkButton runat="server" ID="btnActualizarSolicitudes" OnClientClick="activarSpinner();" OnClick="btnActualizarSolicitudes_Click" CssClass="btn btn-warning"><i class="fa fa-refresh"></i> Actualizar solicitudes</asp:LinkButton>
                </div>
                <br />
            <br />
            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">    
                <asp:GridView ID="gvListadoSolicitudes" class="table table-responsive table-bordered table-hover table-striped table-condensed" AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Codigo de solicitud" DataField="CodSolicitud" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="¿Esta procesada?" DataField="FlgProcesado" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Nota" DataField="Nota" />
                    </Columns>
                </asp:GridView>
            </div>        
               
        </div>
    <!-- /.row -->

    </div>
           
    <!-- /.container-fluid -->
     <%-- MODAL sincronización --%>
                    <div class="modal fade" id="modalSincro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title" id="myModalSincro">Actualizacion masiva de status
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h4><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                <%-- Fin modal Sincronización --%>
    </div>
       
    <!-- /#page-wrapper -->
    <asp:HiddenField ID="HDrutaArchivoSubido" runat="server"/>
</asp:Content>
