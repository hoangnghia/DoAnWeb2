using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
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
            ArrayList lstnguoidung = DataProvider.LayNguoiDung();
            datalistnguoidung.DataSource = lstnguoidung;
            datalistnguoidung.DataBind();
           // datalistnguoidung.
        }
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
                if(quyen == "Admin")
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