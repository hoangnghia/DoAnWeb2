<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuanLyChiTietDonHang.aspx.cs" Inherits="QuanLyChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="toanbo">
         <div id ="tieudechucnang">
         <div id="tentieude">Quản Lý Chi Tiết Đơn Hàng</div> <div id="themxoa"><div id="chucnangthem"><a href ="ThemChiTietDonHang.aspx">Thêm</a></div> <div id="chucnangxoa"> <asp:Button ID="btnXoaChiTietDonHang" runat="server" OnClick="btnXoaChiTietDonHang_Click" Text="Xóa" Class ="clbtnxoanguoidung" CssClass="clbtnxoanguoidung"/> </div></div>              
         </div>
    <asp:DataList ID="datalstchhitietdonhang" runat="server" CssClass="cldtlstdonhang" css="cldtlstdonhang">
        <ItemTemplate>
             <div id="idphannoidung">
              <%--<div id="idmadonhang1">
                <div id="chudh1">lưa chọn </div> <div id="thongtindh">  <asp:CheckBox ID="CheckBox1" runat="server" /> </div>
            </div>--%>
            <div id="idmadonhang">
               
                <div id="thongtindh"> <asp:Label ID="idlblMaDonHang" runat="server" Text='<%# Bind("ID") %>' CssClass="cllblmadonhang" css="cllblmadonhang" Visible ="false"></asp:Label> </div>
            </div>

                   <div id="idmadonhang">
              <%-- <div id="chudh">Mã Đơn Hàng </div>--%> <div id="thongtindh"> <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaDH") %>' Visible="false" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:Label> </div>
            </div>

                   <div id="idmadonhang1">
               <div id="chudh1">Sản Phẩm</div> <div id="thongtindh"> <asp:Label ID="Label5" runat="server" Text='<%# Bind("TenSP") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                  <div id="idmadonhang">
               <%--<div id="chudh1">Địa Chỉ</div>--%> <div id="thongtindh"> <asp:Label ID="lblhoten" runat="server" Text='<%# Bind("HoTen") %>' Visible="false" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
                 <div id="idmadonhang">
               <%--<div id="chudh1">Địa Chỉ</div>--%> <div id="thongtindh"> <asp:Label ID="lbldiachi" runat="server" Text='<%# Bind("DiaChi") %>' Visible="false" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
                    <div id="idmadonhang">
               <%--<div id="chudh1">Địa Chỉ</div>--%> <div id="thongtindh"> <asp:Label ID="lbltinhtrang" runat="server" Text='<%# Bind("ttdh") %>' Visible="false" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
                  <div id="idmadonhang">
               <%--<div id="chudh1">Địa Chỉ</div>--%> <div id="thongtindh"> <asp:Label ID="lblloaithanhtoan" runat="server" Text='<%# Bind("LoaiThanhToan") %>' Visible="false" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
                  <div id="idmadonhang">
               <%--<div id="chudh1">Địa Chỉ</div>--%> <div id="thongtindh"> <asp:Label ID="lbltongtien" runat="server" Text='<%# Bind("TongTien","{0:0,0} vnđ") %>' Visible="false" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                   <div id="idmadonhang1">
               <div id="chudh1">Số Lượng </div> <div id="thongtindh"> <asp:Label ID="Label2" runat="server" Text='<%# Bind("SoLuong") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                   <div id="idmadonhang1">
               <div id="chudh1">Đơn Giá </div> <div id="thongtindh"> <asp:Label ID="Label3" runat="server" Text='<%# Bind("DonGia","{0:0,0} vnđ") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                   <div id="idmadonhang1">
               <div id="chudh1">Thành Tiền </div> <div id="thongtindh"> <asp:Label ID="Label4" runat="server" Text='<%# Bind("ThanhTien","{0:0,0} vnđ") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                 
               
                </div>
              
        </ItemTemplate>
    </asp:DataList>
           <div id="idmadonhang1">
               <div id="chudh1"> Họ Tên </div> <div id="thongtindh"> <asp:Label ID="lbhoten" runat="server" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
          <div id="idmadonhang1">
               <div id="chudh1"> Địa chỉ </div> <div id="thongtindh"> <asp:Label ID="lbdiachi" runat="server" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
          <div id="idmadonhang1">
               <div id="chudh1">Tình Trạng: </div> <div id="thongtindh"> <asp:Label ID="lbtinhtrang" runat="server" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
          <div id="idmadonhang1">
               <div id="chudh1">Loại Thanh Toán </div> <div id="thongtindh"> <asp:Label ID="lbloaithanhtoan" runat="server" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
           <div id="idmadonhang1">
               <div id="chudh1">Tổng Tiền </div> <div id="thongtindh"> <asp:Label ID="lbtongtien" runat="server" CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
         </div>
</asp:Content>

