using ESmart;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ThongKe();
            Bind();
        }
    }
    private void ThongKe()
    {
        int thang = DateTime.Now.Month - 1;
        string nam = DateTime.Now.Year.ToString();
            DataTable dt = DataProvider.ReportHome(thang, nam); // Hàm xử lý
            ReportViewer1.Reset();
            ReportDataSource ds = new ReportDataSource("DataSet1", dt);
            ReportViewer1.LocalReport.DataSources.Add(ds);
            ReportViewer1.LocalReport.ReportPath = "admin\\Report2.rdlc";
            ReportViewer1.LocalReport.Refresh();
    }
    private void Bind()
    {
        DataTable list = new DataTable();
        int ngay = DateTime.Now.Day;
        list = DataProvider.LayDonHangMoiNhat(ngay);
        dtDonHang.DataSource = list;
        dtDonHang.DataBind();
    }
}