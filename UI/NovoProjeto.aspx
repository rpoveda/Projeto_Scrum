<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NovoProjeto.aspx.cs" Inherits="UI.NovoProjeto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(function () {
                var imgLoader = "<img src='img/ajax-loader.gif' class='imgLoader' />";
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

                $('#<%= btnCadastro.ClientID %>').click(function (e) {
                    e.preventDefault();
                    var nomeProjeto = $('#<%= txtNomeProjeto.ClientID %>').val();
                    var descricaoProjeto = $('#<%= txtDescricaoProjeto.ClientID %>').val();
                    var urlProjeto = $('#<%= txtUrlProjeto.ClientID %>').val();
                    var dataFinalizacaoProjeto = $('#<%= txtDataFinalizacao.ClientID %>').val();
                    $.ajax({
                        type: "POST",
                        url: "NovoProjeto.aspx/adicionaProjeto",
                        data: "{nome: '" + nomeProjeto + "', descricao: '" + descricaoProjeto + "', url: '" + urlProjeto + "', datafinalizacao: '" + dataFinalizacaoProjeto + "'}",
                        contentType: "application/json",
                        success: function (data) {
                            var retorno = data.d.split('@');
                            alert("Projeto salvo com sucesso!");
                            $('#hfCodigoProjeto').val(retorno[0]);
                            $('#<%= lblProjeto.ClientID %>').text(retorno[1]);
                        },
                        error: function (data) {
                            alert("Não foi póssivel executar o login no momento.\n Tente novamente mais tarde.");
                        },
                        complete: function () {
                            $(".imgLoader").hide();
                        }
                    });
                });

                $('#<%= btbSalvarItem.ClientID %>').click(function (e) {
                    e.preventDefault();
                    var codigoProjeto = $('#hfCodigoProjeto').val();
                    var nomeItem = $('#<%= txtNomeItem.ClientID %>').val();
                    var descricaoItem = $('#<%= txtDescricaoItem.ClientID %>').val();
                    var valorItem = $('#<%= txtValorItem.ClientID %>').val();
                    var dataFinalizacaItem = $('#<%= txtDataFinalizacao.ClientID %>').val();
                    $.ajax({
                        type: "POST",
                        url: "NovoProjeto.aspx/adicionaitem",
                        data: "{codigoprojeto = " + codigoProjeto + ", nome: '" + nomeItem + "', descricao: '" + descricaoItem + "', valor: " + valorItem + ", datafinalizacao: '" + dataFinalizacaItem + "'}",
                        contentType: "application/json",
                        success: function (data) {
                            var retorno = data.d;
                            alert("Item salvo com sucesso!");
                            $('.tbody-item').append(retorno);
                        },
                        error: function (data) {
                            alert(data.d);
                        },
                        complete: function () {
                            $(".imgLoader").hide();
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
                        <p><asp:Label runat="server" ID="lblProjeto" CssClass="label label-info" /></p>
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
                    <h1>Itens</h1>
                    <hr/>
                        <div class="span8">
                          <table class="table table-striped">
                            <thead>
                              <tr>
                                <th>#</th>
                                <th>Nome</th>
                                <th>Valor</th>
                                <th>Remover</th>
                              </tr>
                            </thead>
                            <tbody class="tbody-item">
                              <tr>
                                <td>1</td>
                                <td>ClienteDAO</td>
                                <td>2</td>
                                <td><button class="btn btn-remove-item" id="codigo">Remover</button></td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                    </fieldset>

                </div>
                <div id="tab3" class="tab-pane">
                    <fieldset class="well form-inline" style="width: 800px">
                        <label>Selecione um item</label>
                        <p><asp:DropDownList runat="server" ID="ddlTarefa" CssClass="span3"/></p>
                        <label>Nome Tarefa</label>
                        <p><asp:TextBox runat="server" ID="txtNomeTarefa" CssClass="span3" Width="300px"/></p>
                        <label>Descrição Tarefa</label>
                        <p><asp:TextBox runat="server" ID="txtDescricaoTarefa" CssClass="span3" Width="300px" TextMode="MultiLine"/></p>
                        <label>Valor Tarefa</label>
                        <p><asp:TextBox runat="server" ID="txtValorTarefa" CssClass="span3" Width="300px"/></p>
                        <label>Data finalizacao Tarefa</label>
                        <p><asp:TextBox runat="server" ID="txtDataFinalizacaoTarefa" CssClass="span3" Width="300px" /></p>
                        <div class="form-actions">
                            <asp:Button ID="btnSalvarTarefa" class="btn" runat="server" Text="Salvar Tarefa" />
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
