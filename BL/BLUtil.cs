using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace BL
{
    public static class BLUtil
    {
        public static string CriptografaSenha(string strSenha)
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile(strSenha, "sha1");
        }
    }
}
