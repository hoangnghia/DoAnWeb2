<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ThemSlide.aspx.cs" Inherits="ThemSlide" %>

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
            <p>THÊM MỚI SLIDE</p>
        </div>
        <div class="TSlidestyleheader1">
            <div class="contentTSL">
             <div class="RowTSL">
                   <div class="rowTSL1">Mã Slide :</div> 
                    <div class="rowTSL2"><asp:TextBox CssClass="textbox" ID="txtMaSL" runat="server"></asp:TextBox></div>
                    <div class="rowTSL3"><asp:Label ID="lbMaSL" runat="server" Text="not null!!!"></asp:Label></div>
             </div>
             <div class="RowTSL">
                    <div class="rowTSL1">Link Hình :</div> 
                     <div class="rowTSL2"><asp:TextBox CssClass="textbox" ID="txtLink" runat="server"></asp:TextBox></div>
                 <div class="rowTSL3"><asp:Label ID="lbLink" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             <div class="RowTSL">
                    <div class="rowTSL1">Hình slide :  </div> 
                     <div class="rowTSL2"><asp:FileUpload ID="FileUpload1" runat="server" onchange="file_change(this)"/>
                     </div>
                 <div class="rowTSL3"><asp:Label ID="lbHinh" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             </div>
              <div class="RowTSL">
                    <div class="rowTSL1">
                    </div> 
                     <div class="rowTSL2"><img id="img" style="width: 146px;margin-left: 380px;height: 102px;display: inline;" /></div>
                 </div>
             </div>
            </div>
        <div class="TSlidestylefooter">
            <div class="buttonSlide">
                 <div class="textButton"> <asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/images/save.png" Width="52px" Height="45px" OnClick="btnThem_Click"/></div>
                <div class="textButton1">Save</div>
            </div>
             <div class="thongbao"><asp:Label ID="lbThongBao" runat="server" Text="..."></asp:Label></div>
        </div>
   </div>
</asp:Content>

