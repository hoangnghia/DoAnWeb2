<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#cccccc">
<tr>
<td width="100" align="right" bgcolor="#eeeeee" class="header1"> To</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtTo" runat="server" Columns="50"></asp:TextBox></td>
</tr>
<tr>
<td width="100" align="right" bgcolor="#eeeeee" class="header1"> From</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtFrom" runat="server" Columns="50"></asp:TextBox></td>
</tr>
<tr>
<td align="right" bgcolor="#eeeeee" class="header1"> SMTP Server</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtSMTPServer" runat="server" Columns="50"></asp:TextBox></td>
</tr>
<tr>
<td width="100" align="right" bgcolor="#eeeeee" class="header1"> Subject</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtSubject" runat="server" Columns="50"></asp:TextBox></td>
</tr>
<tr>
<td width="100" align="right" bgcolor="#eeeeee" class="header1"> Body</td>
<td bgcolor="#FFFFFF"><asp:TextBox ID="txtBody" runat="server" Columns="40" TextMode="MultiLine"></asp:TextBox></td>
</tr>
<tr>
<td align="right" bgcolor="#eeeeee" class="header1">Action</td>
<td bgcolor="#FFFFFF"><asp:Button ID="btnSubmit" runat="server" Text="Send Email" OnClick="btnSubmit_Click" /></td>
</tr>
<tr>
<td width="100" align="right" bgcolor="#eeeeee" class="header1">Status</td>
<td bgcolor="#FFFFFF" class="basix">
    <asp:Label ID="lblPassword" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
</table>

    </div>
    </form>
</body>
</html>
