using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind();
    }

    private void Bind()
    {
        //ArrayList list = new ArrayList();
        //list = DataProvider.LayDanhSachSanPham();
        DataTable dt = new DataTable();
        dt = DataProvider.LayDanhSachSanPhamChoCollectionPage();
        //dtSanPham.DataSource = dt;
        //dtSanPham.DataBind();
        //Phân trang
        
        CollectionPager2.MaxPages = 1000;
        CollectionPager2.PageSize = 3;
        CollectionPager2.DataSource = dt.DefaultView;
        CollectionPager2.BindToControl = dtSanPham;
        dtSanPham.DataSource = CollectionPager2.DataSourcePaged;
        dtSanPham.DataBind();
    }
    protected void btnThem_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ThemSanPham.aspx");
    }
    protected void btnXoa_Click1(object sender, ImageClickEventArgs e)
    {
        foreach (DataListItem li in dtSanPham.Items)
        {
            CheckBox chked_item = (CheckBox)li.FindControl("cbChonSP");
            if (chked_item != null)
            {
                if (chked_item.Checked == true)
                {
                    Label lb = (Label)li.FindControl("lbMaSP");
                    string masp = lb.Text;
                    DataProvider.DeleteSanPham(masp);
                    DataProvider.DeleteCTSPSanPham(masp);
                    DataProvider.DeleteHinhSanPham(masp);
                    lbThongBao.Text = "Xóa thành công....";
                }
                else
                {
                    lbThongBao.Text = "Cần chọn sản phẩm để xóa!!!";
                }
            }
        }
        Bind();
    }
    protected void LinkClick()
    {

    }

}