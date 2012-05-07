<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="UI.Default" %>

<%@ MasterType VirtualPath="Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>
            Projetos</h1>
        <hr />
        <ul class="thumbnails">
            <li class="span3">
                <div class="thumbnail">
                    <img alt="" src="http://placehold.it/260x180">
                    <div class="caption">
                        <h5>
                            Projeto A</h5>
                        <p>
                            O Projeto faz A, B e C.
                        </p>
                        <p>
                            <a class="btn btn-primary" href="#" style="display: block">Detalhes</a></p>
                    </div>
                </div>
                <div class="alert alert-block">
                    <h4 class="alert-heading">
                        Pontos da semana:<span>13</span></h4>
                </div>
            </li>
            <li class="span3">
                <div class="thumbnail">
                    <img alt="" src="http://placehold.it/260x180">
                    <div class="caption">
                        <h5>
                            Projeto A</h5>
                        <p>
                            O Projeto faz A, B e C.
                        </p>
                        <p>
                            <a class="btn btn-primary" href="#" style="display: block">Detalhes</a></p>
                    </div>
                </div>
                <div class="alert alert-block">
                    <h4 class="alert-heading">
                        Pontos da semana:<span>13</span></h4>
                </div>
            </li>
        </ul>
    </div>
</asp:Content>
