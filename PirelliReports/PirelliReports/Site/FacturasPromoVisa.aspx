<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FacturasPromoVisa.aspx.cs" Inherits="PirelliReports.Site.FacturasPromoVisa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">

        <div class="container-fluid table-pirelli">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Facturas Promo Visa
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Index</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Facturas Promo Visa
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>

                        <button type="button" class="btn btn-warning"><i class="fa fa-refresh"></i> Actualizar</button>

                        <button type="button" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</button>
                    </div>

                    <%-- MODAL --%>
                        <div class="modal fade" id="modalFiltros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="page-header modal-title" id="myModalLabel">
                                    Filtros
                                 </h4>
                              </div>
                              <div class="modal-body">
                                  <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Text Input</label>
                                            <input class="form-control">
                                            <p class="help-block">Example block-level help text here.</p>

                                            ...


                                         </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Text Input</label>
                                            <input class="form-control">
                                            <p class="help-block">Example block-level help text here.</p>

                                            ...


                                         </div>
                                    </div>
                                  </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-warning">Save changes</button>
                              </div>
                            </div>
                          </div>
                        </div>


                    <div class="col-lg-12">
                        <br />
                        <asp:GridView ID="gvListadosFacturasVisa" runat="server" class="table table-responsive table-bordered table-hover table-striped"></asp:GridView>
                    </div>
                </div>
            </div>

</asp:Content>
