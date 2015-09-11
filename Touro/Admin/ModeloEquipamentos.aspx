<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ModeloEquipamentos.aspx.cs" Inherits="Touro.Admin.ModeloEquipamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <div class="col-md-10 col-lg-10">
            <div class="panel panel-primary">
                <div class="panel-heading">Modelos de Equipamentos</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlTipo" runat="server" DataSourceID="SqlDataSourceTipoEquip" DataTextField="TipoEquip" DataValueField="Id_TipoEquip" CssClass="form-control"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_TipoEquip] ORDER BY [TipoEquip]"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlMarca" runat="server" DataSourceID="SqlDataSourceMarcaEquip" DataTextField="MarcaEquip" DataValueField="Id_MarcaEquip" CssClass="form-control"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceMarcaEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_MarcaEquip] ORDER BY [MarcaEquip]" InsertCommand="AddModeloEquip" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlTipo" Name="Id_TipoEquip" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlMarca" Name="Id_MarcaEquip" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtModeloEquip" Name="ModeloEquip" PropertyName="Text" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-5">
                            <asp:TextBox ID="txtModeloEquip" CssClass="form-control" runat="server" placeholder="Modelo de Equipamento" AutoCompleteType="Disabled"></asp:TextBox>
                        </div>
                        <div class="col-md-1">
                            <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-success-alt form-control" OnClick="btnSave_Click"><i class="fa fa-save"></i></asp:LinkButton>
                        </div>
                    </div>
                    <hr />
                    <asp:ListView ID="lvModelo" runat="server" DataSourceID="SqlDataSourceModelo" DataKeyNames="Id_ModeloEquip">
                        
                        
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                        <p>
                                            <b>
                                                Nenhum modelo de equipamento registado.
                                            </b>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                       
                        <ItemTemplate>
                            <tr style="">
                                <%-- <td>
                                    <asp:Label Text='<%# Eval("Id_TipoEquip") %>' runat="server" ID="Id_TipoEquipLabel" /></td>--%>
                                <td>
                                    <asp:Label Text='<%# Eval("TipoEquip") %>' runat="server" ID="TipoEquipLabel" /></td>
                              <%--  <td>
                                    <asp:Label Text='<%# Eval("Id_MarcaEquip") %>' runat="server" ID="Id_MarcaEquipLabel" /></td>--%>
                                <td>
                                    <asp:Label Text='<%# Eval("MarcaEquip") %>' runat="server" ID="MarcaEquipLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("ModeloEquip") %>' runat="server" ID="ModeloEquipLabel" /></td>
                                <%--<td>
                                    <asp:Label Text='<%# Eval("Id_ModeloEquip") %>' runat="server" ID="Id_ModeloEquipLabel" /></td>--%>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width:100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover"> 
                                            <tr runat="server" style="">
                                                
                                                <%--<th runat="server">Id_TipoEquip</th>--%>
                                                <th runat="server" style="width:30%">Tipo</th>
                                                <%--<th runat="server">Id_MarcaEquip</th>--%>
                                                <th runat="server" style="width:30%">Marca</th>
                                                <th runat="server" style="width:30%">Modelo</th>
                                                <%--<th runat="server"></th>--%>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager runat="server" ID="DataPager1" PageSize="20">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                                <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn btn-primary-alt" NextPreviousButtonCssClass="btn btn-primary-alt" CurrentPageLabelCssClass="btn btn-primary-alt"></asp:NumericPagerField>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceModelo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_ModeloEquip.Id_ModeloEquip, Tb_TipoEquip.TipoEquip, Tb_MarcaEquip.MarcaEquip, Tb_ModeloEquip.ModeloEquip FROM Tb_MarcaEquip INNER JOIN Tb_ModeloEquip ON Tb_MarcaEquip.Id_MarcaEquip = Tb_ModeloEquip.Id_MarcaEquip INNER JOIN Tb_TipoEquip ON Tb_ModeloEquip.Id_TipoEquip = Tb_TipoEquip.Id_TipoEquip ORDER BY Tb_TipoEquip.TipoEquip, Tb_MarcaEquip.MarcaEquip, Tb_ModeloEquip.ModeloEquip"></asp:SqlDataSource>
                </div>

            </div>
        </div>
</asp:Content>
