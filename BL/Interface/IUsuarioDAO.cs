using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ML.Date;

namespace BL.Interface
{
    public interface IUsuarioDAO : IBaseBL<usuario>
    {
        bool alteraSenha(usuario usuario);
        bool autenticar(string strLogin, string strSenha, bool blLembrar);
    }
}
