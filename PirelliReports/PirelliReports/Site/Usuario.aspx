<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="PirelliReports.Site.Usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div class="container-fluid form-pirelli">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Edición Perfil
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i><a href="index.html">Index</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i>Edición Perfil
                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="form-inline margin-15">
                    <label>Piso: </label>
                    <input type="text" class="form-control pull-right" id="" placeholder="1" />
                </div>

                <div class="form-inline margin-15">
                    <label>Piso: </label>
                    <input type="text" class="form-control pull-right" id="" placeholder="1" />
                </div>

                <div class="form-inline">
                    <label>Piso: </label>
                    <input type="text" class="form-control pull-right" id="" placeholder="1" />
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-inline margin-15">
                    <label>Piso: </label>
                    <input type="text" class="form-control pull-right" id="" placeholder="1" />
                </div>

                <div class="form-inline margin-15">
                    <label>Piso: </label>
                    <input type="text" class="form-control pull-right" id="" placeholder="1" />
                </div>

                <div class="form-inline pull-right">
                    <button class="btn btn-success">Aceptar</button>
                    <button class="btn btn-danger">Cancelar</button>
                </div>
            </div>
        </div>
        <!-- Page Heading /.row -->
    </div>
</asp:Content>
