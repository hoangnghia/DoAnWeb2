using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<DonHang> listDH = new List<DonHang>();

        if (!IsPostBack)
        {
            ArrayList listDM = new ArrayList();
            listDM = DataProvider.LayDanhMuc();
            ListView1.DataSource = listDM;
            ListView1.DataBind();

            if (Session["mand"] != null)
            {
                int mand = int.Parse(Session["mand"].ToString());
                listDH = DataProvider.LayDanhSachDonHangTheoMaND(mand);
                if (listDH.Count == 0)
                {
                    listOerderNull.Visible = true;
                }
                listOerderNull.Visible = false;
                listDonHang.DataSource = listDH;
                listDonHang.DataBind();
            }
            else
            {
                this.Response.Redirect("/");
            }

        }
    }
}