<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="HinhSanPham.aspx.cs" Inherits="HinhSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="stylemainSP">
        <div class="styleheader1SP">
            <p>HÌNH CHI TIẾT SẢN PHẨM </p>
        </div>
       <div class="styleheader3SP">
            <div class="styleHSP01"><div class="text">Mã SP</div></div>
            <div class="styleHSP02"><div class="text"> Tên SP</div></div>
            <div class="styleHSP03"><div class="text">Giá cũ</div></div>
            <div class="styleHSP04"><div class="text">Giá mới</div></div>
           <div class="styleHSP05"><div class="text">Sửa</div></div>
        </div>
         <asp:DataList ID="dtHinhSanPham" runat="server">
               <ItemTemplate>
                   <div class="styleHSP6"><div class="dataSP"><asp:Label ID="lbMaDM" runat="server" Text='<%# Bind("MaSP") %>'></asp:Label></div></div>
                   <div class="styleHSP7"><img alt ="" src='<%# Eval("HinhAnh1") %>' runat="server" style="width:100px; height:90px;" /></div>
                   <div class="styleHSP7"><img alt ="" src='<%# Eval("HinhAnh2") %>' runat="server" style="width:100px; height:90px;" /></div>
                   <div class="styleHSP7"><img alt ="" src='<%# Eval("HinhAnh3") %>' runat="server" style="width:100px; height:90px;" /></div>
                   <div class="styleHSP9"><div class="dataSP"><a href='<%# "SuaSanPham.aspx?MaSP="+Eval("MaSP") %>'><img src="images/update.png" style=" Width: 44px; Height: 42px;" /></a></div> </div>
               </ItemTemplate>
           </asp:DataList>
   </div>
</asp:Content>

