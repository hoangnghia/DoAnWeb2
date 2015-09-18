<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="QuanLyBinhLuan.aspx.cs" Inherits="QuanLyBinhLuan" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Quanr Lý Bình Luận</div> <div id="themxoa"><div id="chucnangthem"><a href ="ThemBinhLuan.aspx">Thêm</a></div> <div id="chucnangxoa"> <asp:Button ID="btnXoaBinhLuan" runat="server" Text="Xóa" UseSubmitBehavior="true" OnClick="btnXoaBinhLuan_Click" CssClass="clbtnxoabinhlua" css="clbtnxoabinhlua"/> </div>  </div>        
         </div>

         <div id ="tieude">
             <div id ="cot0">Lựa chọn</div><%--<div id ="idcotmabinhluan">Mã Bình Luận</div> --%><div id="cot2">Người Dùng</div> <div id="cot3">Nội Dung</div> <div id="cot4">Ngày Bình Luận</div> <div id ="cot5">Sản Phẩm</div> <div id ="6">Thao Tác</div>
         </div>
    <asp:DataList ID="datalistbinhluan" runat="server">
           
               <ItemTemplate>

            <div id="tieude1">
            <div id="cot0">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                </div>
             <div id="idcotmabinhluan">
                 <asp:Label ID="lblmabinhluan" runat="server" Visible ="false" Text='<%# Bind("mabinhluan") %>'>
                    </asp:Label>
                </div>
             <div id="cot2">
                   <asp:Label ID="Idmahangsx" runat="server" Text='<%# Bind("TaiKhoan") %>'></asp:Label>
                </div>
             <div id="cot3">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("noidung") %>'></asp:Label>
                </div>
             <div id="cot4">
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("ngaybinhluan") %>'></asp:Label>
                </div>
            <div id="cot5">
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("TenSP") %>'></asp:Label>
                </div>
              <div id="cot6">
                  <a href ='<%# "SuaBinhLuan.aspx?MaBL=" + Eval("mabinhluan") %>' >Sửa</a>                
                </div>
         </div>
           
            </ItemTemplate>
        
    </asp:DataList>
                       <div class="phantrang" style="margin-right: 33px;"><cc2:CollectionPager PageNumbersStyle="padding: 20px;" ID="CollectionPager2" runat="server" ResultsFormat="{0}->{1} (của {2}) Bình luận" ShowFirstLast="True" SliderSize="5" PagingMode="QueryString"></cc2:CollectionPager></div>
    </div>
</asp:Content>

