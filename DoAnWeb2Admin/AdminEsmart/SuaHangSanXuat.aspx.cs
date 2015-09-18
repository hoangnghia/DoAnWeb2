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

public partial class SuaHangSanXuat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ArrayList l = new ArrayList();
            string h = Request["MaHSX"];
            l = DataProvider.LayChiTietHangSX(h);
            DataList1.DataSource = l;
            DataList1.DataBind();
        }

    }
    private bool KiemTraHieuAnh(string tenanh)
    {
        string ext = Path.GetExtension(tenanh);
        if (ext.Equals(".jpg") || ext.Equals(".JPG") || ext.Equals(".jpeg") || ext.Equals(".JPEG") || ext.Equals(".bmp") || ext.Equals(".BMP") || ext.Equals(".gif") || ext.Equals(".GIF") || ext.Equals(".png") || ext.Equals(".PNG"))
        {
            return true;
        }
        return false;
    }
    protected void btnCapNhap_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in DataList1.Items)
        {
            TextBox txtmahangsx = (TextBox)item.FindControl("txtMaHangSX");
            TextBox txttenhangsx = (TextBox)item.FindControl("txtTenHangSX");
            TextBox txtstatus = (TextBox)item.FindControl("txtStatus");
            string mahangsx = txtmahangsx.Text;
            string tenhangsx = txttenhangsx.Text;
            int status = int.Parse(txtstatus.Text.ToString());
            FileUpload filehinh = (FileUpload)item.FindControl("uploadhinh");
            //DataProvider.XoaHangSX(mahangsx);
            //DataTable ktthxs = DataProvider.KiemTraTonTaiHSX(mahangsx);
            if(mahangsx == "")
            {
                lbthongbao.Text = "Nhập Mã Hãng SX";
                return;
            }
            //else if(ktthxs.Rows.Count > 0)
            //{
            //    lbthongbao.Text = "Mã Hãng SX đã tồn tại";
            //    DataProvider.LayLaiHSX(mahangsx);
            //    return;
            //}
            else if(tenhangsx == "")
            {
                lbthongbao.Text = "Nhập tên hãng sx";
                return;
            }
            else if(status.ToString() == "")
            {
                status = 1;
            }
            if (filehinh.HasFile)
            {
              
                string fileName = DateTime.Now.ToString() + Path.GetFileName(filehinh.PostedFile.FileName);
                fileName = fileName.Replace(" ", "");
                fileName = fileName.Replace("/", "");
                fileName = fileName.Replace(":", "");
                  bool ktkieuanh = KiemTraHieuAnh(fileName);
                  if (ktkieuanh == false)
                  {
                      lbthongbao.Text = "Vui lòng chọn file ảnh";
                      return;
                  }
                  else
                  {
                      filehinh.PostedFile.SaveAs(Server.MapPath("~/images/HinhHangSX/") + fileName);
                      DataProvider.SuaHangSX(mahangsx, tenhangsx, status, fileName);
                      Response.Redirect("HangSanXuat.aspx");
                  }
            }
            else
            {
                DataProvider.SuaHangSX1(mahangsx, tenhangsx, status);
                Response.Redirect("HangSanXuat.aspx");
            }
        }
    }
}