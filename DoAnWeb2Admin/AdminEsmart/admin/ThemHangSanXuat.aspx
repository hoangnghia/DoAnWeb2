<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ThemHangSanXuat.aspx.cs" Inherits="ThemHangSanXuat" %>

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
         <div id="tentieude">Thêm Hãng Sản Xuất</div>   
         </div>

         <div id ="tieude">
             <div id ="cotmahangsx">Mã HSX</div><div id ="cottenhsx">Tên Hãng SX</div> <div id="cothinhhangsx">Hình Ảnh</div> <div id="cotthemhangsx">Hình Ảnh</div>
         </div>
    
            <div id="tieude1">
            <div id="cotmahangsx">
                <asp:TextBox ID="txtMaHangSX" runat="server"></asp:TextBox>
                </div>
             <div id="cottenhsx">
                 <asp:TextBox ID="txtTenHangSX" runat="server"></asp:TextBox>
                </div>
             <div id="cothinhhangsx">
                  <img src="" id ="hinh"  style="width:80px; height:90px;"/>
                 <asp:FileUpload ID="uploadhinh" runat="server" onchange="file_change(this)"/>
                </div>
               <div id="cotthemhangsx">
                   <asp:Button ID="btnThemHangSX" runat="server" Text="Thêm" OnClick="btnThemHangSX_Click" />
                </div>

         </div> 
        <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>