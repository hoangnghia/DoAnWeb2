using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "http://dantri.com.vn/may-tinh-di-dong.rss";
            XmlTextReader reader = new XmlTextReader(url);
            DataSet ds = new DataSet();
            
            ds.ReadXmlSchema("http://www.thearchitect.co.uk/schemas/rss-2_0.xsd");
            ds.ReadXml(reader);
            
            //for (int i = 0; i < ds.Tables["item"].Rows.Count; i++)
            //{
            //    //String abc = "abc";
            //    //Object ob = abc;
            //    ds.Tables["item"].Rows[i]["link"] = "news-detals.aspx?url=" + ds.Tables["item"].Rows[i]["link"].ToString();
            //    ds.Tables["item"].Rows[i]["description"] = Convert.ToString(ds.Tables["item"].Rows[i]["description"]).Replace("href=\"", "href=\"news-detals.aspx?url=");

            //}

            rptRSS.DataSource = ds.Tables["item"];
            rptRSS.DataBind();

            // Lấy danh mục

            ArrayList listDM = new ArrayList();
            if (!IsPostBack)
            {             

                // Lấy danh mục

                listDM = DataProvider.LayDanhMuc();
                listDanhMuc.DataSource = listDM;

                listDanhMuc.DataBind();


            }
    }
}