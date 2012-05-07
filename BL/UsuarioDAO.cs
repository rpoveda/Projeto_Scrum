using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using BL.Interface;
using ML.Date;
namespace BL
{
    public class UsuarioDAO : AbstractBL<usuario>, IUsuarioDAO
    {
        public bool alteraSenha(usuario usuario)
        {
            throw new NotImplementedException();
        }


        public bool autenticar(string strLogin, string strSenha, bool blLembrar)
        {
            var senha = BLUtil.CriptografaSenha(strSenha);
            var objUsuario = obter(u => u.Email.Equals(strLogin) && u.Senha.Equals(senha));

            if (objUsuario != null)
            {
                HttpContext.Current.Cache["objUsuario"] = objUsuario;
                FormsAuthentication.SignOut();
                FormsAuthentication.SetAuthCookie(objUsuario.CodigoUsuario.ToString(), blLembrar);
                return true;
            }
            else
                return false;
        }
    }
}
