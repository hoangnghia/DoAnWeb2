using ESmart;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HoiDap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LayThacMac();
    }
    private void LayThacMac()
    {
        ArrayList list = new ArrayList();
        string email = Request["Email"];
        list = DataProvider.LayThacMacTheoEmail(email);
        dtHoiDap.DataSource = list;
        dtHoiDap.DataBind();
        txtEmail.Text = email;
        
    }
    protected void btnSend_Click(object sender, ImageClickEventArgs e)
    {
        MailMessage mail = new MailMessage("kduan274@gmail.com", txtEmail.Text);
        SmtpClient client = new SmtpClient();
        client.Port = 587;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.Host = "smtp.gmail.com";
        mail.Body = CKEditorControl1.Text;
        mail.IsBodyHtml = true;
        client.UseDefaultCredentials = false;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;

        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = "kduan274@gmail.com";
        NetworkCred.Password = "hangngoc";
        client.UseDefaultCredentials = true;
        client.Credentials = NetworkCred;
        client.Send(mail);
        string email = Request["Email"];
        DataProvider.XoaThacMac(email);
        Response.Redirect("ThacMac.aspx");
    }
}