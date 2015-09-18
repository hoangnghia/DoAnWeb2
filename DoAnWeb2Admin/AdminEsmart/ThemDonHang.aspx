<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ThemDonHang.aspx.cs" Inherits="ThemDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Thêm Đơn Hàng</div> 
         </div>
               <div id="idphannoidung">
           <%--  
            <div id="idmadonhang">
               <div id="chudh">Tổng Tiền</div> <div id="thongtindh"> <asp:TextBox ID="txtTongTien" runat="server" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>--%>
     <%--   <div id="idmadonhang">
               <div id="chudh">Ngày Lập </div> <div id="thongtindh"> <asp:TextBox ID="txtNgayLap" runat="server" Text='<%# Bind("HoTen") %>' CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
                  <div id="lichdh">
                    <asp:Calendar ID="cldngaylap" runat="server" ShowTimeSelector="true" DateFormat="yyyy-MM-dd" DatePickerMode="fale" OnSelectionChanged="cldngaylap_SelectionChanged" CssClass="clcldlich" Class="clcldlich"></asp:Calendar> 
                </div>
            </div>--%>

                <div id="idmadonhang">
                    <div id="chudh">Tình Trạng</div>
              <asp:DropDownList ID="iddrlsttinhtrang" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
                 <asp:ListItem>Đã Thanh Toán</asp:ListItem>
                 <asp:ListItem>Chưa Thanh Toán</asp:ListItem>
                 </asp:DropDownList>
            </div>

             

                <div id="idmadonhang">
                <div id="chudh">Loại Thanh Toán</div>
              <asp:DropDownList ID="iddrlloaithanhtoan" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
                 <asp:ListItem>Nhận Hàng</asp:ListItem>
                 <asp:ListItem>Ngân Hàng</asp:ListItem>
                 </asp:DropDownList>
            </div>

               

                <div id="idmadonhang">
               <div id="chudh">Khách Hàng</div>
              <asp:DropDownList ID="iddrlkhachhang" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
                 
                 </asp:DropDownList>
            </div>

              
                 <div id="idmadonhang">
                   <asp:Button ID="btnLuuDonHang" runat="server" Text="Lưu" CssClass="clbtnludonhang" Class="clbtnludonhang" OnClick="btnLuuDonHang_Click"/>
                    <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao" css="cllblthongbao"></asp:Label>                         
                </div>
                </div>
    </div>
</asp:Content>

