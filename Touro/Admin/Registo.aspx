<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="Registo.aspx.cs" Inherits="Touro.Admin.Registo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Registo do Sistema
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ListView ID="lvReg" runat="server" DataSourceID="SqlDataSourceReg" DataKeyNames="Id_Reg">

        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        <p style="text-align: center"><b>Nenhum Registo a mostrar.</b></p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("Id_Reg") %>' runat="server" ID="Id_RegLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Data","{0:D}") %>' runat="server" ID="DataLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Reg") %>' runat="server" ID="RegLabel" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="width: 100%">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                            <tr runat="server" style="">
                                <th runat="server" style="width:80px">Reg Nº</th>
                                <th runat="server" style="width:200px">Data</th>
                                <th runat="server" style="width:150px">Nome</th>
                                <th runat="server">Reg</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager runat="server" ID="DataPager1" PageSize="50">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primeira" LastPageText="Ultima" NextPageText="Seguinte" PreviousPageText="Anterior" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn btn-primary-alt" NextPreviousButtonCssClass="btn btn-primary-alt" CurrentPageLabelCssClass="btn btn-primary-alt"></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primeira" LastPageText="Ultima" NextPageText="Seguinte" PreviousPageText="Anterior" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("Id_Reg") %>' runat="server" ID="Id_RegLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Data") %>' runat="server" ID="DataLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Reg") %>' runat="server" ID="RegLabel" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceReg" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Reg.Id_Reg, Tb_Usuario.Nome, Tb_Reg.Data, Tb_Reg.Reg FROM Tb_Reg INNER JOIN Tb_Usuario ON Tb_Reg.Id_Usuario = Tb_Usuario.Id_Usuario ORDER BY Tb_Reg.Id_Reg DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
