<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contentHome">
        <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="SanPham.aspx"><img src="images/folder-iphone-icon.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   <a href="SanPham.aspx"> Sản Phẩm </a>
               </div>
           </div>
        </div>
         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="QuanLyBinhLuan.aspx"><img src="images/comment.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   Comment
               </div>
           </div>
        </div>
         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="QuanLyDonHang.aspx"><img src="images/hoadon.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   Hóa Đơn
               </div>
           </div>
        </div>
         <div class="content1">
          <div class="SanPham">
               <div class="icon">
                   <a href="QuanLyNguoiDung.aspx"><img src="images/user-group-icon.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   Tài Khoản
               </div>
           </div>
        </div>
        <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="BaoCao.aspx"><img src="images/report.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                    Báo Cáo
               </div>
           </div>
        </div>
         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="ThongKe.aspx"><img src="images/thongke.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   Thống Kê
               </div>
           </div>
        </div>

         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="Slide.aspx"><img src="images/slide.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   Slide
               </div>
           </div>
        </div>

         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="DanhMuc.aspx"><img src="images/search.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                   <a href="DanhMuc.aspx">Danh Mục</a>
               </div>
           </div>
        </div>

         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="HangSanXuat.aspx"><img src="images/product.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                    <a href="HangSanXuat.aspx">Hãng SX</a>
               </div>
           </div>
        </div>

         <div class="content1">
           <div class="SanPham">
               <div class="icon">
                   <a href="ThacMac.aspx"><img src="images/email.png" style="height: 73px; width: 64px" /></a>
               </div>
                <div class="icon">
                  <a href="ThacMac.aspx">Thắc mắc</a>
               </div>
           </div>
        </div>
    </div>
    <div class="contentFooterLert">
        <div class="DonHang">   Đơn hàng mới </div>
        <div class="ContentDonHangMoi">
       <div class="styleheaderDonHang">
            <div class="styleCot1"><div class="text">Đơn hàng </div></div>
            <div class="styleCot2"><div class="text"> Số tiền </div></div>
            <div class="styleCot3"><div class="text">Tình Trạng</div></div>
            <div class="styleCot4"><div class="text">Ngày Lập</div></div>
           <div class="styleCot5"><div class="text">Xem</div></div>
        </div>
        <div class="stylecontentDonHang">
         <asp:DataList ID="dtDonHang" runat="server">
               <ItemTemplate>
                   <div class="styleCot6"><div class="textTM"><asp:Label ID="lbMaDH" runat="server" Text='<%# Bind("ID") %>'></asp:Label></div></div>
                   <div class="styleCot7"><div class="textTM"><asp:Label ID="lbSoTien" runat="server" Text='<%# Bind("TongTien") %>'></asp:Label></div></div>
                   <div class="styleCot8"><div class="textTM"><asp:Label ID="lbTinhTrang" runat="server" Text='<%# Bind("TinhTrang") %>'></asp:Label></div></div>
                   <div class="styleCot9"><div class="textTM"><asp:Label ID="lbNgayLap" runat="server" Text='<%# Bind("NgayLap") %>'></asp:Label></div></div>
                   <div class="styleCot10"><a href='<%# "ChiTietDonHang.aspx?ID="+Eval("ID") %>'><img src="images/Next.png" style=" Width: 43px; Height: 30px;" /></a> </div>
               </ItemTemplate>
           </asp:DataList>
            </div>
        </div>
    </div>
    <div class="contentFooterRight">
        <div class="ContentThongKe">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="391px" style="margin-right: 0px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="378px">
                <LocalReport ReportPath="Report2.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="DataSet1TableAdapters."></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

