<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
    <title></title>
</head>
    <body class="loginbody">

<div class="loginwrapper">
	<div class="loginwrap zindex100">
	<h1 class="logintitle"><span class="iconfa-lock"></span> Sign In <span class="subtitle">Đăng nhập bằng tài khoản Admin</span></h1>
        <div class="loginwrapperinner">
            <form id="loginform" runat="server">
                <p class="animate4 bounceIn">
                    <asp:TextBox ID="txtusername" runat="server" CssClass="inputusername" placeholder="Username"></asp:TextBox>
                </p>
                 <div class="lbthongbao"><asp:Label ID="lbUsername" runat="server" Text="..."></asp:Label></div>
                <p class="animate5 bounceIn">
                    <asp:TextBox ID="txtpassword"  type="password"  runat="server" CssClass="inputpassword" placeholder="Password"></asp:TextBox></p>
               <div class="lbthongbao"> <asp:Label ID="lbPass" runat="server" Text="..."></asp:Label></div>
                <p class="animate6 bounceIn">
                    <asp:Button ID="btnDangNhap" runat="server" OnClick="btnDangNhap_Click" Text="Summit" CssClass="btnDangKi" Font-Bold="True" style="color:#252526;padding-left: 12px;" />
                </p>
              <div class ="forgot"> Forgot Password?</div>
            </form>
        </div><!--loginwrapperinner-->
    </div>
    <div class="loginshadow animate3 fadeInUp"></div>
</div><!--loginwrapper-->




</body>
</html>
