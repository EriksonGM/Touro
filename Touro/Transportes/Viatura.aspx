<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Viatura.aspx.cs" Inherits="Touro.Transportes.Viatura" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>
        .tab-pane {
            min-height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <h2>Perfil de Viatura</h2>
            <div class="options">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-1-1" data-toggle="tab">Informação</a></li>
                    <li><a href="#tab-1-2" data-toggle="tab">Saidas</a></li>
                    <li><a href="#tab-1-3" data-toggle="tab">Manutenções</a></li>
                    <%--<li><a href="#tab-1-4" data-toggle="tab">Avarias</a></li>--%>
                </ul>
            </div>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab-1-1">

                    <asp:FormView ID="fvInfo" runat="server" DataKeyNames="Id_Viatura" DataSourceID="SqlDataSourceInfo" Width="100%">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>
                                        <b>Marca:</b>
                                        <asp:Label Text='<%# Bind("Marca") %>' runat="server" ID="MarcaLabel" />
                                    </p>
                                    <p>
                                        <b>Modelo:</b>
                                        <asp:Label Text='<%# Bind("Modelo") %>' runat="server" ID="ModeloLabel" />
                                    </p>
                                    <p>
                                        <b>Matricula:</b>
                                        <asp:Label Text='<%# Bind("Matricula") %>' runat="server" ID="MatriculaLabel" />
                                    </p>
                                    <p>
                                        <b>Quilometragem:</b>
                                        <asp:Label Text='<%# Bind("Km") %>' runat="server" ID="KmLabel" />
                                        <span> Km</span>
                                    </p>
                                    <p>
                                        <b>Nº Motor:</b>
                                        <asp:Label Text='<%# Bind("NumMotor") %>' runat="server" ID="NumMotorLabel" />
                                        
                                    </p>
                                    <p>
                                        <b>Pneus:</b>
                                        <asp:Label Text='<%# Bind("Pneus") %>' runat="server" ID="PneusLabel" />
                                    </p>
                                    <p>
                                        <b>Combustivel:</b>
                                        <asp:Label Text='<%# Bind("Combustivel") %>' runat="server" ID="CombustivelLabel" />
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <b>Intervalo de Manutenções: </b>
                                        <asp:Label Text='<%# Bind("KmCheck") %>' runat="server" ID="Label1" />
                                        <span> Km</span>
                                    </p>
                                    <p>
                                        <b>Proxima Manutenção em:</b>
                                        <asp:Label Text='<%# LastCheck((int)Eval("Km"),(int)Eval("KmCheck"))%>' runat="server" ID="Label2" />
                                        <span> Km</span>
                                    </p>
                                    

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>



                    <asp:SqlDataSource runat="server" ID="SqlDataSourceInfo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Viatura.Id_Viatura, Tb_Viatura.Marca, Tb_Viatura.Modelo, Tb_Viatura.Matricula, Tb_Viatura.Km, Tb_Viatura.NumMotor, Tb_Viatura.Pneus, Tb_Viatura.Id_Combustivel, Tb_Combustivel.Combustivel, Tb_Viatura.KmCheck FROM Tb_Combustivel INNER JOIN Tb_Viatura ON Tb_Combustivel.Id_Combustivel = Tb_Viatura.Id_Combustivel WHERE (Tb_Viatura.Id_Viatura = @Id_Viatura)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Viatura"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="tab-pane" id="tab-1-2">
                    <asp:ListView ID="lvSaidas" runat="server" DataSourceID="SqlDataSourceSaidas" DataKeyNames="Id_Saida">

                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                        <h4>Nenhum salida registrada</h4>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <tr style="">
                                <%-- <td>
                                    <asp:Label Text='<%# Eval("Id_Saida") %>' runat="server" ID="Id_SaidaLabel" /></td>--%>
                                <td>
                                    <asp:Label Text='<%# Eval("Motorista") %>' runat="server" ID="MotoristaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Data","{0:D}") %>' runat="server" ID="DataLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("HoraSaida") %>' runat="server" ID="HoraSaidaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("HoraEntrada") %>' runat="server" ID="HoraEntradaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("KmSaida") %>' runat="server" ID="KmSaidaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("KmEntrada") %>' runat="server" ID="KmEntradaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Distancia").ToString() + " Km" %>' runat="server" ID="DistanciaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Rota") %>' runat="server" ID="RotaLabel" /></td>
                                <td>
                                    <a class="btn btn-primary-alt btn-sm Obs" data-toggle="popover" data-trigger="hover" title="Observações" data-content="And here's some amazing content. It's very engaging."><i class="fa fa-info-circle"></i></a>
                                    <%--<asp:Label Text='<%# Eval("Obs") %>' runat="server" ID="ObsLabel" /></td>--%>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                            <tr runat="server" style="">
                                                <%--<th runat="server" style="width:10px"></th>--%>
                                                <th runat="server">Motorista</th>
                                                <th runat="server">Data</th>
                                                <th runat="server">Hora Saida</th>
                                                <th runat="server">Hora Entrada</th>
                                                <th runat="server">Km Saida</th>
                                                <th runat="server">Km Entrada</th>
                                                <th runat="server">Distancia</th>
                                                <th runat="server">Rota</th>
                                                <th runat="server">Obs</th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager runat="server" ID="DataPager1" PageSize="25">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label Text='<%# Eval("Id_Saida") %>' runat="server" ID="Id_SaidaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Motorista") %>' runat="server" ID="MotoristaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Data") %>' runat="server" ID="DataLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("HoraSaida") %>' runat="server" ID="HoraSaidaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("HoraEntrada") %>' runat="server" ID="HoraEntradaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("KmSaida") %>' runat="server" ID="KmSaidaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("KmEntrada") %>' runat="server" ID="KmEntradaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Distancia") %>' runat="server" ID="DistanciaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Rota") %>' runat="server" ID="RotaLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Obs") %>' runat="server" ID="ObsLabel" /></td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceSaidas" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Saida.Id_Saida, Tb_Motorista.Nome AS Motorista, Tb_Saida.Data, Tb_Saida.HoraSaida, Tb_Saida.HoraEntrada, Tb_Saida.KmSaida, Tb_Saida.KmEntrada, Tb_Saida.KmEntrada - Tb_Saida.KmSaida AS Distancia, Tb_Saida.Rota, Tb_Saida.Obs FROM Tb_Saida INNER JOIN Tb_Motorista ON Tb_Saida.Id_Motorista = Tb_Motorista.Id_Motorista WHERE (Tb_Saida.Id_Viatura = @Id_Viatura) ORDER BY Tb_Saida.Data DESC, Tb_Saida.HoraSaida DESC, Tb_Saida.Id_Saida DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Viatura"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="tab-pane" id="tab-1-3">
                    <p>
                        <a data-toggle="modal" href="#AddManu" class="btn btn-primary-alt"><i class="fa fa-plus-circle"></i>&nbsp;Registar Manutenção</a>
                    </p>

                    <asp:ListView ID="lvManu" runat="server" DataSourceID="SqlDataSourceManu" DataKeyNames="Id_CheckViatura">


                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                        <h4>Nenhum Manutenção registada</h4>
                                    </td>

                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <tr style="">
                                <%--<td>
                                    <asp:Label Text='<%# Eval("Id_CheckViatura") %>' runat="server" ID="Id_CheckViaturaLabel" /></td>--%>
                                <td>
                                    <asp:Label Text='<%# Eval("Entidade") %>' runat="server" ID="EntidadeLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Data","{0:d}") %>' runat="server" ID="DataLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Km") %>' runat="server" ID="KmLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Custo","{0:F2}").ToString() + " Kz" %>' runat="server" ID="CustoLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Obs") %>' runat="server" ID="ObsLabel" /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                            <tr runat="server" style="">
                                                <%-- <th runat="server">Id_CheckViatura</th>--%>
                                                <th runat="server" style="width: 200px">Entidade</th>
                                                <th runat="server" style="width: 150px">Data</th>
                                                <th runat="server" style="width: 150px">Quilometragem</th>
                                                <th runat="server" style="width: 150px">Custo</th>
                                                <th runat="server">Obs</th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager runat="server" ID="DataPager2">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary-alt"></asp:NextPreviousPagerField>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>
                </div>
                <div class="tab-pane" id="tab-1-4">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="AddManu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Touro</h2>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">

                        <asp:SqlDataSource runat="server" ID="SqlDataSourceManu" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Id_CheckViatura, Entidade, Data, Km, Custo, Obs FROM Tb_CheckViatura WHERE (Id_Viatura = @Id_Viatura)" InsertCommand="AddCheckViatura" InsertCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Viatura"></asp:QueryStringParameter>
                                <asp:ControlParameter ControlID="txtEntidade" Name="Entidade" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtData" DbType="Date" Name="Data" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtKm" Name="Km" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txtCusto" Name="Custo" PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtObs" Name="Obs" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Viatura"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>


                        <div class="form-group">
                            <label class="col-md-3 control-label">Entidade</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtEntidade" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Data</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtData" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Quilometragem</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtKm" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Custo</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtCusto" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Observações</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtObs" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px" MaxLength="1000"></asp:TextBox>
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
