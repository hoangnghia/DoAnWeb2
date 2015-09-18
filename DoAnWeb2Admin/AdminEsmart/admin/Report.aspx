<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="lbTittle"> Bảng thống kê : </div>
     <div class ="lbSesson"> Tháng : <asp:Label ID ="lbThang" runat="server" Text="."></asp:Label></div>
    <div class ="lbSesson"> Quý : <asp:Label ID ="lbQuy" runat="server" Text="."></asp:Label></div>
    <div class ="lbSesson">Năm : <asp:Label ID ="lbNam" runat="server" Text="."></asp:Label></div>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="500px" style="margin-bottom: 13px" Width="1071px">
    </rsweb:ReportViewer>
    
    <br />
</asp:Content>

