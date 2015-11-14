<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SincronizarClientes.aspx.cs" Inherits="PirelliReports.Site.SincronizarClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
<script>
   
    function openModal() {
       
        $('#modalSincro').modal('show');
    }
</script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
  
    
    <div id="page-wrapper">

        <div class="container-fluid form-pirelli">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sincronizar Clientes
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-refresh"></i> Sincronizar Clientes
                            </li>
                    </ol>
                </div>

                <div class="col-lg-12 margin-15">
                    <%--<button class="btn btn-warning" onclick="#"><i class="fa fa-refresh"></i> Sincronizar</button>--%>
                    <asp:LinkButton runat="server" ID="btnCargar" OnClick="btnCargar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Cargar</asp:LinkButton> 
                    <asp:LinkButton runat="server" ID="btnSincronizar" OnClick="btnSincronizar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Sincronizar</asp:LinkButton>
                </div>
                <br />
            <br />
            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">    
                <asp:GridView ID="gvListadoClientes" class="table table-responsive table-bordered table-hover table-striped table-condensed" AutoGenerateColumns="false" runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Codigo" DataField="COD" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="CUIT" DataField="CUIT" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Tipo" DataField="TIPO" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Direccion" DataField="DIR" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Provincia" DataField="PROV" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Pais" DataField="COL008" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Telefono Sucursal" DataField="COL009" />
                    </Columns>
                    <Columns>
                        <asp:BoundField HeaderText="Region" DataField="REGION" />
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
                                    <h4 class="page-header modal-title" id="myModalSincro">Sincronización
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h4><asp:Label runat="server" ID="lblMensaje"></asp:Label> </h4>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                <%-- Fin modal Sincronización --%>
    </div>
       
    <!-- /#page-wrapper -->
</asp:Content>
