<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Equipamento.aspx.cs" Inherits="Touro.Patrimonio.Equipamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:FormView ID="fvEquipamento" runat="server" DataKeyNames="Id_Equipamento" DataSourceID="SqlDataSourceEquipamento" Width="100%">
        <ItemTemplate>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 style="font-size: larger"><%#Eval ("COD") %></h2>
                    <div class="options">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-2-1" data-toggle="tab">Detalhes</a></li>
                            <li><a href="#tab-2-2" data-toggle="tab">Historial</a></li>
                            <li><a href="#tab-2-3" data-toggle="tab">Tab 3</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-2-1">

                            <%--<asp:Label Text='<%# Eval("Id_Equipamento") %>' runat="server" ID="Id_EquipamentoLabel" />--%>

                            <div class="row">
                                <div class="col-md-4">
                                    <p>
                                        <b>Tipo de Equipamento</b>
                                        <br />
                                        <asp:Label Text='<%# Bind("TipoEquip") %>' runat="server" ID="TipoEquipLabel" />
                                    </p>
                                    <p>
                                        <b>Marca: </b>
                                        <br />
                                        <asp:Label Text='<%# Bind("MarcaEquip") %>' runat="server" ID="MarcaEquipLabel" />
                                    </p>
                                    <p>
                                        <b>Modelo</b><br />
                                        <asp:Label Text='<%# Bind("ModeloEquip") %>' runat="server" ID="ModeloEquipLabel" />
                                    </p>
                                    <p>
                                        <b>Estado</b><br />
                                        <asp:Label Text='<%# Bind("EstadoEquip") %>' runat="server" ID="EstadoEquipLabel" />
                                    </p>
                                    <p>
                                        <b>Localização</b><br />
                                        <asp:Label Text='<%# Bind("Sala") %>' runat="server" ID="SalaLabel" />
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <p>
                                        <b>Nº de Serie</b><br />
                                        <asp:Label Text='<%# Bind("NumSerie") %>' runat="server" ID="NumSerieLabel" />
                                    </p>

                                    <p>
                                        <b>Custo</b><br />
                                        <asp:Label Text='<%# Eval("Custo", "{0:N}").ToString() + " Kz"%>' runat="server" ID="CustoLabel" />
                                    </p>

                                    <p>
                                        <b>Fornecedor</b><br />
                                        <asp:Label Text='<%# Bind("Fornecedor") %>' runat="server" ID="FornecedorLabel" />
                                    </p>
                                    <p>
                                        <b>Codigo</b><br />
                                        <asp:Label Text='<%# Bind("COD") %>' runat="server" ID="CODLabel" />
                                    </p>
                                    <p>
                                        <b>Data de Registo</b><br />
                                        <asp:Label Text='<%# Bind("DataReg") %>' runat="server" ID="DataRegLabel" />
                                    </p>

                                </div>
                                <div class="col-md-4">
                                    <div class="info-tile tile-warning">
                                        <div class="tile-icon"><i class="ti ti-settings"></i></div>
                                        <div class="tile-heading"><span>Reparações</span></div>
                                        <div class="tile-body"><span>0</span></div>
                                        <div class="tile-footer"><span class="text-danger">-7.6%</span></div>
                                    </div>
                                    <div class="info-tile tile-warning">
                                        <div class="tile-icon"><i class="ti ti-thumb-up"></i></div>
                                        <div class="tile-heading"><span>Manutenções</span></div>
                                        <div class="tile-body"><span>0</span></div>
                                        <div class="tile-footer"><span class="text-danger">-7.6%</span></div>
                                    </div>
                                </div>

                            </div>

                            <p>
                                <b>Observações</b><br />
                                <asp:Label Text='<%# Bind("Obs") %>' runat="server" ID="ObsLabel" />
                            </p>



                            <br />
                        </div>
                        <div class="tab-pane" id="tab-2-2">
                            <asp:ListView ID="lvHistorial" runat="server" DataSourceID="SqlDataSourceHistorial">
                                
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td><p><b>Sem Historial.</b></p></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Data") %>' runat="server" ID="DataLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Reg") %>' runat="server" ID="RegLabel" /></td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width:100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server">Usuario</th>
                                                        <th runat="server">Data</th>
                                                        <th runat="server">Reg</th>
                                                    </tr>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="">
                                                <asp:DataPager runat="server" ID="DataPager1">
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
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Data") %>' runat="server" ID="DataLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Reg") %>' runat="server" ID="RegLabel" /></td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceHistorial" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="HistorialEquipamento" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="Id" Name="Id_Equipamento" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="tab-pane" id="tab-2-3">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceEquipamento" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Equipamento.Id_Equipamento, Tb_TipoEquip.TipoEquip, Tb_MarcaEquip.MarcaEquip, Tb_ModeloEquip.ModeloEquip, Tb_EstadoEquip.EstadoEquip, Tb_Sala.Sala, Tb_Equipamento.NumSerie, Tb_Equipamento.Custo, Tb_Equipamento.Fornecedor, Tb_Equipamento.COD, Tb_Equipamento.Obs, Tb_Equipamento.DataReg FROM Tb_Equipamento INNER JOIN Tb_EstadoEquip ON Tb_Equipamento.Id_EstadoEquip = Tb_EstadoEquip.Id_EstadoEquip INNER JOIN Tb_ModeloEquip ON Tb_Equipamento.Id_ModeloEquip = Tb_ModeloEquip.Id_ModeloEquip INNER JOIN Tb_MarcaEquip ON Tb_ModeloEquip.Id_MarcaEquip = Tb_MarcaEquip.Id_MarcaEquip INNER JOIN Tb_Sala ON Tb_Equipamento.Id_Sala = Tb_Sala.Id_Sala INNER JOIN Tb_TipoEquip ON Tb_ModeloEquip.Id_TipoEquip = Tb_TipoEquip.Id_TipoEquip WHERE (Tb_Equipamento.Id_Equipamento = @Id_Equipamento)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Equipamento"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
