using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyBinhLuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable binhluan = new DataTable();
            binhluan = DataProvider.LayBinhLuan();
            datalistbinhluan.DataSource = binhluan;
            datalistbinhluan.DataBind();
            foreach(DataListItem item in datalistbinhluan.Items)
            {
               
            }

        }
    }
    protected void btnXoaBinhLuan_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in datalistbinhluan.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
            if (cb.Checked == true)
            {
                Label lb = (Label)item.FindControl("lblmabinhluan");
                int mabl = int.Parse(lb.Text.ToString());
                DataProvider.XoaBinhLuan(mabl);
                //  Page_Load(sender,e);
                //TextBox1.Text = id.ToString();
            }

        }
        Response.Redirect("QuanLyBinhLuan.aspx");
    }
}