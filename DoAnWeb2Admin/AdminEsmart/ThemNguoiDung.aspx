<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ThemNguoiDung.aspx.cs" Inherits="ThemNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Thêm Người Dùng</div>       
         </div>
         <div id="phanthemnguoidung">
         <div id ="idquyen">
             Quyền :<asp:DropDownList ID="iddrlstquyen" runat="server" CssClass="cldrlistquyen" Class="cldrlistquyen">
                 <asp:ListItem>User</asp:ListItem>
                 <asp:ListItem>Admin</asp:ListItem>
                 </asp:DropDownList>
             </div> 
             <div id="idtaikhoan">Tài Khoản : <asp:TextBox ID="txtTaiKhoan" runat="server"  CssClass="cltxttaikhoan" Class="cltxttaikhoan"></asp:TextBox></div>
             <div id="idhoten">Họ Tên : <asp:TextBox ID="txtHoTen" runat="server" CssClass="cltxthoten" Class="cltxthoten"></asp:TextBox> </div> 
             <div id="idngaysinh">Ngày Sinh: <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="cltxtngaysinh" Class="cltxtngaysinh"></asp:TextBox> 
                <div id="lich">
                    <asp:Calendar ID="Calendar2" runat="server" ShowTimeSelector="true" DateFormat="yyyy-MM-dd" DatePickerMode="fale" OnSelectionChanged ="Calendar1_SelectionChanged" CssClass="clcldlich" Class="clcldlich"></asp:Calendar> 
                </div>
             </div> 
             <div id="idgioitinh">
                Giới tính: <asp:DropDownList ID="iddrlgioitinh" runat="server" CssClass="cldrlgioitinh" css ="cldrlgioitinh">
                     <asp:ListItem>Nam</asp:ListItem>
                     <asp:ListItem>Nữ</asp:ListItem>
                 </asp:DropDownList>
             </div>
             <div id="iddiachi">Địa chỉ: <textarea ID="txaDiaChi" name="txaDiaChi" runat="server" rows="2" CssClass="cltxadiachi" Class="cltxadiachi"></textarea></div> 
             <div id="idthanhph"> Thành phố: <asp:TextBox ID="txtThanhPho" runat="server" CssClass="cltxtthanhpho" Class="cltxtthanhpho"></asp:TextBox></div> 
             <div id="idemail"> Email: <asp:TextBox ID="txtEmail" runat="server" CssClass="cltxtemail" Class="cltxtemail"></asp:TextBox></div> 
             <div id="iddienthoai"> Điện thoại <asp:TextBox ID="txtDienThai" runat="server" CssClass="cltxtdienthoai" Class="cltxtdienthoai"></asp:TextBox></div>
         </div>
         </div>
         <asp:Button ID="btnThemNguoiDung" runat="server" Text="Thêm" CssClass="clbtnthemnguoidung" Class="clbtnthemnguoidung" OnClick="btnThemNguoiDung_Click"/>
       <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao" css="cllblthongbao"></asp:Label>                

</asp:Content>

