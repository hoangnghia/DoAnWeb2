using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myprofle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NguoiDung nguoidung = new NguoiDung();
        IList<NguoiDung> nd = new List<NguoiDung>();

        if (!IsPostBack)
        {

            if (Session["username"] != null)
            {
        
            ArrayList listDM = DataProvider.LayDanhMuc();
            ListView1.DataSource = listDM;
            ListView1.DataBind();

                nguoidung = DataProvider.LayNguoiDungDangNhapTheoTen(Session["username"].ToString());
                nd.Add(nguoidung);
                listNguoiDung.DataSource = nd;
                listNguoiDung.DataBind();

            }

            else
            {
                this.Response.Redirect("/");
            }


        }
    }
}