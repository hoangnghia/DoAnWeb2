using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyDonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataTable donhang = new DataTable();
            donhang = DataProvider.LayDonHang1();
            datalistdonhang.DataSource = donhang;
            datalistdonhang.DataBind();
            //foreach (DataListItem item in datalistdonhang.Items)
            //{
            //    Label lb = (Label)item.FindControl("Label2");
            //    lb.Text = lb.Text.ToString("#,###");
            //}
           
        }
    }
    //protected void btnXoaDonHang_Click(object sender, EventArgs e)
    //{
    //    foreach (DataListItem item in datalistdonhang.Items)
    //    {
    //        CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
    //        if (cb.Checked == true)
    //        {
    //            Label lbma = (Label)item.FindControl("idlblMaDonHang");
    //            int madh = int.Parse(lbma.Text.ToString());

    //            DataProvider.XoaDonHang(madh);
    //        }
    //    }
    //    Response.Redirect("QuanLyDonHang.aspx");
    //}
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string tt = DropDownList1.SelectedValue.ToString();
        if (tt == "Tất Cả")
        {
            DataTable donhang = new DataTable();
            donhang = DataProvider.LayDonHang1();
            datalistdonhang.DataSource = donhang;
            datalistdonhang.DataBind();
        }
        else
        {
            DataTable donhang = new DataTable();
            donhang = DataProvider.LayDonHangTheoTinhTrang(tt);
            datalistdonhang.DataSource = donhang;
            datalistdonhang.DataBind();
        }
    }
    protected void btnXoaBinhLuan_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in datalistdonhang.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
            if (cb.Checked == true)
            {
                Label lbma = (Label)item.FindControl("idlblMaDonHang");
                int madh = int.Parse(lbma.Text.ToString());

                DataProvider.XoaDonHang(madh);
            }
        }
        Response.Redirect("QuanLyDonHang.aspx");
    }
    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in datalistdonhang.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
            if (cb.Checked == true)
            {
                Label lbma = (Label)item.FindControl("idlblMaDonHang");
                int madh = int.Parse(lbma.Text.ToString());

                DataProvider.ThanhToanDonHang(madh);
            }
        }
        Response.Redirect("QuanLyDonHang.aspx");
    }
}