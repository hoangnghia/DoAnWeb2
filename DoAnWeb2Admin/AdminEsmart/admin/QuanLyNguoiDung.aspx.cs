using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyNguoiDung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bind();
            //ArrayList lstnguoidung = DataProvider.LayNguoiDung();
            //datalistnguoidung.DataSource = lstnguoidung;
            //datalistnguoidung.DataBind();
           // datalistnguoidung.
        }
    }
    private void Bind()
    {
        //ArrayList list = new ArrayList();
        //list = DataProvider.LayDanhSachSanPham();
        DataTable dt = new DataTable();
        dt = DataProvider.LayNguoiDungChoPhanTrang();
        //dtSanPham.DataSource = dt;
        //dtSanPham.DataBind();
        //Phân trang

        CollectionPager2.MaxPages = 1000;
        CollectionPager2.PageSize =10;
        CollectionPager2.DataSource = dt.DefaultView;
        CollectionPager2.BindToControl = datalistnguoidung;
        datalistnguoidung.DataSource = CollectionPager2.DataSourcePaged;
        datalistnguoidung.DataBind();
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnXoaNguoiDung_Click(object sender, EventArgs e)
    {
        foreach(DataListItem item in datalistnguoidung.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("checkboxchon");
            if(cb.Checked == true)
            {
                Label lbma = (Label)item.FindControl("lblMaND");
                int mand = int.Parse(lbma.Text.ToString());
                Label lbquyen = (Label)item.FindControl("lblQuyen");
                string quyen = lbquyen.Text;
                if(quyen == "admin")
                {
                    lbthongbao.Text = "Không được xóa Admin";
                    return;
                }
                DataProvider.XoaNguoiDung(mand);
            }
        }
        Response.Redirect("QuanLyNguoiDung.aspx");
    }
}