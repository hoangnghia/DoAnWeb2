using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ThemSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            loadDanhMuc();
            loadHangSX();
            lbThongBao(false);
        }
        
    }

    private void loadHangSX()
    {
        ArrayList list = new ArrayList();
        list = DataProvider.LayHangSanXuat();
        DropDownList1.DataSource = list;
        DropDownList1.DataTextField = "TenHSX";
        DropDownList1.DataValueField = "MaHSX";
        DropDownList1.DataBind();
    }

    private void loadDanhMuc()
    {
        ArrayList list = new ArrayList();
        list = DataProvider.LayDanhMuc();
        DropDownList2.DataSource = list;
        DropDownList2.DataTextField = "TenDM";
        DropDownList2.DataValueField = "ID";
        DropDownList2.DataBind();
    }
    protected void btnThem_Click(object sender, ImageClickEventArgs e)
    {
        if (txtMaSP.Text == "")
        {
            lbMaSP.Visible = true;
            txtMaSP.Focus();
        }
        else if (txtTenSP.Text == "")
        {
            lbTenSP.Visible = true;
            txtTenSP.Focus();
        }
        else if (txtGiaCu.Text == "")
        {
            lbGiaCu.Visible = true;
            txtGiaCu.Focus();
        }
        else if (txtGiaMoi.Text == "")
        {
            lbGiaMoi.Visible = true;
            txtGiaMoi.Focus();
        }
        else if (FileUpload1.HasFile == false)
        {
            lbHinhDD.Visible = true;
        }
        else if (FileUpload2.HasFile == false)
        {
            lbHinhCT1.Visible = true;
        }
        else if (FileUpload3.HasFile == false)
        {
            lbHinhCT2.Visible = true;
        }
        else if (FileUpload4.HasFile == false)
        {
            lbHinhCT3.Visible = true;
        }
        else
        {

            if (CheckFileType(FileUpload1.FileName) == true & CheckFileType(FileUpload2.FileName) == true & CheckFileType(FileUpload3.FileName) == true & CheckFileType(FileUpload4.FileName) == true)
            {

                string ngaythem = DateTime.Now.ToString();
                string file = DateTime.Now.ToString() + Path.GetFileName(FileUpload1.PostedFile.FileName);
                string file1 = DateTime.Now.ToString() + Path.GetFileName(FileUpload2.PostedFile.FileName);
                string file2 = DateTime.Now.ToString() + Path.GetFileName(FileUpload3.PostedFile.FileName);
                string file3 = DateTime.Now.ToString() + Path.GetFileName(FileUpload4.PostedFile.FileName);
                file = file.Replace(" ", "");
                file = file.Replace("/", "");
                file = file.Replace(":", "");
                file1 = file1.Replace(" ", "");
                file1 = file1.Replace("/", "");
                file1 = file1.Replace(":", "");
                file2 = file2.Replace(" ", "");
                file2 = file2.Replace("/", "");
                file2 = file2.Replace(":", "");
                file3 = file3.Replace(" ", "");
                file3 = file3.Replace("/", "");
                file3 = file3.Replace(":", "");
                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file);
                FileUpload2.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file1);
                FileUpload3.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file2);
                FileUpload4.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file3);
                string path = "../images/" + file.ToString();
                string path1 = "../images/" + file1.ToString();
                string path2 = "../images/" + file2.ToString();
                string path3 = "../images/" + file3.ToString();
                string cke = CKEditorControl1.Text;
                DataTable dt = DataProvider.KiemTraInsertSP(txtMaSP.Text);
                if (dt.Rows.Count >0)
                {
                    lbThongBaoLoiFile.Text = ".!!! Mã sản phẩm đã tồn tại, vui lòng kiểm tra lại....";
                    txtMaSP.Focus();
                    return;
                }
                else
                {
                    DataProvider.InsertSanPham(txtMaSP.Text, txtTenSP.Text, Convert.ToDouble(txtGiaCu.Text), Convert.ToDouble(txtGiaMoi.Text), DropDownList1.SelectedValue.ToString(), DropDownList2.SelectedValue.ToString(), path, cke, ddTinhTrang.SelectedValue, 1, ngaythem);
                    DataProvider.InsertChiTietSanPham(txtMaSP.Text, txtSKU.Text, txtModel.Text, txtManHinh.Text, txtTrongLuong.Text, txtMauSac.Text, txtKTMH.Text, txtBNT.Text, txtBNN.Text, txtCamera.Text, txtHDH.Text, txtLoaiPin.Text, txtCKN.Text, txtBaoHanh.Text, txtCPU.Text, 1);
                    DataProvider.InsertHinhSanPham(txtMaSP.Text, path1, path2, path3);
                    Response.Redirect("SanPham.aspx");
                }
            }

            else
            {
                lbThongBaoLoiFile.Text = ".!!!..Lỗi chọn file, vui lòng kiểm tra lại....";
            }
        }
    }

    private bool lbThongBao( bool t)
    {
        lbMaSP.Visible = t;
        lbTenSP.Visible = t;
        lbGiaCu.Visible = t;
        lbGiaMoi.Visible = t;
        lbHinhDD.Visible = t;
        lbHinhCT1.Visible = t;
        lbHinhCT2.Visible = t;
        lbHinhCT3.Visible = t;
        lbTinhTrang.Visible = t;
        return t;
    }
    private bool CheckFileType(string FileName)
    {
        string ext = Path.GetExtension(FileName);
        if (ext.Equals(".png") || ext.Equals(".jpg"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}