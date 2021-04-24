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
    public partial class BookingTrainingClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                TrainingClassBind();
                ViewBookedTrainingClass();
            }
        }

        protected void TrainingClassBind()
        {
            SqlConnection conn = new SqlConnection
               ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd1.Parameters.AddWithValue("@D", "Monday");
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            adapter1.Fill(dt1);
            GridView1.DataSource = dt1;
            GridView1.DataBind();

            SqlCommand cmd2 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd2.Parameters.AddWithValue("@D", "Tuesday");
            SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);
            GridView2.DataSource = dt2;
            GridView2.DataBind();

            SqlCommand cmd3 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd3.Parameters.AddWithValue("@D", "Wednesday");
            SqlDataAdapter adapter3 = new SqlDataAdapter(cmd3);
            DataTable dt3 = new DataTable();
            adapter3.Fill(dt3);
            GridView3.DataSource = dt3;
            GridView3.DataBind();

            SqlCommand cmd4 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd4.Parameters.AddWithValue("@D", "Thursday");
            SqlDataAdapter adapter4 = new SqlDataAdapter(cmd4);
            DataTable dt4 = new DataTable();
            adapter4.Fill(dt4);
            GridView4.DataSource = dt4;
            GridView4.DataBind();

            SqlCommand cmd5 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd5.Parameters.AddWithValue("@D", "Friday");
            SqlDataAdapter adapter5 = new SqlDataAdapter(cmd5);
            DataTable dt5 = new DataTable();
            adapter5.Fill(dt5);
            GridView5.DataSource = dt5;
            GridView5.DataBind();

            SqlCommand cmd6 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd6.Parameters.AddWithValue("@D", "Saturday");
            SqlDataAdapter adapter6 = new SqlDataAdapter(cmd6);
            DataTable dt6 = new DataTable();
            adapter6.Fill(dt6);
            GridView6.DataSource = dt6;
            GridView6.DataBind();

            SqlCommand cmd7 = new SqlCommand("select TrainingClass.className as className, Tutor.name as name, TrainingClass.timeSlot as timeSlot, TrainingClass.price as price, TrainingClass.tcID as tcID, TrainingClass.days as days from TrainingClass,Tutor where TrainingClass.tutorID = Tutor.tID and TrainingClass.days = @D", conn);
            cmd7.Parameters.AddWithValue("@D", "Sunday");
            SqlDataAdapter adapter7 = new SqlDataAdapter(cmd7);
            DataTable dt7 = new DataTable();
            adapter7.Fill(dt7);
            GridView7.DataSource = dt7;
            GridView7.DataBind();
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            mvBookingTrainingClass.ActiveViewIndex = Int32.Parse(e.Item.Value);
        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Book")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                
                int trainingClassID = Convert.ToInt32(commandArgs[0]);
                String timeslot = commandArgs[1];
                String days = commandArgs[2];

                SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
                conn.Open();

                SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
                cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd1.Parameters.AddWithValue("@CID", trainingClassID);
                SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adapter1.Fill(dt1);

                if(dt1.Rows.Count != 0)
                {
                    Label1.Text = "Already Booked";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                    cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                    cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                    cmd2.Parameters.AddWithValue("@TS", timeslot);
                    cmd2.Parameters.AddWithValue("@D", days);
                    cmd2.Parameters.AddWithValue("@S", "Pending");
                    cmd2.ExecuteNonQuery();
                    cmd2.Dispose();
                    TrainingClassBind();
                    ViewBookedTrainingClass();
                }
            } 
        }

        protected void GridView2_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

                int trainingClassID = Convert.ToInt32(commandArgs[0]);
                String timeslot = commandArgs[1];
                String days = commandArgs[2];

                SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
                conn.Open();

                SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
                cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd1.Parameters.AddWithValue("@CID", trainingClassID);
                SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adapter1.Fill(dt1);

                if (dt1.Rows.Count != 0)
                {
                    Label1.Text = "Already Booked";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                    cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                    cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                    cmd2.Parameters.AddWithValue("@TS", timeslot);
                    cmd2.Parameters.AddWithValue("@D", days);
                    cmd2.Parameters.AddWithValue("@S", "Pending");
                    cmd2.ExecuteNonQuery();
                    cmd2.Dispose();
                    TrainingClassBind();
                    ViewBookedTrainingClass();
                }
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

                int trainingClassID = Convert.ToInt32(commandArgs[0]);
                String timeslot = commandArgs[1];
                String days = commandArgs[2];

                SqlConnection conn = new SqlConnection
                ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
                conn.Open();

                SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
                cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd1.Parameters.AddWithValue("@CID", trainingClassID);
                SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adapter1.Fill(dt1);

                if (dt1.Rows.Count != 0)
                {
                    Label1.Text = "Already Booked";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                    cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                    cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                    cmd2.Parameters.AddWithValue("@TS", timeslot);
                    cmd2.Parameters.AddWithValue("@D", days);
                    cmd2.Parameters.AddWithValue("@S", "Pending");
                    cmd2.ExecuteNonQuery();
                    cmd2.Dispose();
                    TrainingClassBind();
                    ViewBookedTrainingClass();
                }
            }
        }

        protected void GridView4_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

            int trainingClassID = Convert.ToInt32(commandArgs[0]);
            String timeslot = commandArgs[1];
            String days = commandArgs[2];

            SqlConnection conn = new SqlConnection
            ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
            cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd1.Parameters.AddWithValue("@CID", trainingClassID);
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            adapter1.Fill(dt1);

            if (dt1.Rows.Count != 0)
            {
                Label1.Text = "Already Booked";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                cmd2.Parameters.AddWithValue("@TS", timeslot);
                cmd2.Parameters.AddWithValue("@D", days);
                cmd2.Parameters.AddWithValue("@S", "Pending");
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
                TrainingClassBind();
                ViewBookedTrainingClass();
            }
        }

        protected void GridView5_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

            int trainingClassID = Convert.ToInt32(commandArgs[0]);
            String timeslot = commandArgs[1];
            String days = commandArgs[2];

            SqlConnection conn = new SqlConnection
            ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
            cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd1.Parameters.AddWithValue("@CID", trainingClassID);
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            adapter1.Fill(dt1);

            if (dt1.Rows.Count != 0)
            {
                Label1.Text = "Already Booked";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                cmd2.Parameters.AddWithValue("@TS", timeslot);
                cmd2.Parameters.AddWithValue("@D", days);
                cmd2.Parameters.AddWithValue("@S", "Pending");
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
                TrainingClassBind();
                ViewBookedTrainingClass();
            }
        }

        protected void GridView6_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

            int trainingClassID = Convert.ToInt32(commandArgs[0]);
            String timeslot = commandArgs[1];
            String days = commandArgs[2];

            SqlConnection conn = new SqlConnection
            ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
            cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd1.Parameters.AddWithValue("@CID", trainingClassID);
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            adapter1.Fill(dt1);

            if (dt1.Rows.Count != 0)
            {
                Label1.Text = "Already Booked";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                cmd2.Parameters.AddWithValue("@TS", timeslot);
                cmd2.Parameters.AddWithValue("@D", days);
                cmd2.Parameters.AddWithValue("@S", "Pending");
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
                TrainingClassBind();
                ViewBookedTrainingClass();
            }
        }

        protected void GridView7_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });

            int trainingClassID = Convert.ToInt32(commandArgs[0]);
            String timeslot = commandArgs[1];
            String days = commandArgs[2];

            SqlConnection conn = new SqlConnection
            ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();

            SqlCommand cmd1 = new SqlCommand("select BookingTraining.userID as userID, BookingTraining.classID as classID from BookingTraining where userID = @UID and classID = @CID",conn);
            cmd1.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
            cmd1.Parameters.AddWithValue("@CID", trainingClassID);
            SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            adapter1.Fill(dt1);

            if (dt1.Rows.Count != 0)
            {
                Label1.Text = "Already Booked";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("insert into BookingTraining(userID,classID,timeSlot,days,status) values(@UID, @CID, @TS, @D, @S)",conn);
                cmd2.Parameters.Add("@UID", System.Data.SqlDbType.Int, 100).Value = Session["user_id"];
                cmd2.Parameters.AddWithValue("@CID", trainingClassID);
                cmd2.Parameters.AddWithValue("@TS", timeslot);
                cmd2.Parameters.AddWithValue("@D", days);
                cmd2.Parameters.AddWithValue("@S", "Pending");
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
                TrainingClassBind();
                ViewBookedTrainingClass();
            }
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

        protected void btnEditBookedTrainingClass_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditBookedTrainingClass.aspx");
        }
    }
}