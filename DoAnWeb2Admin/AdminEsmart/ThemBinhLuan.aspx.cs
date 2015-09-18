using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThemBinhLuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ArrayList lstnguoidung = DataProvider.LayNguoiDung();
            iddrlstnguoidung.DataSource = lstnguoidung;
            iddrlstnguoidung.DataTextField = "TaiKhoan";
            iddrlstnguoidung.DataValueField = "MaND";
            iddrlstnguoidung.DataBind();

            DataTable lsttensp = DataProvider.LaySanPhamChoDonHang();
            iddrlsanpham.DataSource = lsttensp;
            iddrlsanpham.DataTextField = "TenSP";
            iddrlsanpham.DataValueField = "MaSP";
            iddrlsanpham.DataBind();
        }
    }
    protected void btnLuuDonHang_Click(object sender, EventArgs e)
    {
        if (txtNoiDung.Text == "")
        {
            lbthongbao.Text = "Nhập nội dung!!!";
            return;
        }
        else
        {
            DateTime ngaybinhluan = DateTime.Now;
            int mand = int.Parse(iddrlstnguoidung.SelectedValue.ToString());
            string noidung = txtNoiDung.Text;
            string masp = iddrlsanpham.SelectedValue.ToString();
            DataProvider.ThemBinhLuan(mand, noidung, ngaybinhluan, 1, masp);
            Response.Redirect("QuanLyBinhLuan.aspx");
        }
    }
}