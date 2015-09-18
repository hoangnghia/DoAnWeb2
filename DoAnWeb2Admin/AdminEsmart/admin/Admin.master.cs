
using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["username"] == null)
        //{
        //    Response.Redirect("SignIn.aspx");
        //}
        //else
        //{
        //    lbUsername.Text = Session["username"].ToString();
        //}
        if (!IsPostBack)
        {
            if (Session["taikhoan"] != null)
            {
                //string taikhoan = Session["taikhoan"].ToString();
                //idlbltaikhoan.Text = taikhoan;
                ArrayList lstnguoidung = new ArrayList();
                int mand = int.Parse(Session["mand"].ToString());
                lstnguoidung = DataProvider.LayChiTietNguoiDung(mand);
                foreach (NguoiDung nd in lstnguoidung)
                {
                    string a = nd.TaiKhoan;
                    idlbltaikhoan.Text = a.ToString();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }

        }
    }
}
