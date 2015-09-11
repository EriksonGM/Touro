<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="DadosPatrimonio.aspx.cs" Inherits="Touro.Admin.DadosPatrimonio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">

        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Tipos de Equipamentos</div>
                <div class="panel-body">

                    <asp:TextBox ID="txtTipoEquip" CssClass="form-control" runat="server" AutoCompleteType="Disabled" AutoPostBack="True" OnTextChanged="txtTipoEquip_TextChanged" placeholder="Tipo de Equipamento"></asp:TextBox>
                    <hr />
                    <asp:ListView ID="lvTipo" runat="server" DataSourceID="SqlDataSourceTipo" DataKeyNames="Id_TipoEquip">

                        <EditItemTemplate>
                            <tr style="">
                                <%--<td>
                                    <asp:Label Text='<%# Eval("Id_TipoEquip") %>' runat="server" ID="Id_TipoEquipLabel1" /></td>--%>
                                <td>
                                    <asp:TextBox Text='<%# Bind("TipoEquip") %>' runat="server" ID="TipoEquipTextBox" CssClass="form-control" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" CssClass="btn btn-danger-alt btn-sm"><i class="fa fa-ban"></i></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Guardar" CssClass="btn btn-success-alt btn-sm"><i class="fa fa-save"></i></asp:LinkButton>
                                    <%--<asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                                    <asp:Button runat="server"  Text="Cancel" ID="CancelButton" />--%>
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                        <p>
                                            <b>Nenhum Tipo cadastrado.</b>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label Text='<%# Eval("TipoEquip") %>' runat="server" ID="TipoEquipLabel" /></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary-alt btn-sm" CommandName="Edit"><i class="fa fa-edit"></i></asp:LinkButton>
                                    <%--<asp:Label Text='<%# Eval("Id_TipoEquip") %>' runat="server" ID="Id_TipoEquipLabel" />--%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                            <tr runat="server" style="">
                                                <th runat="server">Tipo de Equipamento</th>
                                                <th runat="server" style="width: 75px"></th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager runat="server" ID="DataPager1" PageSize="10" PagedControlID="lvTipo">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                                <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn btn-primary-alt" CurrentPageLabelCssClass="btn btn-primary-alt"></asp:NumericPagerField>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceTipo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_TipoEquip] ORDER BY [TipoEquip]" InsertCommand="AddTipoEquip" InsertCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                            <asp:ControlParameter ControlID="txtTipoEquip" Name="TipoEquip" PropertyName="Text" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
                <%-- <div class="panel-footer">
                        </div>--%>
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Marcas de Equipamentos</div>
                <div class="panel-body">

                    <asp:TextBox ID="txtMarca" CssClass="form-control" runat="server" AutoPostBack="True" AutoCompleteType="Disabled" placeholder="Marca de Equipamento" OnTextChanged="txtMarca_TextChanged"></asp:TextBox>
                    <hr />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:ListView ID="lvMarcas" runat="server" DataSourceID="SqlDataSourceMarca" DataKeyNames="Id_MarcaEquip">
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" CssClass="btn btn-danger-alt"><i class="fa fa-ban"></i></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Guardar" CssClass="btn btn-success-alt"><i class="fa fa-save"></i></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Id_MarcaEquip") %>' runat="server" ID="Id_MarcaEquipLabel1" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("MarcaEquip") %>' runat="server" ID="MarcaEquipTextBox" /></td>
                                    </tr>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>
                                                <p>
                                                    <b>Nenhuma Marca cadastrada.</b>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr style="">

                                        <td>
                                            <asp:Label Text='<%# Eval("MarcaEquip") %>' runat="server" ID="MarcaEquipLabel" /></td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn btn-primary-alt btn-sm"><i class="fa fa-edit"></i></asp:LinkButton></td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server">Marca de Equipamento</th>
                                                        <th runat="server" style="width: 75px"></th>
                                                    </tr>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="">
                                                <asp:DataPager runat="server" ID="DataPager2" PageSize="10">
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

                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceMarca" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_MarcaEquip] ORDER BY [MarcaEquip]" InsertCommand="AddMarcaEquip" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtMarca" Name="MarcaEquip" PropertyName="Text" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>

    </div>

</asp:Content>
