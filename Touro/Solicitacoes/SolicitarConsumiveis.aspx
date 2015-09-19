<%@ Page Title="" Language="C#" MasterPageFile="~/LayOutPanel.master" AutoEventWireup="true" CodeBehind="SolicitarConsumiveis.aspx.cs" Inherits="Touro.Solicitacoes.SolicitarConsumiveis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    Solicitação de Consumiveis
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div>
                <div class="col-md-6">
                    <h4>Tipo de Consumivel</h4>
                    <asp:DropDownList ID="ddlTipoConsumivel" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoConsumivel" DataTextField="TipoConsumivel" DataValueField="Id_TipoConsumivel" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceTipoConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_TipoConsumivel.Id_TipoConsumivel, Tb_TipoConsumivel.TipoConsumivel FROM Tb_Consumivel INNER JOIN Tb_TipoConsumivel ON Tb_Consumivel.Id_TipoConsumivel = Tb_TipoConsumivel.Id_TipoConsumivel GROUP BY Tb_TipoConsumivel.TipoConsumivel, Tb_TipoConsumivel.Id_TipoConsumivel"></asp:SqlDataSource>
                    <hr />
                    <h4>Consumivel</h4>
                    <div style="width: 100%; max-height: 500px; overflow-y: auto">
                        <asp:ListView ID="lvConsumivel" runat="server" DataSourceID="SqlDataSourceConsumivel" DataKeyNames="Id_Consumivel">

                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>
                                            <h3>Nenhum resultado. </h3>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="">
                                    <td style="width: 15px;">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary-alt btn-sm" CommandName="Select"><i class="fa fa-plus-circle"></i></asp:LinkButton>
                                        &nbsp;
                                   <%-- </td>
                                    <td>--%>
                                        <asp:Label Text='<%# Eval("Consumivel") %>' runat="server" ID="ConsumivelLabel" /></td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                <tr runat="server">
                                                    <%-- <th runat="server" ></th>
                                                    <th runat="server" ></th>--%>
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
                                <tr style="" class="info">
                                    <td>


                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary btn-sm"><i class="fa fa-circle"></i></asp:LinkButton>
                                        &nbsp;
                                        <asp:Label Text='<%# Eval("Consumivel") %>' runat="server" ID="ConsumivelLabel" /></td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Consumivel.Id_Consumivel, Tb_UnidadConsumivel.UnidadConsumivel + ' - ' + Tb_Consumivel.Descr AS Consumivel FROM Tb_Consumivel INNER JOIN Tb_UnidadConsumivel ON Tb_Consumivel.Id_UnidadConsumivel = Tb_UnidadConsumivel.Id_UnidadConsumivel WHERE (Tb_Consumivel.Id_TipoConsumivel = @Id_TipoConsumivel) ORDER BY Consumivel">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlTipoConsumivel" PropertyName="SelectedValue" Name="Id_TipoConsumivel"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <hr />
                </div>
                <div class="col-md-6">
                    <h4>Destino</h4>
                    <asp:DropDownList ID="ddlDestino" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceDestino" DataTextField="Sala" DataValueField="Id_Sala"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceDestino" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Sala.Id_Sala, Tb_Sala.Sala FROM Tb_Solicitantes INNER JOIN Tb_Sala ON Tb_Solicitantes.Id_Sala = Tb_Sala.Id_Sala WHERE (Tb_Solicitantes.Id_Usuario = @Id_Usuario) AND (Tb_Sala.Id_Sala <> 1) ORDER BY Tb_Sala.Id_Sala">
                        <SelectParameters>
                            <asp:Parameter Name="Id_Usuario"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <div style="width: 100%; max-height: 500px; overflow-y: auto">
                        <asp:FormView ID="fvConsumivel" runat="server" DataSourceID="SqlDataSourceSelect" Width="100%">
                            
                            <ItemTemplate>
                               <hr /> 
                                <h4>Quantidade:</h4>
                                <asp:Label Text='<%# Bind("Quantidade") %>' runat="server" ID="QuantidadeLabel" /><br />
                                <br />
                                <asp:LinkButton ID="LinkButton3" runat="server"><i class="fa fa-share-square-o"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceSelect" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Quantidade FROM Tb_Consumivel WHERE (Id_Consumivel = @Id_Consumivel)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lvConsumivel" PropertyName="SelectedValue" Name="Id_Consumivel"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphBodyExtra" runat="server">
</asp:Content>
