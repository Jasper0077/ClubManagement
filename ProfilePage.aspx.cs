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
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] == null)
                    Response.Redirect("Login.aspx");

                ViewProfile();
                ViewBookedFacilities();
                ViewBookedTrainingClass();
            }

        }

        protected void ViewProfile()
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

            if (dt_profile.Rows[0]["age"] is System.DBNull)
                Age.Text = " ";
            else
                Age.Text = Convert.ToString(dt_profile.Rows[0]["age"]);

            if (dt_profile.Rows[0]["gender"] is System.DBNull)
                Gender.Text = " ";
            else
                Gender.Text = Convert.ToString(dt_profile.Rows[0]["gender"]);

            if (dt_profile.Rows[0]["firstName"] is System.DBNull)
                FirstName.Text = " ";
            else
                FirstName.Text = Convert.ToString(dt_profile.Rows[0]["firstName"]);

            if (dt_profile.Rows[0]["lastName"] is System.DBNull)
                LastName.Text = " ";
            else
                LastName.Text = Convert.ToString(dt_profile.Rows[0]["lastName"]);

            if (dt_profile.Rows[0]["email"] is System.DBNull)
                Email.Text = " ";
            else
                Email.Text = Convert.ToString(dt_profile.Rows[0]["email"]);

            if (dt_profile.Rows[0]["address"] is System.DBNull)
                Address.Text = " ";
            else
                Address.Text = Convert.ToString(dt_profile.Rows[0]["address"]);

            if (dt_profile.Rows[0]["occupation"] is System.DBNull)
                Occupation.Text = " ";
            else
                Occupation.Text = Convert.ToString(dt_profile.Rows[0]["occupation"]);

            if (dt_profile.Rows[0]["phone"] is System.DBNull)
                Phone.Text = " ";
            else
                Phone.Text = Convert.ToString(dt_profile.Rows[0]["phone"]);

        }

        protected void ViewBookedFacilities()
        {
            SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select Facility.fName, BookingFacility.days, BookingFacility.timeSlot, BookingFacility.status from BookingFacility, Facility where userID=@UID and BookingFacility.facilityID = Facility.fID", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_bookedFacilities = new DataTable();
            adapter.Fill(dt_bookedFacilities);
            FacilitiesList.DataSource = dt_bookedFacilities;
            FacilitiesList.DataBind();
        }

        protected void ViewBookedTrainingClass()
        {
            SqlConnection conn = new SqlConnection
                 ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd = new
                    SqlCommand("select TrainingClass.className, BookingTraining.days, BookingTraining.timeSlot, BookingTraining.status from BookingTraining, TrainingClass where userID=@UID and BookingTraining.classID = TrainingClass.tcID", conn);
            cmd.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt_bookedTrainingClass = new DataTable();
            adapter.Fill(dt_bookedTrainingClass);
            TrainingClassList.DataSource = dt_bookedTrainingClass;
            TrainingClassList.DataBind();
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void btnEditBookedFacilities_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditBookedFacilities.aspx");
        }

        protected void btnEditBookedTrainingClass_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditBookedTrainingClass.aspx");
        }
    }
}