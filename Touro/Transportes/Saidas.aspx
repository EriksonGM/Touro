<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Saidas.aspx.cs" Inherits="Touro.Transportes.Saidas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="panel panel-default" data-widget='{"draggable": "false"}'>
        <div class="panel-heading">
            <h2>Historial de Saidas</h2>
            <div class="panel-ctrls button-icon-bg"
                data-actions-container=""
                data-action-collapse='{"target": ".panel-body"}'>
            </div>

        </div>

        <div class="panel-body">
            <asp:ListView ID="lvSaidas" runat="server" DataSourceID="SqlDataSourceSaidas" DataKeyNames="Id_Saida">
                
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                <h4>Nenhuma salida registrada.</h4>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("Id_Saida") %>' runat="server" ID="Id_SaidaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Matricula") %>' runat="server" ID="MatriculaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Data","{0:d}") %>' runat="server" ID="Label1" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("HoraSaida","{0:t}") %>' runat="server" ID="HoraSaidaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("HoraEntrada") %>' runat="server" ID="HoraEntradaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Rota") %>' runat="server" ID="RotaLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width:90px">Nº Salida</th>
                                        <th runat="server" style="width:110px">Matricula</th>
                                        <th runat="server" style="width:250px">Motorista</th>
                                        <th runat="server" style="width:100px">Data</th>
                                        <th runat="server" style="width:110px">Hora Saida</th>
                                        <th runat="server" style="width:110px">Hora Entrada</th>
                                        <th runat="server">Rota</th>
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
                <%--<SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("Id_Saida") %>' runat="server" ID="Id_SaidaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Matricula") %>' runat="server" ID="MatriculaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("HoraSaida") %>' runat="server" ID="HoraSaidaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("HoraEntrada") %>' runat="server" ID="HoraEntradaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Rota") %>' runat="server" ID="RotaLabel" /></td>
                    </tr>
                </SelectedItemTemplate>--%>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceSaidas" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Saida.Id_Saida, Tb_Viatura.Matricula, Tb_Motorista.Nome, Tb_Saida.HoraSaida, Tb_Saida.HoraEntrada, Tb_Saida.Rota, Tb_Saida.Data FROM Tb_Motorista INNER JOIN Tb_Saida ON Tb_Motorista.Id_Motorista = Tb_Saida.Id_Motorista INNER JOIN Tb_Viatura ON Tb_Saida.Id_Viatura = Tb_Viatura.Id_Viatura ORDER BY Tb_Saida.Data DESC, Tb_Saida.HoraSaida DESC, Tb_Saida.Id_Saida DESC" InsertCommandType="StoredProcedure" InsertCommand="AddSaida">
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlViatura" Name="Id_Viatura" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlMotorista" Name="Id_Motorista" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txtData" DbType="Date" Name="Data" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtHoraSaida" DbType="Time" Name="HoraSaida" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtHoraEntrada" DbType="Time" Name="HoraEntrada" PropertyName="Text" />
                    <asp:Parameter Name="KmEntrada" Type="Int32" />
                    <asp:ControlParameter ControlID="txtRota" Name="Rota" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtObs" Name="Obs" PropertyName="Text" Type="String" DefaultValue="Sem novidade" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>

        <div class="panel-footer" style="text-align: center">
            <a data-toggle="modal" href="#AddSaida" class="btn btn-primary-alt pull-right">Registar Saida</a>
        </div>
    </div>


    <div class="modal fade" id="AddSaida" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Touro</h2>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Motorista</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlMotorista" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMotorista" DataTextField="Nome" DataValueField="Id_Motorista" ></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSourceMotorista" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Id_Motorista], [Nome] FROM [Tb_Motorista] WHERE ([Activo] = @Activo)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="true" Name="Activo" Type="Boolean"></asp:Parameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Viatura</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlViatura" runat="server" AutoPostBack="True" CssClass="form-control" DataSourceID="SqlDataSourceViatura" DataTextField="Matricula" DataValueField="Id_Viatura"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSourceViatura" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Id_Viatura], [Matricula] FROM [Tb_Viatura]"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Rota</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtRota" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Data</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtData" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Hora de Saida</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtHoraSaida" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Hora de Entrada</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtHoraEntrada" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:FormView ID="fvKmEntrada" runat="server" DataSourceID="SqlDataSourceKmSaida" Width="100%">

                                    <ItemTemplate>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Km Saida</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtKmSaida" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Bind("Km") %>' Enabled="False"></asp:TextBox>

                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Km Entrada</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtKmEntrada" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Bind("Km") %>'></asp:TextBox>
                                                <%--<asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtKmEntrada" Display="Dynamic" MaximumValue="999999" MinimumValue='<%# Bind("Km") %>' ForeColor="Red" ValidationGroup="Km"><i class="fa fa-asterisk"></i>&nbsp; Quilometragem errada.</asp:RangeValidator>--%>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtKmEntrada" Display="Dynamic" ForeColor="Red" ValidationGroup="Km" ControlToCompare="txtKmSaida" Type="Integer" Operator="GreaterThan"><i class="fa fa-asterisk"></i>&nbsp; Quilometragem errada.</asp:CompareValidator>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceKmSaida" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Km] FROM [Tb_Viatura] WHERE ([Id_Viatura] = @Id_Viatura)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlViatura" PropertyName="SelectedValue" Name="Id_Viatura" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>


                                <div class="form-group">
                                    <label class="col-md-3 control-label">Observações</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtObs" runat="server" TextMode="MultiLine" MaxLength="1000" CssClass="form-control" Height="200px"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger-alt" data-dismiss="modal"><i class="fa fa-ban"></i>&nbsp; Cancelar</button>
                    <asp:LinkButton ID="btnOk" runat="server" CssClass="btn btn-success-alt" ValidationGroup="Km" OnClick="btnOk_Click"><i class="fa fa-plus-circle" ></i>&nbsp; Cadastrar</asp:LinkButton>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <!-- /.modal -->
</asp:Content>
