<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ThongKe.aspx.cs" Inherits="ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="stylemain">
        <div class="styleheader0">
            <p>THỐNG KÊ DOANH THU</p>
        </div>
        <div class="styleTK">
            <div class="styleTK1">
                <div class="stylerightTK1">
                   Thống kê theo tháng :
                </div>
                <div class="styleleftTK1">
                    <div class="styleleftTK1left">
                        <div class="styleleftTK1left1">
                            Tháng :
                       <asp:DropDownList ID="ddlThang" runat="server" style="height: 30px; color: blue;font-size: 16px;border-radius: 6px; width: 135px;">
                           <asp:ListItem Value="1">Th&#225;ng 1</asp:ListItem>
                           <asp:ListItem Value="2">Th&#225;ng 2</asp:ListItem>
                           <asp:ListItem Value="3">Th&#225;ng 3</asp:ListItem>
                           <asp:ListItem Value="4">Th&#225;ng 4</asp:ListItem>
                           <asp:ListItem Value="5">Th&#225;ng 5</asp:ListItem>
                           <asp:ListItem Value="6">Th&#225;ng 6</asp:ListItem>
                           <asp:ListItem Value="7">Th&#225;ng 7</asp:ListItem>
                           <asp:ListItem Value="8">Th&#225;ng 8</asp:ListItem>
                           <asp:ListItem Value="9">Th&#225;ng 9</asp:ListItem>
                           <asp:ListItem Value="10">Th&#225;ng 10</asp:ListItem>
                           <asp:ListItem Value="11">Th&#225;ng 11</asp:ListItem>
                           <asp:ListItem Value="12">Th&#225;ng 12</asp:ListItem>
                       </asp:DropDownList>
                        </div>
                         <div class="styleleftTK1left2">
                             Năm : 
                       <asp:DropDownList ID="ddlNamTKThang" runat="server" style="height: 30px; color: blue;font-size: 16px;border-radius: 6px; width: 135px;">
                           <asp:ListItem Value="2014">2014</asp:ListItem>
                           <asp:ListItem Value="2015">2015</asp:ListItem>
                           <asp:ListItem Value="2016">2016</asp:ListItem>
                           <asp:ListItem Value="2017">2017</asp:ListItem>
                           <asp:ListItem Value="2018">2018</asp:ListItem>
                           <asp:ListItem Value="2019">2019</asp:ListItem>
                           <asp:ListItem Value="2020">2020</asp:ListItem>
                       </asp:DropDownList>
                        </div>
                    </div>
                     <div class="styleleftTK1right">
                         <div class="btnXem"><asp:ImageButton ID="btnTKTheoThang" ImageUrl="~/images/Next.png" runat="server" style="width: 42px;" OnClick="btnTKTheoThang_Click"/></div>
                    </div>
                </div>

        </div>
            <div class="styleTK1">
                <div class="stylerightTK1">
                   Thống kê theo quý :
                </div>
                <div class="styleleftTK1">
                    <div class="styleleftTK1left">
                        <div class="styleleftTK1left1">
                            Quý... :
                       <asp:DropDownList ID="ddlQuy" runat="server" style="height: 30px; color: blue;font-size: 16px;border-radius: 6px; width: 135px;">
                           <asp:ListItem Value="1">Qu&#253; 1</asp:ListItem>
                           <asp:ListItem Value="2">Qu&#253; 2</asp:ListItem>
                           <asp:ListItem Value="3">Qu&#253;  3</asp:ListItem>
                           <asp:ListItem Value="4">Qu&#253;  4</asp:ListItem>
                       </asp:DropDownList>
                        </div>
                         <div class="styleleftTK1left2">
                             Năm : 
                       <asp:DropDownList ID="ddlNamTKQuy" runat="server" style="height: 30px; color: blue;font-size: 16px;border-radius: 6px; width: 135px;">
                           <asp:ListItem Value="2014">2014</asp:ListItem>
                           <asp:ListItem Value="2015">2015</asp:ListItem>
                           <asp:ListItem Value="2016">2016</asp:ListItem>
                           <asp:ListItem Value="2017">2017</asp:ListItem>
                           <asp:ListItem Value="2018">2018</asp:ListItem>
                           <asp:ListItem Value="2019">2019</asp:ListItem>
                           <asp:ListItem Value="2020">2020</asp:ListItem>
                       </asp:DropDownList>
                        </div>
                    </div>
                     <div class="styleleftTK1right">
                         <div class="btnXem"><asp:ImageButton ID="btnThongKeQuy" ImageUrl="~/images/Next.png" runat="server" style="width: 42px;" OnClick="btnThongKeQuy_Click" /></div>
                    </div>
                </div>

        </div>
            <div class="styleTK1">
                <div class="stylerightTK1">
                   Thống kê theo năm :
                </div>
                <div class="styleleftTK1">
                    <div class="styleleftTK1left">
                         <div class="styleleftTK1left22">
                             Năm : 
                       <asp:DropDownList ID="ddlNamTKNam" runat="server" style="height: 30px; color: blue;font-size: 16px;border-radius: 6px; width: 135px;">
                           <asp:ListItem Value="2014">2014</asp:ListItem>
                           <asp:ListItem Value="2015">2015</asp:ListItem>
                           <asp:ListItem Value="2016">2016</asp:ListItem>
                           <asp:ListItem Value="2017">2017</asp:ListItem>
                           <asp:ListItem Value="2018">2018</asp:ListItem>
                           <asp:ListItem Value="2019">2019</asp:ListItem>
                           <asp:ListItem Value="2020">2020</asp:ListItem>
                       </asp:DropDownList>
                        </div>
                    </div>
                     <div class="styleleftTK1right">
                         <div class="btnXem"><asp:ImageButton ID="btnXemTheoNam" ImageUrl="~/images/Next.png" runat="server" style="width: 42px;" OnClick="btnXemTheoNam_Click" /></div>
                    </div>
                </div>
        </div>
        </div>
        </div>
</asp:Content>

