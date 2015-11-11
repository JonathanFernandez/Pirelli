<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Neumaticos.aspx.cs" Inherits="PirelliReports.Site.Neumaticos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IncludeCssSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="includeJsSection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PaginaCentral_ContentPlaceHolder" runat="server">
    <script>

        function OpenPopUp(url) {
            hidden = open(url, "NewWindow", "top=25,left=300,width=800, height=600,status=yes,resizable=yes,scrollbars=yes");
            return false;
        }

        function openModal() {
            $('#modalEdit').modal('show');
        }

    </script>

    <div class="container-fluid table-pirelli">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Neumaticos
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i><a href="index.html">Index</a>
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
                <asp:LinkButton runat="server" ID="btnOpenModal" OnClientClick="return false;" class="btn btn-warning" data-toggle="modal" data-target="#modalFiltros"><i class="fa fa-search"></i> Filtros</asp:LinkButton>

                <asp:LinkButton runat="server" ID="btnExportar" OnClick="btnExportar_Click" class="btn btn-warning"><i class="fa fa-search"></i> Envio A Excel</asp:LinkButton>
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

                                        <asp:TextBox runat="server" ID="txtFiltrosIP" CssClass="form-control" placeholder="Código de Neumatico"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosDescripcion" CssClass="form-control" placeholder="Descripción"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:DropDownList runat="server" ID="ddlFiltrosPais" CssClass="form-control" placeholder="Pais"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosOtros" CssClass="form-control" placeholder="Otro"></asp:TextBox>
                                        <p class="help-block"></p>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                         <asp:DropDownList runat="server" ID="ddlFiltrosFamilia" CssClass="form-control" placeholder="familia"></asp:DropDownList>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosMarca" CssClass="form-control" placeholder="Marca"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRango" CssClass="form-control" placeholder="Rango"></asp:TextBox>
                                        <p class="help-block"></p>

                                        <asp:TextBox runat="server" ID="txtFiltrosRodado" CssClass="form-control" placeholder="Rodado"></asp:TextBox>
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
                                <asp:LinkButton runat="server" ID="btnLFiltrosimpiar" OnClientClick="btnFiltrosLimpiar_OnClientClick()" CssClass="btn btn-warning"><i class="fa fa-trash"></i> Limpiar</asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="btnFiltrosBuscar_Click" ID="btnFiltrosBuscar" CssClass="btn btn-warning"><i class="fa fa-search"></i> Buscar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Fin modal Filtrros --%>
            <br />
            <br />
            <div class="col-lg-12" style="overflow: auto; width: 98%; height: 400px">
                <asp:GridView ID="gvListadoNeumaticos" class="table table-responsive table-bordered table-hover table-striped table-condensed" OnSelectedIndexChanged="gvListadoNeumaticos_SelectedIndexChanged" AutoGenerateColumns="false" runat="server">
                     <Columns>
                        <asp:CommandField ControlStyle-CssClass="btn btn-warning btn-edit-modal"   HeaderText="Edición"  SelectText="Editar" ShowSelectButton="true" />
                    </Columns>
                     <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-edit-modal" CommandName="Editar" OnClientClick="alert();return false;" />
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

            <%-- MODAL EDIT --%>
            <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-full-width" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="page-header modal-title">Editar
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <%--<label>IP:</label>--%>

                                        <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Rango" disabled="true"></asp:TextBox>
                                        <p class="help-block"></p>

                                    </div>
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
    </div>
    </div>


         <%-- MODAL mensaje --%>
                    <div class="modal fade" id="modalSincro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="page-header modal-title" id="myModalSincro">Edición de Neumatico
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
         <%-- Fin modal mensaje --%>

</asp:Content>
