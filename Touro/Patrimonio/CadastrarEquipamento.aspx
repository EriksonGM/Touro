<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="CadastrarEquipamento.aspx.cs" Inherits="Touro.Patrimonio.CadastrarEquipamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Cadastrar Equipamento
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-horizontal row-border">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Tipo</label>
                    <div class="col-sm-4 col-lg-3">
                        <asp:DropDownList ID="ddlTipoEquip" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceTipoEquip" DataTextField="TipoEquip" DataValueField="Id_TipoEquip" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_ModeloEquip.Id_TipoEquip, Tb_TipoEquip.TipoEquip FROM Tb_TipoEquip INNER JOIN Tb_ModeloEquip ON Tb_TipoEquip.Id_TipoEquip = Tb_ModeloEquip.Id_TipoEquip GROUP BY Tb_TipoEquip.TipoEquip, Tb_ModeloEquip.Id_TipoEquip" InsertCommand="AddEquipamento" InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceTipoEquip_Inserted" >
                            <InsertParameters>
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlModeloEquip" Name="Id_ModeloEquip" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlEstadoEquip" Name="Id_EstadoEquip" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtNumSerie" Name="NumSerie" PropertyName="Text" Type="String" />
                                <asp:ControlParameter Name="Custo" Type="Decimal" ControlID="txtCusto" PropertyName="Text" DefaultValue="0" />
                                <asp:ControlParameter ControlID="txtFornecedor" Name="Fornecedor" PropertyName="Text" Type="String" DefaultValue="Nenhuma Informação Disponivel" />
                                <asp:Parameter Direction="InputOutput" Name="Id_Equipamento" Type="String" DefaultValue="0" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlSala" Name="Id_Sala" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtObs" Name="Obs" PropertyName="Text" Type="String" DefaultValue="Sem observações" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Marca</label>
                    <div class="col-sm-4 col-lg-3">
                        <asp:DropDownList ID="ddlMarcaEquip" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceMarcaEquip" DataTextField="MarcaEquip" DataValueField="Id_MarcaEquip" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceMarcaEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_ModeloEquip.Id_MarcaEquip, Tb_MarcaEquip.MarcaEquip FROM Tb_ModeloEquip INNER JOIN Tb_MarcaEquip ON Tb_ModeloEquip.Id_MarcaEquip = Tb_MarcaEquip.Id_MarcaEquip WHERE (Tb_ModeloEquip.Id_TipoEquip = @Id_TipoEquip)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlTipoEquip" PropertyName="SelectedValue" Name="Id_TipoEquip"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 15px; padding-bottom: 0;">
                    <label class="col-sm-3 control-label">Modelo</label>
                    <div class="col-sm-4 col-lg-3">
                        <asp:DropDownList ID="ddlModeloEquip" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceModeloEquip" DataTextField="ModeloEquip" DataValueField="Id_ModeloEquip"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceModeloEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Id_ModeloEquip, ModeloEquip FROM Tb_ModeloEquip WHERE (Id_TipoEquip = @Id_TipoEquip) AND (Id_MarcaEquip = @Id_MarcaEquip)" InsertCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlTipoEquip" PropertyName="SelectedValue" Name="Id_TipoEquip"></asp:ControlParameter>
                                <asp:ControlParameter ControlID="ddlMarcaEquip" PropertyName="SelectedValue" Name="Id_MarcaEquip"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="form-group">
            <label class="col-sm-3 control-label">Estado</label>
            <div class="col-sm-4 col-lg-3">
                <asp:DropDownList ID="ddlEstadoEquip" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceEstadoEquip" DataTextField="EstadoEquip" DataValueField="Id_EstadoEquip"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceEstadoEquip" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_EstadoEquip]"></asp:SqlDataSource>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Localização</label>
            <div class="col-sm-4 col-lg-3">
                <asp:DropDownList ID="ddlSala" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceSala" DataTextField="Sala" DataValueField="Id_Sala"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceSala" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_Sala]"></asp:SqlDataSource>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Nº de Serie</label>
            <div class="col-sm-4 col-lg-3">
                <asp:TextBox ID="txtNumSerie" runat="server" CssClass="form-control" MaxLength="20" AutoCompleteType="Disabled" placeholder="Nº de Serie do Equipamento"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Fornecedor</label>
            <div class="col-sm-4 col-lg-3">
                <asp:TextBox ID="txtFornecedor" runat="server" CssClass="form-control" MaxLength="30" AutoCompleteType="Disabled" placeholder="Nome do Fornecedor"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Custo</label>
            <div class="col-sm-4 col-lg-3">
                <asp:TextBox ID="txtCusto" runat="server" CssClass="form-control" MaxLength="30" AutoCompleteType="Disabled" placeholder="Custo do Equipamento" TextMode="Number"></asp:TextBox>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Numero de Serie" ControlToValidate="txtNumSerie" Display="Dynamic" ForeColor="Red"><p><i class="fa fa-asterisk"></i>&nbsp; Falta o Numero de Serie.</p></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="O custo do equipamento esta errado." MinimumValue="0" MaximumValue="9999999999" ControlToValidate="txtCusto" ForeColor="Red"><p><i class="fa fa-asterisk"></i>&nbsp;O custo do equipamento esta errado.</p></asp:RangeValidator>
            </div>
        </div>


    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
    <a class="btn btn-danger-alt" href="/Patrimonio/CadastrarEquipamento.aspx"><i class="fa fa-ban"></i>&nbsp; Cancelar</a>
    <asp:LinkButton ID="btnSaveEquip" runat="server" CssClass="btn btn-success-alt" OnClick="btnSaveEquip_Click"><i class="fa fa-save"></i>&nbsp; Guardar</asp:LinkButton>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
