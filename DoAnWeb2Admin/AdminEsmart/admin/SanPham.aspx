<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SanPham.aspx.cs" Inherits="SanPham" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="stylemainSP">
        <div class="styleheader1SP">
            <p>QUẢN LÝ SẢN PHẨM </p>
        </div>
       <div class="styleheader3SP">
            <div class="styleSP00"><div class="text"> Chọn</div></div>
            <div class="styleSP01"><div class="text">Mã SP</div></div>
            <div class="styleSP02"><div class="text"> Tên SP</div></div>
            <div class="styleSP03"><div class="text">Giá cũ</div></div>
            <div class="styleSP04"><div class="text">Giá mới</div></div>
            <div class="styleSP05"><div class="text">Hãng SX</div></div>
            <div class="styleSP06"><div class="text">Danh Mục</div></div>
            <div class="styleSP07"><div class="text">Hình ảnh</div></div>
           <div class="styleSP010"><div class="text">Mô tả</div></div>
            <div class="styleSP08"><div class="text">Tình trạng</div></div>
           <div class="styleSP09"><div class="text">Sửa</div></div>
        </div>
           <asp:DataList ID="dtSanPham1" runat="server">
               <ItemTemplate>
                   <div class="styleSP0"><div class="dataSP"><asp:CheckBox ID="cbchonSP" runat="server" /></div></div>
                   <div class="styleSP1"><div class="dataSP"><asp:Label ID="lbMaSP" runat="server" Text='<%# Bind("MaSP") %>'></asp:Label></div></div>
                   <div class="styleSP2"><div class="dataSP"><asp:Label ID="lbTenSP" runat="server" Text='<%# Bind("TenSP") %>'></asp:Label></div></div>
                   <div class="styleSP3"><div class="dataSP"><asp:Label ID="lbGiaCu" runat="server" Text='<%# Bind("GiaCu") %>'></asp:Label></div></div>
                   <div class="styleSP4"><div class="dataSP"><asp:Label ID="lbGiaMoi" runat="server" Text='<%# Bind("GiaMoi") %>'></asp:Label></div></div>
                   <div class="styleSP5"><div class="dataSP"><asp:Label ID="lbHSX" runat="server" Text='<%# Bind("TenHSX") %>'></asp:Label></div></div>
                   <div class="styleSP6"><div class="dataSP"><asp:Label ID="lbMaDM" runat="server" Text='<%# Bind("TenDM") %>'></asp:Label></div></div>
                   <div class="styleSP7"><img alt ="" src='<%# Eval("HinhSP") %>' runat="server" style="width:70px; height:80px;" /></div>
                   <div class="styleSP10"><div class="dataSP"><asp:Label ID="lbMoTa" runat="server" Text='<%# Bind("MoTa") %>'></asp:Label></div></div>
                   <div class="styleSP8"><div class="dataSP"> <asp:Label ID="lbTinhTrang" runat="server" Text='<%# Bind("TinhTrang") %>'></asp:Label></div></div>
                   <div class="styleSP9"><div class="dataSP"><a href='<%# "SuaSanPham.aspx?MaSP="+Eval("MaSP") %>'><img src="../images/update.png" style=" Width: 44px; Height: 42px;" /></a></div> </div>
               </ItemTemplate>
           </asp:DataList>
       <div class="phantrang" style="margin-right: 33px;"><cc2:CollectionPager PageNumbersStyle="padding: 20px;" ID="CollectionPager2" runat="server" ResultsFormat="{0}->{1} (của {2}) Sản phẩm" ShowFirstLast="True" SliderSize="5" PagingMode="QueryString"></cc2:CollectionPager></div>
       <div class="stylefooterSP">
             <div class="buttonSP2">
                 <div class="textButton"> <asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/images/addlist.png" Width="52px" Height="45px" OnClick="btnThem_Click1"/></div>
                <div class="textButton1">Thêm mới</div>
            </div>
            <div class="buttonSP1">
                 <div class="textButton"> <asp:ImageButton ID="btnXoa" runat="server" ImageUrl="~/images/clear1.png" Width="52px" Height="45px" OnClick="btnXoa_Click1"/></div>
                <div class="textButton1">Xóa</div>
            </div>
             <div class="thongbaoSP">
                <div class="textlable"><asp:Label ID="lbThongBao" runat="server" Text ="..."></asp:Label></div>
            </div>
        </div>
   </div>
</asp:Content>

