using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HangSanXuat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadHangSanXuat();
    }

    public void LoadHangSanXuat()
    {
        if (!IsPostBack)
        {
            Bind();
            //ArrayList l = new ArrayList();
            //l = DataProvider.LayHangSX();
            //DataList1.DataSource = l;
            //DataList1.DataBind();
        }
    }
    private void Bind()
    {
        //ArrayList list = new ArrayList();
        //list = DataProvider.LayDanhSachSanPham();
        DataTable dt = new DataTable();
        dt = DataProvider.LayHangSXChoPhanTrang();
        //dtSanPham.DataSource = dt;
        //dtSanPham.DataBind();
        //Phân trang

        CollectionPager2.MaxPages = 1000;
        CollectionPager2.PageSize = 5;
        CollectionPager2.DataSource = dt.DefaultView;
        CollectionPager2.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager2.DataSourcePaged;
        DataList1.DataBind();
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       foreach(DataListItem item in DataList1.Items)
       {   
           CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
           if(cb.Checked == true)
           {
               Label lb = (Label)item.FindControl("idmahangsx");
               string mahangsx = lb.Text;
               DataProvider.XoaHangSX(mahangsx);           
               //  Page_Load(sender,e);
               //TextBox1.Text = id.ToString();
           }
          
       }
       Response.Redirect("HangSanXuat.aspx");
     
    }
}