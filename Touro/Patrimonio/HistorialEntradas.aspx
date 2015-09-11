<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="HistorialEntradas.aspx.cs" Inherits="Touro.Patrimonio.HistorialEntradas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                $('[data-toggle="popover"]').popover()
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Historial de Entradas
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ListView ID="lvEnttradaStock" runat="server" DataSourceID="SqlDataSourceEntradaStock" DataKeyNames="Id_EntradaStock" OnDataBound="lvEnttradaStock_DataBound" >
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        <p><b>Nenhuma entrada disponivel.</b></p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="">
                <td>
                    <%--<asp:Label Text='<%# Eval("Id_EntradaStock") %>' runat="server" ID="Id_EntradaStockLabel" />--%>
                    <a class="btn btn-primary-alt btn-sm" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right"  data-html="true" data-title="Informação" data-content="<b>Nº: </b><%# Eval("Id_EntradaStock") %><br/><b>Usuario: </b><%# Eval("Nome") %><br/><b>Data Entrada: </b><%# Eval("DataEntrada") %><br/><b>Observação: </b><br/><%# Eval("Obs") %>"><i class="fa fa-info-circle"></i></a>
                    <%--<button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                        Popover on left
                    </button>--%>
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Descr") %>' runat="server" ID="DescrLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CustoUnitario","{0:N}") + " Kz" %>' runat="server" ID="CustoUnitarioLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Quantidade") %>' runat="server" ID="QuantidadeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Fornecedor") %>' runat="server" ID="FornecedorLabel" /></td>
                <%--<td>
                    <asp:Label Text='<%# Eval("Obs") %>' runat="server" ID="ObsLabel" /></td>--%>
                <%--<td>
                    <asp:Label Text='<%# Eval("DataEntrada") %>' runat="server" ID="DataEntradaLabel" /></td>--%>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="width: 100%">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table  table-hover">
                            <tr runat="server" style="">
                                <th runat="server" style="width:15px"></th>
                                <th runat="server">Descrição</th>
                                <th runat="server">Custo Unitario</th>
                                <th runat="server">Quantidade</th>
                                <th runat="server">Fornecedor</th>
                                <%--<th runat="server">Obs</th>--%>
                                <%--<th runat="server">DataEntrada</th>--%>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager runat="server" ID="DataPager1" PageSize="25">
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
            <tr style="" class="info">
                <td>
                    <%--<asp:Label Text='<%# Eval("Id_EntradaStock") %>' runat="server" ID="Id_EntradaStockLabel" />--%>
                    <a class="btn btn-primary-alt btn-sm" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right"  data-html="true" data-title="Informação" data-content="<b>Nº: </b><%# Eval("Id_EntradaStock") %><br/><b>Usuario: </b><%# Eval("Nome") %><br/><b>Data Entrada: </b><%# Eval("DataEntrada") %><br/><b>Observação: </b><br/><%# Eval("Obs") %>"><i class="fa fa-info-circle"></i></a>
                    <%--<button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="left" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                        Popover on left
                    </button>--%>
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Descr") %>' runat="server" ID="DescrLabel2" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CustoUnitario","{0:N}") + " Kz" %>' runat="server" ID="CustoUnitarioLabel2" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Quantidade") %>' runat="server" ID="QuantidadeLabel2" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Fornecedor") %>' runat="server" ID="FornecedorLabel2" /></td>
                <%--<td>
                    <asp:Label Text='<%# Eval("Obs") %>' runat="server" ID="ObsLabel" /></td>--%>
                <%--<td>
                    <asp:Label Text='<%# Eval("DataEntrada") %>' runat="server" ID="DataEntradaLabel" /></td>--%>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceEntradaStock" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_EntradaStock.Id_EntradaStock, Tb_UnidadConsumivel.UnidadConsumivel + ' - ' + Tb_Consumivel.Descr AS Descr, Tb_EntradaStock.CustoUnitario, Tb_EntradaStock.Quantidade, Tb_EntradaStock.Fornecedor, Tb_EntradaStock.Obs, Tb_EntradaStock.DataEntrada, Tb_Usuario.Nome FROM Tb_EntradaStock INNER JOIN Tb_Consumivel ON Tb_EntradaStock.Id_Consumivel = Tb_Consumivel.Id_Consumivel INNER JOIN Tb_UnidadConsumivel ON Tb_Consumivel.Id_UnidadConsumivel = Tb_UnidadConsumivel.Id_UnidadConsumivel INNER JOIN Tb_Usuario ON Tb_EntradaStock.Id_Usuario = Tb_Usuario.Id_Usuario ORDER BY Tb_EntradaStock.Id_EntradaStock DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
