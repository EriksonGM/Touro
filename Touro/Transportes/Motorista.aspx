<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Motorista.aspx.cs" Inherits="Touro.Transportes.Motorista" %>
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
				<h2>Perfil de Motorista</h2>
				<div class="options">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-1-1" data-toggle="tab">Informação</a></li>
						<li><a href="#tab-1-2" data-toggle="tab">Saidas</a></li>
						<li><a href="#tab-1-3" data-toggle="tab">Efectividade</a></li>
					</ul>
				</div>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane active" id="tab-1-1">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
					</div>
					<div class="tab-pane" id="tab-1-2">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
					</div>
					<div class="tab-pane" id="tab-1-3">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
					</div>
				</div>
			</div>
		</div>
</asp:Content>
