<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaSanPham.aspx.cs" Inherits="SuaSanPham" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

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
        function file_change1(f) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = document.getElementById("img1");
                img.src = e.target.result;
                img.style.display = "inline";
            };
            reader.readAsDataURL(f.files[0]);
        }
        function file_change2(f) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = document.getElementById("img2");
                img.src = e.target.result;
                img.style.display = "inline";
            };
            reader.readAsDataURL(f.files[0]);
        }
        function file_change3(f) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = document.getElementById("img3");
                img.src = e.target.result;
                img.style.display = "inline";
            };
            reader.readAsDataURL(f.files[0]);
        }
</script>
    <div class="stylemainSP">
        <div class="styleheader1SP">
            <p>CẬP NHẬT SẢN PHẨM </p>
        </div>
        <div class ="contentSSP">
           <div class="contentRight1SSP">
               <div class="ctspSSP">
                   <p> Sản phẩm </p>
                 </div>
            <div class ="contentRightSSP">
                <div class="cot1">Mã sản phẩm :</div> 
                <div class="cot1">Tên sản phẩm :</div> 
                <div class="cot1">Giá cũ : </div> 
                 <div class="cot1">Giá mới : </div> 
                <div class="cotHinhDaidien">Hình đại diện sản phẩm :  </div>
                <div class="cot1">Tình trạng: </div>  
                <div class="cot1">Hãng sản xuất : </div>
                 <div class="cot1">Danh mục : </div>
                 <div class="cotHinhDaidien">Hình chi tiết 1 :  </div>
                 <div class="cotHinhDaidien">Hình chi tiết 2 :  </div>
                 <div class="cotHinhDaidien">Hình chi tiết 3 :  </div>
            </div>
            <div class="contentLeftSSP">
          <asp:DataList ID="ltSanPham" runat="server">
              <ItemTemplate>
                  <div class="cot2"><asp:Label ID="lbMaSP" runat="server" style="color: red;" Text='<%# Bind("MaSP") %>'></asp:Label></div>
                  <div class="cot2"><asp:TextBox ID="txtTenSP" runat="server" CssClass="textbox" Text='<%# Bind("TenSP") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtGiaCu" runat="server" CssClass="textbox" Text='<%# Bind("GiaCu","{0:0,000}") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtGiaMoi" runat="server" CssClass="textbox" Text='<%# Bind("GiaMoi","{0:0,000}") %>'></asp:TextBox></div>
                  <div class="Hinh"><img id="img" alt ="" src='<%# Eval("HinhSP") %>' style="width:180px; height:140px;" /></div>
                  <div class="cot2"><asp:TextBox ID="txtTinhTrang" runat="server" CssClass="textbox" Text='<%# Bind("TinhTrang") %>'></asp:TextBox></div>
              </ItemTemplate>
          </asp:DataList>
                   <div class="cot2"><asp:DropDownList ID="DropDownList1" runat="server"  style=" height: 30px; border-radius: 6px; width: 157px;"></asp:DropDownList></div>
                  <div class="cot2"><asp:DropDownList ID="DropDownList2" runat="server" style=" height: 30px; border-radius: 6px; width: 157px;"></asp:DropDownList></div>
             <div class="contentLeftSSP">
          <asp:DataList ID="dtHinhSanPham" runat="server">
              <ItemTemplate>
                  <div class="Hinh"><img id="img1" src='<%# Eval("HinhAnh1") %>'  style="width:180px; height:140px;" /></div>
                  <div class="Hinh"><img id="img2" src='<%# Eval("HinhAnh2") %>'  style="width:180px; height:140px;" /></div>
                  <div class="Hinh"><img id="img3" src='<%# Eval("HinhAnh3") %>'  style="width:180px; height:140px;" /></div>
              </ItemTemplate>
          </asp:DataList>
            </div>
            </div>
            <div class ="contentRightSSP1">
                <div class="upload"><asp:FileUpload ID="FileUpload1" runat="server" onchange="file_change(this)"/></div>
                <div class ="upload4"><asp:Label ID="lbHSX" runat="server" Text=""></asp:Label></div>
                <div class ="upload5"><asp:Label ID="lbDM" runat="server" Text=""></asp:Label></div>
                <div class="upload1"><asp:FileUpload ID="FileUpload2" runat="server" onchange="file_change1(this)"/></div>
                <div class="upload2"><asp:FileUpload ID="FileUpload3" runat="server" onchange="file_change2(this)"/></div>
                <div class="upload3"><asp:FileUpload ID="FileUpload4" runat="server" onchange="file_change3(this)"/></div>
            </div>
           </div>
            <div class="rightSSP">
                <div class="ctspSSP">
                   <p> Chi tiết sản phẩm </p>
                 </div>
            <div class ="contentLeftSSP1">
                <div class="cot1">SKU :</div> 
                <div class="cot1">Model : </div> 
                <div class="cot1">Màn hình : </div> 
                <div class="cot1">Trọng lượng : </div>  
                <div class="cot1">Màu sắc : </div>
                 <div class="cot1">Kích thước màn hình : </div>
                <div class="cot1">Bộ nhớ trong :</div> 
                <div class="cot1">Bộ nhớ ngoài :</div> 
                <div class="cot1">Camera : </div> 
                <div class="cot1">Hệ điều hành : </div> 
                <div class="cot1">Loại Pin : </div>  
                <div class="cot1">Cổng kết nối : </div>
                <div class="cot1">Bảo hành : </div>
                <div class="cot1">CPU : </div>
                <div class="cot1">Mô tả sản phẩm : </div>
            </div>
            <div class="contentLeftSSP">
          <asp:DataList ID="dtlCTSP" runat="server">
              <ItemTemplate>
                  <div class="cot2"><asp:TextBox ID="txtSKU" runat="server" CssClass="textbox" Text='<%# Bind("SKU") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtModel" runat="server" CssClass="textbox" Text='<%# Bind("Model") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtManHinh" runat="server" CssClass="textbox" Text='<%# Bind("ManHinh") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtTrongLuong" runat="server" CssClass="textbox" Text='<%# Bind("TrongLuong") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtMauSac" runat="server" CssClass="textbox" Text='<%# Bind("MauSac") %>'></asp:TextBox></div>
                 <div class="cot2"><asp:TextBox ID="txtKTMH" runat="server" CssClass="textbox" Text='<%# Bind("KichThuocManHinh") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtBoNhoTrong" runat="server" CssClass="textbox" Text='<%# Bind("BoNhoTrong") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtBoNhoNgoai" runat="server" CssClass="textbox" Text='<%# Bind("BoNhoNgoai") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtCamera" runat="server" CssClass="textbox" Text='<%# Bind("Camera") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtHDH" runat="server" CssClass="textbox" Text='<%# Bind("HeDieuHanh") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtLoaiPin" runat="server" CssClass="textbox" Text='<%# Bind("LoaiPin") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtCongKetNoi" runat="server" CssClass="textbox" Text='<%# Bind("CongKetNoi") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtBaoHanh" runat="server" CssClass="textbox" Text='<%# Bind("BaoHanh") %>'></asp:TextBox></div>
                  <div class="cot2"><asp:TextBox ID="txtCPU" runat="server" CssClass="textbox" Text='<%# Bind("CPU") %>'></asp:TextBox></div>
              </ItemTemplate>
          </asp:DataList>
            </div>
                <asp:DataList ID ="ldCKE" runat="server">
                    <ItemTemplate>
                <div class="ckeditor1" >
                    <CKEditor:CKEditorControl ID="CKEMoTa" runat="server" Text='<%# Bind("MoTa") %>'></CKEditor:CKEditorControl>
                     </div>
                        </ItemTemplate>
                </asp:DataList>
            </div>
            </div>
        <div class="stylefooterSSP">
             <div class="btnSSP"><asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/save.png" Width="52px" Height="45px" OnClick="btnSave_Click"/><div class="textbutton">Save</div> </div> 
         </div>
    </div>
</asp:Content>

