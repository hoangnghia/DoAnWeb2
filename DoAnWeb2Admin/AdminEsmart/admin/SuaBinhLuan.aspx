<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SuaBinhLuan.aspx.cs" Inherits="SuaBinhLuan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Sửa Bình Luận</div>       
         </div>
         <div id="idcotmabinhluan">
                 <asp:Label ID="lblmabinhluan" runat="server" Visible ="false" Text='<%# Bind("mabinhluan") %>'>
                    </asp:Label>
                </div>
    <div id="idmadonhang">
                    <div id="chudh">Người Dùng</div>
              <asp:DropDownList ID="iddrlstnguoidung" Enabled="false" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
               
                 </asp:DropDownList>
            </div>
    <asp:DataList ID="datalistchitietbinhlua" runat="server" CssClass="cldtlsnguoidung" class ="cldtlsnguoidung">
        <ItemTemplate>
          <div id="phansuanguoidung">
                <div id="idmadonhang">
              <%-- <div id="chudh">mã nd</div>--%> <div id="thongtindh"> <asp:TextBox ID="txtmand" Visible="false" Enabled="false" runat="server" CssClass="cllblmadonhang" css="cllblmadonhang" Text='<%# Bind("MaND") %>'></asp:TextBox> </div>
            </div>
               <div id="idmadonhang">
               <div id="chudh">Nội Dung</div> <div id="thongtindh"> <asp:TextBox ID="txtNoiDung" Enabled="false" runat="server" TextMode="MultiLine" Height="80px" CssClass="cllblmadonhang" css="cllblmadonhang" Text='<%# Bind("NoiDung") %>'></asp:TextBox> </div>
            </div>
               <div id="idmadonhang"><div id="chu">Ngày Bình Luận </div><div id="thongtin"> <asp:TextBox ID="txtNgayBinhLuan" Enabled="false" runat="server" CssClass="cltxtsngaysinh" Class="cltxtsngaysinh" Text='<%# Bind("NgayBL") %>'></asp:TextBox> </div>
               <%-- <div id="idlichsuabinhluan">
                    <asp:Calendar ID="Calendar2" runat="server" ShowTimeSelector="true" DateFormat="yyyy-MM-dd" DatePickerMode="fale" CssClass="clcldslich" Class="clcldslich" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar> 
                </div>--%>
             </div>
                <div id="idmadonhang"><div id="chu">Ngày Bình Luận </div><div id="thongtin"> <asp:TextBox ID="TextBox1" Enabled="false" runat="server" CssClass="cltxtsngaysinh" Class="cltxtsngaysinh" Text='<%# Bind("NgayBL") %>'></asp:TextBox> </div>
               <%-- <div id="idlichsuabinhluan">
                    <asp:Calendar ID="Calendar2" runat="server" ShowTimeSelector="true" DateFormat="yyyy-MM-dd" DatePickerMode="fale" CssClass="clcldslich" Class="clcldslich" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar> 
                </div>--%>
             </div> 
         </div>
          
            </ItemTemplate>
         
    </asp:DataList>
       <div id="idmadonhang">
                    <div id="chudh">Sản Phẩm</div>
              <asp:DropDownList ID="iddrlsanpham" Enabled="false" runat="server" CssClass="cllblmadonhang" Class="cllblmadonhang">
               
                 </asp:DropDownList>
            </div>
               <asp:Button ID="btnLuuBinhLuan" Enabled="false" runat="server" Text="Lưu" CssClass="clbtnthemnguoidung" Class="clbtnthemnguoidung" OnClick="btnLuuBinhLuan_Click"/>
       <asp:Label ID="lbthongbao" runat="server" CssClass="cllblthongbao" css="cllblthongbao"></asp:Label>     
        </div>
</asp:Content>

