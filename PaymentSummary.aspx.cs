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
    public partial class PaymentSummary : System.Web.UI.Page
    {
        string id;
        int paymentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("Login.aspx");

            id = Request.QueryString["id"].ToString();
            paymentID = Convert.ToInt32(id);
            if(!IsPostBack)
            {
                SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
                conn.Open();

                SqlCommand cmd = new
                        SqlCommand("select * from Payment where pID = @PID", conn);
                cmd.Parameters.AddWithValue("@PID", paymentID);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt_user = new DataTable();
                adapter.Fill(dt_user);
                Name.Text = dt_user.Rows[0]["username"].ToString();
                Phone.Text = dt_user.Rows[0]["phone"].ToString();
                Address.Text = dt_user.Rows[0]["address"].ToString();
                Price.Text = dt_user.Rows[0]["amount"].ToString();

                SqlCommand cmd2 = new
                       SqlCommand("select PaymentDetail.trainingclassID as trainingclassID, PaymentDetail.trainingclassName as trainingclassName, PaymentDetail.amount as amount from PaymentDetail where paymentID = @PID", conn);
                cmd2.Parameters.AddWithValue("@PID", paymentID);
                SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                DataTable dt_payment = new DataTable();
                adapter2.Fill(dt_payment);
                TrainingClassList.DataSource = dt_payment;
                TrainingClassList.DataBind();
            }
        }


        protected void Confirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}