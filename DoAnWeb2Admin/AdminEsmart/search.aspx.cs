using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList listsp = new ArrayList();


        ArrayList listDM = DataProvider.LayDanhMuc();
        ListView3.DataSource = listDM;
        ListView3.DataBind();

        if (!IsPostBack)
        {
            List<SanPham> listSP1 = DataProvider.LayDanhSachSanPhamNgauNhien2();
            listCoTheMuonXem.DataSource = listSP1;
            listCoTheMuonXem.DataBind();
            if (Session["search"] != null)
            {
                listsp = (ArrayList)Session["search"];
                ListView1.DataSource = listsp;
                ListView1.DataBind();
                ListView2.DataSource = listsp;
                ListView2.DataBind();
                //Session["search"] = null;
            }
        }
    }
}