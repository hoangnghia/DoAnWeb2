using ESmart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThayDoiMatKhauAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void btnLuuCTDonHang_Click(object sender, EventArgs e)
    {
        string mkht = txtPassHienTai.Text.ToString();    
        string mkmoi = txtPassMoi.Text.ToString();
        string mkmoilai = txtPassMoiLai.Text.ToString();
        string matkhauhientaimd5 = md5(mkht);
        string mkmoimd5 = md5(mkmoi);
        string mkmoilaimd5 = md5(mkmoilai);
        
        if(mkht.Replace(" ","") == "")
       {
           lbthongbao.Text = "Nhập mật khẩu hiện tại!!!!!!!";
           return;
       }
       else
       {
          
           if(matkhauhientaimd5.CompareTo(Session["matkhau"]) != 0)
           {
               lbthongbao.Text = "Mật khẩu hiện tại không đúng!!!!!!";
               return;
           }
           else
           {
               if(mkmoi.Replace(" ","") == "")
               {
                   lbthongbao.Text = "Nhập mật khẩu mới!!!";
                   return;
               }
               else if(mkmoi.CompareTo(mkmoilai) != 0)
               {
                   lbthongbao.Text = "Mật khẩu nhập lại không trùng!!!";
                   return;
               }
               else
               {
                   int mand = int.Parse(Session["mand"].ToString());
                   DataProvider.ThayDoiMatKhauAdmin(mand, mkmoimd5);
                   Response.Redirect("Home.aspx");
               }
           }
       }
    }
}