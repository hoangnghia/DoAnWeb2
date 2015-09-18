<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="HangSanXuat.aspx.cs" Inherits="HangSanXuat" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Hãng Sản Xuất</div> <div id="themxoa"><div id="chucnangthem"><a href ="ThemHangSanXuat.aspx">Thêm</a></div> <div id="chucnangxoa"> <asp:Button ID="Button1" runat="server" Text="Xóa" OnClick="Button1_Click" UseSubmitBehavior="true"  /> </div>  </div>        
         </div>

         <div id ="tieude">
             <div id ="cot0">lựa chọn</div><div id ="cot1">ID</div> <div id="cot2">Mã Hãng SX</div> <div id="cot3">Tên Hãng SX</div> <div id="cot4">Status</div> <div id ="cot5">Thao Tác</div>
         </div>
    <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
           
               <ItemTemplate>

            <div id="tieude1">
            <div id="cot0">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                </div>
             <div id="cot1">
                 <asp:Label ID="Label3" runat="server" Text=' <%# Bind("ID") %>'>
                    </asp:Label>
                </div>
             <div id="cot2">
                   <asp:Label ID="Idmahangsx" runat="server" Text='<%# Bind("MaHSX") %>'>'></asp:Label>
                </div>
             <div id="cot3">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TenHSX") %>'>'></asp:Label>
                </div>
             <div id="cot4">
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("Status") %>'>'</asp:Label>
                </div>
              <div id="cot5">
                  <a href ='<%# "SuaHangSanXuat.aspx?MaHSX=" + Eval("MaHSX") %>' >Sửa</a>                
                </div>
         </div>
           
            </ItemTemplate>
        
    </asp:DataList>
   <div class="phantrang" style="margin-right: 33px;"><cc2:CollectionPager PageNumbersStyle="padding: 20px;" ID="CollectionPager2" runat="server" ResultsFormat="{0}->{1} (của {2}) Hãng sản xuất" ShowFirstLast="True" SliderSize="5" PagingMode="QueryString"></cc2:CollectionPager></div>
    </div>
</asp:Content>

