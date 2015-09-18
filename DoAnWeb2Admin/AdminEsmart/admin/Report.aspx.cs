using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting;
using System.Data;
using ESmart;
using Microsoft.Reporting.WebForms;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lbNam.Text = Session["TKTheoNam"].ToString();
            lbQuy.Text = Session["Quy"].ToString();
            lbThang.Text = Session["Thang"].ToString();
            if (lbThang.Text != ".")
            {
                //lbQuy.Text = Session["Thang"].ToString();
                lbNam.Text = Session["NamTKThang"].ToString();
                string thang = lbThang.Text;
                string nam = lbNam.Text;
                DataTable dt = DataProvider.ReportThang(thang,nam);
                ReportViewer1.Reset();
                ReportDataSource ds = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.DataSources.Add(ds);
                ReportViewer1.LocalReport.ReportPath = "admin\\Report.rdlc";
                ReportViewer1.LocalReport.Refresh();
            }
            else if(lbQuy.Text != ".")
            {
                if (lbQuy.Text == "1")
                {
                    string nam = Session["NamTKQuy"].ToString();
                    lbNam.Text = nam;
                    DataTable dt = DataProvider.ReportQuy1(nam);
                    ReportViewer1.Reset();
                    ReportDataSource ds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.DataSources.Add(ds);
                    ReportViewer1.LocalReport.ReportPath = "admin\\Report.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                }
                if (lbQuy.Text == "2")
                {
                    string nam = Session["NamTKQuy"].ToString();
                    lbNam.Text = nam;
                    DataTable dt = DataProvider.ReportQuy2(nam);
                    ReportViewer1.Reset();
                    ReportDataSource ds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.DataSources.Add(ds);
                    ReportViewer1.LocalReport.ReportPath = "admin\\Report.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                }
                if (lbQuy.Text == "3")
                {
                    string nam = Session["NamTKQuy"].ToString();
                    lbNam.Text = nam;
                    DataTable dt = DataProvider.ReportQuy3(nam);
                    ReportViewer1.Reset();
                    ReportDataSource ds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.DataSources.Add(ds);
                    ReportViewer1.LocalReport.ReportPath = "admin\\Report.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                }
                if (lbQuy.Text == "4")
                {
                    string nam = Session["NamTKQuy"].ToString();
                    lbNam.Text = nam;
                    DataTable dt = DataProvider.ReportQuy4(nam);
                    ReportViewer1.Reset();
                    ReportDataSource ds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.DataSources.Add(ds);
                    ReportViewer1.LocalReport.ReportPath = "admin\\Report.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                }
            }
            else
            {
                lbNam.Text = Session["TKTheoNam"].ToString();
                string nam = lbNam.Text;
                DataTable dt = DataProvider.ReportNam(nam);
                ReportViewer1.Reset();
                ReportDataSource ds = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.DataSources.Add(ds);
                ReportViewer1.LocalReport.ReportPath = "admin\\Report.rdlc";
                ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}