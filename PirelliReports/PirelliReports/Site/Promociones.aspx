<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Promociones.aspx.cs" Inherits="PirelliReports.Site.Promociones" %>

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
                    <h1 class="page-header">Blank Page
                           
                        <small>Subheading</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-file"></i>Blank Page
                            </li>
                    </ol>
                </div>

                <div class="col-lg-12 margin-15">
                    <button class="btn btn-warning"><i class="fa fa-plus"></i>Alta</button>
                    <button class="btn btn-warning disabled"><i class="fa fa-trash"></i>Baja</button>
                    <button class="btn btn-warning"><i class="fa fa-edit"></i>Modificación</button>
                    <button class="btn btn-warning pull-right disabled"><i class="fa fa-trash"></i>Baja Ĺógica</button>
                </div>

                <br />

                <div class="col-lg-12">
                    <div class="form-inline">
                        <label>Nombre de promoción:</label>
                        <input type="text" class="form-control" id="" placeholder="Promoción" />
                    </div>
                </div>

                <div class="col-lg-4">
                    <label>Rango de fechas</label>
                    <div class="control-group">
                        <div class="controls">
                            <div class="input-group margin-15">
                                <input id="date-picker-1" type="text" class="date-picker form-control" placeholder="Desde" />
                                <label for="date-picker-1" class="input-group-addon btn">
                                    <span class="glyphicon glyphicon-calendar"></span>

                                </label>
                            </div>

                            <div class="input-group">
                                <input id="date-picker-2" type="text" class="date-picker form-control" placeholder="Hasta" />
                                <label for="date-picker-2" class="input-group-addon btn">
                                    <span class="glyphicon glyphicon-calendar"></span>

                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <label>Cuotas</label>

                    <div class="col-lg-12">

                        <div class="form-group margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Domingo</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group margin-15">
                            <label for="inputEmail3" class="col-sm-4 control-label">Lunes</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Martes</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Miércoles</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Jueves</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Viernes</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Sábado</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" />
                            </div>

                        </div>
                    </div>
            </div>
            <div class="col-lg-4">
                <label>Descuentos</label>

                <div class="col-lg-12">
                    <div class="form-group">
                        <input type="text" class="form-control" />
                        <input type="text" class="form-control" />
                        <input type="text" class="form-control" />
                        <input type="text" class="form-control" />
                        <input type="text" class="form-control" />
                        <input type="text" class="form-control" />
                        <input type="text" class="form-control" />
                    </div>
                </div>
            </div>
        </div>
    <!-- /.row -->

    </div>
           
    <!-- /.container-fluid -->

    </div>
       
    <!-- /#page-wrapper -->

    <!-- /#wrapper -->
</asp:Content>
