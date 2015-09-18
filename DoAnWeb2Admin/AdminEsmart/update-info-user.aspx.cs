using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class update_info_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ArrayList listDM = DataProvider.LayDanhMuc();
            ListView1.DataSource = listDM;
            ListView1.DataBind();
        }
    }
}