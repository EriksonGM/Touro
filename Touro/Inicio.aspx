<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Touro.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Inicio
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server"> 
    <h2>
        Seja Bem-vindo a <span>TOURO</span>
    </h2>
    <h3>
        O seu Sistema Integrado de Gestão de Patrimonio.
    </h3>
    <hr />
    <div class="row">
		<div class="col-md-3">
			<div class="info-tile tile-warning">
				<div class="tile-icon"><i class="ti ti-desktop"></i></div>
				<div class="tile-heading"><span>Equipamentos</span></div>
				<div class="tile-body"><span>1600</span></div>
				<%--<div class="tile-footer"><span class="text-danger">-7.6%</span></div>--%>
			</div>
		</div>
		<div class="col-md-3">
			<div class="info-tile tile-success">
				<div class="tile-icon"><i class="ti ti-thumb-up"></i></div>
				<div class="tile-heading"><span>Likes</span></div>
				<div class="tile-body"><span>345</span></div>
				<%--<div class="tile-footer"><span class="text-success">+15.4%</span></div>--%>
			</div>
		</div>
		<div class="col-md-3">
			<div class="info-tile tile-danger">
				<div class="tile-icon"><i class="ti ti-check-box"></i></div>
				<div class="tile-heading"><span>Bugs Fixed</span></div>
				<div class="tile-body"><span>21</span></div>
				<%--<div class="tile-footer"><span class="text-success">+10.4%</span></div>--%>
			</div>
		</div>
		<div class="col-md-3">
			<div class="info-tile tile-info">
				<div class="tile-icon"><i class="ti ti-user"></i></div>
				<div class="tile-heading"><span>Usuarios</span></div>
				<div class="tile-body"><span>124</span></div>
				<%--<div class="tile-footer"><span class="text-danger">-25.4%</span></div>--%>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
