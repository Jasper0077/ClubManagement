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
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["user_id"] == null)
                    Response.Redirect("Login.aspx");

                ViewApprovedTrainingClass();
                ViewPayment();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TrainingClassList.Rows.Count != 0)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You didn't have unpaid training class');", true);
            }
        }

        protected void PaymentList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ViewApprovedTrainingClass()
        {
            SqlConnection conn = new SqlConnection
                 ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            
            SqlCommand cmd = new
                    SqlCommand("select BookingTraining.btID as btID, TrainingClass.className as className, BookingTraining.days as days, BookingTraining.timeSlot as timeSlot, BookingTraining.status as status from BookingTraining, TrainingClass where userID=@UID and BookingTraining.classID = TrainingClass.tcID and BookingTraining.status=@S", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd.Parameters.AddWithValue("@S", "Approved");
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_bookedTrainingClass = new DataTable();
            adapter.Fill(dt_bookedTrainingClass);
            TrainingClassList.DataSource = dt_bookedTrainingClass;
            TrainingClassList.DataBind();
        }

        protected void ViewPayment()
        {
            SqlConnection conn = new SqlConnection
                 ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select pID as pID, amount as amount from Payment where Payment.userID = @UID", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_payment = new DataTable();
            adapter.Fill(dt_payment);
            PaymentList.DataSource = dt_payment;
            PaymentList.DataBind();

            for (int i = 0; i < PaymentList.Rows.Count; ++i)
            {
                LinkButton btn = (LinkButton)PaymentList.Rows[i].FindControl("details");
                int pID = Convert.ToInt32(PaymentList.Rows[i].Cells[0].Text);

                btn.PostBackUrl = "Receipt.aspx?id=" + pID;
            }
        }
    }
}