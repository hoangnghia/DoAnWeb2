using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuaSlide : System.Web.UI.Page
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
        string masl = Request["MaSL"];
        list = DataProvider.LaySlideTheoMa(masl);
        dlSuaSlide.DataSource = list;
        dlSuaSlide.DataBind();
    }
    protected void btnThem_Click(object sender, ImageClickEventArgs e)
    {
        foreach (DataListItem it in dlSuaSlide.Items)
        {
            Label masl = (Label)it.FindControl("lbMaSL");
            TextBox tb = (TextBox)it.FindControl("txtLink");
            string ma = masl.Text;
            string link = tb.Text;
            if (FileUpload1.HasFile)
            {
                string file = DateTime.Now.ToString() + Path.GetFileName(FileUpload1.PostedFile.FileName);
                file = file.Replace(" ", "");
                file = file.Replace("/", "");
                file = file.Replace(":", "");
                String pathSave = Server.MapPath("\\images\\");
                FileUpload1.PostedFile.SaveAs(pathSave + file);
                string path = "../images/" + file.ToString();
                DataProvider.UpdateSlide1(ma,path,link,1);
                Response.Redirect("Slide.aspx");
            }
            else
            {
                DataProvider.UpdateSlide2(ma, link, 1);
                Response.Redirect("Slide.aspx");
            }
        }
    }
}