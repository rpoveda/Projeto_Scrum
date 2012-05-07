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
            var objUsuario = (usuario)Session["objUsuario"];
            if(objUsuario == null && !string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                int idUsuario = Convert.ToInt16(HttpContext.Current.User.Identity.Name);
                objUsuario = new UsuarioDAO().obter(u => u.CodigoUsuario == idUsuario);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            lblNomeUsuario.Text = objUsuario.Nome + " " + objUsuario.Sobrenome;
        }
    }
}