<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Touro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt">
<head runat="server">
    <meta charset="utf-8">
    <title>Login - Touro</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="description" content="Gestão de Projetos">
    <meta name="author" content="Erikson Melgarejo">

    <link type="text/css" href="/assets/plugins/iCheck/skins/minimal/blue.css" rel="stylesheet">
    <link type="text/css" href="/assets/plugins/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link type="text/css" href="/assets/fonts/themify-icons/themify-icons.css" rel="stylesheet">
    <!-- Themify Icons -->
    <link type="text/css" href="/assets/css/styles.css" rel="stylesheet">

    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
</head>
<body class="focused-form animated-content" style="background: url('assets/img/taurus.png') no-repeat fixed center">
    <form id="form1" runat="server">
        <div class="container" id="login-form">
            <a class="login-logo">
                <%--<img src="/assets/img/logo-big.png">--%>
                <h2 style="font-weight: bold; text-shadow:0px 0px 10px #ffffff">TOURO</h2>
            </a>
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Iniciar Sessão</h2>
                        </div>
                        <div class="panel-body">

                            <div class="form-horizontal" id="validate-form">
                                <div class="form-group mb-md">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="ti ti-user"></i>
                                            </span>
                                            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" data-parsley-minlength="6" placeholder="Nome de Usuario"></asp:TextBox>
                                        </div>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Email" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i> Falta o email.</asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                                <div class="form-group mb-md">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="ti ti-key"></i>
                                            </span>
                                            <asp:TextBox ID="txtPass" runat="server" placeholder="Senha" CssClass="form-control"></asp:TextBox>
                                            <%--<input type="password" class="form-control" id="exampleInputPassword1" >--%>
                                        </div>
                                    </div>
                                </div>



                                <%--<div class="form-group mb-n">
                                    <div class="col-xs-12">
                                        <a href="#" class="pull-left">Esqueceu a senha?</a>
                                        <div class="checkbox-inline icheck pull-right p-n">
                                            <label for="">
                                                <asp:CheckBox ID="cbRemenber" runat="server" Text="Lembrar-me" />
                                            </label>
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="form-group mb-md">
                                    <div class="col-xs-12">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome de Usuario" ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i> Falta o Nome de Usuario.<br /></asp:RequiredFieldValidator>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Senha" ControlToValidate="txtPass" Display="Dynamic" ForeColor="Red"><i class="fa fa-asterisk"></i> Falta a Senha.<br /></asp:RequiredFieldValidator>

                                        <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="false"><i class="fa fa-asterisk"></i> Email o Senha errada. Tente novamente.</asp:Label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <div class="clearfix">
                                <%--<a href="#" class="btn btn-default pull-left">Registar-se</a>--%>
                                <asp:Button ID="btnLogin" runat="server" Text="Entrar" CssClass="btn btn-primary pull-right" OnClick="Login_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Load site level scripts -->

        <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script> -->

        <script type="text/javascript" src="assets/js/jquery-2.1.4.min.js"></script>
        <!-- Load jQuery -->
        <script type="text/javascript" src="assets/js/jqueryui-1.10.3.min.js"></script>
        <!-- Load jQueryUI -->
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <!-- Load Bootstrap -->
        <script type="text/javascript" src="assets/js/enquire.min.js"></script>
        <!-- Load Enquire -->

        <script type="text/javascript" src="assets/plugins/velocityjs/velocity.min.js"></script>
        <!-- Load Velocity for Animated Content -->
        <script type="text/javascript" src="assets/plugins/velocityjs/velocity.ui.min.js"></script>

        <script type="text/javascript" src="assets/plugins/wijets/wijets.js"></script>
        <!-- Wijet -->

        <script type="text/javascript" src="assets/plugins/codeprettifier/prettify.js"></script>
        <!-- Code Prettifier  -->
        <script type="text/javascript" src="assets/plugins/bootstrap-switch/bootstrap-switch.js"></script>
        <!-- Swith/Toggle Button -->

        <script type="text/javascript" src="assets/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js"></script>
        <!-- Bootstrap Tabdrop -->

        <script type="text/javascript" src="assets/plugins/iCheck/icheck.min.js"></script>
        <!-- iCheck -->

        <script type="text/javascript" src="assets/plugins/nanoScroller/js/jquery.nanoscroller.min.js"></script>
        <!-- nano scroller -->

        <script type="text/javascript" src="assets/js/application.js"></script>
        <script type="text/javascript" src="assets/demo/demo.js"></script>
        <script type="text/javascript" src="assets/demo/demo-switcher.js"></script>

        <!-- End loading site level scripts -->
        <!-- Load page level scripts-->


        <!-- End loading page level scripts-->
    </form>
</body>
</html>
