using ESmart;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThemSlide : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbLink.Visible = false;
        lbMaSL.Visible = false;
        lbHinh.Visible = false;
    }
    protected void btnThem_Click(object sender, ImageClickEventArgs e)
    {
        //if(txtMaSL.Text == "")
        //{
        //    lbMaSL.Visible = true;
        //    txtMaSL.Focus();
        //}
        //else if(txtLink.Text == "")
        //{
        //    lbLink.Visible = true;
        //    txtLink.Focus();
        //}
        if (FileUpload1.HasFile)
        {
            string file = DateTime.Now.ToString() + Path.GetFileName(FileUpload1.PostedFile.FileName);
            file = file.Replace(" ", "");
            file = file.Replace("/", "");
            file = file.Replace(":", "");
            FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "../images/" + file);
            string path = "../images/" + file.ToString();
            DataTable dt = DataProvider.KiemTraInsertSlide(txtMaSL.Text);
            if (dt.Rows.Count > 0)
            {
                lbThongBao.Text = "Mã Slide đã tồn tại";
            }
            else
            {
                DataProvider.ThemSlide(txtMaSL.Text, path, txtLink.Text);
                Response.Redirect("Slide.aspx");
            }
        }
        else
        {
            lbHinh.Visible = true;
            lbThongBao.Text = "Bạn cần chọn file ảnh";
        }
        //Response.Redirect("Slide.aspx");
    }
}