<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Mapa.aspx.cs" Inherits="PirelliReports.Site.Mapa" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div class="container-fluid table-pirelli">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           Maps
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Index</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Maps
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        
                       <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>
                        
                       <button type="button" class="btn btn-warning"><i class="fa fa-refresh"></i> Actualizar</button>

                       <asp:LinkButton runat="server" ID="btnExportar"  class="btn btn-warning"><i class="fa fa-search"></i> Envio A Excel</asp:LinkButton>

                       <asp:LinkButton runat="server" ID="btnVerMapa" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalMaps"><i class="fa fa-map-marker"></i> Ver Mapa</asp:LinkButton>
                                             
                    </div>
                 </div>
                <div id="map">
                    <cc:GMap ID="GMap1" runat="server" />
                </div>
           
     </div>
</asp:Content>
