using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CKEditor.NET;
using System.IO;
using System.Data;

public partial class SuaSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bind();
            CTSP();
            HinhSP();
        }
    }
    private void Bind()
    {
        DataTable list = new DataTable();
        string ma = Request["MaSP"];
        list = DataProvider.LayDanhSachChiTietSanPham2(ma);
        ltSanPham.DataSource = list;
        ldCKE.DataSource = list;
        ldCKE.DataBind();
        ltSanPham.DataBind();
        //lấy danh mục
        ArrayList listDM = new ArrayList();
        listDM = DataProvider.LayDanhMuc();
        foreach (DataListItem item in ltSanPham.Items)
        {
            DropDownList2.DataSource = listDM;
            DropDownList2.DataTextField = "TenDM";
            DropDownList2.DataValueField = "ID";
            DropDownList2.DataBind();
           DropDownList2.SelectedIndex = DropDownList2.Items.IndexOf(DropDownList2.Items.FindByText("TenDM"));
            foreach (DataRow dr in list.Rows)
            {
                Session["danhmuc"] = dr["TenDM"];

            }
            string dm = Session["danhmuc"].ToString();
            DropDownList2.Items.FindByText(dm).Selected = true;
        }
        //Lấy hãng sản xuất 

        ArrayList listHSX = new ArrayList();
        listHSX = DataProvider.LayHangSanXuat();
        foreach (DataListItem item in ltSanPham.Items)
        {
            DropDownList1.DataSource = listHSX;
            DropDownList1.DataTextField = "TenHSX";
            DropDownList1.DataValueField = "MaHSX";
            DropDownList1.DataBind();
            DropDownList2.SelectedIndex = DropDownList2.Items.IndexOf(DropDownList2.Items.FindByText("TenHSX"));
            foreach (DataRow dr in list.Rows)
            {
                Session["hangSX"] = dr["TenHSX"];

            }
            string hangsx = Session["hangSX"].ToString();
            DropDownList1.Items.FindByText(hangsx).Selected = true;
        }
    }
    private void CTSP()
    {
        ArrayList list = new ArrayList();
        string ma = Request["MaSP"];
        list = DataProvider.LayDanhSachChiTietSanPham(ma);
        dtlCTSP.DataSource = list;
        dtlCTSP.DataBind();
    }
    private void HinhSP()
    {
        ArrayList list = new ArrayList();
        string ma = Request["MaSP"];
        list = DataProvider.LayHinhSanPham(ma);
        dtHinhSanPham.DataSource = list;
        dtHinhSanPham.DataBind();
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string file = DateTime.Now.ToString() + Path.GetFileName(FileUpload1.PostedFile.FileName);
            file = file.Replace(" ", "");
            file = file.Replace("/", "");
            file = file.Replace(":", "");
            FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file);
            string path = "../images/" + file.ToString();
            if(CheckFileType(FileUpload1.FileName))
            {
                foreach (DataListItem li in ltSanPham.Items)
                {
                    Label masp = (Label)li.FindControl("lbMaSP");
                    TextBox ten = (TextBox)li.FindControl("txtTenSP");
                    TextBox giac = (TextBox)li.FindControl("txtGiaCu");
                    TextBox giam = (TextBox)li.FindControl("txtGiaMoi");
                    TextBox mt = (TextBox)li.FindControl("txtMoTa");
                    TextBox tt = (TextBox)li.FindControl("txtTinhTrang");
                    foreach (DataListItem it in ldCKE.Items)
                    {
                        CKEditorControl cke = (CKEditorControl)it.FindControl("CKEMoTa");
                        string m = masp.Text;
                        string tensp = ten.Text;
                        double giacu = Convert.ToDouble(giac.Text);
                        double giamoi = Convert.ToDouble(giam.Text);
                        string mota = cke.Text;
                        string tinhtrang = tt.Text;
                        string mahsx = DropDownList1.SelectedValue.ToString();
                        string madm = DropDownList2.SelectedValue.ToString();
                        DataProvider.UpdateSanPham1(m, tensp, giacu, giamoi, mahsx, madm, path, mota, tinhtrang, 1);
                    }
                }
            }
            else
            {
                lbDM.Text = "error...";
            }
        }
        else if (FileUpload2.HasFile & FileUpload3.HasFile & FileUpload4.HasFile)
        {
            string file1 = DateTime.Now.ToString() + Path.GetFileName(FileUpload2.PostedFile.FileName);
            string file2 = DateTime.Now.ToString() + Path.GetFileName(FileUpload3.PostedFile.FileName);
            string file3 = DateTime.Now.ToString() + Path.GetFileName(FileUpload4.PostedFile.FileName);
            file1 = file1.Replace(" ", "");
            file1 = file1.Replace("/", "");
            file1 = file1.Replace(":", "");
            file2 = file2.Replace(" ", "");
            file2 = file2.Replace("/", "");
            file2 = file2.Replace(":", "");
            file3 = file3.Replace(" ", "");
            file3 = file3.Replace("/", "");
            file3 = file3.Replace(":", "");
            FileUpload2.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file1);
            FileUpload3.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file2);
            FileUpload4.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file3);
            string path1 = "../images/" + file1.ToString();
            string path2 = "../images/" + file2.ToString();
            string path3 = "../images/" + file3.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham(m, path1, path2, path3);
            }
        }
        else if (FileUpload2.HasFile & FileUpload3.HasFile)
        {

            string file2 = DateTime.Now.ToString() + Path.GetFileName(FileUpload2.PostedFile.FileName);
            string file3 = DateTime.Now.ToString() + Path.GetFileName(FileUpload3.PostedFile.FileName);
            file2 = file2.Replace(" ", "");
            file2 = file2.Replace("/", "");
            file2 = file2.Replace(":", "");
            file3 = file3.Replace(" ", "");
            file3 = file3.Replace("/", "");
            file3 = file3.Replace(":", "");
            FileUpload2.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file2);
            FileUpload3.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file3);
            string path1 = "../images/" + file2.ToString();
            string path2 = "../images/" + file3.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham4(m, path1, path2);
            }
        }
        else if (FileUpload3.HasFile & FileUpload4.HasFile)
        {
            string file3 = DateTime.Now.ToString() + Path.GetFileName(FileUpload3.PostedFile.FileName);
            string file4 = DateTime.Now.ToString() + Path.GetFileName(FileUpload4.PostedFile.FileName);
            file3 = file3.Replace(" ", "");
            file3 = file3.Replace("/", "");
            file3 = file3.Replace(":", "");
            file4 = file4.Replace(" ", "");
            file4 = file4.Replace("/", "");
            file4 = file4.Replace(":", "");
            FileUpload3.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file3);
            FileUpload4.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file4);
            string path2 = "../images/" + file3.ToString();
            string path3 = "../images/" + file4.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham5(m, path2, path3);
            }
        }
        else if (FileUpload2.HasFile & FileUpload4.HasFile)
        {
            string file2 = DateTime.Now.ToString() + Path.GetFileName(FileUpload2.PostedFile.FileName);
            string file4 = DateTime.Now.ToString() + Path.GetFileName(FileUpload4.PostedFile.FileName);
            file2 = file2.Replace(" ", "");
            file2 = file2.Replace("/", "");
            file2 = file2.Replace(":", "");
            file4 = file4.Replace(" ", "");
            file4 = file4.Replace("/", "");
            file4 = file4.Replace(":", "");
            FileUpload2.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file2);
            FileUpload4.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file4);
            string path1 = "../images/" + file2.ToString();
            string path3 = "../images/" + file4.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham6(m, path1, path3);
            }
        }
        else if (FileUpload2.HasFile)
        {
            string file2 = DateTime.Now.ToString() + Path.GetFileName(FileUpload2.PostedFile.FileName);
            file2 = file2.Replace(" ", "");
            file2 = file2.Replace("/", "");
            file2 = file2.Replace(":", "");
            FileUpload2.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file2);
            string path1 = "../images/" + file2.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham1(m, path1);
            }
        }
        else if (FileUpload3.HasFile)
        {
            string file3 = DateTime.Now.ToString() + Path.GetFileName(FileUpload3.PostedFile.FileName);
            file3 = file3.Replace(" ", "");
            file3 = file3.Replace("/", "");
            file3 = file3.Replace(":", "");
            FileUpload3.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file3);
            string path1 = "../images/" + file3.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham2(m, path1);
            }
        }
        else if (FileUpload4.HasFile)
        {
            string file4 = DateTime.Now.ToString() + Path.GetFileName(FileUpload4.PostedFile.FileName);
            file4 = file4.Replace(" ", "");
            file4 = file4.Replace("/", "");
            file4 = file4.Replace(":", "");
            FileUpload4.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file4);
            string path1 = "../images/" + file4.ToString();
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                string m = masp.Text;
                DataProvider.UpdateHinhSanPham3(m, path1);
            }
        }
        else
        {
            lbDM.Text = "*";
            lbHSX.Text = "*";
            foreach (DataListItem li in ltSanPham.Items)
            {
                Label masp = (Label)li.FindControl("lbMaSP");
                TextBox ten = (TextBox)li.FindControl("txtTenSP");
                TextBox giac = (TextBox)li.FindControl("txtGiaCu");
                TextBox giam = (TextBox)li.FindControl("txtGiaMoi");
                TextBox tt = (TextBox)li.FindControl("txtTinhTrang");
                string m = masp.Text;
                string tensp = ten.Text;
                double giacu = Convert.ToDouble(giac.Text);
                double giamoi = Convert.ToDouble(giam.Text);
                string tinhtrang = tt.Text;
                string mahsx = DropDownList1.SelectedValue.ToString();
                string madm = DropDownList2.SelectedValue.ToString();
                foreach (DataListItem it in ldCKE.Items)
                {
                    CKEditorControl cke = (CKEditorControl)it.FindControl("CKEMoTa");
                    string mota = cke.Text;
                    DataProvider.UpdateSanPham2(m, tensp, giacu, giamoi, mahsx, madm, mota, tinhtrang, 1);
                    foreach (DataListItem item in dtlCTSP.Items)
                    {
                        TextBox ck = (TextBox)item.FindControl("txtSKU");
                        TextBox md = (TextBox)item.FindControl("txtModel");
                        TextBox mh = (TextBox)item.FindControl("txtManHinh");
                        TextBox tl = (TextBox)item.FindControl("txtTrongLuong");
                        TextBox ms = (TextBox)item.FindControl("txtMauSac");
                        TextBox ktmh = (TextBox)item.FindControl("txtKTMH");
                        TextBox bnt = (TextBox)item.FindControl("txtBoNhoTrong");
                        TextBox bnn = (TextBox)item.FindControl("txtBoNhoNgoai");
                        TextBox cmr = (TextBox)item.FindControl("txtCamera");
                        TextBox hdh = (TextBox)item.FindControl("txtHDH");
                        TextBox lp = (TextBox)item.FindControl("txtLoaiPin");
                        TextBox ckn = (TextBox)item.FindControl("txtCongKetNoi");
                        TextBox bh = (TextBox)item.FindControl("txtBaoHanh");
                        TextBox cp = (TextBox)item.FindControl("txtCPU");
                        string sku = ck.Text;
                        string model = md.Text;
                        string manhinh = mh.Text;
                        string trongluong = tl.Text;
                        string mausac = ms.Text;
                        string kichthuocmh = ktmh.Text;
                        string bonhotrong = bnt.Text;
                        string bonhongoai = bnn.Text;
                        string camera = cmr.Text;
                        string hedieuhanh = hdh.Text;
                        string loaipin = lp.Text;
                        string congketnoi = ckn.Text;
                        string baohanh = bh.Text;
                        string cpu = cp.Text;
                        DataProvider.UpdateChiTietSanPham(m, sku, model, manhinh, trongluong, mausac, kichthuocmh, bonhotrong, bonhongoai, camera, hedieuhanh, loaipin, congketnoi, baohanh,cpu, 1);
                    }
                }
               
            }
        }
        Response.Redirect("SanPham.aspx");
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