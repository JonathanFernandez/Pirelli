<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministracionPermisos.aspx.cs" Inherits="PirelliReports.Site.AdministracionPermisos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">

    <div id="page-wrapper">

        <div class="container-fluid form-pirelli">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Administración de Permisos
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-user"></i> Administración de Permisos
                            </li>
                    </ol>
                </div>
            </div>

                <div class="row">
                    <div class="col-lg-12 margin-15">
                        <asp:LinkButton runat="server" OnClientClick="btnAltaOnClientClick();return false;" ID="btnAlta" CssClass="btn btn-warning"><i class="fa fa-plus"></i> Alta</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnEdit" OnClientClick="btnEditOnClientClick();" CssClass="btn btn-warning"><i class="fa fa-edit"></i> Modificación</asp:LinkButton>
                    </div>
                </div>
            
                <div class="row">
                    <div class="col-lg-4 margin-15">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Nombre de Permiso"></asp:TextBox>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="col-lg-6 margin-15">
                        <div class="form-inline">
                            <div class="checklist-container">
                               <asp:CheckBoxList runat="server" ID="chklistFiltro"></asp:CheckBoxList>
                            </div>
                        </div>
                    </div>
              </div>
    <!-- /.row -->

        </div>
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
                                        <h4><asp:Label runat="server" ID="lblMensage"></asp:Label> </h4>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                <%-- Fin modal Sincronización --%>

</asp:Content>
