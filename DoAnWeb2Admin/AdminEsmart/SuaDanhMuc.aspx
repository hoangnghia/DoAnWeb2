<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaDanhMuc.aspx.cs" Inherits="SuaDanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="stylemain">
        <div class="styleheader0">
            <p>QUẢN LÝ DANH MỤC</p>
        </div>
        <div class="styleheader2SDM">
                    <div class="style1SDM"> <p>Mã Danh mục</p></div>
                     <div class= "style11SDM"><p> Tên Danh mục</p></div>
                    
        </div>
                <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                <div class="stylecontent">
                    <div class="style2SDM"> <asp:Label ID="txtMaDM" runat="server" Text='<%# Bind("ID") %>'></asp:Label></div>
                    <div class="style3SDM"> <asp:TextBox ID="txtTenDM" runat="server" Text='<%# Bind("TenDM") %>'></asp:TextBox></div>
                     </div>   
        </ItemTemplate>
    </asp:DataList>
         <div class="stylefooterSDM">
            <div class="buttonSDM">
                 <div class="textButtonSDM"><asp:Button CssClass="btnLuu" ID="btnLuu" runat="server" Text="Lưu Lại" OnClick="btnLuu_Click"/></div>
            </div>
             <div class="thongbao"><asp:Label ID="lbThongBao" runat="server" Text="..."></asp:Label></div>
        </div>
        </div>
</asp:Content>

