<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ThemSanPham.aspx.cs" Inherits="ThemSanPham" EnableEventValidation="false" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="stylemainSP">
        <div class="styleheader1SP">
            <p>QUẢN LÝ SẢN PHẨM </p>
        </div>
         <div class="styleheaderTSP">
            <div class="title"> Thêm Sản Phẩm Mới </div>
 <form id="frm">
        <div class ="contentTSP">
         <div class="contentRightTSP">
             <div class="ctsp">
                   <p> Sản Phẩm</p>
                 </div>
           
             <div class="Row2">
                   <div class="row1">Mã sản phẩm :</div> 
                    <div class="row2"><asp:TextBox CssClass="textbox" ID="txtMaSP" runat="server"></asp:TextBox></div>
                    <div class="row3"><asp:Label ID="lbMaSP" runat="server" Text="not null!!!"></asp:Label></div>
             </div>
             <div class="Row2">
                    <div class="row1">Tên sản phẩm :</div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtTenSP" runat="server"></asp:TextBox></div>
                 <div class="row3"><asp:Label ID="lbTenSP" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Giá cũ : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtGiaCu" runat="server"></asp:TextBox></div>
                 <div class="row3"><asp:Label ID="lbGiaCu" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Giá mới : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtGiaMoi" runat="server"></asp:TextBox></div>
                  <div class="row3"><asp:Label ID="lbGiaMoi" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Mã hãng sản xuất : </div> 
                     <div class="row2">
                         <asp:DropDownList ID="DropDownList1" runat="server" style="height: 30px; border-radius: 6px; width: 157px;">
                         </asp:DropDownList>
                    </div>
                 </div>
              <div class="Row2">
                    <div class="row1">Mã Danh mục : </div> 
                     <div class="row2">
                         <asp:DropDownList ID="DropDownList2" runat="server" style=" height: 30px; border-radius: 6px; width: 157px;">
                         </asp:DropDownList>
                    </div>
                 </div>
             <div class="Row2">
                    <div class="row1">Hình đại diện sản phẩm :  </div> 
                     <div class="row2"><asp:FileUpload ID="FileUpload1" runat="server" /></div>
                 <div class="row3"><asp:Label ID="lbHinhDD" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Hình chi tiết 1 : </div> 
                     <div class="row2"><asp:FileUpload ID="FileUpload2" runat="server" /></div>
                 <div class="row3"><asp:Label ID="lbHinhCT1" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Hình chi tiết 2 : </div> 
                     <div class="row2"><asp:FileUpload ID="FileUpload3" runat="server" /></div>
                 <div class="row3"><asp:Label ID="lbHinhCT2" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Hình chi tiết 3 : </div> 
                     <div class="row2"><asp:FileUpload ID="FileUpload4" runat="server" /></div>
                 <div class="row3"><asp:Label ID="lbHinhCT3" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Tình trạng: </div> 
                     <div class="row2">
                         <asp:DropDownList ID="ddTinhTrang" runat="server" style=" height: 30px; border-radius: 6px; width: 157px;">
                             <asp:ListItem>Còn hàng</asp:ListItem>
                             <asp:ListItem>Hết hàng</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                  <div class="row3"><asp:Label ID="lbTinhTrang" runat="server" Text="not null!!!"></asp:Label></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Mô tả sản phẩm: </div> 
                 </div>
              <div class="ckeditor" >
                  <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" ></CKEditor:CKEditorControl>
                     </div>
             </div>

             </div>
                 
         <div class="contentLeftTSP">
             <div class="ctsp">
                   <p> Chi tiết sản phẩm </p>
                 </div>
              <div class="Row2">
                    <div class="row1">SKU  : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtSKU" runat="server"></asp:TextBox></div>

                 </div>
              <div class="Row2">
                    <div class="row1">Model : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtModel" runat="server"></asp:TextBox></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Màn hình : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtManHinh" runat="server"></asp:TextBox></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Trọng lượng : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtTrongLuong" runat="server"></asp:TextBox></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Màu sắc : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtMauSac" runat="server"></asp:TextBox></div>
                 </div>
              <div class="Row2">
                    <div class="row1">Kích thước màn hình : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtKTMH" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Bộ nhớ trong : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtBNT" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Bộ nhớ ngoài : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtBNN" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Camera :</div> 
                     <div class="row2"><asp:TextBox CssClass="textbox"  ID="txtCamera" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Hệ điều hành :</div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtHDH" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Loại Pin : </div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtLoaiPin" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1">Cổng kết nối :</div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtCKN" runat="server"></asp:TextBox></div>
                 </div>
             <div class="Row2">
                    <div class="row1"> CPU :</div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtCPU" runat="server"></asp:TextBox></div>
                 </div>
               <div class="Row2">
                    <div class="row1">Bảo hành :</div> 
                     <div class="row2"><asp:TextBox CssClass="textbox" ID="txtBaoHanh" runat="server"></asp:TextBox></div>
                 </div>
             </div>
            </div>
        </div>
        <div class ="footerTSP">
            <div class="btnTSP"><asp:ImageButton ID="btnThem" runat="server" ImageUrl="~/images/addlist.png" Width="52px" Height="45px" OnClick="btnThem_Click"/></div> 
            <div class="lbThongBaoLoi"><asp:Label ID="lbThongBaoLoiFile" runat="server" Text="."></asp:Label></div> 
        </div>
        </form>
</asp:Content>

