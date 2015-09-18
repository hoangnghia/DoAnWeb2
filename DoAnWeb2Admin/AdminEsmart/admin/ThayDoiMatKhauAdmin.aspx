<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ThayDoiMatKhauAdmin.aspx.cs" Inherits="ThayDoiMatKhauAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Thay Đổi Mật Khẩu</div> 
         </div>
               <div id="idphannoidung">
          
               
              <div id="idmadonhang">
               <div id="chudh">Mật Khẩu Hiện Tại</div> <div id="thongtindh"> <asp:TextBox ID="txtPassHienTai" runat="server" TextMode="Password" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>
                   <div id="idmadonhang">
               <div id="chudh">Mật Khẩu Mới</div> <div id="thongtindh"> <asp:TextBox ID="txtPassMoi" runat="server" TextMode="Password" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>
                 
                   <div id="idmadonhang">
               <div id="chudh">Nhập Lại Mật Khẩu</div> <div id="thongtindh"> <asp:TextBox ID="txtPassMoiLai" runat="server" TextMode="Password" CssClass="cllblmadonhang" css="cllblmadonhang"></asp:TextBox> </div>
            </div>
       
               
                </div>
           
                          <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao2" css="cllblthongbao2"></asp:Label>  
               
             <div id="idmadonhang">
                   <asp:Button ID="btnLuuCTDonHang" runat="server" Text="Lưu" CssClass="clbtncapnhapmk" Class="clbtncapnhapmk" OnClick="btnLuuCTDonHang_Click"/>
                     
                </div>

    </div>          

</asp:Content>

