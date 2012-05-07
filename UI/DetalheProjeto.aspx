<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DetalheProjeto.aspx.cs" Inherits="UI.DetalheProjeto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            alert('oi');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>
            Detalhe Projeto:
        </h1>
        <hr />
        <div class="tabbable tabs-left">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#lA">Cadastrar de Obra</a></li>
                <li class=""><a data-toggle="tab" href="#lB">Cadastrar Exemplar</a></li>
                <li class=""><a data-toggle="tab" href="#lC">Section 3</a></li>
            </ul>
            <div class="tab-content">
                <div id="lA" class="tab-pane active">
                    <div class="row-fluid">
                        <div class="span4">
                            <h2 class="label label-info">TO DO</h2>
                            <ul class="nav nav-list">
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                            </ul>
                        </div>
                        <!--/span-->
                        <div class="span4">
                            <h2 class="label label-important">
                                Impeded</h2>
                            <ul class="nav nav-list">
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                            </ul>
                        </div>
                        <!--/span-->
                        <div class="span4">
                            <h2 class="label label-success">
                                Done</h2>
                            <ul class="nav nav-list">
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                                <li>
                                    <div class="alert"><span>Tela Usuario</span></div>
                                </li>
                            </ul>
                        </div>
                        <!--/span-->
                    </div>
                </div>
                <div id="lB" class="tab-pane">
                    <p>
                        Howdy, I'm in Section B.</p>
                </div>
                <div id="lC" class="tab-pane">
                    <p>
                        What up girl, this is Section C.</p>
                </div>
            </div>
        </div>
        <hr/>
        <div class="well">
            Ola mundo
        </div>
    </div>
</asp:Content>
