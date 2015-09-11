<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="CriarUsuario.aspx.cs" Inherits="Touro.Admin.CriarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Criar Usuario
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    
    <div class="form-horizontal row-border">

        <div class="form-group">
            <label class="col-sm-3 control-label">Nome Usuario</label>
            <div class="col-sm-8 col-lg-6">
                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>
            <div class="col-sm-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome de Usuario" ControlToValidate="txtNome" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Nome Acesso</label>
            <div class="col-sm-8 col-lg-6">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>
            <div class="col-sm-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta o Nome de Acesso" ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Senha</label>
            <div class="col-sm-4 col-lg-3">
                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>
            <div class="col-sm-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta a senha" ControlToValidate="txtPass" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Confirmação Senha</label>
            <div class="col-sm-4 col-lg-3">
                <asp:TextBox ID="txtPass2" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
            </div>
            <div class="col-sm-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Falta a confirmação da senha" ControlToValidate="txtPass2" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="As senhas devem ser iguais" ControlToCompare="txtPass" ControlToValidate="txtPass2" ForeColor="Red" Display="Dynamic"><i class="fa fa-asterisk"></i></asp:CompareValidator>
            </div>
        </div>

        <div class="form-group">
            <label for="checkbox" class="col-sm-3 control-label">Permições</label>
            <div class="col-sm-8 icheck">
                <asp:CheckBox ID="cbSoli" runat="server" Text="Modulo de Solicitações" /><br />
                <asp:CheckBox ID="cbPatr" runat="server" Text="Modulo de Patrimonio" /><br />
                <asp:CheckBox ID="cbTran" runat="server" Text="Modulo de Trasportes" /><br />
                <asp:CheckBox ID="cbArea" runat="server" Text="Modulo de Area Técnica" /><br />
                <asp:CheckBox ID="cbEsta" runat="server" Text="Modulo de Estatisticas" /><br />
                <asp:CheckBox ID="cbGest" runat="server" Text="Modulo de Gestão" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-8 col-lg-6">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"><i class="fa fa-asterisk"></i>&nbsp; Nome de Acesso em uso, tente novamente com outro.</asp:Label>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
    <asp:LinkButton ID="btnGuardar" runat="server" CssClass="btn btn-success-alt" OnClick="btnGuardar_Click"><i class="fa fa-save"></i>&nbsp; Criar Usuario</asp:LinkButton>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
