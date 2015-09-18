<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SuaHangSanXuat.aspx.cs" Inherits="SuaHangSanXuat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <script type="text/javascript">
       function file_change(f) {
           var reader = new FileReader();
           reader.onload = function (e) {
               var img = document.getElementById("hinh");
               img.src = e.target.result;
               img.style.display = "inline";
           };
           reader.readAsDataURL(f.files[0]);
       }

</script>
   <div id ="toanbo">
        <div id ="tieudechucnang">
         <div id="tentieude">Sửa Sản Xuất</div>      
         </div>

         <div id ="tieude">
             <div id ="cot0">Mã Hãng SX</div><div id ="cot1">Tên Hãng SX</div> <div id="cot2">Hình Ảnh</div> <div id="cot3">Status</div> <div id ="cot4suahangsx">Thao Tác</div>
         </div>
       
    <asp:DataList ID="DataList1" runat="server">
           
               <ItemTemplate>

            <div id="tieude1">
            <div id="cot0">
               
                <asp:TextBox ID="txtMaHangSX" Class="cltxtmahangsx" runat="server" Text='<%# Bind("MaHSX") %>' CssClass="cltxtmahangsx" Enabled="False"></asp:TextBox>
                </div>
             <div id="cot1">
                 <asp:TextBox ID="txtTenHangSX" Class="cltxttenhangsx" runat="server" Text='<%# Bind("TenHSX") %>'></asp:TextBox>
                </div>
             <div id="cot2">
                 <img src="../images/HinhHangSX/<%# Eval("HinhHangSX") %>" id ="hinh"  style="width:80px; height:90px;"/>
                  <asp:FileUpload ID="uploadhinh" runat="server" onchange="file_change(this)"/>
                </div>
             <div id="cot3">
                 <asp:TextBox ID="txtStatus" Class="cltxtstatus" CssClass="cltxtstatus" runat="server" Text='<%# Bind("Status") %>' Enabled="False"></asp:TextBox>
                </div>
             <div id="cot4suahangsx">
                 <asp:Button ID="btnCapNhap" Class="clbtncapnhap" runat="server" Text="Lưu" OnClick="btnCapNhap_Click" />
                 <asp:Button ID="btnHuy" Class="clbbtnhuy" runat="server" Text="Hủy" />
                </div>
              
         </div>
           
            </ItemTemplate>
        
    </asp:DataList>
        <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>     
    </div>
       
</asp:Content>

