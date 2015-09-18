using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CapNhapThongTinAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {


            ArrayList lstnguoidung = new ArrayList();
            int mand = int.Parse(Session["mand"].ToString());
            lstnguoidung = DataProvider.LayChiTietNguoiDung(mand);
            datalistsuanguoidung.DataSource = lstnguoidung;
            datalistsuanguoidung.DataBind();

            ArrayList lstlayquyen = new ArrayList();
            lstlayquyen = DataProvider.LayQuyenGioiTinhNguoiDung();

            foreach (DataListItem item in datalistsuanguoidung.Items)
            {
                DropDownList gt = (DropDownList)item.FindControl("iddrlgioitinh");
                gt.DataSource = lstlayquyen;
                gt.DataTextField = "GioiTinh";
                gt.DataValueField = "GioiTinh";
                gt.DataBind();
            }
        }
    }
    protected void btnLuuNguoiDung_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in datalistsuanguoidung.Items)
        {
            TextBox txtmand = (TextBox)item.FindControl("txtMaND");
            TextBox txttaikhoan = (TextBox)item.FindControl("txtTaiKhoan");
            TextBox txthoten = (TextBox)item.FindControl("txtHoTen");
            TextBox txtngaysinh = (TextBox)item.FindControl("txtNgaySinh");
            DropDownList drlgioitinh = (DropDownList)item.FindControl("iddrlgioitinh");
            TextBox txtdiachi = (TextBox)item.FindControl("txaDiaChi");
            TextBox txtthanhpho = (TextBox)item.FindControl("txtThanhPho");
            TextBox txtdienthoai = (TextBox)item.FindControl("txtDienThai");
            TextBox txtemail = (TextBox)item.FindControl("txtEmail");
            int mand = int.Parse(txtmand.Text.ToString());
            string taikhoan = txttaikhoan.Text;
            string hoten = txthoten.Text;
            string gioitinh = drlgioitinh.SelectedValue;
            string diachi = txtdiachi.Text;
            string thanhpho = txtthanhpho.Text;
            string email = txtemail.Text;
            string dienthoai = txtdienthoai.Text;
            DateTime OutputDate;
            if (DateTime.TryParseExact(txtngaysinh.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out OutputDate))
            {
                string t = OutputDate.Year.ToString();
                int tuoi = Int32.Parse(t);
                string gio = DateTime.Now.Year.ToString();
                if ((Int32.Parse(gio) - tuoi) < 15)
                {
                    lbthongbao.Text = "Tuổi không được nhỏ hơn 15";
                    return;
                }

                DataTable kttaikhoan = DataProvider.KiemTraTonTaiNguoiDung(taikhoan);
                DataTable ktemail = DataProvider.KiemTraTonTaiEmail(email);
                if (taikhoan.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập tài khoản";
                    return;
                }
                else if (hoten.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập họ tên";
                    return;
                }
                else if (diachi.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập địa chỉ";
                    return;
                }
                else if (thanhpho.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập thành phố";
                    return;
                }
                else if (email.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập Eamil";
                    return;
                }
                else if (dienthoai.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập điện thoại";
                    return;
                }
                //else if (kttaikhoan.Rows.Count > 0)
                //{
                //    lbthongbao.Text = "Tài khoản đã tồn tại";
                //    return;
                //}
                //else if (ktemail.Rows.Count > 0)
                //{
                //    lbthongbao.Text = "Email đã tồn tại";
                //    return;
                //}
                else
                {
                    DataProvider.CapNhapThongTinAdmin(mand, taikhoan, hoten, OutputDate, gioitinh, diachi, thanhpho, email, dienthoai);
                    Response.Redirect("Home.aspx");
                }

            }
            else { lbthongbao.Text = "Nhập sai định dạng ngày"; }

        }
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        foreach (DataListItem item in datalistsuanguoidung.Items)
        {
            System.Web.UI.WebControls.Calendar cldsnd = (System.Web.UI.WebControls.Calendar)item.FindControl("Calendar2");
            string t = cldsnd.SelectedDate.ToShortDateString();
            t = t.Replace("/", "-");
            TextBox txtngsinh = (TextBox)item.FindControl("txtNgaySinh");
            txtngsinh.Text = t.ToString();
        }
    }
}