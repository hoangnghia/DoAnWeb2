
using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbPass.Visible = false;
        lbUsername.Visible = false;
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
    protected void btnDangNhap_Click(object sender, EventArgs e)
    {
        if(txtusername.Text=="")
        {
            lbUsername.Visible = true;
            lbUsername.Text = "Nhập Username";
            txtusername.Focus();
        }
        else if (txtpassword.Text == "")
        {
            lbPass.Visible = true;
            lbPass.Text = "Nhập Pass";
            txtpassword.Focus();
        }
        else
        {
            string ten = txtusername.Text;
            string pass = txtpassword.Text.ToString();
            string passmahoa = md5(pass);
            // Session["username"] = ten;           
            DataTable tb = DataProvider.KiemTraDangNhap(ten, passmahoa);
            // Session["taikhoan"] = ten;

            if (tb.Rows.Count > 0)
            {

                foreach (DataRow dr in tb.Rows)
                {
                    Session["mand"] = dr["MaND"];
                    //Session["quyen"] = dr["Quyen"];
                    Session["taikhoan"] = dr["TaiKhoan"];
                    Session["matkhau"] = dr["MatKhau"];
                    //Session["hoten"] = dr["HoTen"];
                    //Session["ngaysinh"] = dr["NgaySinh"];
                    //Session["gioitinh"] = dr["GioiTinh"];
                    //Session["diachi"] = dr["DiaChi"];
                    //Session["thanhpho"] = dr["ThanhPho"];
                    //Session["email"] = dr["Email"];
                    //Session["dienthoai"] = dr["DienThoai"];
                    //Session["stt"] = dr["STT"];
                }
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbPass.Visible = true;
                lbPass.Text = "Nhập sai username hoặc password";
            }
        }
    }
}