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
    public partial class BookFacilities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("Login.aspx");

            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            Username.Text = (String)Session["username"];
            SqlCommand selectFacilities = new
                    SqlCommand("select * from Facility where availability = 1", conn);
            SqlDataAdapter adapter1 = new SqlDataAdapter(selectFacilities);
            DataTable dt_facilities = new DataTable();
            adapter1.Fill(dt_facilities);

            //FacilitiesDropDown.DataSource = dt_facilities;
            //FacilitiesDropDown.DataBind();
            //FacilitiesDropDown.DataTextField = "fName";
            //FacilitiesDropDown.DataValueField = "fID";
            //FacilitiesDropDown.DataBind();
            facilityName.Text = Request.QueryString["fName"];

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
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (chkConfirm.Checked == false)
            {
                Result.Text = "You must confirm first.";
            }
            else
            {
                SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
                conn.Open();

                SqlCommand cmd1 = new
                    SqlCommand("insert into BookingFacility(userID, facilityID, timeSlot, days, status) values(@UID, @FID, @T, @D, @S)", conn);

                SqlCommand cmd2 = new
                    SqlCommand("select fID from Facility where fName=@Query", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd2);
                DataTable dt_facilityID = new DataTable();
                cmd2.Parameters.AddWithValue("@Query", Request.QueryString["fName"]);
                adapter.Fill(dt_facilityID);

                cmd1.Parameters.AddWithValue("@UID", Session["user_id"]);
                cmd1.Parameters.AddWithValue("@FID", dt_facilityID.Rows[0]["fID"]);
                cmd1.Parameters.AddWithValue("@T", TimeSlotDropDown.SelectedValue);
                cmd1.Parameters.AddWithValue("@D", DaysDropDown.SelectedValue);
                cmd1.Parameters.AddWithValue("@S", "Pending");

                cmd1.ExecuteNonQuery();
                cmd1.Dispose();
                Result.ForeColor = System.Drawing.Color.MediumSpringGreen;
                Result.Text = "Successfully submitted.";
            }
        }
    }
}