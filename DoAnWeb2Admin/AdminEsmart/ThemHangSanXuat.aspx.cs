using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThemHangSanXuat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private bool KiemTraHieuAnh(string tenanh)
    {
        string ext = Path.GetExtension(tenanh);
        if(ext.Equals(".jpg") ||ext.Equals(".JPG") ||ext.Equals(".jpeg")||ext.Equals(".JPEG") ||ext.Equals(".bmp") ||ext.Equals(".BMP") ||ext.Equals(".gif") ||ext.Equals(".GIF") ||ext.Equals(".png") ||ext.Equals(".PNG") )
        {
            return true;
        }
        return false;
    }
    protected void btnThemHangSX_Click(object sender, EventArgs e)
    {
        
        if (uploadhinh.HasFile)
        {
            string fileName = DateTime.Now.ToString() + Path.GetFileName(uploadhinh.PostedFile.FileName);
            fileName = fileName.Replace(" ", "");
            fileName = fileName.Replace("/", "");
            fileName = fileName.Replace(":", "");
            bool ktkieuanh = KiemTraHieuAnh(fileName);
            //lbthongbao.Text = fileName;
            if (ktkieuanh == false)
           //if ((@"^([0-9a-zA-Z_\-~ :\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$").Contains(fileName))
           {
                lbthongbao.Text = "Vui lòng chọn file ảnh";
                return;
            }
           else
           {
               uploadhinh.PostedFile.SaveAs(Server.MapPath("~/images/HinhHangSX/") + fileName);

               //  Response.Redirect(Request.Url.AbsoluteUri);
               string mahangsx = txtMaHangSX.Text;
               string tenhangsx = txtTenHangSX.Text;
               DataTable tb = DataProvider.KiemTraTonTai(mahangsx);
                if(mahangsx.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập Mã HSX";
                    return;
                }
                else if (tenhangsx.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập Tên HSX";
                    return;
                }
               else if (tb.Rows.Count > 0)
               {
                   lbthongbao.Text = "Mã Hãng SX đã tồn tại";
                   return;
               }
               if (mahangsx == "" || tenhangsx == "")
               {
                   lbthongbao.Text = "Nhập đầy đủ thông tin";

                   return;
               }
               DataProvider.ThemHangSX(mahangsx, tenhangsx, fileName, 1);
               Response.Redirect("HangSanXuat.aspx");
            
           }
        }
        else
        {
            lbthongbao.Text = "Chọn hình Hãng SX";
        }
   
    }
}