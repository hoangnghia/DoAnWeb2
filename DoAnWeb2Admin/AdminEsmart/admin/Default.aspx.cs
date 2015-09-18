
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
            //MailMessage objMail = new MailMessage("kduan2704@gmail.com", "kduan274@gmail.com", "kikiki", "lololo");
            //NetworkCredential objNC = new NetworkCredential("KimDuan", "hangngoc");
            //SmtpClient objsmtp = new SmtpClient("smtp.live.com", 587); // for hotmail
            //objsmtp.EnableSsl = true;
            //objsmtp.Credentials = objNC;
            //objsmtp.Send(objMail);
            //MailMessage mail = new MailMessage();
            //mail.From = new MailAddress("kduan2704@gmail.com");
            //string msgSubject = "Test";
            //string msgMessage = "123456";
            //mail.To.Add("kduan274@gmail.com");
            //mail.Subject = msgSubject.ToString();
            //mail.Body = msgMessage.ToString();
            //mail.IsBodyHtml = true;

            //SmtpClient SmtpServer = new SmtpClient("smtp.live.com", 587);
            //SmtpServer.Credentials = new NetworkCredential("kduan2704@gmail.com", "hangngoc");
            //SmtpServer.EnableSsl = true;
            //SmtpServer.UseDefaultCredentials = false;
            //SmtpServer.Send(mail);
            MailMessage mail = new MailMessage("kduan274@gmail.com", "kduan2704@gmail.com");
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            client.Host = "smtp.gmail.com";
            mail.Subject = "lolo";
            mail.Body = "Nghĩa là thằng gay";
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
            lblPassword.Text = "<b>Mail Successfully Sent..!!</b>";
    }
}
