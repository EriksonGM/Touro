<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Motoristas.aspx.cs" Inherits="Touro.Transportes.Motoristas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <div class="panel panel-default" data-widget='{"draggable": "false"}'>
        <div class="panel-heading">
            <h2>Gestão de Motoristas
            </h2>
            <div class="panel-ctrls button-icon-bg"
                data-actions-container=""
                data-action-collapse='{"target": ".panel-body"}'>
            </div>

        </div>

        <div class="panel-body">
            <asp:ListView ID="lvMotoristas" runat="server" DataSourceID="SqlDataSourceMotorista" DataKeyNames="Id_Motorista">

                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                <h4>Nenhum motorista cadastrado.</h4>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Nome") %>' runat="server" ID="NomeTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("DataNasc") %>' runat="server" ID="DataNascTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("BI") %>' runat="server" ID="BITextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Carta") %>' runat="server" ID="CartaTextBox" /></td>
                        <td>
                            <asp:CheckBox Checked='<%# Bind("Activo") %>' runat="server" ID="ActivoCheckBox" /></td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td><a class="btn btn-primary-alt btn-sm" href='<%# "Motorista.aspx?Id=" +Eval("Id_Motorista").ToString() %>'>Perfil</a>
                        <td>
                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("DataNasc","{0:D}") %>' runat="server" ID="DataNascLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("BI") %>' runat="server" ID="BILabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Carta") %>' runat="server" ID="CartaLabel" /></td>
                        <%-- <td>
                            <asp:CheckBox Checked='<%# Eval("Activo") %>' runat="server" ID="ActivoCheckBox" Enabled="false" /></td>--%>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width:10px"></th>
                                        <th runat="server">Nome</th>
                                        <th runat="server">Data Nascimento</th>
                                        <th runat="server">BI Nº</th>
                                        <th runat="server">Carta Nº</th>
                                        <%--<th runat="server">Activo</th>--%>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("Id_Motorista") %>' runat="server" ID="Id_MotoristaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("DataNasc") %>' runat="server" ID="DataNascLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("BI") %>' runat="server" ID="BILabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Carta") %>' runat="server" ID="CartaLabel" /></td>
                        <td>
                            <asp:CheckBox Checked='<%# Eval("Activo") %>' runat="server" ID="ActivoCheckBox" Enabled="false" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceMotorista" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Motorista]" InsertCommand="AddMotorista" InsertCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:ControlParameter ControlID="txtNome" Name="Nome" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDataNasc" DbType="Date" Name="DataNasc" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtBI" Name="BI" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCarta" Name="Carta" PropertyName="Text" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>

        <div class="panel-footer" style="text-align: center">
            <a data-toggle="modal" href="#AddMotorista" class="btn btn-primary-alt pull-right">Cadastrar Motorista</a>
        </div>

    </div>

    <div class="modal fade" id="AddMotorista" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Touro</h2>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Nome</label>

                            <div class="col-md-6">
                                <asp:TextBox ID="txtNome" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Data de Nascimento</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtDataNasc" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">BI Nº</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtBI" runat="server" MaxLength="15" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Carta Nº</label>

                            <div class="col-md-6">
                                <asp:TextBox ID="txtCarta" runat="server" MaxLength="15" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger-alt" data-dismiss="modal"><i class="fa fa-ban"></i>&nbsp; Cancelar</button>
                    <asp:LinkButton ID="btnOk" runat="server" CssClass="btn btn-success-alt" OnClick="btnOk_Click"><i class="fa fa-plus-circle"></i>&nbsp; Cadastrar</asp:LinkButton>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</asp:Content>
