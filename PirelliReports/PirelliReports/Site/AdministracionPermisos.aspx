﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministracionPermisos.aspx.cs" Inherits="PirelliReports.Site.AdministracionPermisos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script>
        function openModalMensaje() {
            $('#modalMensaje').modal('show');
        }
        function btnAceptarOnClientClick()
        {
            
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtGrupoAlta").value.length < 1)
            {
            
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ingrese un nombre valido";

                openModalMensaje();
                return false;
            
            }
        }

        function btnCambiarNombre()
        {
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtEditarNombre").value.length < 1) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ingrese un nombre valido";

                openModalMensaje();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">

    <div id="page-wrapper">

        <div class="container-fluid form-pirelli">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Administración de Grupos
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-user"></i> Administración de Grupos
                            </li>
                    </ol>
                </div>
            </div>

            
                <div class="row">
                    <div class="col-lg-4 margin-15 form-pirelli">
                        <h3>Dar de Alta un Grupo</h3>
                            <div class="form-group">
                                <asp:TextBox runat="server" MaxLength="50" ID="txtGrupoAlta" CssClass="form-control" placeholder="Nombre de Grupo"></asp:TextBox>
                            <p class="help-block"></p>
                                <div class="checklist-container">
                                  <asp:CheckBoxList runat="server" ID="chklistPermisosAlta"></asp:CheckBoxList>
                                 </div>
                                <p class="help-block"></p>
                                <asp:LinkButton runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" OnClientClick="return btnAceptarOnClientClick();" CssClass="btn btn-warning"><i class="fa fa-plus"></i> Alta</asp:LinkButton>
                        </div>
                    </div>

                    <div class="col-lg-6 margin-15 form-pirelli">
                        <h3>Modificar un Grupo</h3>
                            <div class="form-group">
                                <asp:DropDownList runat="server" ID="ddlGrupos" AutoPostBack="true" OnSelectedIndexChanged="ddlGrupos_SelectedIndexChanged" CssClass="form-control" placeholder="Pais"></asp:DropDownList>
                            <p class="help-block"></p>
                                <div class="form-group">
                                <asp:TextBox runat="server" MaxLength="50" ID="txtEditarNombre" CssClass="form-control" placeholder="Nombre de Grupo"></asp:TextBox>
                                <asp:LinkButton runat="server" ID="btnCambiarNombre" OnClick="btnCambiarNombre_Click" OnClientClick="return btnCambiarNombre();" CssClass="btn btn-warning pull-right"><i class="fa fa-edit"></i> Cambiar Nombre</asp:LinkButton>
                            <p class="help-block"></p>

                                 <div class="checklist-container">
                                  <asp:CheckBoxList runat="server" ID="chkListPermisosEditar"></asp:CheckBoxList>
                                 </div>

                            <asp:LinkButton runat="server" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger pull-right"><i class="fa fa-trash"></i> Eliminar</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnEditar" OnClick="btnEditar_Click" CssClass="btn btn-warning pull-right"><i class="fa fa-edit"></i> Modificar</asp:LinkButton>
                            
                        </div>
                    </div>
              </div>
    <!-- /.row -->

        </div>
     </div>
   
  </div>
            
    <!-- /.container-fluid -->
     <%-- MODAL mensaje --%>
                    <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title"> Mensaje    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h4><asp:Label runat="server" ID="lblMensaje"></asp:Label> </h4>
                                    </div>
                                    <asp:LinkButton runat="server" ID="btnCerrar" OnClick="btnCerrar_Click" CssClass="btn btn-danger pull-right"><i class="fa fa-trash"></i>Cerrar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
      <%-- Fin modal Sincronización --%>
</asp:Content>