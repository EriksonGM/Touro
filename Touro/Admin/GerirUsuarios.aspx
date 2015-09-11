<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="GerirUsuarios.aspx.cs" Inherits="Touro.Admin.GerirUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default" data-widget='{"draggable": "false"}'>
                <div class="panel-heading">
                    <h2>Usuarios</h2>
                    <div class="panel-ctrls button-icon-bg"
                        data-actions-container=""
                        data-action-collapse='{"target": ".panel-body"}'
                        <%--data-action-colorpicker=''
						data-action-refresh-demo='{"type": "circular"}'--%>>
                    </div>

                </div>
                <div class="panel-body">
                    <asp:ListView ID="lvUsuarios" runat="server" DataSourceID="SqlDataSourceUsuarios" DataKeyNames="Id_Usuario">
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                        <p>
                                            <b>Nenhum Usuario cadastrado.</b>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <%--<asp:Label Text='' runat="server" ID="Id_UsuarioLabel" />--%>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary-alt btn-sm" CommandName="Select"><i class="fa fa-info"></i></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" border="0" class="table table-hover">
                                            <tr runat="server" style="">
                                                <th runat="server" style="width: 20px"></th>
                                                <th runat="server">Nome</th>
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
                            <tr style="" class="info">
                                <td>
                                    <%--<asp:Label Text='<%# Eval("Id_Usuario") %>' runat="server" ID="Id_UsuarioLabel" />--%>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn-sm"><i class="fa fa-info"></i></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceUsuarios" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Id_Usuario], [Nome] FROM [Tb_Usuario] ORDER BY [Id_Usuario]" InsertCommand="ResetPass" InsertCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                            <asp:ControlParameter ControlID="lvUsuarios" Name="Id_User" PropertyName="SelectedValue" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>

            </div>
        </div>
        <div class="col-md-8">
            <asp:FormView ID="fvOps" runat="server" Width="100%" DataSourceID="SqlDataSourceUsuario" OnItemCommand="fvOps_ItemCommand">
                <ItemTemplate>
                    <%--UserId:
                <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel" /><br />--%>
                    <div class="col-md-6 col-sm-6">
                        <div class="panel panel-default" data-widget='{"draggable": "false"}'>
                            <div class="panel-heading">
                                <h2>Permições de Acesso</h2>
                                <div class="panel-ctrls button-icon-bg"
                                    data-actions-container=""
                                    data-action-collapse='{"target": ".panel-body"}'>
                                </div>
                            </div>
                            <div class="panel-body icheck">
                                <table style="width: 100%;" class="table table-hover">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbSoli" runat="server" Text="Modulo de Solicitações" Checked='<%#Roles.IsUserInRole(Eval("Username").ToString(),"Solicitacao") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbPatr" runat="server" Text="Modulo de Patrimonio" Checked='<%#Roles.IsUserInRole(Eval("Username").ToString(),"Patrimonio") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbTran" runat="server" Text="Modulo de Trasportes" Checked='<%#Roles.IsUserInRole(Eval("Username").ToString(),"Transportes") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbArea" runat="server" Text="Modulo de Area Técnica" Checked='<%#Roles.IsUserInRole(Eval("Username").ToString(),"AreaTecnica") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbEsta" runat="server" Text="Modulo de Estatisticas" Checked='<%#Roles.IsUserInRole(Eval("Username").ToString(),"Estatistica") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbGest" runat="server" Text="Modulo de Gestão" Checked='<%#Roles.IsUserInRole(Eval("Username").ToString(),"Admin") %>' /></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="panel-footer" style="text-align: center">
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-success-alt" CommandName="Permicoes" CommandArgument='<%# Eval("Username") %>'><i class="fa fa-save"></i>&nbsp; Guardar Permições</asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6">
                        <div class="panel panel-default" data-widget='{"draggable": "false"}'>
                            <div class="panel-heading">
                                <h2>Alterar Senha</h2>
                                <div class="panel-ctrls button-icon-bg"
                                    data-actions-container=""
                                    data-action-collapse='{"target": ".panel-body"}'>
                                </div>
                            </div>
                            <div class="panel-body">
                                <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" placeholder="Senha" ValidationGroup="Senha" TextMode="Password"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtPass2" CssClass="form-control" runat="server" placeholder="Confirmação" ValidationGroup="Senha" TextMode="Password"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta a Senha" ControlToValidate="txtPass" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="Senha"><i class="fa fa-asterisk"></i>&nbsp; Falta a Senha.<br /></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Confirmação" ControlToValidate="txtPass2" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="Senha"><i class="fa fa-asterisk"></i>&nbsp; Falta a Confirmação.<br /></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPass" ControlToValidate="txtPass2" ValidationGroup="Senha" ForeColor="Red" Display="Dynamic"><i class="fa fa-asterisk"></i>&nbsp; As senhas não coincidem.</asp:CompareValidator>
                            </div>

                            <div class="panel-footer" style="text-align: center">
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-success-alt" CommandName="Senha" CommandArgument='<%# Eval("Username") %>' ValidationGroup="Senha"><i class="fa fa-save"></i>&nbsp; Guardar Senha</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>


        <asp:SqlDataSource runat="server" ID="SqlDataSourceUsuario" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Username] FROM [Tb_Usuario] WHERE ([Id_Usuario] = @Id_Usuario)" InsertCommand="PermicoesEditadas" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                <asp:ControlParameter ControlID="lvUsuarios" Name="Id_User" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lvUsuarios" PropertyName="SelectedValue" Name="Id_Usuario" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>



    </div>
</asp:Content>
