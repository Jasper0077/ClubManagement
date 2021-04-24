using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClubManagement
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_logout.Text = "Log Out";
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["user_id"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}