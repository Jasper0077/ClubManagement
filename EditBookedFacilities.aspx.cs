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
    public partial class EditBookedFacilities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initialize();
            }
        }

        protected void initialize()
        {
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand selectTimeSlot = new
                   SqlCommand("select * from TimeSlots", conn);
            SqlDataAdapter adapter1 = new SqlDataAdapter(selectTimeSlot);
            DataTable dt_timeslot = new DataTable();
            adapter1.Fill(dt_timeslot);

            SqlCommand cmd2 = new
                    SqlCommand("select BookingFacility.bfID, Facility.fName, BookingFacility.days, BookingFacility.timeSlot from BookingFacility, Facility where userID=@UID and BookingFacility.facilityID = Facility.fID and BookingFacility.status = @S", conn);
            cmd2.Parameters.AddWithValue("@UID", Session["user_id"]);
            cmd2.Parameters.AddWithValue("@S", "Pending");
            SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
            DataTable dt_facilities = new DataTable();
            adapter2.Fill(dt_facilities);

            ListBox1.DataSource = dt_facilities;
            ListBox1.DataBind();
            ListBox1.DataTextField = "fName";
            ListBox1.DataValueField = "bfID";
            ListBox1.DataBind();

            TimeSlotDropDown.DataSource = dt_timeslot;
            TimeSlotDropDown.DataBind();
            TimeSlotDropDown.DataTextField = "timeSlot";
            TimeSlotDropDown.DataValueField = "timeSlot";
            TimeSlotDropDown.DataBind();
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
               ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd1 = new
                    SqlCommand("select BookingFacility.bfID, Facility.fName, BookingFacility.days, BookingFacility.timeSlot from BookingFacility, Facility where userID=@UID and BookingFacility.facilityID = Facility.fID and BookingFacility.bfID = @BFID", conn);
            cmd1.Parameters.AddWithValue("@UID", Session["user_id"]);
            cmd1.Parameters.AddWithValue("@BFID", ListBox1.SelectedValue);
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt_facilities = new DataTable();
            adapter1.Fill(dt_facilities);

            SqlCommand selectTimeSlot = new
                   SqlCommand("select * from TimeSlots", conn);
            SqlDataAdapter adapter2 = new SqlDataAdapter(selectTimeSlot);
            DataTable dt_timeslot = new DataTable();
            adapter2.Fill(dt_timeslot);

            TimeSlotDropDown.DataSource = dt_timeslot;
            TimeSlotDropDown.DataBind();
            TimeSlotDropDown.DataTextField = "timeSlot";
            TimeSlotDropDown.DataValueField = "timeSlot";
            TimeSlotDropDown.DataBind();

            Username.Text = (String)Session["username"];
            Facility.Text = Convert.ToString(dt_facilities.Rows[0]["fName"]);
            DaysDropDown.SelectedValue = (String)dt_facilities.Rows[0]["days"];
            TimeSlotDropDown.SelectedValue = (String)dt_facilities.Rows[0]["timeSlot"];
        }

        protected void BtnEditBookedFacility_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
              ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd = new
                SqlCommand("update BookingFacility set timeSlot=@T, days=@D where bfID=@BFID", conn);
            cmd.Parameters.AddWithValue("@BFID", ListBox1.SelectedValue);
            cmd.Parameters.AddWithValue("@T", TimeSlotDropDown.SelectedValue);
            cmd.Parameters.AddWithValue("@D", DaysDropDown.SelectedValue);

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            Response.Redirect("EditBookedFacilities.aspx");
        }

        protected void BtnDeleteBookedFacility_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
              ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd = new
                SqlCommand("delete from BookingFacility where bfID=@BFID", conn);
            cmd.Parameters.AddWithValue("@BFID", ListBox1.SelectedValue);

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            Response.Redirect("EditBookedFacilities.aspx");
        }
    }
}