<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="CadastrarConsumivel.aspx.cs" Inherits="Touro.Patrimonio.CadastrarConsumivel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <link type="text/css" href="/assets/plugins/pines-notify/pnotify.css" rel="stylesheet"> 
    <script type="text/javascript" src="/assets/plugins/pines-notify/pnotify.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Cadastrar Consumiveis
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
     <div class="form-horizontal row-border">

        <div class="form-group">
            <label class="col-sm-3 control-label">Tipo de Consumivel</label>
            <div class="col-sm-6 col-lg-4">
                <asp:DropDownList ID="ddlTipoConsumivel" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceTipoConsumivel" DataTextField="TipoConsumivel" DataValueField="Id_TipoConsumivel"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_TipoConsumivel]" InsertCommand="AddConsumivel" InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceTipoConsumivel_Inserted">
                    <InsertParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTipoConsumivel" Name="Id_TipoConsumivel" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlUnidadConsumivel" Name="Id_UnidadConsumivel" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtDesc" Name="Descr" PropertyName="Text" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-3 control-label">Unidad</label>
            <div class="col-sm-6 col-lg-4">
                <asp:DropDownList ID="ddlUnidadConsumivel" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceUnidadConsumivel" DataTextField="UnidadConsumivel" DataValueField="Id_UnidadConsumivel"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSourceUnidadConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT * FROM [Tb_UnidadConsumivel]"></asp:SqlDataSource>
            </div>
        </div>

		<div class="form-group">
            <label class="col-sm-3 control-label">Descrição</label>
            <div class="col-sm-6 col-lg-4">
                <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" placeholder="Descrição do consumivel" AutoCompleteType="Disabled" MaxLength="50"></asp:TextBox>
            </div>
        </div>

         <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta a descrição do consumivel" ControlToValidate="txtDesc" Display="Dynamic" ForeColor="Red"><p><i class="fa fa-asterisk"></i>&nbsp; Falta a descrição do consumivel.</p></asp:RequiredFieldValidator>
            </div>
        </div>

    </div>

    

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success-alt" OnClick="LinkButton1_Click"><i class="fa fa-save"></i>&nbsp; Guardar</asp:LinkButton>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
