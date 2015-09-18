using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList listDM = new ArrayList();
        listDM = DataProvider.LayDanhMuc();
        ListView1.DataSource = listDM;
        ListView1.DataBind();
        Session.Remove("giohang");
    }
}