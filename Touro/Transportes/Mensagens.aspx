<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Mensagens.aspx.cs" Inherits="Touro.Transportes.Mensagens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--    <div class="container-fluid">--%>


    <div class="input-group mb-xl">
        <%--<input type="text" class="form-control input-lg" placeholder="Search mail...">--%>
        <asp:TextBox ID="txtFiltro" CssClass="form-control input-lg" placeholder="Filtrar mensagens" runat="server"></asp:TextBox>
        <span class="input-group-btn">
            <asp:LinkButton ID="LinkButton2" CssClass="btn btn-default btn-lg" runat="server"><i class="ti ti-search"></i></asp:LinkButton>
            <%--<button class="btn btn-default btn-lg" type="button"><i class="ti ti-search"></i></button>--%>
        </span>
    </div>
    <!-- /input-group -->


    <div class="panel panel-inbox">
        <div class="panel-body">
            <div class="inbox-mail-heading">
                <div class="clearfix">
                    <div class="pull-left">
                        <div class="btn-group">
                            <a href="#" class="btn btn-lg btn-default dropdown-toggle" data-toggle="dropdown">
                                <div class="checkbox-inline icheck">
                                    <input type="checkbox" value="">
                                </div>
                                <i class="caret"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Select All</a></li>
                                <li><a href="#">Unselect All</a></li>
                                <li><a href="#">Another Action</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated Link</a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-reload"></i></a>
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-archive"></i></a>
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-folder"></i></a>
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-trash"></i></a>
                        </div>
                    </div>
                    <div class="pull-right hidden-xs">
                        <strong>1</strong> of <strong>50</strong>
                        <div class="btn-group ml-sm">
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-angle-left"></i></a>
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-hover table-inbox table-vam">
                <tbody>
                    <%--<asp:UpdatePanel runat="server">
                                            <ContentTemplate>--%>
                    <asp:ListView ID="lvMsg" runat="server" DataSourceID="SqlDataSourceMsgAll" OnSelectedIndexChanged="lvMsg_SelectedIndexChanged" DataKeyNames="Id_Msg">



                        <EmptyDataTemplate>
                            <h4 style="text-align: center">Sem resultados</h4>
                        </EmptyDataTemplate>


                        <ItemTemplate>

                            <tr class='<%# IsRead(Eval("DataRead").ToString()) %>'>
                                <td class="inbox-msg-check" styçe="width:20px">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-primary-alt btn-sm" CommandName="Select" CommandArgument='<%# Eval("Id_Msg") %>'><i class="fa fa-eye"></i>&nbsp;Ler</asp:LinkButton>
                                </td>
                                <td class="inbox-msg-from hidden-xs hidden-sm" width="20%">
                                    <div><%# Eval("TipoMsg") %></div>
                                </td>
                                <td class="inbox-msg-snip">
                                    <%# Eval("Asunto") %>
                                </td>
                                <td class="inbox-msg-attach"></td>
                                <td class="inbox-msg-time" style="width: 15%"><%# Eval("Data") %></td>
                            </tr>


                            <%--<span style="">Id_Msg:
                                <asp:Label Text='<%# Eval("Id_Msg") %>' runat="server" ID="Id_MsgLabel" /><br />
                                TipoMsg:
                                <asp:Label Text='<%# Eval("TipoMsg") %>' runat="server" ID="TipoMsgLabel" /><br />
                                Asunto:
                                <asp:Label Text='<%# Eval("Asunto") %>' runat="server" ID="AsuntoLabel" /><br />
                                Data:
                                <asp:Label Text='<%# Eval("Data") %>' runat="server" ID="DataLabel" /><br />
                                <br />
                            </span>--%>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <%--<div runat="server" id="itemPlaceholderContainer" style="">--%>
                            <tr runat="server" id="itemPlaceholder" />

                            <%--</div>
                            <div style="">
                            </div>--%>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr class='<%# IsRead(Eval("DataRead").ToString()) %>'>
                                <td class="inbox-msg-check" styçe="width:20px">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-primary-alt btn-sm" CommandName="Select" CommandArgument='<%# Eval("Id_Msg") %>'><i class="fa fa-eye"></i>&nbsp;Ler</asp:LinkButton>
                                </td>
                                <td class="inbox-msg-from hidden-xs hidden-sm" width="20%">
                                    <div><%# Eval("TipoMsg") %></div>
                                </td>
                                <td class="inbox-msg-snip">
                                    <%# Eval("Asunto") %>
                                </td>
                                <td class="inbox-msg-attach"></td>
                                <td class="inbox-msg-time" style="width: 15%"><%# Eval("Data") %></td>
                            </tr>

                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceMsgAll" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="CargarMensagens" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtFiltro" PropertyName="Text" Name="Filtro" Type="String" DefaultValue=" "></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <tr class="unread">
                        <td class="inbox-msg-check">
                            <div class="checkbox-inline icheck">
                                <input type="checkbox" value="">
                            </div>
                        </td>
                        <td class="inbox-msg-from hidden-xs hidden-sm">
                            <div>Tyler Charlebois</div>
                        </td>
                        <td class="inbox-msg-snip">
                            <span class="label label-info" width="58%">Family</span>
                            Accusantium doloremque laudantium totam rem aperiam
                        </td>
                        <td class="inbox-msg-attach"></td>
                        <td class="inbox-msg-time">1:31</td>
                    </tr>
                    <%--</ContentTemplate>
                                        </asp:UpdatePanel>--%>
                    <%-- <tr class="unread">
                                    <td class="inbox-msg-check" width="5%">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value="">
                                        </div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm" width="20%">
                                        <div>Terrell Tilson</div>
                                    </td>
                                    <td class="inbox-msg-snip"><span class="label label-primary" width="58%">Work</span>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</td>
                                    <td class="inbox-msg-attach"><i class="ti ti-paperclip" width="5%"></i></td>
                                    <td class="inbox-msg-time" width="12%">13:42</td>
                                </tr>--%>
                    <%-- <tr class="unread">
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Tyler Charlebois</div>
                                    </td>
                                    <td class="inbox-msg-snip"><span class="label label-info" width="58%">Family</span>Accusantium doloremque laudantium totam rem aperiam</td>
                                    <td class="inbox-msg-attach"></td>
                                    <td class="inbox-msg-time">1:31</td>
                                </tr>
                                <tr>
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Carrol Granados</div>
                                    </td>
                                    <td class="inbox-msg-snip">Eaque ipsa quae ab illo inventore veritatis et quasi</td>
                                    <td class="inbox-msg-attach"><i class="ti ti-paperclip"></i></td>
                                    <td class="inbox-msg-time">9/03/14</td>
                                </tr>
                                <tr>
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Sang Roles</div>
                                    </td>
                                    <td class="inbox-msg-snip">Voluptas sit aspernatur aut odit aut fugit sed quia consequuntur</td>
                                    <td class="inbox-msg-attach"><i class="ti ti-paperclip"></i></td>
                                    <td class="inbox-msg-time">9/03/14</td>
                                </tr>
                                <tr>
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Avery Hooper</div>
                                    </td>
                                    <td class="inbox-msg-snip">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet</td>
                                    <td class="inbox-msg-attach"></td>
                                    <td class="inbox-msg-time">8/03/14</td>
                                </tr>
                                <tr class="unread">
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Alex Murphy</div>
                                    </td>
                                    <td class="inbox-msg-snip"><span class="label label-primary" width="58%">Work</span>Consectetur adipisci velit sed quia non numquam eius</td>
                                    <td class="inbox-msg-attach"></td>
                                    <td class="inbox-msg-time">8/03/14</td>
                                </tr>
                                <tr class="unread">
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Bernie Maldonado</div>
                                    </td>
                                    <td class="inbox-msg-snip">Quis autem vel eum iure reprehenderit qui in ea voluptate</td>
                                    <td class="inbox-msg-attach"><i class="ti ti-paperclip"></i></td>
                                    <td class="inbox-msg-time">8/03/14</td>
                                </tr>
                                <tr>
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Dominique Slay</div>
                                    </td>
                                    <td class="inbox-msg-snip">Vel illum qui dolorem eum fugiat quo voluptas nulla pariatur</td>
                                    <td class="inbox-msg-attach"></td>
                                    <td class="inbox-msg-time">7/03/14</td>
                                </tr>
                                <tr>
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Jc Doney</div>
                                    </td>
                                    <td class="inbox-msg-snip">Ullam corporis suscipit laboriosam nisi ut</td>
                                    <td class="inbox-msg-attach"><i class="ti ti-paperclip"></i></td>
                                    <td class="inbox-msg-time">7/03/14</td>
                                </tr>
                                <tr>
                                    <td class="inbox-msg-check">
                                        <div class="checkbox-inline icheck">
                                            <input type="checkbox" value=""></div>
                                    </td>
                                    <td class="inbox-msg-from hidden-xs hidden-sm">
                                        <div>Brock Wulff</div>
                                    </td>
                                    <td class="inbox-msg-snip"><span class="label label-danger" width="58%">Important</span>Numquam eius modi tempora incidunt ut labore</td>
                                    <td class="inbox-msg-attach"></td>
                                    <td class="inbox-msg-time">7/03/14</td>
                                </tr>--%>
                </tbody>
            </table>
            <div class="inbox-mail-footer">
                <div class="clearfix">
                    <div class="pull-right">
                        <strong>1</strong> of <strong>50</strong>
                        <div class="btn-group ml-sm">
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-angle-left"></i></a>
                            <a href="#" class="btn btn-lg btn-default"><i class="ti ti-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--</div>--%>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="modal fade" id="ReadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h2 class="modal-title">Touro</h2>
                        </div>
                        <div class="modal-body">
                            <asp:FormView ID="fvMensagem" runat="server" DataKeyNames="Id_Msg" DataSourceID="SqlDataSourceMsg">
                                <ItemTemplate>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Tipo de Mensagem</label>
                                            <div class="col-md-6">
                                                <%# Eval("TipoMsg") %>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Data</label>
                                            <div class="col-md-6">
                                                <%# Eval("Data") %>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Asunto</label>
                                            <div class="col-md-6">
                                                <%# Eval("Asunto") %>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Mensagem</label>
                                            <div class="col-md-6">
                                                <%# Eval("Texto") %>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Data Leitura</label>
                                            <div class="col-md-6">
                                                <%# Eval("DataRead") %>
                                            </div>
                                        </div>
                                    </div>
                                    <%--Id_MsgTransporte:
                                    <asp:Label Text='<%# Eval("Id_Msg") %>' runat="server" ID="Id_MsgTransporteLabel" /><br />
                                    AreaMsg:
                                    <asp:Label Text='<%# Bind("AreaMsg") %>' runat="server" ID="AreaMsgLabel" /><br />
                                    TipoMsg:
                                    <asp:Label Text='<%# Bind("TipoMsg") %>' runat="server" ID="TipoMsgLabel" /><br />
                                    Data:
                                    <asp:Label Text='<%# Bind("Data") %>' runat="server" ID="DataLabel" /><br />
                                    Asunto:
                                    <asp:Label Text='<%# Bind("Asunto") %>' runat="server" ID="AsuntoLabel" /><br />
                                    Texto:
                                    <asp:Label Text='<%# Bind("Texto") %>' runat="server" ID="TextoLabel" /><br />
                                    DataRead:
                                    <asp:Label Text='<%# Bind("DataRead") %>' runat="server" ID="DataReadLabel" /><br />--%>

                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceMsg" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="Update Tb_Msg Set DataRead = Getdate() where (Tb_Msg.Id_Msg = @Id_Msg)

SELECT Tb_Msg.Id_Msg, Tb_AreaMsg.AreaMsg, Tb_TipoMsg.TipoMsg, Tb_Msg.Data, Tb_Msg.Asunto, Tb_Msg.Texto, Tb_Msg.DataRead FROM Tb_Msg INNER JOIN Tb_TipoMsg ON Tb_Msg.Id_TipoMsg = Tb_TipoMsg.Id_TipoMsg INNER JOIN Tb_AreaMsg ON Tb_TipoMsg.Id_AreaMsg = Tb_AreaMsg.Id_AreaMsg WHERE (Tb_Msg.Id_Msg = @Id_Msg)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lvMsg" PropertyName="SelectedValue" Name="Id_Msg"></asp:ControlParameter>

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary-alt" data-dismiss="modal"><i class="fa fa-times"></i>&nbsp; Fechar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- /.modal -->

</asp:Content>
