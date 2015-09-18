<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

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
                            <a href="#">Đổi mật khẩu</a>
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
    <asp:ListView ID="listNguoiDung" runat="server" ItemPlaceholderID="itemplaceholder1">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                    </LayoutTemplate>
                   <ItemTemplate>
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
                    <div class="col-sm-12">
                        <p class="text-center">Vui lòng nhập đầy đủ thông tin để đổi mật khẩu</p>
                        <form method="post" id="passwordForm">
                            <input type="password" class="input-lg form-control" name="password1" id="password1" placeholder="Mật khẩu mới..." autocomplete="off">
                            <div class="row">
                                <div class="col-sm-6">
                                    <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004; line-height:35px;" ></span> Lớn hơn 8 kí tự
                                    
                                </div>                                
                            </div>
                            <input type="password" class="input-lg form-control" name="password2" id="password2" placeholder="Nhập lại mật khẩu..." autocomplete="off">
                            <div class="row">
                                <div class="col-sm-12">
                                    <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;line-height:35px;"></span> Mật khẩu trùng
                                </div>
                            </div>
                            <input type="submit" onclick="changePassWord(); return false;" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Đổi mật khẩu">
                        </form>
                    </div>
                    <!--/col-sm-6-->
                </div>
                <!--/row-->
                    </div>               
            
                  </div>
                      

                   </div>
                </div>
              </div>
           
                   
                
            </main>
                        </ItemTemplate>
                      </asp:ListView>
    <script>
        $("input[type=password]").keyup(function () {


            if ($("#password1").val().length >= 8) {
                $("#8char").removeClass("glyphicon-remove");
                $("#8char").addClass("glyphicon-ok");
                $("#8char").css("color", "#00A41E");
            } else {
                $("#8char").removeClass("glyphicon-ok");
                $("#8char").addClass("glyphicon-remove");
                $("#8char").css("color", "#FF0004");

            }

            if ($("#password1").val() == $("#password2").val()) {
                $("#pwmatch").removeClass("glyphicon-remove");
                $("#pwmatch").addClass("glyphicon-ok");
                $("#pwmatch").css("color", "#00A41E");
            } else {
                $("#pwmatch").removeClass("glyphicon-ok");
                $("#pwmatch").addClass("glyphicon-remove");
                $("#pwmatch").css("color", "#FF0004");

            }
        });
    </script>
</asp:Content>

