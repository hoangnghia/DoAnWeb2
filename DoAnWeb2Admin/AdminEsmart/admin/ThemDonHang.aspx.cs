using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThemDonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ArrayList lstnguoidung = DataProvider.LayNguoiDung();
            iddrlkhachhang.DataSource = lstnguoidung;
            iddrlkhachhang.DataTextField = "TaiKhoan";
            iddrlkhachhang.DataValueField = "MaND";
            iddrlkhachhang.DataBind();
        }
    }
    //protected void cldngaylap_SelectionChanged(object sender, EventArgs e)
    //{
    //    string t = cldngaylap.SelectedDate.ToShortDateString();
    //    t = t.Replace("/", "-");
    //    txtNgayLap.Text = t;
    //}
    protected void btnLuuDonHang_Click(object sender, EventArgs e)
    {
        //DateTime OutputDate;
        //if (DateTime.TryParseExact(txtNgayLap.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out OutputDate))
        //{
            //string t = OutputDate.Year.ToString();
            //int tuoi = Int32.Parse(t);
            //string gio = DateTime.Now.Year.ToString();
            //if ((Int32.Parse(gio) - tuoi) < 15)
            //{
            //    lbthongbao.Text = "Tuổi không được nhỏ hơn 15";
            //    return;
            //}
          //if(txtTongTien.Text == "")
          //{
          //    lbthongbao.Text = "Nhập Tổng Tiền";
          //    return;
          //}
            //else
            //{
                DateTime ngaylap = DateTime.Now;
                //long tongtien = long.Parse(txtTongTien.Text.ToString());
                string tinhtrangthanhtoan = iddrlsttinhtrang.Text.ToString();
                string loaithanhtoan = iddrlloaithanhtoan.Text.ToString();
                int nguoidung = int.Parse(iddrlkhachhang.SelectedValue.ToString());
                lbthongbao.Text = nguoidung.ToString();
                DataProvider.ThemDonHang(nguoidung, 0, ngaylap, tinhtrangthanhtoan, loaithanhtoan, 1);
                Response.Redirect("QuanLyDonHang.aspx");
            //}
            //DateTime n = DateTime.Parse(txtNgaySinh.Text, new CultureInfo("en-US"));
            // string date = "Thu Jul 18 17:39:53 +0000 2013";

            //DateTime dt = DateTime.ParseExact(txtNgaySinh.Text, "yyyy-MM-dd",new CultureInfo("en-US"));

        //}
        //else { lbthongbao.Text = "Nhập sai định dạng ngày"; }
        
    }
}