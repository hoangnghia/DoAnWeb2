<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuanLyNguoiDung.aspx.cs" Inherits="QuanLyNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Quản Lý Người Dùng</div> <div id="themxoa"><div id="chucnangthem"><a href ="ThemNguoiDung.aspx">Thêm</a></div> <div id="chucnangxoa"> <asp:Button ID="btnXoaNguoiDung" runat="server" Text="Xóa" Class ="clbtnxoanguoidung" CssClass="clbtnxoanguoidung" OnClick="btnXoaNguoiDung_Click"/> </div>  </div>        
         </div>

         <div id ="tieude">
             <div id ="cot0nguoidung">lựa chọn</div><div id ="cot1nguoidung">Mã ND</div> <div id="cot2nguoidung">Quyền</div> <div id="cot3nguoidung">Tài Khoản</div> <div id="cot4nguoidung">Họ Tên</div> <div id ="cot5nguoidung">Email</div> <div id ="cot6nguoidung">Thao Tác</div>
         </div>
    <asp:DataList ID="datalistnguoidung" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
           
               <ItemTemplate>

            <div id="tieude1">
            <div id="cot0nguoidung">
                <asp:CheckBox ID="checkboxchon" runat="server" />
                </div>
             <div id="cot1nguoidung">
                 <asp:Label ID="lblMaND" runat="server" Text=' <%# Bind("MaND") %>'>
                    </asp:Label>
                </div>
             <div id="cot2nguoidung">
                   <asp:Label ID="lblQuyen" runat="server" Text='<%# Bind("Quyen") %>'></asp:Label>
                </div>
             <div id="cot3nguoidung">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TaiKhoan") %>'></asp:Label>
                </div>
             <div id="cot4nguoidung">
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("HoTen") %>'></asp:Label>
                </div>
              <div id="cot5nguoidung">
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>          
                </div>
                 <div id="cot6nguoidung">
                  <a href ='<%# "SuaNguoiDung.aspx?MaND=" + Eval("MaND") %>'>Sửa</a>                
                </div>
         </div>
           
            </ItemTemplate>
        
    </asp:DataList>
       <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>                
    </div>
</asp:Content>

