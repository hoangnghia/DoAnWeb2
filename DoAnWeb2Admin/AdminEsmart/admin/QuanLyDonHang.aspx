<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="QuanLyDonHang.aspx.cs" Inherits="QuanLyDonHang" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Quản Lý Đơn Hàng</div> <div id="themxoa"><div id="chucnangthem"><a href ="ThemDonHang.aspx">Thêm</a></div> <div id="chucnangxoa"> <asp:Button ID="btnXoaBinhLuan" runat="server" Text="Xóa" UseSubmitBehavior="true" OnClick="btnXoaBinhLuan_Click" CssClass="clbtnxoabinhlua" css="clbtnxoabinhlua"/>
             <asp:Button ID="btnThanhToan" runat="server" Text="Thanh Toán" UseSubmitBehavior="true" OnClick="btnThanhToan_Click" CssClass="clbtnthanhtoandonhang" css="clbtnthanhtoandonhang"/> </div>  </div>        
         </div>
           <div id ="tieude">
           
              <div id ="cotloc">
               <div id="thongtindh"> <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" CssClass="cllblmadonhang" Class="cllblmadonhang">
                <asp:ListItem>Tất Cả</asp:ListItem>
                      <asp:ListItem>Đã Thanh Toán</asp:ListItem>
                <asp:ListItem>Chưa Thanh Toán</asp:ListItem>
               </asp:DropDownList> 
                                           </div></div>
         </div>
         <div id ="tieude">
             <div id ="cot0">Lựa chọn</div><%--<div id ="idcotmabinhluan">Mã Bình Luận</div> --%><div id="cot2">Người Dùng</div> <div id="cot3">Tổng tiền</div> <div id="cot4">Địa Chỉ</div> <div id ="cot5">Tình Trạng</div> <div id ="6">Thao Tác</div>
             
         </div>
         
    <asp:DataList ID="datalistdonhang" runat="server">
           
               <ItemTemplate>

            <div id="tieude1">
            <div id="cot0">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                </div>
             <div id="idcotmabinhluan">
                 <asp:Label ID="idlblMaDonHang" runat="server" Visible ="false" Text='<%# Bind("ID") %>'>
                    </asp:Label>
                </div>
             <div id="cot2">
                   <asp:Label ID="Idmahangsx" runat="server" Text='<%# Bind("HoTen") %>'></asp:Label>
                </div>
             <div id="cot3">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TongTien","{0:0,0} vnđ") %>'></asp:Label>
                </div>
             <div id="cot4">
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("DiaChi") %>'></asp:Label>
                </div>
            <div id="cot5">
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("TinhTrang") %>'></asp:Label>
                </div>
              <div id="cot6">
                  <a href ='<%# "QuanLyChiTietDonHang.aspx?ID=" + Eval("ID") %>' >Xem</a>                
                </div>
         </div>
           
            </ItemTemplate>
        
    </asp:DataList>
            <div class="phantrang" style="margin-right: 33px;"><cc2:CollectionPager PageNumbersStyle="padding: 20px;" ID="CollectionPager2" runat="server" ResultsFormat="{0}->{1} (của {2}) Đơn hàng" ShowFirstLast="True" SliderSize="5" PagingMode="QueryString"></cc2:CollectionPager></div>
                      
    </div>
  <%--  <div id="toanbo">
         <div id ="tieudechucnang">
         <div id="tentieude">Quản Lý Đơn Hàng</div> <div id="themxoa"><div id="chucnangthem"><a href ="ThemDonHang.aspx">Thêm</a></div> <div id="chucnangxoa"> <asp:Button ID="btnXoaDonHang" runat="server" Text="Xóa" OnClick="btnXoaDonHang_Click" Class ="clbtnxoanguoidung" CssClass="clbtnxoanguoidung"/> </div>  </div>              
         </div>
        <div id="idmadonhang">
                <div id="chudh">Lọc </div> <div id="thongtindh"> <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" CssClass="cllblmadonhang" Class="cllblmadonhang">
                <asp:ListItem>Tất Cả</asp:ListItem>
                      <asp:ListItem>Đã Thanh Toán</asp:ListItem>
                <asp:ListItem>Chưa Thanh Toán</asp:ListItem>
               </asp:DropDownList> 
                                           </div>
            </div>
    <asp:DataList ID="datalistdonhang" runat="server" CssClass="cldtlstdonhang" css="cldtlstdonhang">
        <ItemTemplate>
            <div id="idphannoidung">
              <div id="idmadonhang">
                <div id="chudh">lưa chọn </div> <div id="thongtindh">  <asp:CheckBox ID="CheckBox1" runat="server" /> </div>
            </div>
            <div id="idmadonhang">
               <div id="chudh">Mã Đơn Hàng </div> <div id="thongtindh"> <asp:Label ID="idlblMaDonHang" runat="server" Text='<%# Bind("ID") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>
        <div id="idmadonhang">
               <div id="chudh">Tên Khách Hàng </div> <div id="thongtindh"> <asp:Label ID="Label1" runat="server" Text='<%# Bind("HoTen") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                <div id="idmadonhang">
               <div id="chudh">Tổng Tiền </div> <div id="thongtindh"> <asp:Label ID="Label2" runat="server" Text='<%# Bind("TongTien") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                <div id="idmadonhang">
               <div id="chudh">Ngày Lập: </div> <div id="thongtindh"> <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayLap") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                <div id="idmadonhang">
               <div id="chudh">Tình Trạng </div> <div id="thongtindh"> <asp:Label ID="Label4" runat="server" Text='<%# Bind("TinhTrang") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                <div id="idmadonhang">
               <div id="chudh">Loại Thanh Toán </div> <div id="thongtindh"> <asp:Label ID="Label5" runat="server" Text='<%# Bind("LoaiThanhToan") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                <div id="idmadonhang">
               <div id="chudh">Địa Chỉ </div> <div id="thongtindh"> <asp:Label ID="Label6" runat="server" Text='<%# Bind("DiaChi") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                <div id="idmadonhang">
               <div id="chudh">Số Điện Thoại: </div> <div id="thongtindh"> <asp:Label ID="Label7" runat="server" Text='<%# Bind("DienThoai") %>' CssClass="cllblmadonhang1" css="cllblmadonhang1"></asp:Label> </div>
            </div>

                 <div id="idmadonhang">
                  <a href ='<%# "QuanLyChiTietDonHang.aspx?ID=" + Eval("ID") %>' id="asua">Chi Tiếc Đơn Hàng</a>                
                </div>

                <div id="idmadonhang">
                <asp:Label runat="server" Text="-------------------------------------------------------------------------------"></asp:Label>
                    </div>
                </div>
              
        </ItemTemplate>
      
    </asp:DataList>
        </div>--%>
</asp:Content>

