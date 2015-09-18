using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThemChiTietDonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //int madh = int.Parse(Request["ID"]); 
            DataTable lsttensp = DataProvider.LaySanPhamChoDonHang();
            iddrlsanpham.DataSource = lsttensp;
            iddrlsanpham.DataTextField = "TenSP";
            iddrlsanpham.DataValueField = "MaSP";
            iddrlsanpham.DataBind();
            DataTable lsdonhang = DataProvider.LayDonHangChoDonHang();
            iddrlstmadonhang.DataSource = lsdonhang;
            iddrlstmadonhang.DataTextField = "ID";
            iddrlstmadonhang.DataValueField = "ID";
            iddrlstmadonhang.DataBind();        
        }
    }
    protected void iddrlsanpham_SelectedIndexChanged(object sender, EventArgs e)
    {
        string masp = iddrlsanpham.SelectedValue;
        DataTable lstdongia = DataProvider.LayGiaSPChoDonHang(masp);
        idrldongia.DataSource = lstdongia;
        idrldongia.DataTextField = "GiaMoi";
        idrldongia.DataValueField = "GiaMoi";
        idrldongia.DataBind();
        if (IsNumber(txtSoLuong.Text.ToString()) == false)
        {
            lbthongbao.Text = "Số lượng chỉ được nhập số!!!!";
            return;
        }
        if (txtSoLuong.Text.Replace(" ", "") == "")
        {
            lbthongbao.Text = "Nhập số lượng!!!!";
            return;
        }
        if (idrldongia.Text == "")
        {
            lbthongbao.Text = "chọn sản phẩm để hiển thị giá!!!!";
            return;
        }
        else
        {
            lbthongbao.Text = "";
            long tien = long.Parse(txtSoLuong.Text.ToString()) * long.Parse(idrldongia.Text.ToString());
            //txtTongTien.Text = tien.ToString();
            txtTongTien.Text = tien.ToString("#,###");
        }

    }
    protected void btnLuuCTDonHang_Click(object sender, EventArgs e)
    {
        //double tien = double.Parse(txtSoLuong.Text.ToString()) * double.Parse(idrldongia.Text.ToString());
        int madh = int.Parse(iddrlstmadonhang.Text);
        string masp = iddrlsanpham.SelectedValue;
        int soluong = int.Parse(txtSoLuong.Text.ToString());
        //float dongia = float.Parse(idrldongia.Text);
        //float thanhtien = float.Parse(txtTongTien.Text);
        long dongia = long.Parse(idrldongia.SelectedValue.ToString());
        long thanhtien = long.Parse(txtTongTien.Text.ToString().Replace(",",""));
        DataProvider.ThemChiTietDonHang(madh,masp,soluong,dongia,thanhtien,1);
        DataProvider.CapNhapDonHangKhiThemChiTiet(madh, "Chưa Thanh Toán", thanhtien);
        Response.Redirect("QuanLyDonHang.aspx");
    }
    public bool IsNumber(string pValue)
    {
        foreach (Char c in pValue)
        {
            if (!Char.IsDigit(c))
                return false;
        }
        return true;
    }
    //protected void btnTinhTien_Click(object sender, EventArgs e)
    //{
    //    long tien = long.Parse(txtSoLuong.Text.ToString()) * long.Parse(idrldongia.Text.ToString());
    //    txtTongTien.Text = tien.ToString();
    //}
    protected void txtSoLuong_TextChanged(object sender, EventArgs e)
    {
        //int soluong = int.Parse(txtSoLuong.Text.ToString());
        if(IsNumber(txtSoLuong.Text.ToString()) == false)
        {
            lbthongbao.Text = "Số lượng chỉ được nhập số!!!!";
            return;
        }
       if(txtSoLuong.Text.Replace(" ","") == "")
       {
           lbthongbao.Text = "Nhập số lượng!!!!";
           return;
       }
       if(idrldongia.Text == "")
        {
            lbthongbao.Text = "chọn sản phẩm để hiển thị giá!!!!";
            return;
        }
        else
        {
            lbthongbao.Text = "";
            long tien = long.Parse(txtSoLuong.Text.ToString()) * long.Parse(idrldongia.Text.ToString());
          //  txtTongTien.Text = tien.ToString();
            txtTongTien.Text = tien.ToString("#,###");
        }
       
    }
    protected void idrldongia_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int soluong = int.Parse(txtSoLuong.Text.ToString());
        if (IsNumber(txtSoLuong.Text.ToString()) == false)
        {
            lbthongbao.Text = "Số lượng chỉ được nhập số!!!!";
            return;
        }
        if (txtSoLuong.Text.Replace(" ", "") == "")
        {
            lbthongbao.Text = "Nhập số lượng!!!!";
            return;
        }
        if (idrldongia.Text == "")
        {
            lbthongbao.Text = "chọn sản phẩm để hiển thị giá!!!!";
            return;
        }
        else
        {
            lbthongbao.Text = "";
            long tien = long.Parse(txtSoLuong.Text.ToString()) * long.Parse(idrldongia.Text.ToString());
           // txtTongTien.Text = tien.ToString();
             txtTongTien.Text = tien.ToString("#,###");
        }
    }
}