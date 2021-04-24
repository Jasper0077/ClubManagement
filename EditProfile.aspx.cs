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
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] == null)
                    Response.Redirect("Login.aspx");
                initialize();
            }
        }

        protected void initialize()
        {
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select * from Users where uID = @UID", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_profile = new DataTable();
            adapter.Fill(dt_profile);

            Username.Text = (String)Session["username"];
            Age.Text = Convert.ToString(dt_profile.Rows[0]["age"]);
            GenderDropDown.SelectedValue = (String)dt_profile.Rows[0]["gender"];
            FirstName.Text = (String)dt_profile.Rows[0]["firstName"];
            LastName.Text = (String)dt_profile.Rows[0]["lastName"];
            Email.Text = (String)dt_profile.Rows[0]["email"];
            Address.Text = (String)dt_profile.Rows[0]["address"];
            Occupation.Text = (String)dt_profile.Rows[0]["occupation"];
            Phone.Text = (String)dt_profile.Rows[0]["phone"];
        }
        protected void btnConfirmEdit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new SqlCommand("update Users set firstName=@FN, lastName=@LN, age=@A, gender=@G, email=@E, phone=@P, address=@Address, occupation=@O where uID = @UID", conn);
            cmd.Parameters.Add("@UID", SqlDbType.Int, 100).Value = Session["user_id"];
            cmd.Parameters.AddWithValue("@FN", FirstName.Text);
            cmd.Parameters.AddWithValue("@LN", LastName.Text);
            cmd.Parameters.AddWithValue("@A", Convert.ToInt32(Age.Text));
            cmd.Parameters.AddWithValue("@G", GenderDropDown.SelectedValue);
            cmd.Parameters.AddWithValue("@E", Email.Text);
            cmd.Parameters.AddWithValue("@P", Phone.Text);
            cmd.Parameters.AddWithValue("@Address", Address.Text);
            cmd.Parameters.AddWithValue("@O", Occupation.Text);

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            Response.Redirect("ProfilePage.aspx");
        }
    }
}