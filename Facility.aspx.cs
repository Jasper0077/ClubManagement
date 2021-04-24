using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;

namespace ClubManagement
{
    public partial class Facility : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection
             ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
                conn.Open();

                SqlCommand cmd = new SqlCommand("select fID, fName from Facility", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt_fid = new DataTable();
                adapter.Fill(dt_fid);
                ddlFacility.DataSource = dt_fid;
                ddlFacility.DataBind();
                ddlFacility.DataTextField = "fName";
                ddlFacility.DataValueField = "fID";
                ddlFacility.DataBind();

                fill();
            }
        }

        protected void fill()
        {
            SqlConnection conn = new SqlConnection
             ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("select fName, imageName from Facility", conn);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string path;
            if (FileUpload.HasFile)
                FileUpload.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "image/" + FileUpload.FileName);
            path = FileUpload.FileName;
            SqlConnection conn = new SqlConnection
              ("Server=DESKTOP-41H50KG\\SQLEXPRESS; Database=clubone; Uid=20201113; password=123456");
            conn.Open();
            SqlCommand cmd = new SqlCommand("update Facility set imageName = @img where fID=@FID", conn);
            cmd.Parameters.AddWithValue("@FID", Convert.ToInt32(ddlFacility.SelectedValue));
            cmd.Parameters.AddWithValue("@img", path);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "bookFacilities")
            {
                Response.Redirect("BookFacilities.aspx?fName=" + e.CommandArgument.ToString());
            }
        }
    }


}