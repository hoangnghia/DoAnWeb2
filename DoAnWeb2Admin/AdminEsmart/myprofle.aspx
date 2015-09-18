<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myprofle.aspx.cs" Inherits="myprofle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <header class="no-padding-bottom header-alt" style="  padding:0;">
    <!-- ========================================= NAVIGATION ========================================= -->
   <nav id="top-megamenu-nav" class="megamenu-vertical animate-dropdown">
        <div class="container">
            <div class="yamm navbar">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mc-horizontal-menu-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!-- /.navbar-header -->
                <div class="collapse navbar-collapse" id="mc-horizontal-menu-collapse">
                     <ul class="nav navbar-nav">
                         <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemplaceholder">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                </LayoutTemplate>
               <ItemTemplate>
                  
                        <li class="dropdown">
                             <a href="product.aspx?danhmuc=<%# Eval("MaDM") %>" class="dropdown-toggle" data-hover="dropdown"><%# Eval("TenDM") %></a>
                        </li>
                         </ItemTemplate>
                             </asp:ListView>

                        
                    </ul>
                    <!-- /.navbar-nav -->
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.navbar -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- /.megamenu-vertical -->
          <div class="animate-dropdown">
        <!-- ========================================= BREADCRUMB ========================================= -->
               <asp:ListView ID="listNguoiDung" runat="server" ItemPlaceholderID="itemplaceholder1">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                    </LayoutTemplate>
                   <ItemTemplate>
        <div id="breadcrumb-alt">
            <div class="container">
                <div class="breadcrumb-nav-holder minimal">
                    <ul>
                     
                        <li class="breadcrumb-item">
                            <a href="index.aspx">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item current">
                            <a href="#">tài khoản</a>
                        </li>
                        <li class="breadcrumb-item current">
                            <a href="#"><%#Eval("HoTen") %></a>
                        </li>
                    </ul>
                </div>
                <!-- /.breadcrumb-nav-holder -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#breadcrumb-alt -->
        <!-- ========================================= BREADCRUMB : END ========================================= -->
    </div>
    <!-- ========================================= NAVIGATION : END ========================================= -->
  </header>
    <main id="blog" class="inner-bottom-xs">
      
                <div class="container">
      <div class="row">
           
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
             
   
                  <div class="panel panel-info">
              
                    <div class="panel-heading">
                      <h3 class="panel-title">Xin chào <%#Eval("HoTen") %></h3>
                    </div>
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="assets/images/default-avatar.jpg" class="img-circle"> </div>

                        <div class=" col-md-9 col-lg-9 "> 
                          <table class="table table-user-information">
                            <tbody>
                              <tr>
                                <td>Tài khoản</td>
                                <td><%#Eval("TaiKhoan") %></td>
                              </tr>                  
                              <tr>
                                <td>Giới tính</td>
                                <td><%#Eval("GioiTinh") %></td>
                              </tr>                
                                 <tr>
                                     <tr>
                                <td>Địa chỉ</td>
                                <td><%#Eval("DiaChi") %></td>
                              </tr>
                                <tr>
                                <td>Thành phố</td>
                                <td><%#Eval("ThanhPho") %></td>
                              </tr>
                              <tr>
                                <td>Email</td>
                                <td><a><%#Eval("Email") %></a></td>
                              </tr>
                                <td>Số điện thoại</td>
                                <td><%#Eval("SoDienThoai") %>
                                </td>
                           
                              </tr>
                     
                            </tbody>
                          </table>
                  
                          <a href="changepassword.aspx" class="btn btn-primary">Đổi mật khẩu</a>
                          <a href="changeprofile.aspx" class="btn btn-primary" style="float:right;">Thay đổi thông tin</a>
                        </div>
                      </div>
                    </div>               
            
                  </div>
                   </div>
                </div>
              </div>
           
                   
                </div>
            </main>
                       </ItemTemplate>
                  </asp:ListView>
</asp:Content>

