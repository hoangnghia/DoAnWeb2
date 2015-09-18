using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList listDM = new ArrayList();
        if (!IsPostBack)
        {
            listDM = DataProvider.LayDanhMuc();
            ListView1.DataSource = listDM;

            ListView1.DataBind();
        }
    }
}
