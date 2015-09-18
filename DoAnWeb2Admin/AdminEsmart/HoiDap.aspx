<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="HoiDap.aspx.cs" Inherits="HoiDap" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="headerHD">
        <div class="StyleTop">
            <div class="StyleTopLeft">
                    <div class="StyleTop1">Tên : </div> 
                    <div class="StyleTop1">Email : </div> 
                    <div class="StyleTop1">Tiêu đề : </div> 
                    <div class="StyleTop1">Nội dung : </div>
              </div> 
            <div class="StyleTopRight">
              <asp:DataList ID="dtHoiDap" runat="server">
               <ItemTemplate>
                   <div class="StyleTop2"><div class="textTM"><asp:Label ID="lbTen" runat="server" Text='<%# Bind("Ten") %>'></asp:Label></div></div>
                   <div class="StyleTop2"><div class="textTM"><asp:Label ID="lbEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label></div></div>
                  <div class="StyleTop2"><div class="textTM"><asp:Label ID="lbTieuDe" runat="server" Text='<%# Bind("TieuDe") %>'></asp:Label></div></div>
                   <div class="StyleTop2"><div class="textTM"><asp:Label ID="lbNoiDung" runat="server" Text='<%# Bind("NoiDung") %>'></asp:Label></div></div>
               </ItemTemplate>
           </asp:DataList>
           </div>
        </div>
       <div class="StyleHeader">
            <div class="StyleHeader1">
                <div class ="StyleHeaderTop">
                    <div class="Send"> Hồi Đáp : </div>
                </div>
                <div class="StyleHeaderLeft">
                    <div class="email">Email : <asp:TextBox ID="txtEmail" runat="server" style="width: 304px;height: 26px;border-radius: 10px;"></asp:TextBox></div>
                </div>
                 <div class="StyleHeaderRight">
                    <div class="Send1"><asp:ImageButton ID="btnSend" ImageUrl="~/images/send.png" runat="server" style="width: 76px; height: 78px;" OnClick="btnSend_Click"/></div>
                </div>
            </div>
            <div class="StyleHeader2">
                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" ></CKEditor:CKEditorControl>
            </div>
        </div>
    </div>
</asp:Content>

