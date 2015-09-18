<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaSlide.aspx.cs" Inherits="SuaSlide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function file_change(f) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = document.getElementById("img");
                img.src = e.target.result;
                img.style.display = "inline";
            };
            reader.readAsDataURL(f.files[0]);
        }
</script>
    <div class="SSlidestylemain">
        <div class="Slidestyleheader0">
            <p>CẬP NHẬT SLIDE</p>
        </div>
        <div class="Slidestyleheader1">
            <div class="Slidestyleheader2">
                    <div class="Slidestyle0"> <p>Mã Slide</p></div>
                    <div class="Slidestyle1"> <p>Hình Slide</p></div>
                    <div class= "Slidestyle2"><p> Link Hình</p></div>      
        </div>
            <asp:DataList ID="dlSuaSlide" runat="server">
                <ItemTemplate>
                <div class="stylecontent">
                    <div class ="Slidestyle7"><p><asp:Label ID ="lbMaSL" runat="server" Text='<%# Eval("MaSL") %>'></asp:Label></p></div>
                    <div class="Slidestyle3"><img id ="img" src='<%# Eval("HinhAnh") %>'  style="width:140px; height:94px;" /></div>
                    <div class="Slidestyle4"> <p><asp:TextBox ID="txtLink" runat="server" CssClass="textboxSL" Text='<%# Bind("Link") %>'></asp:TextBox></p></div>
                </div>   
        </ItemTemplate>
    </asp:DataList>
             <div class="SlidestyleUpLoad"><asp:FileUpload ID="FileUpload1" runat="server" onchange="file_change(this)" /></div>
         </div>
        <div class="Slidestylefooter">
            <div class="buttonSlide">
                 <div class="textButton"> <asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/images/save.png" Width="52px" Height="45px" OnClick="btnThem_Click"/></div>
                <div class="textButton1">Save</div>
            </div>
             <div class="thongbao"><asp:Label ID="lbThongBao" runat="server" Text="..."></asp:Label></div>
        </div>
   </div>
</asp:Content>

