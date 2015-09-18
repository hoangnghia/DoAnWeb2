using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuaNguoiDung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataTable lstnguoidung = new DataTable();
            int mand = int.Parse(Request["MaND"]);
            lstnguoidung = DataProvider.LayNguoiDungChoi(mand);
            datalistsuanguoidung.DataSource = lstnguoidung;
            datalistsuanguoidung.DataBind();

            ArrayList lstlayquyen = new ArrayList();
            lstlayquyen = DataProvider.LayQuyenGioiTinhNguoiDung();
            
            iddrlstquyen.DataSource = lstlayquyen;
            iddrlstquyen.DataTextField = "Quyen";
            iddrlstquyen.DataValueField = "Quyen";
            iddrlstquyen.SelectedIndex = iddrlstquyen.Items.IndexOf(iddrlstquyen.Items.FindByText("GioiTinh"));
            iddrlstquyen.DataBind();
            foreach (DataListItem item in datalistsuanguoidung.Items)
            {
                DropDownList gt = (DropDownList)item.FindControl("iddrlgioitinh");
                gt.DataSource = lstlayquyen; 
                gt.DataTextField = "GioiTinh";
                gt.DataBind();
                gt.ClearSelection();
                foreach (DataRow dr in lstnguoidung.Rows)
                {
                    Session["ssgt"] = dr["GioiTinh"];
                    Session["ssq"] = dr["Quyen"];
                }
                string strgt = Session["ssgt"].ToString();
                string strq = Session["ssq"].ToString();
                gt.Items.FindByText(strgt).Selected = true;
                iddrlstquyen.ClearSelection();
                iddrlstquyen.Items.FindByText(strq).Selected = true;
            }
            
          
         }
    }
    protected void datalistsuanguoidung_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
       foreach(DataListItem item in datalistsuanguoidung.Items)
       {
           System.Web.UI.WebControls.Calendar cldsnd = (System.Web.UI.WebControls.Calendar)item.FindControl("Calendar2");
           string t = cldsnd.SelectedDate.ToShortDateString();
           t = t.Replace("/", "-");
           TextBox txtngsing = (TextBox)item.FindControl("txtNgaySinh");
           txtngsing.Text = t.ToString();
       }
        
    }
    private bool KiemTraSoDienThoai(string sdt)
    {
        Regex isValidInput = new Regex(@"^\d{9,11}$");
        if (!isValidInput.IsMatch(sdt))
        {
            return false;
        }
        return true;
    }
    private bool KiemTraDinhDangemail(string email)
    {
        Regex isValidInput = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        if (!isValidInput.IsMatch(email))
        {
            return false;
        }
        return true;
    }
    protected void btnLuuNguoiDung_Click(object sender, EventArgs e)
    {
        string quyen = iddrlstquyen.SelectedValue;
        foreach(DataListItem item in datalistsuanguoidung.Items)
        {
            TextBox txtmand = (TextBox)item.FindControl("txtMaND");
            TextBox txttaikhoan = (TextBox)item.FindControl("txtTaiKhoan");
            TextBox txthoten = (TextBox)item.FindControl("txtHoTen");
            TextBox txtngaysinh = (TextBox)item.FindControl("txtNgaySinh");
            DropDownList drlgioitinh = (DropDownList)item.FindControl("iddrlgioitinh");
            TextBox txtdiachi = (TextBox)item.FindControl("txaDiaChi");
            TextBox txtthanhpho = (TextBox)item.FindControl("txtThanhPho");
            TextBox txtdienthoai = (TextBox)item.FindControl("txtDienThai");
            TextBox txtemail = (TextBox)item.FindControl("txtEmail");
            int mand = int.Parse(txtmand.Text.ToString());
            string taikhoan = txttaikhoan.Text;
            string hoten = txthoten.Text;
            string gioitinh = drlgioitinh.SelectedValue;
            string diachi = txtdiachi.Text;
            string thanhpho = txtthanhpho.Text;
            string email = txtemail.Text;
            string dienthoai = txtdienthoai.Text;
            bool ktsdt = KiemTraSoDienThoai(dienthoai);
            bool ktdinhdangmail = KiemTraDinhDangemail(email);
           // string ns = txtngaysinh.Text;
           // string ns1 = ns.ToString("yyyy-MM-dd").ToString();
            //DateTime dt = DateTime.ParseExact(txtngaysinh.Text, "yyyy-MM-dd", new CultureInfo("en-US"));
           
            DateTime OutputDate;
            if (DateTime.TryParseExact(txtngaysinh.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out OutputDate))
            {
                string t = OutputDate.Year.ToString();
                int tuoi = Int32.Parse(t);
                string gio = DateTime.Now.Year.ToString();
                if ((Int32.Parse(gio) - tuoi) < 15)
                {
                    lbthongbao.Text = "Tuổi không được nhỏ hơn 15";
                    return;
                }
              
             
                if (taikhoan.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập tài khoản";
                    return;
                }
                else if (hoten.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập họ tên";
                    return;
                }
                else if (diachi.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập địa chỉ";
                    return;
                }
                else if (thanhpho.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập thành phố";
                    return;
                }
                else if (email.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập Eamil";
                    return;
                }
                else if (ktdinhdangmail == false)
                {
                    lbthongbao.Text = "Nhập sai định dạng email";
                    return;
                }
                else if (dienthoai.Replace(" ", "") == "")
                {
                    lbthongbao.Text = "Nhập điện thoại";
                    return;
                }
                else if(ktsdt == false)
                {
                    lbthongbao.Text = "Nhập sai định dạng điện thoại";
                    return;
                }
               
                    else
                    {
                        DataProvider.SuaNguoiDung(mand, quyen, taikhoan, hoten, OutputDate, gioitinh, diachi, thanhpho, email, dienthoai);
                        Response.Redirect("QuanLyNguoiDung.aspx");
                    }
                  
                
             
            }
            else { lbthongbao.Text = "Nhập sai định dạng ngày"; }

        }
    }
}