using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Slide : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bind();
        }
    }
    private void Bind()
    {
        ArrayList list = new ArrayList();
        list = DataProvider.LaySlide();
        dlSlide.DataSource = list;
        dlSlide.DataBind();
    }
    protected void btnThem_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ThemSlide.aspx");
    }
    protected void btnXoa_Click(object sender, ImageClickEventArgs e)
    {
        foreach(DataListItem it in dlSlide.Items)
        {
            CheckBox cb = (CheckBox)it.FindControl("cbChon");
            if(cb != null)
            {
                if(cb.Checked == true)
                {
                    Label masl = (Label)it.FindControl("lbMaSL");
                    string ma = masl.Text;
                    DataProvider.DeleteSlide(ma);
                    lbThongBao.Text = "Xóa thành công..";
                }
                else
                {
                    lbThongBao.Text = "Bạn cần chọn Slide để xóa";
                }
            }
        }
        Bind();
    }
}