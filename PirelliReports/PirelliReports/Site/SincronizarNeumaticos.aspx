﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SincronizarNeumaticos.aspx.cs" Inherits="PirelliReports.Site.SincronizarNeumaticos" %>
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
                    <h1 class="page-header">Sincronizar Neumaticos
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-tyre"></i> Sincronizar Neumaticos
                            </li>
                    </ol>
                </div>

                <div class="col-lg-12 margin-15">
                    <%--<button class="btn btn-warning" onclick="#"><i class="fa fa-refresh"></i> Sincronizar</button>--%>
                    <asp:LinkButton runat="server" ID="btnCargar" OnClick="btnCargar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Cargar</asp:LinkButton> 
                    <asp:LinkButton runat="server" ID="btnSincronizar" OnClick="btnSincronizar_Click" CssClass="btn btn-warning"><i class="fa fa-search"></i> Sincronizar</asp:LinkButton>
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
