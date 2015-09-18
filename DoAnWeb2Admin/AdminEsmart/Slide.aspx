<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Slide.aspx.cs" Inherits="Slide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Slidestylemain">
        <div class="Slidestyleheader0">
            <p>QUẢN LÝ SLIDE</p>
        </div>
        <div class="Slidestyleheader1">
            <div class="Slidestyleheader2">
                    <div class="Slidestyle0"><p>Chọn</p></div>
                    <div class="Slidestyle0"> <p>Mã Slide</p></div>
                    <div class="Slidestyle1"> <p>Hình Slide</p></div>
                    <div class= "Slidestyle2"><p> Link Hình</p></div>      
        </div>
            <asp:DataList ID="dlSlide" runat="server">
                <ItemTemplate>
                <div class="stylecontent">
                    <div class="Slidestyle5"><p><asp:CheckBox ID="cbChon" runat="server" /></p></div>
                    <div class ="Slidestyle7"><p><asp:Label ID ="lbMaSL" runat="server" Text='<%# Eval("MaSL") %>'></asp:Label></p></div>
                    <div class="Slidestyle3"><img alt ="" src='<%# Eval("HinhAnh") %>' runat="server" style="width:165px; height:122px;" /></div>
                    <div class="Slidestyle4"> <p><asp:Label ID="lbTenDM" runat="server" Text='<%# Bind("Link") %>'></asp:Label></p></div>
                    <div class="Slidestyle6"><p><a href='<%# "SuaSlide.aspx?MaSL="+Eval("MaSL") %>'><img src="images/update.png" style=" Width: 45px; Height: 52px;" /></a></p></div>
                </div>   
        </ItemTemplate>
    </asp:DataList>
         </div>
        <div class="Slidestylefooter">
            <div class="buttonSlide">
                 <div class="textButton"> <asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/images/addlist.png" Width="52px" Height="45px" OnClick="btnThem_Click"/></div>
                <div class="textButton1">Thêm mới</div>
            </div>
            <div class="buttonSlide">
                 <div class="textButton"> <asp:ImageButton ID="btnXoa" runat="server" ImageUrl="~/images/clear1.png" Width="52px" Height="45px" OnClick="btnXoa_Click"/></div>
                <div class="textButton1">Xóa</div>
            </div>
             <div class="thongbao"><asp:Label ID="lbThongBao" runat="server" Text="..."></asp:Label></div>
        </div>
   </div>
</asp:Content>

