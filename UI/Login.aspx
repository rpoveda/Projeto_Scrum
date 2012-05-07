<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="script/jquery-1.7.2.min.js" type="text/javascript"></script>
    <title>Login - Scrum Project</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            margin-top: 50px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var imgLoader = "<img src='img/ajax-loader.gif' class='imgLoader' />";
            $("#<%= btnLogin.ClientID %>").click(function (e) {
                e.preventDefault();
                var login = $("#<%= txtEmaiLogin.ClientID %>").attr("value");
                var senha = $("#<%= txtSenhaLogin.ClientID %>").attr("value");
                $("#<%= txtSenhaLogin.ClientID %>").after(imgLoader);
                $.ajax({
                    type: "POST",
                    url: "Login.aspx/login",
                    data: "{strLogin: '" + login + "', strSenha: '" + senha + "'}",
                    contentType: "application/json",
                    success: function (data) {
                        if (data.d) {
                            $(window.location).attr('href', 'Default.aspx');
                        } else {
                            $("#<%= txtSenhaLogin.ClientID %>").after("<span style='font-size: 12px; color: red'>Usuário ou Senha inválido!</span>");
                        }
                    },
                    error: function (data) {
                        alert("Não foi póssivel executar o login no momento.\n Tente novamente mais tarde.");
                    },
                    complete: function () {
                        $(".imgLoader").hide();
                    }
                });
            });

            $("#<%= btnCadastro.ClientID %>").click(function (e) {
                e.preventDefault();
                var nome = $("#<%= txtNome.ClientID %>").val();
                var sobrenome = $("#<%= txtSobrenome.ClientID %>").val();
                var email = $("#<%= txtEmailCad.ClientID %>").val();
                var senha = $("#<%= txtSenhaCad.ClientID %>").val();

                $("#<%= txtConfSenhaCad.ClientID %>").after(imgLoader);

                $.ajax({
                    type: "POST",
                    url: "Login.aspx/cadastro",
                    data: "{nome: '" + nome + "', sobrenome: '" + sobrenome + "', email: '" + email + "', senha: '" + senha + "'}",
                    contentType: "application/json",
                    success: function (data) {
                        if (data.d) {
                            alert("Cadastro efetuado com sucesso!");
                        } else {
                            alert("Não foi póssivel fazer o cadastro no momento.\n Tente novamente mais tarde.");
                        }
                    },
                    error: function (data) {
                        alert("Não foi póssivel fazer o cadastro no momento.\n Tente novamente mais tarde.");
                    },
                    complete: function () {
                        $('.imgLoader').hide();
                    }
                });

            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <!-- Main hero unit for a primary marketing message or call to action -->
        <div class="hero-unit">
            <h1>Lorem ipsum</h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non volutpat nisl.
                Phasellus sodales erat eget nisi feugiat aliquam. Morbi laoreet consectetur ligula
                eget dictum. Proin lorem mi, placerat vitae iaculis nec, malesuada vel lectus. Cras
                in lacus ac libero facilisis varius quis quis orci. Quisque velit odio, tempus quis
                tincidunt sed, sollicitudin quis metus. Duis blandit mi et elit feugiat hendrerit.
                Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus
                mus.
            </p>
            <p>
                <a class="btn btn-large" style="display: inline-block; margin: 0 10px">Login &raquo;</a><a
                    class="btn btn-warning btn-large">Cadastrar &raquo;</a>
            </p>
            <div class="row">
                <div class="span4">
                    <fieldset class="well form-inline" style="width: 800px;" id="fieldLogin">
                        <span>Fazer Login</span>
                        <hr />
                        <span>Login</span>
                        <asp:TextBox ID="txtEmaiLogin" Width="200px" CssClass="input-small" placeholder="Email"
                            runat="server" />
                        <span>Senha</span>
                        <asp:TextBox TextMode="password" ID="txtSenhaLogin" Width="200px" class="input-small"
                            placeholder="Password" runat="server" />
                        <asp:Button ID="btnLogin" class="btn" runat="server" Text="Login" />
                        <asp:Button ID="btnCancelaLogin" class="btn btn-danger" runat="server" Text="Cancelar" />
                    </fieldset>
                    <fieldset class="well form-inline" style="width: 800px" id="fielCadastro">
                        <span>Fazer Cadastro</span>
                        <hr />
                        <label>
                            Nome</label>
                        <p>
                            <asp:TextBox ID="txtNome" class="span3" Style="width: 300px" runat="server" /></p>
                        <label>
                            Sobrenome</label>
                        <p>
                            <asp:TextBox ID="txtSobrenome" class="span3" Style="width: 300px" runat="server" /></p>
                        <label>
                            E-mail</label>
                        <p>
                            <asp:TextBox ID="txtEmailCad" class="span3" Style="width: 300px" runat="server" /></p>
                        <label>
                            Senha</label>
                        <p>
                            <asp:TextBox ID="txtSenhaCad" TextMode="Password" class="span3" Style="width: 300px"
                                runat="server" /></p>
                        <label>
                            Confirmação Senha</label>
                        <p>
                            <asp:TextBox runat="server" ID="txtConfSenhaCad" TextMode="Password" CssClass="span3"
                                Style="width: 300px;"></asp:TextBox></p>
                        <div class="form-actions">
                            <asp:Button ID="btnCadastro" class="btn" runat="server" Text="Cadastrar" />
                            <asp:Button ID="btnCancelaCad" class="btn btn-danger" runat="server" Text="Cancelar" />
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
        <!-- Example row of columns -->
        <%--        <div class="row">
            <div class="span4">
                <h2>
                    Heading</h2>
                <p>
                    Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus
                    commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                    Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                </p>
                <p>
                    <a class="btn" href="#">View details &raquo;</a></p>
            </div>
            <div class="span4">
                <h2>
                    Heading</h2>
                <p>
                    Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus
                    commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                    Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                </p>
                <p>
                    <a class="btn" href="#">View details &raquo;</a></p>
            </div>
            <div class="span4">
                <h2>
                    Heading</h2>
                <p>
                    Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                    Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus
                    commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p>
                    <a class="btn" href="#">View details &raquo;</a></p>
            </div>
        </div>--%>
        <hr>
        <footer>
        <p>&copy; Company 2012</p>
      </footer>
    </div>
    </form>
</body>
</html>
