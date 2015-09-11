<%@ Page Title="" Language="C#" MasterPageFile="../LayOut.Master" AutoEventWireup="true" CodeBehind="Sala.aspx.cs" Inherits="Touro.Patrimonio.Sala" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:FormView ID="fvSala" runat="server" DataSourceID="SqlDataSourceSala" Width="100%">

        <ItemTemplate>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2>
                        <asp:Label Text='<%# Bind("Sala") %>' runat="server" ID="Label1" /></h2>
                    <div class="options">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-2-1" data-toggle="tab">Equipamentos</a></li>
                            <li><a href="#tab-2-2" data-toggle="tab">Imoveis</a></li>
                            <li><a href="#tab-2-3" data-toggle="tab">Solicitações</a></li>
                            <li><a href="#tab-2-4" data-toggle="tab">Solicitantes</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-2-1" style="min-height:350px">

                        </div>
                        <div class="tab-pane" id="tab-2-2" style="min-height:350px">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
                        </div>
                        <div class="tab-pane" id="tab-2-3" style="min-height:350px">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, blanditiis adipisci eveniet ad sed voluptatum natus voluptatibus vitae deleniti? Iure porro recusandae molestiae molestias similique unde totam non omnis veritatis.</p>
                        </div>
                         <div class="tab-pane" id="tab-2-4" style="min-height:350px">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
                                     <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceSolicitantes"></asp:ListView>
                                     <asp:SqlDataSource runat="server" ID="SqlDataSourceSolicitantes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Solicitantes.Id_Solicitante, Tb_Usuario.Nome FROM Tb_Solicitantes INNER JOIN Tb_Usuario ON Tb_Solicitantes.Id_Usuario = Tb_Usuario.Id_Usuario WHERE (Tb_Solicitantes.Id_Sala = @Id_Sala)">
                                         <SelectParameters>
                                             <asp:QueryStringParameter QueryStringField="Id" Name="Id_Sala"></asp:QueryStringParameter>
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                 </ContentTemplate>
                             </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceSala" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Sala] FROM [Tb_Sala] WHERE ([Id_Sala] = @Id_Sala)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Sala" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


