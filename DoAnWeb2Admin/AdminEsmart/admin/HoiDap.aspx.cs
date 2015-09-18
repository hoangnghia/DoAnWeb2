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
        sendMail("hoangnghiagll@gmail.com",txtEmail.Text,"Trả lời thắc mắc",CKEditorControl1.Text, true);
        Response.Redirect("ThacMac.aspx");
    }
    public void sendMail(string emailFrom, string emailTo, string subJect, string body, bool isHTMLBody)
    {
        MailMessage mail = new MailMessage(emailFrom, emailTo);
        SmtpClient client = new SmtpClient();
        client.Port = 587;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;

        client.Host = "smtp.gmail.com";
        mail.Subject = subJect;
        mail.Body = body;
        mail.IsBodyHtml = isHTMLBody;
        client.UseDefaultCredentials = false;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;

        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = emailFrom;
        NetworkCred.Password = "HONmachusE1";
        client.UseDefaultCredentials = true;
        client.Credentials = NetworkCred;
        client.Send(mail);


    }
}