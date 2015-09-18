using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillPage();
        }
    }
    private void FillPage()
    {

        List<SanPham> lisSP = new List<SanPham>();
        List<SanPham> lisSPApple = new List<SanPham>();
        List<SanPham> lisSPSamSung = new List<SanPham>();
        List<SanPham> lisSPNokia = new List<SanPham>();
        List<SanPham> lisSPHTC = new List<SanPham>();
        


        ArrayList listDM = new ArrayList();
        if (!IsPostBack)
        {

            // Lấy danh sách sản phẩm Bán chạy
            lisSP = DataProvider.LayDanhSachSanPhamLoadMoreBanChay(0);
            ListView2.DataSource = lisSP;
            ListView2.DataBind();

            // Lấy danh sách sản phẩm Mới nhất
            lisSP = DataProvider.LayDanhSachSanPhamLoadMoreMoiNhat(0);
            listSanPhaMoi.DataSource = lisSP;
            listSanPhaMoi.DataBind();

            // Lấy danh sách sản phẩm Nổi bật
            lisSP = DataProvider.LayDanhSachSanPhamLoadMoreNoiBat(0);
            listSanPhanNoiBat.DataSource = lisSP;
            listSanPhanNoiBat.DataBind();

            // Lấy danh sách sản phẩm Ngẫu nhiên
            lisSP = DataProvider.LayDanhSachSanPhamNgauNhien();
            listSanPhamNgauNhien.DataSource = lisSP;
            listSanPhamNgauNhien.DataBind();
            // Lấy danh sách sản phẩm Apple
            lisSPApple = DataProvider.LayDanhSachSanPhamMaTheoMaDanhMuc(1);
            listSanPhamApple.DataSource = lisSPApple;
            listSanPhamApple.DataBind();
            // Lấy danh sách sản phẩm SamSung
            lisSPSamSung = DataProvider.LayDanhSachSanPhamMaTheoMaDanhMuc(2);
            listSanPhamSamSung.DataSource = lisSPSamSung;
            listSanPhamSamSung.DataBind();
            // Lấy danh sách sản phẩm Nokia
            lisSPNokia = DataProvider.LayDanhSachSanPhamMaTheoMaDanhMuc(3);
            listSPNoKia.DataSource = lisSPNokia;
            listSPNoKia.DataBind();
            // Lấy danh sách sản phẩm HTC
            lisSPHTC = DataProvider.LayDanhSachSanPhamMaTheoMaDanhMuc(4);
            listSPHTC.DataSource = lisSPHTC;
            listSPHTC.DataBind();
            // Lấy danh mục

            listDM = DataProvider.LayDanhMuc();
            ListView1.DataSource = listDM;

            ListView1.DataBind();


        }

    }
}