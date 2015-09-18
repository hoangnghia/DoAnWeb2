using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NguoiDung nguoidung = new NguoiDung();
        IList<NguoiDung> nd = new List<NguoiDung>();
        IList<SanPhamGioHang> listSPGH = new List<SanPhamGioHang>();
        if (!IsPostBack)
        {
            ArrayList listDM = DataProvider.LayDanhMuc();
            ListView2.DataSource = listDM;

            ListView2.DataBind();

            if (Session["giohang"] != null)
            {
                listSPGH = (IList<SanPhamGioHang>)Session["giohang"];
                ListView1.DataSource = listSPGH;
                ListView1.DataBind();


            }
            else
            {
                this.Response.Redirect("/");
            }
            if (Session["username"] != null)
            {
                NguoiDung ndd = new NguoiDung();
                ndd = DataProvider.LayNguoiDungDangNhapTheoTen(Session["username"].ToString());
                nd.Add(ndd);
                lstNguoiDung.DataSource = nd;
                lstNguoiDung.DataBind();
            }
            else
            {
                this.Response.Redirect("/");
            }



        }
    }
}