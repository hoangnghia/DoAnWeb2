<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ThacMac.aspx.cs" Inherits="ThacMac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="stylemainSP">
        <div class="styleheader1SP">
            <p>THẮC MẮC KHÁCH HÀNG</p>
        </div>
       <div class="styleheader3SP">
            <div class="styleTM01"><div class="text">Tên  </div></div>
            <div class="styleTM02"><div class="text"> Địa chỉ</div></div>
            <div class="styleTM03"><div class="text">Email liên hệ</div></div>
            <div class="styleTM04"><div class="text">Tiêu đề</div></div>
           <div class="styleTM05"><div class="text">Nội dung </div></div>
           <div class="styleTM06"><div class="text"> Hồi đáp </div></div>
        </div>
        <div class="dataThacMac">
         <asp:DataList ID="dtThacMac" runat="server">
               <ItemTemplate>
                   <div class="styleTM07"><div class="textTM"><asp:Label ID="lbTen" runat="server" Text='<%# Bind("Ten") %>'></asp:Label></div></div>
                   <div class="styleTM08"><div class="textTM"><asp:Label ID="lbDiaChi" runat="server" Text='<%# Bind("DiaChi") %>'></asp:Label></div></div>
                   <div class="styleTM09"><div class="textTM"><asp:Label ID="lbEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label></div></div>
                   <div class="styleTM10"><div class="textTM"><asp:Label ID="lbTieuDe" runat="server" Text='<%# Bind("TieuDe") %>'></asp:Label></div></div>
                   <div class="styleTM11"><div class="textTM"><asp:Label ID="lbNoiDung" runat="server" Text='<%# Bind("NoiDung") %>'></asp:Label></div></div>
                   <div class="styleTM12"><a href='<%# "HoiDap.aspx?Email="+Eval("Email") %>'><img src="images/hoidap.png" style=" Width: 50px; Height: 36px;" /></a> </div>
               </ItemTemplate>
           </asp:DataList>
            </div>
   </div>
</asp:Content>

