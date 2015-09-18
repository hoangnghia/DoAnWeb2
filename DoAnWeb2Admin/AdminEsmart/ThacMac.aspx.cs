using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThacMac : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bind();
        }
    }
    private void Bind()
    {
        ArrayList list = new ArrayList();
        list = DataProvider.LayThacMac();
        dtThacMac.DataSource = list;
        dtThacMac.DataBind();
    }
}