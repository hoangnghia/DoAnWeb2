<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="DanhMuc.aspx.cs" Inherits="Slide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="stylemain">
        <div class="styleheader0">
            <p>QUẢN LÝ DANH MỤC</p>
        </div>
        <div class="styleheader1">
            <div class="styleheader11">
            <asp:Label ID="label4" runat="server" Text="Tên DM : "></asp:Label>
            <asp:TextBox ID="txtTenDM" runat="server"></asp:TextBox>
         <div class="buttonAdd"><div class="textButton"><asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/images/add.png" Width="34px" Height="31px" OnClick="btnThem_Click"/></div> 
         </div>
        </div>
        </div>
        <div class="styleheader2">
            <div class="style5"><p>Chọn</p></div>
                    <div class="style1"> <p>Mã Danh mục</p></div>
                     <div class= "style11"><p> Tên Danh mục</p></div>
                    
        </div>
                <asp:DataList ID="dtDanhMuc" runat="server">
                <ItemTemplate>
                <div class="stylecontent">
                    <div class="style4"><asp:CheckBox ID="cbChonDM" runat="server" /></div>
                    <div class="style2"> <asp:Label ID="lbMaDM" runat="server" Text='<%# Bind("MaDM") %>'></asp:Label></div>
                    <div class="style3"> <asp:Label ID="lbTenDM" runat="server" Text='<%# Bind("TenDM") %>'></asp:Label></div>
                    <div class="style6"><a href='<%# "SuaDanhMuc.aspx?MaDM="+Eval("MaDM") %>'><img src="../images/update.png" style=" Width: 28px; Height: 16px;" /></a></div>
                </div>   
        </ItemTemplate>
    </asp:DataList>
        <div class="stylefooter">
            <div class="button">
                 <div class="textButton"> <asp:ImageButton ID="btnXoa" runat="server" ImageUrl="~/images/delete.png" Width="34px" Height="31px" OnClick="btnXoa_Click1" /></div>
            </div>
             <div class="thongbao"><asp:Label ID="lbThongBao" runat="server" Text="..."></asp:Label></div>
        </div>
        </div>
    </asp:Content>

