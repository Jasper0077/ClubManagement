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
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["user_id"] == null)
                    Response.Redirect("Login.aspx");

                viewUserInformation();
                viewBoookingDetail();
            }
        }

        protected void Pay_Click(object sender, EventArgs e)
        {
            String username, phone, address;
            int amount = Convert.ToInt32(Price.Text);
            int id;
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            username = Name.Text;
            phone = Phone.Text;
            address = Address.Text;

            SqlCommand cmdgetID = new
                 SqlCommand("select pID from Payment", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmdgetID);
            DataTable dt_ID = new DataTable();
            adapter.Fill(dt_ID);

            if(dt_ID.Rows.Count == 0)
            {
                id = 1;
            }
            else
            {
                int i = dt_ID.Rows.Count - 1;
                id = (int)dt_ID.Rows[i]["pID"] + 1;
            }

            SqlCommand cmd = new
                SqlCommand("insert into Payment(pID, userID, username, phone, address, amount) values(@PID, @UID,@UN,@P,@A,@AM)", conn);
            cmd.Parameters.AddWithValue("@PID", id);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd.Parameters.AddWithValue("@UN", username);
            cmd.Parameters.AddWithValue("@P", phone);
            cmd.Parameters.AddWithValue("@A", address);
            cmd.Parameters.AddWithValue("@AM", amount);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            SqlCommand cmd3 = new
                SqlCommand("select BookingTraining.btID as btID, BookingTraining.classID as classID,TrainingClass.className as className, TrainingClass.price as price from BookingTraining, TrainingClass where userID=@UID and BookingTraining.classID = TrainingClass.tcID and BookingTraining.status=@S", conn);
            cmd3.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd3.Parameters.AddWithValue("@S", "Approved");
            SqlDataAdapter adapter3 = new SqlDataAdapter(cmd3);
            DataTable dt_bookingClass = new DataTable();
            adapter3.Fill(dt_bookingClass);

            for (int i = 0; i<TrainingClassList.Rows.Count; ++i)
            {
                SqlCommand cmd2 = new
                SqlCommand("update BookingTraining set status = @S where BookingTraining.btID = @ID", conn);
                cmd2.Parameters.AddWithValue("@S", "Paid");
                cmd2.Parameters.AddWithValue("@ID", Convert.ToInt32(TrainingClassList.Rows[i].Cells[0].Text));
                cmd2.ExecuteNonQuery();
            }


            for(int i = 0; i<dt_bookingClass.Rows.Count; ++i)
            {
                SqlCommand cmd4 = new
                    SqlCommand("insert into PaymentDetail(paymentID,trainingclassID,trainingclassName,amount) values(@PID,@TCID,@TCN,@A)", conn);
                cmd4.Parameters.AddWithValue("@PID",id);
                cmd4.Parameters.AddWithValue("@TCID", Convert.ToInt32(dt_bookingClass.Rows[i]["classID"].ToString()));
                cmd4.Parameters.AddWithValue("@TCN", dt_bookingClass.Rows[i]["className"].ToString());
                cmd4.Parameters.AddWithValue("@A", Convert.ToInt32(dt_bookingClass.Rows[i]["price"].ToString()));
                cmd4.ExecuteNonQuery();
            }

            Response.Redirect("PaymentSummary.aspx?id="+id);
        }

        protected void viewUserInformation()
        {
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select * from Users where uID = @UID", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_user = new DataTable();
            adapter.Fill(dt_user);

            Name.Text = (String)dt_user.Rows[0]["username"];
            Phone.Text = (String)dt_user.Rows[0]["phone"];
            Address.Text = (String)dt_user.Rows[0]["address"];

        }

        protected void viewBoookingDetail()
        {
            String price;
            int total = 0;
            SqlConnection conn = new SqlConnection
                 ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select BookingTraining.btID as btID, TrainingClass.className as className, TrainingClass.price as price from BookingTraining, TrainingClass where userID=@UID and BookingTraining.classID = TrainingClass.tcID and BookingTraining.status=@S", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd.Parameters.AddWithValue("@S", "Approved");
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_bookedTrainingClass = new DataTable();
            adapter.Fill(dt_bookedTrainingClass);
            TrainingClassList.DataSource = dt_bookedTrainingClass;
            TrainingClassList.DataBind();

            for(int i=0; i< TrainingClassList.Rows.Count; ++i)
            {
                total = total + (int)dt_bookedTrainingClass.Rows[i]["price"];
            }
            TotalAmount.Text = total.ToString();
            Price.Text = total.ToString();
        }
    }
}