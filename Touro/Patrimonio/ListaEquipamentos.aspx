<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="ListaEquipamentos.aspx.cs" Inherits="Touro.Patrimonio.ListaEquipamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>
        .row div {
            margin-bottom: 5px;
            /*margin-top:5px;*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Lista Geral de Equipamentos
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group">
                        <asp:DropDownList ID="ddlSala" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceSala" DataTextField="Sala" DataValueField="Id_Sala" Enabled="False" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceSala" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Sala]"></asp:SqlDataSource>
                        <div class="input-group-addon">
                            <asp:CheckBox ID="cbSala" runat="server" AutoPostBack="True" OnCheckedChanged="cbSala_CheckedChanged" />
                        </div>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <asp:DropDownList ID="ddlTipoEquip" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoEquip" DataTextField="TipoEquip" DataValueField="Id_TipoEquip" Enabled="False" AutoPostBack="True"></asp:DropDownList>

                        <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_TipoEquip]"></asp:SqlDataSource>
                        <div class="input-group-addon">
                            <asp:CheckBox ID="cbTipo" runat="server" AutoPostBack="True" OnCheckedChanged="cbTipo_CheckedChanged" />
                        </div>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceEstadoEquip" DataTextField="EstadoEquip" DataValueField="Id_EstadoEquip" Enabled="False" AutoPostBack="True"></asp:DropDownList>

                        <asp:SqlDataSource runat="server" ID="SqlDataSourceEstadoEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_EstadoEquip]"></asp:SqlDataSource>
                        <div class="input-group-addon">
                            <asp:CheckBox ID="cbEstado" runat="server" AutoPostBack="True" OnCheckedChanged="cbEstado_CheckedChanged" />
                        </div>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-barcode"></i>
                        </span>
                        <asp:TextBox ID="txxCOD" runat="server" placeholder="Codigo do Equipamento" CssClass="form-control" AutoCompleteType="Disabled" AutoPostBack="True" MaxLength="7"></asp:TextBox>

                    </div>
                </div>
            </div>
            <hr />
            <asp:ListView ID="lvEquipamentos" runat="server" DataSourceID="SqlDataSourceEquipamentos">
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                <p>
                                    <b>Nenhum resultado disponivel.</b>
                                </p>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <a href='<%# "/Patrimonio/Equipamento.aspx?Id="+ Eval("Id_Equipamento") %>' class=" btn btn-primary-alt btn-sm"><i class="fa fa-info-circle"></i></a>
                        </td>

                        <td>
                            <asp:Label Text='<%# Eval("COD") %>' runat="server" ID="CODLabel" />

                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("NumSerie") %>' runat="server" ID="NumSerieLabel" />

                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("TipoEquip") %>' runat="server" ID="TipoEquipLabel" />

                        </td>
                        <%--<td>
                            <asp:Label Text='<%# Eval("Id_TipoEquip") %>' runat="server" ID="Id_TipoEquipLabel" />

                        </td>--%>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width: 25px"></th>
                                        
                                        <th runat="server">Codigo</th>
                                        <th runat="server">Nº de Serie</th>
                                        <th runat="server">Tipo</th>
                                        <%--<th runat="server">Id_TipoEquip</th>--%>
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
                                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-primary-alt" NumericButtonCssClass="btn btn-primary-alt" NextPreviousButtonCssClass="btn btn-primary-alt"></asp:NumericPagerField>
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
                            <asp:Label Text='<%# Eval("Id_Equipamento") %>' runat="server" ID="Id_EquipamentoLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("NumSerie") %>' runat="server" ID="NumSerieLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("COD") %>' runat="server" ID="CODLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("TipoEquip") %>' runat="server" ID="TipoEquipLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Id_TipoEquip") %>' runat="server" ID="Id_TipoEquipLabel" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceEquipamentos" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="FiltrarEquipamento" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlSala" PropertyName="SelectedValue" Name="Id_Sala" Type="Int32"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="cbSala" PropertyName="Checked" Name="Sala" Type="Boolean"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlTipoEquip" PropertyName="SelectedValue" Name="Id_Tipo" Type="Int32"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="cbTipo" PropertyName="Checked" Name="Tipo" Type="Boolean"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="ddlEstado" PropertyName="SelectedValue" Name="Id_Estado" Type="Int32"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="cbEstado" PropertyName="Checked" Name="Estado" Type="Boolean"></asp:ControlParameter>
                    <asp:ControlParameter ControlID="txxCOD" PropertyName="Text" DefaultValue=" " Name="COD" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
