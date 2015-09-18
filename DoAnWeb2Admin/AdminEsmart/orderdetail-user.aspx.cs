using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderdetail_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<SanPhamGioHang> listSPGH = new List<SanPhamGioHang>();
            int a = 100;
            List<DonHang> listDH = new List<DonHang>();
            
            DonHang dh = new DonHang();
            if (!IsPostBack)
            {
                ArrayList listDM = new ArrayList();
                listDM = DataProvider.LayDanhMuc();
                ListView1.DataSource = listDM;
                ListView1.DataBind();
                if (Session["mand"] != null)
                {
                     
                     if (Request["mahoadon"] != null)
                     {
                         int mahoadon = int.Parse(Request["mahoadon"]);
                         int mand = int.Parse(Session["mand"].ToString());
                         listSPGH = DataProvider.LayDanhSachChiTietDonHangTheoMaHoaDon(mahoadon);
                         
                         listSP.DataSource = listSPGH;
                         listSP.DataBind();

                         dh = DataProvider.LoadDonHangTheoMaHoaDon(mahoadon);
                         listDH.Add(dh);
                         listDonHang.DataSource = listDH;
                         listDonHang.DataBind();
                     }
                   
                }
                else
                {
                    this.Response.Redirect("/");
                }

            }
        //public boolean ShowControl(string msg)
        //{
        //    if (msg == HttpContext.Current.Profile.UserName)
        //        return true;
        //    else
        //        return false;
        //}
    }
}