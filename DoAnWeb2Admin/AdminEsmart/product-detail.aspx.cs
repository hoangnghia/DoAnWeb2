using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         IList<SanPham> spdetail = new List<SanPham>();
            List<BinhLuan> binhluan = new List<BinhLuan>();

            List<SanPham> listSPLienQuan = new List<SanPham>();
            int madm =1;
            if (!IsPostBack) {
                SanPham sp = null;
                String masp = Request["masp"];
                ArrayList listDM = new ArrayList();
                listDM = DataProvider.LayDanhMuc();
                ListView2.DataSource = listDM;
                ListView2.DataBind();
                if (masp != null)
                {                  
                    sp = DataProvider.LaySanPhamTheoMa(masp);                    
                    spdetail.Add(sp);
                    ListView1.DataSource = spdetail;
                    ListView1.DataBind();
                    madm = int.Parse(sp.MaDM);
                    listSPLienQuan = DataProvider.LayDanhSachSanPhamTheoMaDM(madm);
                    listSanPhamLienQuan.DataSource = listSPLienQuan;
                    listSanPhamLienQuan.DataBind();
                }
                // Load bình luận theo mã sp
                if (masp != null)
                {                  
                    binhluan = DataProvider.LayDanhSachBinhLuanTheoMaSP(masp);
                    listBinhLuan.DataSource = binhluan;
                    listBinhLuan.DataBind();
                }
                else
                {

                }
                
            }
    }
}