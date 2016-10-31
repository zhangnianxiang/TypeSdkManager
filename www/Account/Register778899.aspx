﻿<%@ Page Title="注册" Language="C#" AutoEventWireup="true" CodeBehind="Register778899.aspx.cs" Inherits="SDKPackage.Account.Register" %>



<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
<head runat="server">
    <title><%: Page.Title %></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link rel="stylesheet" media="screen" href="/css/bootstrap.min.css">
    <link rel="stylesheet" media="screen" href="/css/bootstrap-theme.min.css">

    <!-- Bootstrap Admin Theme -->
    <link rel="stylesheet" media="screen" href="/css/bootstrap-admin-theme.css">

    <!-- Custom styles -->
    <style type="text/css">
        .alert {
            margin: 0 auto 20px;
        }
    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
           <script type="text/javascript" src="js/html5shiv.js"></script>
           <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->
</head>
<body class="bootstrap-admin-without-padding">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <div class="alert alert-info">
                        <a class="close" data-dismiss="alert" href="#">&times;</a>
                        <asp:Literal runat="server" ID="FailureText" />
                    </div>
                </asp:PlaceHolder>
                <form class="bootstrap-admin-login-form" runat="server">
                    <h1>注册</h1>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="E-mail" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="“电子邮件”字段是必填字段。" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="密码" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="“密码”字段是必填字段。" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="确认密码" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="“确认密码”字段是必填字段。" />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="密码和确认密码不匹配。" />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="注册" CssClass="btn btn-lg btn-primary btn-block" />

                    </div>
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            // Setting focus
            $('input[name="email"]').focus();
            // Setting width of the alert box
            var alert = $('.alert');
            var formWidth = $('.bootstrap-admin-login-form').innerWidth();
            var alertPadding = parseInt($('.alert').css('padding'));

            if (isNaN(alertPadding)) {
                alertPadding = parseInt($(alert).css('padding-left'));
            }

            $('.alert').width(formWidth - 2 * alertPadding);
        });
    </script>
</body>
</html>