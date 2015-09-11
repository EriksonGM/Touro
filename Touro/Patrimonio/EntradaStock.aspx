<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="EntradaStock.aspx.cs" Inherits="Touro.Patrimonio.EntradaStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Entrada em Stock
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="form-horizontal row-border">
                <div class="form-group">
                    <label class="col-sm-3 control-label">Tipo </label>
                    <div class="col-sm-6 col-lg-4">
                        <asp:DropDownList ID="ddlTipoConsumivel" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceTipoConsumivel" DataTextField="TipoConsumivel" DataValueField="Id_TipoConsumivel" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_TipoConsumivel.TipoConsumivel, Tb_Consumivel.Id_TipoConsumivel FROM Tb_TipoConsumivel INNER JOIN Tb_Consumivel ON Tb_TipoConsumivel.Id_TipoConsumivel = Tb_Consumivel.Id_TipoConsumivel GROUP BY Tb_Consumivel.Id_TipoConsumivel, Tb_TipoConsumivel.TipoConsumivel"></asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Consumivel</label>
                    <div class="col-sm-6 col-lg-4">
                        <asp:DropDownList ID="ddlConsumivel" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceConsumivel" DataTextField="Descr" DataValueField="Id_Consumivel"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Consumivel.Id_Consumivel, Tb_UnidadConsumivel.UnidadConsumivel + ' - ' + Tb_Consumivel.Descr AS Descr FROM Tb_UnidadConsumivel INNER JOIN Tb_Consumivel ON Tb_UnidadConsumivel.Id_UnidadConsumivel = Tb_Consumivel.Id_UnidadConsumivel WHERE (Tb_Consumivel.Id_TipoConsumivel = @Id_TipoConsumivel)" InsertCommandType="StoredProcedure" InsertCommand="AddEntradaStock" OnInserted="SqlDataSourceConsumivel_Inserted">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlConsumivel" Name="Id_Consumivel" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtCusto" Name="CustoUnitario" PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtQuantidade" DefaultValue="" Name="Quantidade" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txtFornecedor" DefaultValue="Sem informação." Name="Fornecedor" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtObs" DefaultValue="Sem informação." Name="Obs" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlTipoConsumivel" PropertyName="SelectedValue" Name="Id_TipoConsumivel"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <%--<div class="form-group">
                    <label class="col-sm-3 control-label">Estado</label>
                    <div class="col-sm-6 col-lg-4">
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>--%>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Custo Unitario</label>
                    <div class="col-sm-3 col-lg-2">
                        <asp:TextBox ID="txtCusto" runat="server" CssClass="form-control" MaxLength="30" AutoCompleteType="Disabled" placeholder="Custo do Unitario" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Quantidade</label>
                    <div class="col-sm-3 col-lg-2">
                        <asp:TextBox ID="txtQuantidade" runat="server" CssClass="form-control" MaxLength="30" AutoCompleteType="Disabled" placeholder="Quantidade" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Fornecedor</label>
                    <div class="col-sm-4 col-lg-3">
                        <asp:TextBox ID="txtFornecedor" runat="server" CssClass="form-control" MaxLength="30" placeholder="Nome do Fornecedor"></asp:TextBox>
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-sm-3 control-label">Observações</label>
                    <div class="col-sm-8 col-lg-6">
                        <asp:TextBox ID="txtObs" runat="server" CssClass="form-control" MaxLength="1000" AutoCompleteType="Disabled" placeholder="Observações do Equipamento" TextMode="MultiLine" Height="100px"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-8">
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Numero de Serie" ControlToValidate="txtNumSerie" Display="Dynamic" ForeColor="Red"><p><i class="fa fa-asterisk"></i>&nbsp; Falta o Numero de Serie.</p></asp:RequiredFieldValidator>--%>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="O custo esta errado." MinimumValue="0" MaximumValue="9999999999" ControlToValidate="txtCusto" ForeColor="Red"><p><i class="fa fa-asterisk"></i>&nbsp;O custo esta errado.</p></asp:RangeValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="O falta a quantidade." MinimumValue="1" MaximumValue="9999999999" ControlToValidate="txtCusto" ForeColor="Red"><p><i class="fa fa-asterisk"></i>&nbsp;Falta a quantidade.</p></asp:RangeValidator>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
    <asp:LinkButton ID="btnGuardar" runat="server" CssClass="btn btn-success-alt" OnClick="btnGuardar_Click"><i class="fa fa-save"></i>&nbsp; Guardar</asp:LinkButton>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
