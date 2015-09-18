using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThemNguoiDung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        string t = Calendar2.SelectedDate.ToShortDateString();
        t = t.Replace("/","-");
        txtNgaySinh.Text = t;
       // DateTime ng = Convert.ToDateTime(txtNgaySinh.Text);
       // lbthongbao.Text = ng.Day.ToString();
    }
    private bool KiemTraSoDienThoai(string sdt)
    {
        Regex isValidInput = new Regex(@"^\d{9,11}$");   
           if (!isValidInput.IsMatch(sdt))
           {
               return false;
           }
           return true;
    }
    private bool KiemTraDinhDangemail(string email)
    {
        Regex isValidInput = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        if (!isValidInput.IsMatch(email))
        {
            return false;
        }
        return true;
    }
    public static byte[] encryptData(string data)
    {
        System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
        byte[] hashedBytes;
        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
        return hashedBytes;
    }
    public static string md5(string data)
    {
        return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
    }
    protected void btnThemNguoiDung_Click(object sender, EventArgs e)
    {
        //DateTime mh = DateTime.Parse(txtNgaySinh.Text);
      // ng.ToString("yyyy-MM-dd");
     //  string format = @"yyyy-mm-dd";
     //  string date = txtNgaySinh.Text.ToString(format);
     //  DateTime ng = Convert.ToDateTime(date);
        DateTime OutputDate;
       if(DateTime.TryParseExact(txtNgaySinh.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out OutputDate))
       {
         
           string t = OutputDate.Year.ToString();
           int tuoi = Int32.Parse(t);
           string gio = DateTime.Now.Year.ToString();
           if ((Int32.Parse(gio) - tuoi) < 15)
           {
               lbthongbao.Text = "Tuổi không được nhỏ hơn 15";
               return;
           }
           string quyen = iddrlstquyen.SelectedValue;
           string taikhoan = txtTaiKhoan.Text.ToString();
           string hoten = txtHoTen.Text.ToString();
           string matkhau = txtNgaySinh.Text.ToString().Replace("-","");
           string matkhaumahoa = md5(matkhau);
           string gioitinh = iddrlgioitinh.SelectedValue;
           string diachi = txaDiaChi.InnerText.ToString();
           string thanhpho = txtThanhPho.Text.ToString();
           string email = txtEmail.Text.ToString();
           string dienthoai = txtDienThai.Text.ToString();
           DataTable kttaikhoan = DataProvider.KiemTraTonTaiNguoiDung(taikhoan);
           DataTable ktemail = DataProvider.KiemTraTonTaiEmail(email);
           bool ktsdt = KiemTraSoDienThoai(dienthoai);
           bool ktdinhdangmail = KiemTraDinhDangemail(email);
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
           else if(email.Replace(" ","") == "")
           {
               lbthongbao.Text = "Nhập Eamil";
               return;
           }
           else if(dienthoai.Replace(" ", "") == "")
           {
               lbthongbao.Text = "Nhập điện thoại";
               return;
           }
           else if(ktsdt == false)
           {
               lbthongbao.Text = "Điện thoại không hợp lệ";
               return;
           }
           else if(kttaikhoan.Rows.Count > 0)
           {
               lbthongbao.Text = "Tài khoản đã tồn tại";
               return;
           }
           else if(ktemail.Rows.Count > 0)
           {
               lbthongbao.Text = "Email đã tồn tại";
               return;
           }
            else if(ktdinhdangmail == false)
           {
               lbthongbao.Text = "Email sai định dạng";
               return;
           }
           else
           {
               DataProvider.Them(quyen, taikhoan, matkhaumahoa, hoten, OutputDate, gioitinh, diachi, thanhpho, email, dienthoai, 1);
               Response.Redirect("QuanLyNguoiDung.aspx");
           }
           //DateTime n = DateTime.Parse(txtNgaySinh.Text, new CultureInfo("en-US"));
           // string date = "Thu Jul 18 17:39:53 +0000 2013";

           //DateTime dt = DateTime.ParseExact(txtNgaySinh.Text, "yyyy-MM-dd",new CultureInfo("en-US"));
           
       }
       else { lbthongbao.Text = "Nhập sai định dạng ngày"; }
        
    }

}