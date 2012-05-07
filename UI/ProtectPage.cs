using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public class ProtectPage : Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if(String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name.ToString()))
                Response.Redirect("Login.aspx");
        }
    }
}