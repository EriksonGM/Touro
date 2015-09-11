<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Consumivel.aspx.cs" Inherits="Touro.Patrimonio.Consumivel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:FormView ID="fvConsumivel" runat="server" DataKeyNames="Id_Consumivel" DataSourceID="SqlDataSourceConsumivel">
       
        <ItemTemplate>
            Id_Consumivel:
            <asp:Label Text='<%# Eval("Id_Consumivel") %>' runat="server" ID="Id_ConsumivelLabel" /><br />
            TipoConsumivel: 
            Id_Consumivel:
            <asp:Label Text='<%# Bind("TipoConsumivel") %>' runat="server" ID="TipoConsumivelLabel" /><br />
            UnidadConsumivel:
            <asp:Label Text='<%# Bind("UnidadConsumivel") %>' runat="server" ID="UnidadConsumivelLabel" /><br />
            Descr:
            <asp:Label Text='<%# Bind("Descr") %>' runat="server" ID="DescrLabel" /><br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceConsumivel" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Consumivel.Id_Consumivel, Tb_TipoConsumivel.TipoConsumivel, Tb_UnidadConsumivel.UnidadConsumivel, Tb_Consumivel.Descr FROM Tb_TipoConsumivel INNER JOIN Tb_Consumivel ON Tb_TipoConsumivel.Id_TipoConsumivel = Tb_Consumivel.Id_TipoConsumivel INNER JOIN Tb_UnidadConsumivel ON Tb_Consumivel.Id_UnidadConsumivel = Tb_UnidadConsumivel.Id_UnidadConsumivel WHERE (Tb_Consumivel.Id_Consumivel = @Id_Consumivel)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Id" Name="Id_Consumivel"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
