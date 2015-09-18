using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<SanPham> listSP1 = DataProvider.LayDanhSachSanPhamNgauNhien2();
            listCoTheMuonXem.DataSource = listSP1;
            listCoTheMuonXem.DataBind();

            ArrayList listDM = DataProvider.LayDanhMuc();
            ListView1.DataSource = listDM;
            ListView1.DataBind();
            if (Request["danhmuc"] != null)
            {
                int madm = int.Parse(Request["danhmuc"]);
                List<SanPham> listSP = DataProvider.LayDanhSachSanPhamTheoMaDM(madm);
                listSanPham.DataSource = listSP;
                listSanPham.DataBind();
                List<SanPham> listSPMN = DataProvider.LayDanhSachSanPham1();
                listSPMuaNhieu.DataSource = listSPMN;
                listSPMuaNhieu.DataBind();
            }

        }
    }
}