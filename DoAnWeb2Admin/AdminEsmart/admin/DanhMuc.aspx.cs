using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Data;
using ESmart;
using System.Text;
using System.Net;
using System.IO;
public partial class Slide : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }

    }

    private void Bind()
    {
        lbThongBao.Visible = false;
        ArrayList l = new ArrayList();
        l = DataProvider.LayDanhMuc();
        dtDanhMuc.DataSource = l;
        dtDanhMuc.DataBind();
    }
    protected void btnThem_Click(object sender, ImageClickEventArgs e)
    {
        if (txtTenDM.Text == "")
        {
            lbThongBao.Visible = true;
            lbThongBao.Text = "Error!!! : nhập tên Danh Mục";
            txtTenDM.Focus();
        }
        else
        {
            string ten = txtTenDM.Text;
            DataTable d = DataProvider.KiemTraInsertDanhMuc(ten);
            if(d.Rows.Count > 0)
            {
                lbThongBao.Visible = true;
                lbThongBao.Text = "Error...Tên danh mục đã tồn tại!!!";
                return;
            }
            else
            {
                lbThongBao.Visible = true;
                lbThongBao.Text = "Error d**!!!";
                DanhMuc dm = new DanhMuc();
                string tendm = txtTenDM.Text;
                DataProvider.InsertDanhMuc(tendm);
            }
           Bind();
        }

    }
    protected void btnXoa_Click1(object sender, ImageClickEventArgs e)
    {
        foreach (DataListItem li in dtDanhMuc.Items)
        {
            CheckBox chked_item = (CheckBox)li.FindControl("cbChonDM");
            if (chked_item != null)
            {
                if (chked_item.Checked == true)
                {
                    lbThongBao.Visible = true;
                    lbThongBao.Text = "click ngon!!!";
                    Label lb = (Label)li.FindControl("lbMaDM");
                    int madm = int.Parse((lb.Text).ToString());
                    DataProvider.DeleteDanhMuc(madm);
                }
                else
                {
                    lbThongBao.Text = "Lỗi xảy ra...Bạn cần chọn danh mục để thực hiện xóa!!!";
                }
            }
            else
            {
                lbThongBao.Text = "Lỗi xảy ra...Bạn cần chọn Danh mục để thực hiện xóa!!!";
            }
        }
        Bind();
    }
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        //DataList1.EditItemTemplate = e.Item.ItemIndex;
        //Bind();
    }
        //foreach (DataListItem li in DataList1.Items)
        //{
        //    CheckBox chked_item = (CheckBox)li.FindControl("cbChon");
        //    if (chked_item != null)
        //    {
        //        if (chked_item.Checked == true)
        //        {
        //            lbThongBao.Visible = true;
        //            lbThongBao.Text = "click ngon!!!";
        //            Label lb = (Label)li.FindControl("lbMaDM");
        //            int madm = int.Parse((lb.Text).ToString());
        //            DataProvider.DeleteDanhMuc(madm);

        //        }
        //        else
        //        {
        //            lbThongBao.Visible = true;
        //            lbThongBao.Text = "Error...Bạn cần chọn danh mục cần xóa!!!";
        //        }
        //    }
        //    Bind();
        //}
}