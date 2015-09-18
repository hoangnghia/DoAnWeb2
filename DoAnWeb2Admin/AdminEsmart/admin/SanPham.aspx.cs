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
        if (!IsPostBack)
        {
            Bind();
        }

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
        CollectionPager2.PageSize = 5;
        CollectionPager2.DataSource = dt.DefaultView;
        CollectionPager2.BindToControl = dtSanPham1;
        dtSanPham1.DataSource = CollectionPager2.DataSourcePaged;
        dtSanPham1.DataBind();
    }
    protected void btnThem_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ThemSanPham.aspx");
    }
    protected void btnXoa_Click1(object sender, ImageClickEventArgs e)
    {
        foreach (DataListItem item in dtSanPham1.Items)
        {
            CheckBox ch = (CheckBox)item.FindControl("cbchonSP");
            if (ch.Checked)
            {
                Label lb = (Label)item.FindControl("lbMaSP");
                string masp = lb.Text;
                DataProvider.DeleteSanPham(masp);
                DataProvider.DeleteCTSPSanPham(masp);
                DataProvider.DeleteHinhSanPham(masp);
                lbThongBao.Text = "Xóa thành công....";
                
            }
            //else
            //{
            //    lbThongBao.Text = "Cần chọn sản phẩm để xóa!!!";
            //}
        }
       Bind();
    }
    protected void LinkClick()
    {

    }

}