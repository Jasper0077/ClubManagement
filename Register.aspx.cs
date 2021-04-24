using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClubManagement
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_register(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
               ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd
                = new SqlCommand("select * from users where username = @UN", conn);
            cmd.Parameters.Add("@UN", System.Data.SqlDbType.VarChar, 100).Value = Username.Text;

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

            if (RePassword.Text.Equals(""))
            {
                Label3.Text = "Please enter Re-Password";
                Label3.ForeColor = System.Drawing.Color.Red;
            }
            else if (ds.Tables[0].Rows.Count != 0)
            {
                Ret.Text = "Already have User";
                Ret.ForeColor = System.Drawing.Color.Red;
            }
            else if (!Password.Text.Equals(RePassword.Text))
            {
                Ret.Text = "Password and Re-Password need to be same";
                Ret.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlCommand cmd2
                    = new SqlCommand("insert into users (username, password, firstName, lastName, age, gender, email, address, occupation, phone) values(@UN,@PWD,@FN, @LN, @A, @G, @E, @AD, @O, @P)", conn);
                cmd2.Parameters.Add("@UN", System.Data.SqlDbType.VarChar, 100).Value = Username.Text;
                cmd2.Parameters.Add("@PWD", System.Data.SqlDbType.VarChar, 100).Value = Password.Text;
                cmd2.Parameters.Add("@FN", System.Data.SqlDbType.VarChar, 100).Value = " ";
                cmd2.Parameters.Add("@LN", System.Data.SqlDbType.VarChar, 100).Value = " ";
                cmd2.Parameters.Add("@A", System.Data.SqlDbType.Int, 100).Value = 18;
                cmd2.Parameters.Add("@G", System.Data.SqlDbType.VarChar, 100).Value = "Male";
                cmd2.Parameters.Add("@E", System.Data.SqlDbType.VarChar, 100).Value = " ";
                cmd2.Parameters.Add("@AD", System.Data.SqlDbType.VarChar, 100).Value = " ";
                cmd2.Parameters.Add("@O", System.Data.SqlDbType.VarChar, 100).Value = " ";
                cmd2.Parameters.Add("@P", System.Data.SqlDbType.VarChar, 100).Value = " ";
                cmd2.ExecuteNonQuery();
                conn.Close();
                Username.Text = "";
                Password.Text = "";
                RePassword.Text = "";

                Response.Redirect("Login.aspx");
            }
        }
    

        protected void btn_login(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}