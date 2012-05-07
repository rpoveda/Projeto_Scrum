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
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static bool login(string strLogin, string strSenha)
        {
            bool blValida = new UsuarioDAO().autenticar(strLogin, strSenha, false);
            return blValida;
        }

        [WebMethod]
        public static bool cadastro(string nome, string sobrenome, string email, string senha)
        {
            usuario usuario = new usuario()
            {
              Nome = nome,
              Sobrenome = sobrenome,
              Email = email,
              Senha = BLUtil.CriptografaSenha(senha),
              Data = DateTime.Now
            };
            return new UsuarioDAO().incluir(usuario);
        }
    }
}