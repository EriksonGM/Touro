<%@ Page Title="" Language="C#" MasterPageFile="../LayOut.Master" AutoEventWireup="true" CodeBehind="Sala.aspx.cs" Inherits="Touro.Patrimonio.Sala" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2>
                <asp:FormView ID="fvSala" runat="server" DataSourceID="SqlDataSourceSala" Width="100%">
                    <ItemTemplate>
                        <asp:Label Text='<%# Bind("Sala") %>' runat="server" ID="Label1" />
                    </ItemTemplate>
                </asp:FormView>
            </h2>
            <div class="options">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-2-1" data-toggle="tab">Equipamentos</a></li>
                    <li><a href="#tab-2-2" data-toggle="tab">Imoveis</a></li>
                    <li><a href="#tab-2-3" data-toggle="tab">Solicitações</a></li>
                    <li><a href="#tab-2-4" data-toggle="tab">Solicitantes</a></li>
                </ul>
            </div>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab-2-1" style="min-height: 350px">
                </div>
                <div class="tab-pane" id="tab-2-2" style="min-height: 350px">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
                </div>
                <div class="tab-pane" id="tab-2-3" style="min-height: 350px">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
                </div>
                <div class="tab-pane" id="tab-2-4" style="min-height: 350px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:ListView ID="lvSolicitantes" runat="server" DataSourceID="SqlDataSourceSolicitante" DataKeyNames="Id_Solicitante" OnItemCommand="lvSolicitantes_ItemCommand">
                                        <EmptyDataTemplate>
                                            <table runat="server" style="">
                                                <tr>
                                                    <td>
                                                        <p><h2>Nenhum Solicitante vinculado.</h2></p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <ItemTemplate>
                                            <tr style="">
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger-alt btn-sm" CommandName="Eliminar" CommandArgument='<%# Eval("Id_Solicitante") %>'><i class="fa fa-times-circle"></i></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                                            </tr>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server" style="width: 100%">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                            <tr runat="server" style="">
                                                                <th runat="server" style="width: 25px;"></th>
                                                                <th runat="server">
                                                                    <h2>Solicitantes Autorisados</h2>
                                                                </th>
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
                                    </asp:ListView>
                                </div>
                                <div class="col-sm-6">
                                    <asp:ListView ID="ListViewAutorizar" runat="server" DataSourceID="SqlDataSourceAutorizar" DataKeyNames="Id_Usuario" OnItemCommand="ListViewAutorizar_ItemCommand">
                                        <EmptyDataTemplate>
                                            <table runat="server" style="">
                                                <tr>
                                                    <td><p><h2>Nenhum Usuario disponivel.</h2></p></td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        
                                        <ItemTemplate>
                                            <tr style="">
                                                <td>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-success-alt btn-sm" CommandName="Add" CommandArgument='<%# Eval("Id_Usuario") %>'><i class="fa fa-plus-circle"></i></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server" style="width:100%">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                            <tr runat="server" style="">
                                                                <th runat="server" style="width:25px"></th>
                                                                <th runat="server"><h2>Solicitantes Não Autorizados</h2></th>
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
                                        
                                    </asp:ListView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSourceAutorizar" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Id_Usuario, Nome FROM Tb_Usuario WHERE (Id_Usuario NOT IN (SELECT Id_Usuario FROM Tb_Solicitantes WHERE (Id_Sala = @Id_Sala)))" InsertCommand="AddSolicitante" InsertCommandType="StoredProcedure">
                                        <InsertParameters>
                                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                            <asp:QueryStringParameter Name="Id_Sala" QueryStringField="Id" Type="Int32" />
                                            <asp:Parameter Name="Id_Solicitante" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Sala"></asp:QueryStringParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>


                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceSolicitante" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Solicitantes.Id_Solicitante, Tb_Usuario.Nome FROM Tb_Solicitantes INNER JOIN Tb_Usuario ON Tb_Solicitantes.Id_Usuario = Tb_Usuario.Id_Usuario WHERE (Tb_Solicitantes.Id_Sala = @Id_Sala)" DeleteCommand="DelSolicitante" DeleteCommandType="StoredProcedure" InsertCommand="DelSolicitante" InsertCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                            <asp:Parameter Name="Id_Solicitante" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                            <asp:Parameter Name="Id_Solicitante" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Sala"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceSala" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Sala] FROM [Tb_Sala] WHERE ([Id_Sala] = @Id_Sala)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Sala" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>


</asp:Content>


