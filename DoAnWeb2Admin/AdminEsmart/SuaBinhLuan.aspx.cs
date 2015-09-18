using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuaBinhLuan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataTable tbbinhluan = new DataTable();
            int mabl = int.Parse(Request["MaBL"].ToString());
            tbbinhluan = DataProvider.LayChiTietBinhLuan(mabl);
            datalistchitietbinhlua.DataSource = tbbinhluan;
            datalistchitietbinhlua.DataBind();

            foreach (DataListItem item in datalistchitietbinhlua.Items)
            {
                TextBox txtma = (TextBox)item.FindControl("txtmand");
                int mand = int.Parse(txtma.Text.ToString());
                ArrayList lstnguoidung = DataProvider.LayNguoiDungTheoMa(mand);
                iddrlstnguoidung.DataSource = lstnguoidung;
                iddrlstnguoidung.DataTextField = "TaiKhoan";
                iddrlstnguoidung.DataValueField = "MaND";
                iddrlstnguoidung.DataBind();
                iddrlsanpham.DataSource = tbbinhluan;
                iddrlsanpham.DataTextField = "TenSP";
                iddrlsanpham.DataBind();
            }
           
            //DataTable lsttensp = DataProvider.LaySanPhamChoDonHang();
            //iddrlsanpham.DataSource = lsttensp;
            //iddrlsanpham.DataTextField = "TenSP";
            //iddrlsanpham.DataValueField = "MaSP";
            //iddrlsanpham.DataBind();
        }
    }
    protected void btnLuuBinhLuan_Click(object sender, EventArgs e)
    {
        int mabl = int.Parse(Request["MaBL"].ToString());
        int mand = int.Parse(iddrlstnguoidung.SelectedValue.ToString());
        string masp = iddrlsanpham.SelectedValue.ToString();
        foreach (DataListItem item in datalistchitietbinhlua.Items)
        {
            TextBox txtnoidung = (TextBox)item.FindControl("txtNoiDung");

            TextBox txtngaybl = (TextBox)item.FindControl("txtNgayBinhLuan");
            string noidung = txtnoidung.Text;
            
            DateTime OutputDate;
            if (DateTime.TryParseExact(txtngaybl.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out OutputDate))
            {
                
               if(txtnoidung.Text.Replace(" ","") == "")
               {
                   lbthongbao.Text = "Nhập nội dung!!!";
                   return;
               }
                else
                {
                    DataProvider.CapNhapBinhLuan(mabl,mand,noidung,OutputDate,masp);
                    Response.Redirect("QuanLyBinhLuan.aspx");
                }

            }
            else { lbthongbao.Text = "Nhập sai định dạng ngày"; }

        }
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        foreach (DataListItem item in datalistchitietbinhlua.Items)
        {
            System.Web.UI.WebControls.Calendar cldsnd = (System.Web.UI.WebControls.Calendar)item.FindControl("Calendar2");
            string t = cldsnd.SelectedDate.ToShortDateString();
            t = t.Replace("/", "-");
            TextBox txtngaybl = (TextBox)item.FindControl("txtNgayBinhLuan");
            txtngaybl.Text = t.ToString();
        }
    }
}