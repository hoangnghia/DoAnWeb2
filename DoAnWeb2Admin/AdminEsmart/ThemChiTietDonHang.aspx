<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ThemChiTietDonHang.aspx.cs" Inherits="ThemChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Thêm Chi Tiết Đơn Hàng</div> 
         </div>
               <div id="idphannoidung">
             
            <div id="idmadonhang">
              <div id="chudh">Mã Đơn Hàng</div>
              <asp:DropDownList ID="iddrlstmadonhang" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
                
                 </asp:DropDownList>
            </div>
     

                <div id="idmadonhang">
                    <div id="chudh">Mã SP</div>
              <asp:DropDownList ID="iddrlsanpham" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang" OnSelectedIndexChanged="iddrlsanpham_SelectedIndexChanged" AutoPostBack="True">
              
                 </asp:DropDownList>
            </div>

              <div id="idmadonhang">
               <div id="chudh">Số Lượng</div> <div id="thongtindh"> <asp:TextBox ID="txtSoLuong" runat="server" OnTextChanged="txtSoLuong_TextChanged" AutoPostBack="true" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>

                <div id="idmadonhang">
                <div id="chudh">Đơn Giá</div>
              <asp:DropDownList ID="idrldongia" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang" AutoPostBack="true" OnSelectedIndexChanged="idrldongia_SelectedIndexChanged">
              
                 </asp:DropDownList>
            </div>

               

                <div id="idmadonhang">
               <div id="chudh">Thành Tiền</div> <div id="thongtindh"> <asp:TextBox ID="txtTongTien" Enabled="false" runat="server" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>

              
                 <div id="idmadonhang">
                      <%--  <asp:Button ID="btnTinhTien" runat="server" Text="Tính" CssClass="clbtnludonhang" Class="clbtnludonhang" OnClick="btnTinhTien_Click"/>--%>
                   <asp:Button ID="btnLuuCTDonHang" runat="server" Text="Lưu" CssClass="clbtnludonhang" Class="clbtnludonhang" OnClick="btnLuuCTDonHang_Click"/>
                    <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao" css="cllblthongbao"></asp:Label>                         
                </div>
                </div>
    </div>
</asp:Content>

