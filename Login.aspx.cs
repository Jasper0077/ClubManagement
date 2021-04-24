using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace ClubManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd
                = new SqlCommand("select * from users where username = @UN and password = @PWD", conn);
            cmd.Parameters.Add("@UN", System.Data.SqlDbType.VarChar, 100).Value = Username.Text;
            cmd.Parameters.Add("@PWD", System.Data.SqlDbType.VarChar, 100).Value = Password.Text;

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            adapter.Fill(ds);

            if (Username.Text.Equals(""))
            {
                Label1.Text = "Please enter Username";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            
            if (Password.Text.Equals(""))
            {
                Label2.Text = "Please enter Password";
                Label2.ForeColor = System.Drawing.Color.Red;
            }
            else if (ds.Tables[0].Rows.Count == 0)
            {
                Ret.Text = "Fail";
                Ret.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Session["username"] = Username.Text;
                Session["user_id"] = ds.Tables[0].Rows[0][0];

                /*if (Request["postbackURL"] == null)
                    Response.Redirect("Login.aspx?postbackURL=BookFacilities");
                else
                    Response.Redirect(Request["postbackURL"] + ".aspx");*/
                Response.Redirect("Home.aspx");
            }
        }

        protected void btn_register(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

    }
}