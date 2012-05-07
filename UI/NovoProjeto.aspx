<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NovoProjeto.aspx.cs" Inherits="UI.NovoProjeto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(function () {
                $('.nav-tabs li a').live('click', function () {
                    var idhref = $(this).attr("href").replace('#', '');
                    $(".tab-pane").each(function () {
                        var id = $(this).attr("id");
                        var componente = $(this);
                        if (id == idhref)
                            $(componente).addClass("active");
                        else {
                            $(componente).removeClass("active");
                        }
                    });
                });
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>
            Cadastro Novo Projeto</h1>
        <hr />
        <div style="margin-bottom: 18px;" class="tabbable">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab1">Projeto</a></li>
                <li><a data-toggle="tab" href="#tab2">Item</a></li>
                <li><a data-toggle="tab" href="#tab3">Tarefas</a></li>
            </ul>
            <div style="padding-bottom: 9px; border-bottom: 1px solid #ddd;" class="tab-content">
                <div id="tab1" class="tab-pane active">
                    <fieldset class="well form-inline" style="width: 800px" id="fielCadastro">
                        <input type="hidden" id="hfCodigoProjeto"/>
                        <label>
                            Nome Projeto</label>
                        <p>
                            <asp:TextBox ID="txtNomeProjeto" class="span3" Style="width: 300px" runat="server" /></p>
                        <label>
                            Descrição</label>
                        <p>
                            <asp:TextBox ID="txtDescricaoProjeto" class="span3" TextMode="MultiLine" Style="width: 300px"
                                runat="server" /></p>
                        <label>
                            Url</label>
                        <p>
                            <asp:TextBox ID="txtUrlProjeto" class="span3" Style="width: 300px" runat="server" /></p>
                        <label>
                            Data Finalização</label>
                        <p>
                            <asp:TextBox ID="txtDataFinalizacao" class="span3" Style="width: 300px" runat="server" /></p>
                        <div class="form-actions">
                            <asp:Button ID="btnCadastro" class="btn" runat="server" Text="Salvar Projeto" />
                        </div>
                    </fieldset>
                </div>
                <div id="tab2" class="tab-pane">
                    <fieldset class="well form-inline" style="width: 800px">
                        <label>Projeto</label>
                        <p><asp:Label runat="server" ID="lblProjeto" /></p>
                        <label>Nome Item</label>
                        <p><asp:TextBox runat="server" ID="txtNomeItem"  CssClass="span3" Width="300px"/></p>
                        <label>Descricao Item</label>
                        <p><asp:TextBox runat="server" ID="txtDescricaoItem" CssClass="span3" TextMode="MultiLine" Width="300px" /></p>
                        <label>Valor Item</label>
                        <p><asp:TextBox runat="server" ID="txtValorItem" CssClass="span3" Width="300px" /></p>
                        <label>Data finalização Item</label>
                        <p><asp:TextBox runat="server" ID="txtDtFinalizacaoItem" CssClass="span3" Width="300px"/></p>
                        <div class="form-actions">
                            <asp:Button ID="btbSalvarItem" class="btn" runat="server" Text="Salvar Item" />
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
