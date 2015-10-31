<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ModificarClienteIP.aspx.cs" Inherits="PirelliReports.Site.ModificarClienteIP" %>
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
                    <h1 class="page-header">Modificar Cliente IP
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-file"></i>Modificar Cliente IP
                            </li>
                    </ol>
                </div>
             </div>
                <div class="row">
                <div class="col-lg-2 margin-15">
                    <div class="checkbox">
                        <label>
                            <%--<input type="radio" name="radio-cliente" value="clientes" checked/>Clientes--%>
                            <asp:RadioButton runat="server" id="radioCliente" AutoPostBack="true" GroupName="radioClienteIP" value="clientes" Checked="true" OnCheckedChanged="radioClienteIP_CheckedChanged"/>Clientes
                        </label>
                    </div>
                </div>

                <div class="col-lg-2 margin-15">
                    <div class="checkbox">
                        <label>
                            <%--<input type="radio" name="radio-cliente" value="ip"/>IP--%>
                            <asp:RadioButton runat="server" id="radioIP" AutoPostBack="true" GroupName="radioClienteIP" value="ip"  OnCheckedChanged="radioClienteIP_CheckedChanged" />IP
                        </label>
                    </div>
                </div>

                <div class="col-lg-3 margin-15">
                    <div class="form-inline">
                        <%--<input type="radiobutton" placeholder="Valor A Modificar" class="form-control" />--%>
                        <asp:TextBox runat="server" ID="txtValorModificar" placeholder="Valor A Modificar" class="form-control" />

                    </div>
                </div>

                 <div class="col-lg-3 margin-15">
                    <div class="form-inline">
                        <%--<input type="text" placeholder="Nuevo Valor" class="form-control"/>--%>
                        <asp:TextBox runat="server" ID="txtNuevoValor" placeholder="Nuevo Valor" class="form-control" />
                    </div>
                </div>

                <div class="col-lg-2 margin-15">
                    <%--<button class="btn btn-warning">Aplicar</button>--%>
                    <asp:Button runat="server" ID="btnAplicar" class="btn btn-warning" Text="Aplicar" />
                </div>
                
                <br />
                <div class="col-lg-12" style="overflow: auto; width: 98%; height: 350px">

              
                <asp:GridView ID="gvListadosCliente_Ip" OnSelectedIndexChanged="gvListadosCliente_Ip_SelectedIndexChanged" class="table table-responsive table-bordered table-hover table-striped table-condensed"  runat="server">
                </asp:GridView>

                </div>
            </div>

    <!-- /.row -->

    </div>
           
    <!-- /.container-fluid -->

    </div>
       
    <!-- /#page-wrapper -->

    <!-- /#wrapper -->
</asp:Content>
