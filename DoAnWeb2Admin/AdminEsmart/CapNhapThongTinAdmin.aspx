<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CapNhapThongTinAdmin.aspx.cs" Inherits="CapNhapThongTinAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Thêm Người Dùng</div>       
         </div>
       
    <%-- <div id ="idsquyen">
       <div id="chu"> Quyền </div> <div id="thongtin"> <asp:DropDownList ID="iddrlstquyen" runat="server" CssClass="cldrlistsquyen" Class="cldrlistsquyen">
                
                 </asp:DropDownList> </div>
             </div> --%>
    <asp:DataList ID="datalistsuanguoidung" runat="server" CssClass="cldtlsnguoidung" class ="cldtlsnguoidung">
        <ItemTemplate>
          <div id="phansuanguoidung">
         <div id="idsumand"><div id="chu">Mã ND </div>  <div id="thongtin"><asp:TextBox ID="txtMaND" runat="server" CssClass="cstxtsmand" Class="cstxtsmand" Enabled="false" Text ='<%# Bind("MaND") %>'></asp:TextBox> </div></div>
             <div id="idstaikhoan"><div id="chu">Tài Khoản </div>  <div id="thongtin"><asp:TextBox ID="txtTaiKhoan" runat="server"  CssClass="cltxtstaikhoan" Class="cltxtstaikhoan" Text ='<%# Bind("TaiKhoan") %>'></asp:TextBox> </div></div>
             <div id="idshoten"><id id="chu">Họ Tên </div> <div id="thongtin"><asp:TextBox ID="txtHoTen" runat="server" CssClass="cltxtshoten" Class="cltxtshoten" Text ='<%# Bind("HoTen") %>'></asp:TextBox> </div></div> 
             <div id="idsngaysinh"><div id="chu">Ngày Sinh </div><div id="thongtin"> <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="cltxtsngaysinh" Class="cltxtsngaysinh" Text ='<%# Bind("NgaySinh") %>'></asp:TextBox> </div>
                <div id="lichsuanguoidung">
                    <asp:Calendar ID="Calendar2" runat="server" ShowTimeSelector="true" DateFormat="yyyy-MM-dd" DatePickerMode="fale" CssClass="clcldslich" Class="clcldslich" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar> 
                </div>
             </div> 
             <div id="idsgioitinh">
              <div id="chu">  Giới tính </div> <div id="thongtin"> <asp:DropDownList ID="iddrlgioitinh" runat="server" CssClass="cldrlsgioitinh" css ="cldrlsgioitinh">
                     
                 </asp:DropDownList>
                  </div>
             </div>
             <div id="idsdiachi"><div id="chu">Địa chỉ </div> <div id="thongtin"> <asp:TextBox ID="txaDiaChi" name="txaDiaChi" runat="server" rows="2" CssClass="cltxasdiachi" Class="cltxasdiachi" Text ='<%# Bind("DiaChi") %>' TextMode="MultiLine"></asp:TextBox> </div></div> 
             <div id="idsthanhph"> <div id="chu"> Thành phố </div> <div id="thongtin"> <asp:TextBox ID="txtThanhPho" runat="server" CssClass="cltxtsthanhpho" Class="cltxtsthanhpho" Text ='<%# Bind("ThanhPho") %>'></asp:TextBox> </div></div> 
             <div id="idsemail"> <div id="chu"> Email </div> <div id="thongtin"> <asp:TextBox ID="txtEmail" runat="server" CssClass="cltxtsemail" Class="cltxtsemail" Text ='<%# Bind("Email") %>'></asp:TextBox> </div></div> 
             <div id="idsdienthoai"> <div id="chu"> Điện thoại </div> <div id="thongtin"> <asp:TextBox ID="txtDienThai" runat="server" CssClass="cltxtsdienthoai" Class="cltxtsdienthoai" Text ='<%# Bind("DienThoai") %>'></asp:TextBox> </div></div>
         
         </div>
          
            </ItemTemplate>
         
    </asp:DataList>
       <asp:Button ID="btnLuuNguoiDung" runat="server" Text="Lưu" CssClass="clbtnthemnguoidung" Class="clbtnthemnguoidung" OnClick="btnLuuNguoiDung_Click"/>
       <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao" css="cllblthongbao"></asp:Label>     
        </div>
</asp:Content>

