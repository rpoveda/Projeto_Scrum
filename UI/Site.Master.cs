using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using ML.Date;

namespace UI
{
    public partial class Site : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PreencheUsuario();
            }
        }

        private void PreencheUsuario()
        {
            var objUsuario = (usuario)Cache["objUsuario"];
            lblNomeUsuario.Text = objUsuario.Nome + " " + objUsuario.Sobrenome;
        }
    }
}