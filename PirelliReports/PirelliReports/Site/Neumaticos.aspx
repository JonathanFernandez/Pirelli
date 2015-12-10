<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Neumaticos.aspx.cs" Inherits="PirelliReports.Site.Neumaticos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">
       function btnEditarOnClientClick(obj) {
           var row = obj.parentNode.parentNode;
           var rowIndex = row.rowIndex - 1;

           document.getElementById("PaginaCentral_ContentPlaceHolder_txtRango").value = row.cells[7].innerHTML;
           if (row.cells[9].innerHTML == "1")
               document.getElementById('PaginaCentral_ContentPlaceHolder_chkBajaLogica').checked = true;
           else
               document.getElementById('PaginaCentral_ContentPlaceHolder_chkBajaLogica').checked = false;

           document.getElementById("PaginaCentral_ContentPlaceHolder_lblEdicion").innerHTML = "Editando " + row.cells[1].innerHTML;
           document.getElementById("PaginaCentral_ContentPlaceHolder_IP").value = row.cells[1].innerHTML;
           document.getElementById("PaginaCentral_ContentPlaceHolder_PAIS").value = row.cells[3].innerHTML;
           openModal()
           return false;
       }

       function OpenPopUp(url) {
           hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
           return false;
       }

       function openModal() {
           $('#modalEdit').modal('show');
       }

       function openModalMensaje() {
           $('#modalMensaje').modal('show');
       }

       function btnFiltrosLimpiar_OnClientClick() {
           document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosIP").value = "";
           document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosDescripcion").value = "";
           document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosOtros").value = "";
           document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosMarca").value = "";
           document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosRango").value = "";
           document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosRodado").value = "";
           document.getElementById("PaginaCentral_ContentPlaceHolder_ddlFiltrosFamilia").selectedIndex = 0;
           document.getElementById("PaginaCentral_ContentPlaceHolder_ddlFiltrosPais").selectedIndex = 0;
           document.getElementById('PaginaCentral_ContentPlaceHolder_chkFiltrosBajaLogica').checked = false;
           return false;
       }

       function filtroSeleccionado() {          
           var  ip  = document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosIP").value;
           var  descripcion = document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosDescripcion").value;
           var  pais  = document.getElementById("PaginaCentral_ContentPlaceHolder_ddlFiltrosPais").value;
           var  otros  = document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosOtros").value;
           var  familia  = document.getElementById("PaginaCentral_ContentPlaceHolder_ddlFiltrosFamilia").value;
           var  marca  = document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosMarca").value;
           var  rango  = document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosRango").value;
           var  rodado  = document.getElementById("PaginaCentral_ContentPlaceHolder_txtFiltrosRodado").value;
           var  baja  = document.getElementById("PaginaCentral_ContentPlaceHolder_chkFiltrosBajaLogica").checked;
           if (ip == "" && descripcion == "" && pais == "%" && otros == "" && familia == "%" && marca == "" && rango == "" && rodado == "" && !baja) 
           {
               return false;
           }
           else
           {
               return true;
           } 
       }

       function btnFiltrosBuscarOnClientClick() {
           return filtroSeleccionado();
       }
     
       $(document).ready(function() {
           //$.validator.addMethod("lettersOnly", function (value, element) {
           //    return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
           //}, "Ingrese una letra");

           $.validator.addMethod("upperCase", 
                                 function (value, element) {
                                 return /^[A-Z]{1}$/.test(value);
                                 }, "Ingrese una sola letra en mayuscula");
 
           $('form').validate({
               rules: 
               {
                   <%= txtFiltrosIP.UniqueID %>: 
                    {
                        digits: true,
                        minlenght: 7,
                        maxlenght: 7
                    },
                   <%= txtFiltrosMarca.UniqueID %>: 
                   {                        
                       digits: true,
                       minlength: 2,
                       maxlength: 2
                   },
                   <%= txtFiltrosRodado.UniqueID %>: 
                    {                        
                        number: true
                    }
               }, 
               messages: 
               {
                    <%= txtFiltrosIP.UniqueID %>: 
                    {
                        digits: "Ingrese solo digitos [0-9] para el IP",
                        minlenght: "Se requieren al menos 7 dgitos",
                        maxlenght: "Se permite como maximo 7 digitos"
                        
                    },
                   <%= txtFiltrosMarca.UniqueID %>: 
                   {                        
                        digits: "Ingrese solo digitos [0-9] para la marca",
                        minlenght: "Se requieren al menos 2 dgitos",
                        maxlenght: "Se permite como maximo 2 digitos"
                   },
                   <%= txtFiltrosRodado.UniqueID %>: 
                    {                        
                        number: "Ingrese un numero. Puede incluir decimales"
                    }
               }
           });

           $.validator.addClassRules({
               rango:
               {
                   upperCase: true,
                   maxlength: 1
               }
           });
       });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <div class="container-fluid table-pirelli">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Neumaticos
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i><a href="index.html"> Index</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-car"></i> Neumaticos
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page Heading /.row -->

        <div class="row">
            <div class="col-lg-12">
                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" CssClass="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" Cssclass="btn btn-warning"><i class="fa fa-file-excel-o"></i> Envio A Excel</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnRefrescar" OnClick="btnRefrescar_Click" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> Refrescar</asp:LinkButton>
            </div>
            <br />
            <br />
            
             <%-- <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-edit-modal" CommandName="Editar" OnClientClick="alert();return false;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>--%>

            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">
                <asp:GridView runat="server" ID="gvListadoNeumaticos" Cssclass="table table-responsive table-bordered table-hover table-striped table-condensed" OnSelectedIndexChanged="gvListadoNeumaticos_SelectedIndexChanged" AutoGenerateColumns="false">
                    <%-- <Columns>
                        <asp:CommandField ControlStyle-CssClass="btn btn-warning btn-edit-modal"   HeaderText="Edición"  SelectText="Editar" ShowSelectButton="true" />
                    </Columns>--%>
                     <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-edit-modal" CommandName="Editar"  OnClientClick="return btnEditarOnClientClick(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <Columns>
                        <asp:BoundField HeaderText="IP" DataField="IP" />
                    </Columns>
                    
                    <Columns>
                        <asp:BoundField HeaderText="Descripción" DataField="Descrip" />
                    </Columns>
                    
                    <Columns>
                        <asp:BoundField HeaderText="País" DataField="pais" />
                    </Columns>
                    
                    <Columns>
                        <asp:BoundField HeaderText="Otro" DataField="Otro" />
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
                    
                    <Columns>
                        <asp:BoundField HeaderText="Rodado" DataField="Rodado" />
                    </Columns>
                    
                    <Columns>
                        <asp:BoundField HeaderText="FlgBajaLogica" DataField="FlgBajaLogica" />
                    </Columns>
                    
                    <Columns>
                        <asp:BoundField HeaderText="FlgFilBusq" DataField="FlgFilBusq" />
                    </Columns>
                </asp:GridView>

            </div>

            <%-- MODAL filtros --%>
            <div class="modal fade" id="modalFiltros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="page-header modal-title" id="myModalLabel">Filtros
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <%--<label>IP:</label>--%>

                                        <asp:TextBox runat="server" ID="txtFiltrosIP" CssClass="form-control" placeholder="Código de Neumatico" MaxLength="7"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescripcion" CssClass="form-control" placeholder="Descripción" MaxLength="50"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:DropDownList runat="server" ID="ddlFiltrosPais" CssClass="form-control" placeholder="Pais"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosOtros" CssClass="form-control" placeholder="Otro" MaxLength="20"></asp:TextBox>
                                        <p class="help-block"></p>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:DropDownList runat="server" ID="ddlFiltrosFamilia" CssClass="form-control" placeholder="familia"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosMarca" CssClass="form-control" placeholder="Marca" MaxLength="2"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRango" CssClass="form-control rango" placeholder="Rango" MaxLength="1"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRodado" CssClass="form-control" placeholder="Rodado" MaxLength="2"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <div class="form-inline">
                                            <label>Baja Lógica: </label>
                                             <asp:CheckBox runat="server" ID="chkFiltrosBajaLogica" />
                                        </div>
                                   </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</button>--%>
                                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
                                <asp:LinkButton runat="server" ID="btnLFiltrosimpiar" OnClientClick="return btnFiltrosLimpiar_OnClientClick();" CssClass="btn btn-warning"><i class="fa fa-trash"></i> Limpiar</asp:LinkButton>
                                <asp:LinkButton runat="server" OnClientClick="return btnFiltrosBuscarOnClientClick();" OnClick="btnFiltrosBuscar_Click" ID="btnFiltrosBuscar" CssClass="btn btn-warning"><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Fin modal Filtrros --%>
           
        </div>
    </div>
        <%-- MODAL EDIT --%>
       
        <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="page-header modal-title">Editar</h4>
                        <br />
                        <h4><asp:Label runat="server" ID="lblEdicion"></asp:Label> </h4>

                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <%--<label>IP:</label>--%>

                                    <asp:TextBox runat="server" ID="txtRango" MaxLength="1" CssClass="form-control rango" placeholder="Rango"></asp:TextBox>
                                    <p class="help-block"></p>

                                </div>
                                <asp:LinkButton runat="server" ID="LinkButton1" OnClick="btnAceptar_Click" CssClass="btn btn-warning pull-left">Aceptar</asp:LinkButton>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">

                                    <div class="form-inline">
                                        <label>Baja Lógica: </label>
                                            <asp:CheckBox runat="server" ID="chkBajaLogica" />
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                </div>
            </div>
        </div>
    </div>
        <%-- Fin modal EDIT --%>
         <%-- MODAL mensaje --%>
                    <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title" id="myModalSincro">Edición de Neumatico
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
         <%-- Fin modal mensaje --%>
    <asp:HiddenField runat="server" ID="IP" />
    <asp:HiddenField runat="server" ID="PAIS" />
</asp:Content>
