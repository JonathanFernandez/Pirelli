<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SincronizarNeumaticos.aspx.cs" Inherits="PirelliReports.Site.SincronizarNeumaticos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
     <script>
         $(document).ready(function () {
             $("#SINZCRONIZACIONCOMERCIAL").addClass("active");
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
                    <h1 class="page-header">Sincronizar neumaticos
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-car"></i> Sincronizar neumaticos
                            </li>
                    </ol>
                </div>

                <div class="col-lg-12 margin-15">
                    <%--<button class="btn btn-warning" onclick="#"><i class="fa fa-refresh"></i> Sincronizar</button>--%>
                    <asp:LinkButton runat="server" ID="btnCargar" OnClientClick="activarSpinner();"  OnClick="btnCargar_Click" CssClass="btn btn-warning"><i class="fa fa-cloud-upload"></i> Cargar</asp:LinkButton> 
                    <asp:LinkButton runat="server" ID="btnSincronizar" OnClientClick="activarSpinner();" OnClick="btnSincronizar_Click" CssClass="btn btn-warning"><i class="fa fa-refresh"></i> Sincronizar</asp:LinkButton>
                </div>
                <br />
                <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">
                    <asp:GridView ID="gvListadoNeumaticos" class="table table-responsive table-bordered table-hover table-striped table-condensed" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:BoundField HeaderText="IP" DataField="IP" />
                        </Columns>
                        <Columns>
                            <asp:BoundField HeaderText="Descripcion" DataField="Descrip" />
                        </Columns>
                        <Columns>
                            <asp:BoundField HeaderText="Pais" DataField="pais" />
                        </Columns>
                        <Columns>
                            <asp:BoundField HeaderText="Otro" DataField="otro" />
                        </Columns>
                        <Columns>
                            <asp:BoundField HeaderText="Familia" DataField="Familia" />
                        </Columns>
                        <Columns>
                            <asp:BoundField HeaderText="Marca" DataField="Marca" />
                        </Columns>
                        <Columns>
                            <asp:BoundField HeaderText="Rango" DataField="Rango" />
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
                        <h4 class="page-header modal-title" id="myModalSincro">Sincronizar neumaticos
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
</asp:Content>
