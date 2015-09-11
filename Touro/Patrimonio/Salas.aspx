<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Salas.aspx.cs" Inherits="Touro.Patrimonio.Salas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <div class="panel panel-default" data-widget='{"draggable": "false"}'>
        <div class="panel-heading">
            <h2>Cadastro de Salas
            </h2>
            <div class="panel-ctrls button-icon-bg"
                data-actions-container=""
                data-action-collapse='{"target": ".panel-body"}'>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-5">
                    <asp:TextBox ID="txtNomeSala" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="AddSala"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:LinkButton ID="btnSaveSala" runat="server" CssClass="btn btn-success-alt form-control" ValidationGroup="AddSala" OnClick="btnSaveSala_Click"><i class="fa fa-save"></i>&nbsp; Guardar Sala</asp:LinkButton>
                </div>
                <div class="col-md-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o nome da sala" ControlToValidate="txtNomeSala" Display="Dynamic" ForeColor="Red" ValidationGroup="AddSala"><i class="fa fa-asterisk"></i>&nbsp; Falta o nome da sala.</asp:RequiredFieldValidator>
                </div>
            </div>

            <%--<hr />--%>

            <asp:ListView ID="lvSalas" runat="server" DataSourceID="SqlDataSourceSalas" DataKeyNames="Id_Sala">

                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Id_Sala") %>' runat="server" ID="Id_SalaLabel1" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Sala") %>' runat="server" ID="SalaTextBox" /></td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                <p><b>Nenhuma sala cadastrada.</b></p>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <%--<asp:Label Text='<%# Eval("Id_Sala") %>' runat="server" ID="Id_SalaLabel" />--%>
                            <div class="btn-group">
                                <button type="button" class="btn btn-midnightblue-alt dropdown-toggle" data-toggle="dropdown">
                                    Opções &nbsp; <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href='<%# "Sala.aspx?Id=" + Eval("Id_Sala") %>'><i class="fa fa-info-circle"></i>&nbsp; Detalhes</a>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="LinkButton1" runat="server"><i class="fa fa-edit"></i>&nbsp; Editar</asp:LinkButton>
                                    </li>
                                    
                                    <%--<li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>--%>
                                </ul>
                            </div>
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Sala") %>' runat="server" ID="SalaLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width: 100px"></th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager runat="server" ID="DataPager1" PageSize="50">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-primary-alt" NumericButtonCssClass="btn btn-primary-alt"></asp:NumericPagerField>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("Id_Sala") %>' runat="server" ID="Id_SalaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Sala") %>' runat="server" ID="SalaLabel" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceSalas" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Sala] Where Sala <> 'Stock'" InsertCommandType="StoredProcedure" InsertCommand="AddSala">
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:ControlParameter ControlID="txtNomeSala" Name="Sala" PropertyName="Text" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
        <%-- <div class="panel-footer" style="text-align: center">
        </div>--%>
    </div>
</asp:Content>
