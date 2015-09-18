<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ThemBinhLuan.aspx.cs" Inherits="ThemBinhLuan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Thêm BinhLuan</div> 
         </div>
               <div id="idphannoidung">
             

                <div id="idmadonhang">
                    <div id="chudh">Người Dùng</div>
              <asp:DropDownList ID="iddrlstnguoidung" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
               
                 </asp:DropDownList>
            </div>

              <div id="idmadonhang">
               <div id="chudh">Nội Dung</div> <div id="thongtindh"> <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Height="80px" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>
               <div id="idmadonhang">
                    <div id="chudh">Sản Phẩm</div>
              <asp:DropDownList ID="iddrlsanpham" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
               
                 </asp:DropDownList>
            </div>
                 <div id="idmadonhang">
                   <asp:Button ID="btnLuuDonHang" runat="server" Text="Lưu" CssClass="clbtnLuuBinhLuan" Class="clbtnLuuBinhLuan" OnClick="btnLuuDonHang_Click"/>
                    <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao" css="cllblthongbao"></asp:Label>                         
                </div>
                </div>
    </div>
</asp:Content>

