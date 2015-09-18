using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuaDanhMuc : System.Web.UI.Page
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

        ArrayList list = new ArrayList();
        int ma = Convert.ToInt32( Request["ID"]); 
        list = DataProvider.LayTungDanhMuc(ma);
        DataList1.DataSource = list;
        DataList1.DataBind();
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        
        DanhMuc dm = new DanhMuc() ;
        foreach (DataListItem li in DataList1.Items)
        {
            Label madm = (Label)li.FindControl("txtMaDM");
            TextBox tendm = (TextBox)li.FindControl("txtTenDM");
            if(madm.Text=="")
            {
                lbThongBao.Visible = true;
                lbThongBao.Text = "Error!!! nhập mã Danh Mục";
                madm.Focus();
            }
            else if (tendm.Text == "")
            {
                lbThongBao.Visible = true;
                lbThongBao.Text = "Error!!! nhập tên Danh Mục";
                tendm.Focus();
            }
            else
            {
                dm.ID = Convert.ToInt32( madm.Text);
                dm.TenDM = tendm.Text;
                DataProvider.UpdateDanhMuc(dm);
                Response.Redirect("DanhMuc.aspx");
            }
        }
    }
}