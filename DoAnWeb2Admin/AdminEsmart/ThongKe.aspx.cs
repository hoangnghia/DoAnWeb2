using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThongKe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnXemTheoNam_Click(object sender, ImageClickEventArgs e)
    {
        string nam = ddlNamTKNam.SelectedValue;
        Session["TKTheoNam"] = nam;
        string thang = ".";
        string quy = ".";
        Session["Quy"] = quy;
        Session["Thang"] = thang;
        Response.Redirect("Report.aspx");
    }
    protected void btnTKTheoThang_Click(object sender, ImageClickEventArgs e)
    {
        string quy = ".";
        Session["Quy"] = quy;
        string thang = ddlThang.SelectedValue;
        string nam = ddlNamTKThang.SelectedValue;   
        Session["Thang"] = thang;
        Session["NamTKThang"] = nam;
        Response.Redirect("Report.aspx");
    }
    protected void btnThongKeQuy_Click(object sender, ImageClickEventArgs e)
    {
        string thang = ".";
        Session["Thang"] = thang;
        string quy = ddlQuy.SelectedValue;
        string nam = ddlNamTKQuy.SelectedValue;
        Session["Quy"] = quy;
        Session["NamTKQuy"] = nam;
        Response.Redirect("Report.aspx");
    }
}