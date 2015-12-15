<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdministracionUsuarios.aspx.cs" Inherits="PirelliReports.Site.AdministracionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ADMINISTRACION").addClass("active");

            $.validator.addMethod("alphaNumericOnly", function (value, element) {
                return /^[a-zA-Z0-9 ]+$/.test(value);
            }, "Ingrese solo minusculas, mayusculas, numeros y/o espacios en blanco");

            $('form').validate({
                rules:
                {
                    <%= txtUsuarioID.UniqueID %>: 
                    {
                        required: true,
                        minlength: 7,
                        maxlength: 50
                    },
                    <%= txtLegajo.UniqueID %>: 
                    {
                        required: true
                    },
                    <%= txtDescripcion.UniqueID %>: 
                    {
                        alphaNumericOnly: true,
                        maxlength: 50
                    },
                    <%= txtMailUser.UniqueID %>: 
                    {
                        required: true,
                        email: true,
                        maxlength: 50
                    },
                    <%= txtPassUser.UniqueID %>: 
                    {
                        required: true,
                        maxlength: 20
                    },
                },
                messages:
                {
                      <%= txtUsuarioID.UniqueID %>: 
                    {
                        required: "Ingrese un ID de usuario",
                        minlength: "Solo se permiten 7 caracteres como minimo en el ID",
                        maxlength: "Solo se permiten 7 caracteres como maximo en el ID"
                    },
                    <%= txtLegajo.UniqueID %>: 
                    {
                        required: "Ingrese legajo"
                    },
                    <%= txtDescripcion.UniqueID %>: 
                    {
                        maxlength: "Solo se permiten 50 caracteres como maximo en la descripcion"
                    },
                    <%= txtMailUser.UniqueID %>: 
                    {
                        required: "Ingrese email",
                        email: "Ingrese email valido xxxx@yyyyy.zzz",
                        maxlength: "Solo se permiten 50 caracteres como maximo en el email"
                    },
                    <%= txtPassUser.UniqueID %>: 
                    {
                        required: "Ingrese clave",
                        maxlength: "Solo se permiten 20 caracteres como maximo en la clave"
                    },
                }
            });
        });

        function btnAceptarOnClientClick()
        {
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtUsuarioID").value.length < 1)
            {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ingrese un usuario";
                openModalMensaje();
                return false;
            }
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtLegajo").value.length < 1) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ingrese un legajo";
                openModalMensaje();
                return false;
            }
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtMail").value.length < 1) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ingrese un mail";
                openModalMensaje();
                return false;
            }
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtPass").value.length < 1) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ingrese una clave";
                openModalMensaje();
                return false;
            }
           
        }
        function openModalMensaje() {
            $('#modalMensaje').modal('show');
        }
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">

    <div id="page-wrapper">

        <div class="container-fluid form-pirelli">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Administración de Usuarios
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i><a href="index.html"> Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-user"></i> Administración de Usuarios
                            </li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 margin-15">
                    <asp:LinkButton runat="server" OnClientClick="btnAltaOnClientClick();return false;" OnClick="btnAlta_Click"  ID="btnAlta" CssClass="btn btn-warning"><i class="fa fa-plus"></i> Alta</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnEdit" OnClientClick="btnEditOnClientClick();" OnClick="btnEdit_Click" CssClass="btn btn-warning"><i class="fa fa-edit"></i> Modificación</asp:LinkButton>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4 margin-15">
                    <label>Buscar Usuario: </label>
                    <asp:DropDownList runat="server" ID="ddlUsuarios" AutoPostBack="true" OnSelectedIndexChanged="ddlUsuarios_SelectedIndexChanged" CssClass="form-control" placeholder="usuarios"></asp:DropDownList>
                    <p class="help-block"></p>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtUsuarioID" MaxLength="50" CssClass="form-control" placeholder="ID de Usuario"></asp:TextBox>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtLegajo" MaxLength="50" CssClass="form-control" placeholder="Legajo"></asp:TextBox>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtMailUser" MaxLength="50"  CssClass="form-control" placeholder="E-mail"></asp:TextBox>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtDescripcion" MaxLength="50" CssClass="form-control" placeholder="Descripción"></asp:TextBox>
                        <p class="help-block"></p>

                        <asp:TextBox runat="server" ID="txtPassUser" MaxLength="20" TextMode="Password" CssClass="form-control" placeholder="clave"></asp:TextBox>
                        <p class="help-block"></p>

                        <div class="form-inline">
                            <label>Activo: </label>
                            <asp:CheckBox runat="server" ID="chkActivo" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 margin-15">
                    <div class="form-inline">
                        <div class="checklist-container">
                            <asp:CheckBoxList runat="server" ID="chkListGrupos"></asp:CheckBoxList>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
             <asp:LinkButton runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" OnClientClick="return btnAceptarOnClientClick();" CssClass="btn btn-warning"><i class="fa fa-plus"></i> Aceptar</asp:LinkButton>
        </div>
    </div>

    <!-- /.container-fluid -->
    <%-- MODAL mensaje --%>
    <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="page-header modal-title" id="myModalMensaje">Mensaje
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <h4><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>

                        <asp:LinkButton runat="server" ID="btnCerrar" OnClick="btnCerrar_Click" CssClass="btn btn-success pull-right margin-right-15"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <%-- Fin modal mensaje --%>
 <asp:HiddenField runat="server" ID="modo" value="ALTA"/>
 <asp:HiddenField runat="server" ID="hdCodigoUsuario" value=""/>
 <asp:HiddenField runat="server" ID="hdMail" value=""/>
 <asp:HiddenField runat="server" ID="hdLegajo" value=""/>

</asp:Content>
