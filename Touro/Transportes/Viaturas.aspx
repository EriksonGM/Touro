<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Viaturas.aspx.cs" Inherits="Touro.Transportes.Viaturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <div class="panel panel-default" data-widget='{"draggable": "false"}'>
        <div class="panel-heading">
            <h2>Gestão de Viaturas
            </h2>
            <div class="panel-ctrls button-icon-bg"
                data-actions-container=""
                data-action-collapse='{"target": ".panel-body"}'>
            </div>

        </div>

        <div class="panel-body">
            <asp:ListView ID="lvViaturas" runat="server" DataSourceID="SqlDataSourceViaturas" DataKeyNames="Id_Viatura">
               
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Id_Viatura") %>' runat="server" ID="Id_ViaturaLabel1" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Marca") %>' runat="server" ID="MarcaTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Modelo") %>' runat="server" ID="ModeloTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Matricula") %>' runat="server" ID="MatriculaTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Km") %>' runat="server" ID="KmTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("NumMotor") %>' runat="server" ID="NumMotorTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Pneus") %>' runat="server" ID="PneusTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Id_Combustivel") %>' runat="server" ID="Id_CombustivelTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Combustivel") %>' runat="server" ID="CombustivelTextBox" /></td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td><h4>Nenhuma viatura cadastrada.</h4></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <a href='<%# "Viatura.aspx?Id=" + Eval("Id_Viatura").ToString() %>' class="btn btn-primary-alt btn-sm">Perfil</a>
                            <%--<asp:Label Text= runat="server" ID="Id_ViaturaLabel" /></td>--%>
                        <td>
                            <asp:Label Text='<%# Eval("Marca") %>' runat="server" ID="MarcaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Modelo") %>' runat="server" ID="ModeloLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Matricula") %>' runat="server" ID="MatriculaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Km") %>' runat="server" ID="KmLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("NumMotor") %>' runat="server" ID="NumMotorLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Pneus") %>' runat="server" ID="PneusLabel" /></td>
                       <%-- <td>
                            <asp:Label Text='<%# Eval("Id_Combustivel") %>' runat="server" ID="Id_CombustivelLabel" /></td>--%>
                        <td>
                            <asp:Label Text='<%# Eval("Combustivel") %>' runat="server" ID="CombustivelLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width:100%">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width:20px"></th>
                                        <th runat="server">Marca</th>
                                        <th runat="server">Modelo</th>
                                        <th runat="server">Matricula</th>
                                        <th runat="server">Km</th>
                                        <th runat="server">NumMotor</th>
                                        <th runat="server">Pneus</th>
                                        <%--<th runat="server">Id_Combustivel</th>--%>
                                        <th runat="server">Combustivel</th>
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
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("Id_Viatura") %>' runat="server" ID="Id_ViaturaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Marca") %>' runat="server" ID="MarcaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Modelo") %>' runat="server" ID="ModeloLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Matricula") %>' runat="server" ID="MatriculaLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Km") %>' runat="server" ID="KmLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("NumMotor") %>' runat="server" ID="NumMotorLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Pneus") %>' runat="server" ID="PneusLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Id_Combustivel") %>' runat="server" ID="Id_CombustivelLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Combustivel") %>' runat="server" ID="CombustivelLabel" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceViaturas" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Viatura.Id_Viatura, Tb_Viatura.Marca, Tb_Viatura.Modelo, Tb_Viatura.Matricula, Tb_Viatura.Km, Tb_Viatura.NumMotor, Tb_Viatura.Pneus, Tb_Viatura.Id_Combustivel, Tb_Combustivel.Combustivel FROM Tb_Viatura INNER JOIN Tb_Combustivel ON Tb_Viatura.Id_Combustivel = Tb_Combustivel.Id_Combustivel" InsertCommand="AddViatura" InsertCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:ControlParameter ControlID="txtMarca" Name="Marca" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtModelo" Name="Modelo" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="Matricula" Type="String" />
                    <asp:ControlParameter ControlID="txtKm" Name="Km" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="NumMotor" Type="String" />
                    <asp:Parameter Name="Pneus" Type="String" />
                    <asp:ControlParameter ControlID="ddlCombustivel" Name="Id_Combustivel" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>

        <div class="panel-footer" style="text-align: center">
            <a data-toggle="modal" href="#AddViatura" class="btn btn-primary-alt pull-right">Cadastrar Viatura</a>
        </div>
    </div>


    <div class="modal fade" id="AddViatura" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Touro</h2>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Marca</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" placeholder="Marca" MaxLength="25"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Modelo</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" placeholder="Modelo" MaxLength="25"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Matricula</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control" placeholder="Matricula da viatura" MaxLength="11" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Quilometragem</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtKm" runat="server" CssClass="form-control" placeholder="" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Nº do motor</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtNumMotor" runat="server" CssClass="form-control" placeholder="" MaxLength="20" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Referência pneus</label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtPneus" runat="server" CssClass="form-control" placeholder="" MaxLength="10" Style="text-transform: uppercase"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Combustivel</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCombustivel" runat="server" DataSourceID="SqlDataSourceCombustivel" DataTextField="Combustivel" DataValueField="Id_Combustivel" CssClass="form-control"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceCombustivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Combustivel]"></asp:SqlDataSource>
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
