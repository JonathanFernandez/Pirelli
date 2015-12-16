<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UsuarioEdit.aspx.cs" Inherits="PirelliReports.Site.UsuarioEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function() {
            $('form').validate({
                rules: 
                {
                }, 
                messages: 
                {
                }      
            });

            $.validator.addClassRules({
                password:
                {
                    required: true,
                    maxlength: 10
                }
            });
        });

        function openModal() {
            $('#modalMensaje').modal('show');
        }

        function btnAceptar_OnClientClick()
        {
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtPassAnterior").value.length < 1) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Complete la contraseña";
                openModal();
                return false;
            }
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtClaveNueva").value.length < 1 && document.getElementById("PaginaCentral_ContentPlaceHolder_txtClaveNueva").value.length < 1)
            {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ambas claves estan vacias";
                openModal();
                return false;
            }
            if (document.getElementById("PaginaCentral_ContentPlaceHolder_txtClaveNueva").value != document.getElementById("PaginaCentral_ContentPlaceHolder_txtReingresarClave").value) {
                document.getElementById("PaginaCentral_ContentPlaceHolder_lblMensaje").innerHTML = "Ambas claves deben ser iguales";
                openModal();
                return false;
            }
        }
        function btnCancelar_OnClientClick()
        {
            window.locationf = "../Index.aspx";
            return false;
        }
    </script>
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
                        <asp:HyperLink runat="server" NavigateUrl="~/Index.aspx"><i class="fa fa-dashboard"></i> Index </asp:HyperLink>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i> Edición Perfil
                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="form-inline margin-15">
                    <label>Usuario: </label>
                    <asp:TextBox runat="server" class="form-control pull-right input-profile" id="txtUsuId" placeholder="" disabled="disabled"></asp:TextBox>
                </div>

                <div class="form-inline margin-15">
                    <label>Legajo: </label>
                    <asp:TextBox runat="server" class="form-control pull-right input-profile" id="txtLegajo" placeholder="" disabled="disabled"> </asp:TextBox>
                </div>

                <div class="form-inline">
                    <label>Descripción: </label>
                    <asp:TextBox runat="server" class="form-control pull-right input-profile" id="txtUsuDesc" placeholder="" disabled="disabled"></asp:TextBox>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-inline margin-15">
                    <label>Estado: </label>
                    <asp:CheckBox runat="server" ID="chkActivo"/><asp:Label runat="server" ID="lblEstado" disabled="disabled"></asp:Label>
                </div>
                
                <div class="form-inline margin-15">
                    <label>E-Mail: </label>
                    <asp:TextBox runat="server" class="form-control pull-right" id="txtMail" disabled="disabled"></asp:TextBox>
                </div>

                <div class="form-inline margin-15">
                    <label>Clave Anterior: </label>
                    <asp:TextBox runat="server" class="form-control pull-right password" id="txtPassAnterior" MaxLength="20" TextMode="Password" autocomplete="off" ></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="txtPassAnteriorRequired" ControlToValidate="txtPassAnterior" runat="server" ErrorMessage="Complete Campo"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-inline margin-15">
                    <label>Clave Nueva: </label>
                    <asp:TextBox runat="server" class="form-control pull-right password" id="txtClaveNueva"  MaxLength="20" TextMode="Password" ></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="txtClaveNuevaRequired" ControlToValidate="txtClaveNueva" runat="server" ErrorMessage="Complete Campo"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-inline margin-15">
                    <label>Reingrese Clave Nueva: </label>
                    <asp:TextBox runat="server" class="form-control pull-right password" id="txtReingresarClave"  MaxLength="20" TextMode="Password" ></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="txtReingresarClaveRequired" ControlToValidate="txtReingresarClave" runat="server" ErrorMessage="Complete Campo"></asp:RequiredFieldValidator>--%>
                    <%--<asp:CompareValidator ID="txtReingresarCompare" ControlToValidate="txtReingresarClave" ControlToCompare="txtClaveNueva" runat="server" ErrorMessage="Ambas claves deben ser iguales"></asp:CompareValidator>--%>
                </div>
                <div class="form-inline pull-right">
                    <asp:Button runat="server" class="btn btn-success" OnClientClick="return btnAceptar_OnClientClick();"  OnClick="btnAceptar_Click" Text="Aceptar"  ID="btnAceptar" />
                    <%--<asp:Button runat="server" class="btn btn-danger" Text="Cancelar" ID="btnCancelar" OnClientClick="return btnCancelar_OnClientClick();"/>--%>
                    
                </div>
            </div>
        </div>
     </div>
      <!-- Page Heading /.row -->
              <%-- MODAL mensaje --%>
                    <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title" id="mymodalMensaje">Mensaje
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h4><asp:Label runat="server" CssClass="margin-left-15" ID="lblMensaje"></asp:Label> </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
      <%-- Fin modal Sincronización --%>
</asp:Content>
