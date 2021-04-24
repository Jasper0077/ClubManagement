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
    public partial class EditBookedTrainingClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ViewBookedTrainingClass();
            }
        }

        protected void ViewBookedTrainingClass()
        {
            SqlConnection conn = new SqlConnection
                 ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select TrainingClass.className as className, BookingTraining.days as days, BookingTraining.timeSlot as timeSlot, BookingTraining.status as status, BookingTraining.btID as btID from BookingTraining, TrainingClass where userID=@UID and BookingTraining.classID = TrainingClass.tcID and BookingTraining.status=@S", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd.Parameters.AddWithValue("@S", "Pending");
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_bookedTrainingClass = new DataTable();
            adapter.Fill(dt_bookedTrainingClass);
            GridView1.DataSource = dt_bookedTrainingClass;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            SqlConnection conn = new SqlConnection
            ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new SqlCommand("delete from BookingTraining where BookingTraining.btID = @ID", conn);
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            ViewBookedTrainingClass();
        }
    }
}