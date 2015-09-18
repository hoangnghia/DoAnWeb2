using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanLyLoiHeThong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
            //DataTable tb = new DataTable();
            //tb = DataProvider.LayLoiHeThong();
            //DataList1.DataSource = tb;
            //DataList1.DataBind();
        }
    }
    private void Bind()
    {
        //ArrayList list = new ArrayList();
        //list = DataProvider.LayDanhSachSanPham();
        DataTable dt = new DataTable();
        dt = DataProvider.LayLoiHeThongChoPhanTrang();
        //dtSanPham.DataSource = dt;
        //dtSanPham.DataBind();
        //Phân trang

        CollectionPager2.MaxPages = 1000;
        CollectionPager2.PageSize =2;
        CollectionPager2.DataSource = dt.DefaultView;
        CollectionPager2.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager2.DataSourcePaged;
        DataList1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in DataList1.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
            if (cb.Checked == true)
            {
                Label lb = (Label)item.FindControl("idid");
                int id = int.Parse(lb.Text.ToString()) ;
                DataProvider.XoaLoiHeThong(id);
                //  Page_Load(sender,e);
                //TextBox1.Text = id.ToString();
            }

        }
        Response.Redirect("QuanLyLoiHeThong.aspx");
    }
}