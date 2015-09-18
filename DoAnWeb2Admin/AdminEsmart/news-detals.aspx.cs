using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news_detals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList listDM = new ArrayList();
        listDM = DataProvider.LayDanhMuc();
        ListView1.DataSource = listDM;
        ListView1.DataBind();
        string url = Convert.ToString(Request.QueryString["url"]);
        string content = GetHTML(url);
        int top = 0;
        int bottom = 0;
        top = content.IndexOf("<div id=\"ctl00_IDContent_ctl00_divContent\"");
        if (top > 0)
            content = content.Substring(top + 43, content.Length - top - 44);

        bottom = content.LastIndexOf("<div class=\"related\"");
        content = content.Substring(0, Math.Max(top, bottom - 10));


        //content = content.Replace("http://www.tienphong.vn/", "news-detals.aspx?url=http://www.tienphong.vn/");
        //content = content.Replace("\"/gl/", "News-detals.aspx?url=http://vnexpress.net/gl/");
        //content = content.Replace("/Files", "http://vnexpress.net/Files");
        //content = content.Replace("/Library", "http://vnexpress.net/Library");
        //content = content.Replace("/Images", "http://vnexpress.net/Images");

        Label1.Text = content;
    }
    public string GetHTML(string url)
    {
        if (string.IsNullOrEmpty(url))
        {
            return "";
        }
        string html = "";
        HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream responseStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
        html = reader.ReadToEnd();
        response.Close();
        reader.Close();

        return html;
    }
}