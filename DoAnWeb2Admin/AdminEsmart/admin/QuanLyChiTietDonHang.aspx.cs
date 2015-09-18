using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyChiTietDonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            int madh = int.Parse(Request["ID"]);
            DataTable tbctdh = DataProvider.LayChiTietDonHang(madh);
            datalstchhitietdonhang.DataSource = tbctdh;
            datalstchhitietdonhang.DataBind();
            foreach (DataListItem item in datalstchhitietdonhang.Items)
            {
                Label hoten = (Label)item.FindControl("lblhoten");
                Label diachi = (Label)item.FindControl("lbldiachi");
                Label tinhtrang = (Label)item.FindControl("lbltinhtrang");
                Label loaithanhtoan = (Label)item.FindControl("lblloaithanhtoan");
                Label tongtien = (Label)item.FindControl("lbltongtien");
                lbhoten.Text = hoten.Text.ToString();
                lbdiachi.Text = diachi.Text.ToString();
                lbtinhtrang.Text = tinhtrang.Text.ToString();
                lbloaithanhtoan.Text = loaithanhtoan.Text.ToString();
                lbtongtien.Text = tongtien.Text.ToString();
            }
        }
    }
    protected void btnXoaChiTietDonHang_Click(object sender, EventArgs e)
    {
        //foreach (DataListItem item in datalstchhitietdonhang.Items)
        //{
        //    CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
        //    if (cb.Checked == true)
        //    {
        //        Label lbma = (Label)item.FindControl("idlblMaDonHang");
        //        int mand = int.Parse(lbma.Text.ToString());
               
        //        DataProvider.XoaChiTietDonHang(mand);
        //    }
        //}
        int madh = int.Parse(Request["ID"]);
        DataProvider.XoaChiTietDonHang(madh);
        DataProvider.SuaDonHangKhiXoaChiTiet(madh, 0);
        Response.Redirect("QuanLyDonHang.aspx");
    }
}