using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using ML.Date;

namespace UI
{
    public partial class NovoProjeto : ProtectPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string adicionaProjeto(string nome, string descricao, string url, string datafinalizacao)
        {
            projeto objProjeto = new projeto()
            {
                NomeProjeto = nome,
                DescricaoProjeto = descricao,
                UrlProjeto = url,
                DataProjeto = DateTime.Now,
                DataFinalizacao = Convert.ToDateTime(datafinalizacao),
                CodigoUsuario = Convert.ToInt16(HttpContext.Current.User.Identity.Name)
            };
            if(new ProjetoDAO().incluir(objProjeto))
            {
                objProjeto = new ProjetoDAO().obter(p => p.NomeProjeto == nome && p.DescricaoProjeto == descricao);
            }
            return objProjeto.CodigoProjeto + "@" + objProjeto.NomeProjeto;
        }

        [WebMethod]
        public static string adicionaItem(string nomeItem, string descricaoItem, int valorItem, string datafinalizacaoItem, string codigoprojeto)
        {
            item objItem = new item()
            {
                CodigoProjeto = Convert.ToInt16(codigoprojeto),
                NomeItem = nomeItem,
                DescricaoItem = descricaoItem,
                ValorItem = Convert.ToInt16(valorItem),
                DataFinalizacaoItem = Convert.ToDateTime(datafinalizacaoItem)
            };

            if(new ItemDAO().incluir(objItem))
            {
                objItem = new ItemDAO().obter(i => i.NomeItem == nomeItem && i.DescricaoItem == descricaoItem);
            }

            var tr = "";
            tr += "<tr>";
            tr += "<td>" + objItem.CodigoItem + "</td>";
            tr += "<td>" + objItem.NomeItem + "</td>";
            tr += "<td>" + objItem.ValorItem.ToString() + "</td>";
            tr += "<td><button class='btn btn-remove-item' id='" + objItem.CodigoItem.ToString() +
                  "'>Remover</button></td>";
            tr += "</tr>@";
            tr += "<option value='"+objItem.CodigoItem+"'>"+ objItem.NomeItem + "</option>";
            return tr;
        }
    }
}