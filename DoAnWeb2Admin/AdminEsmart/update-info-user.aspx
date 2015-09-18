<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="update-info-user.aspx.cs" Inherits="update_info_user" %>

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
                            <a href="update-info-user.aspx">Chỉnh sửa tài khoản</a>
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
                   <section id="checkout-page">
                        <div class="container">
                            <div class="col-xs-12 no-margin">
            
                                <div class="billing-address">
                                    <h2 class="border h1">Thông tin cá nhân</h2>
                                       <form role="form" action="" method="post" >
                                            <div class="col-lg-6" style="width: 100%;">
                        
                                              <div class="form-group">
                                                <label for="InputName">Họ tên</label>
                                                <div class="input-group ">
                                                  <input type="text" class="le-input" name="InputName" id="InputName" value="Hoàng Nghĩa"  required>
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                              </div>
                                              <div class="form-group">
                                                <label for="InputEmail">Email</label>
                                                <div class="input-group">
                                                  <input type="email" class="le-input" id="InputEmail" name="InputEmail" disabled="" value="hoangnghiagll@gmail.com" required  >
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                              </div> 
                                                <div class="form-group">
                                                <label for="InputPhone">Điện Thoại</label>
                                                <div class="input-group">
                                                  <input type="text" class="le-input" id="InputPhone" name="InputPhone"  value="0165 6528 229" required  >
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                              </div> 
                                                  <div class="form-group">
                                                   <label>Giới tính</label>
                                                      <div class="input-group">                                                            
                                                            <select class="le-input">                                        
                                                                <option value="male" selected="selected">Nam</option>
                                                                <option value="female">Nữ</option>
                                                            </select> 
                                                          <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                                                                    
                                                    </div>

                                               
                                                 <div class="form-group">
                                                <label for="InputAddress">Địa Chỉ</label>
                                                <div class="input-group">
                                                  <input type="text" class="le-input" id="InputAddress" name="InputAddress"  value="27/1 Quách Văn Tuấn -Tân Bình" required  >
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                              </div> 
                                                 <div class="form-group">
                                                <label for="InputCity">Tỉnh/Thành phố</label>
                                                <div class="input-group">
                                                  <select class="input-text accountCreateBirthYear le-input"  style="width: 100%;"">
                                                        <option value="3751">An Giang</option>
                                                        <option value="3756">Bà Rịa - Vũng Tàu</option>
                                                        <option value="3759">Bình Dương</option>
                                                        <option value="3758">Bình Định</option>
                                                        <option value="3760">Bình Phước</option>
                                                        <option value="3761">Bình Thuận</option>
                                                        <option value="3752">Bắc Giang</option>
                                                        <option value="3753">Bắc Kạn</option>
                                                        <option value="3754">Bạc Liêu</option>
                                                        <option value="3755">Bắc Ninh</option>
                                                        <option value="3757">Bến Tre</option>
                                                        <option value="3762">Cà Mau</option>
                                                        <option value="3763">Cần Thơ</option>
                                                        <option value="3764">Cao Bằng</option>
                                                        <option value="3767">Đà Nẵng</option>
                                                        <option value="3765">Đắk Lắk</option>
                                                        <option value="3766">Đắk Nông</option>
                                                        <option value="3768">Điện Biên</option>
                                                        <option value="3769">Đồng Nai</option>
                                                        <option value="3770">Đồng Tháp</option>
                                                        <option value="3771">Gia Lai</option>
                                                        <option value="3772">Hà Giang</option>
                                                        <option value="3775">Hà Nam</option>
                                                        <option value="3776">Hà Nội</option>
                                                        <option value="3778">Hà Tĩnh</option>
                                                        <option value="3779">Hòa Bình</option>
                                                        <option value="3773">Hải Dương</option>
                                                        <option value="3774">Hải Phòng</option>
                                                        <option value="3781">Hậu Giang</option>
                                                        <option value="3780" selected="selected">Hồ Chí Minh</option>
                                                        <option value="3782">Hưng Yên</option>
                                                        <option value="3949">Khánh Hòa</option>
                                                        <option value="3950">Kiên Giang</option>
                                                        <option value="3951">Kon Tum</option>
                                                        <option value="3955">Lâm Đồng</option>
                                                        <option value="3953">Lào Cai</option>
                                                        <option value="3952">Lai Châu</option>
                                                        <option value="3954">Lạng Sơn</option>
                                                        <option value="3956">Long An</option>
                                                        <option value="3957">Nam Định</option>
                                                        <option value="3958">Nghệ An</option>
                                                        <option value="3959">Ninh Bình</option>
                                                        <option value="3960">Ninh Thuận</option>
                                                        <option value="3961">Phú Thọ</option>
                                                        <option value="3962">Phú Yên</option>
                                                        <option value="3963">Quảng Bình</option>
                                                        <option value="3964">Quảng Nam</option>
                                                        <option value="3965">Quảng Ngãi</option>
                                                        <option value="3966">Quảng Ninh</option>
                                                        <option value="3967">Quảng Trị</option>
                                                        <option value="3968">Sóc Trăng</option>
                                                        <option value="3969">Sơn La</option>
                                                        <option value="3970">Tây Ninh</option>
                                                        <option value="3971">Thái Bình</option>
                                                        <option value="3972">Thái Nguyên</option>
                                                        <option value="3973">Thanh Hóa</option>
                                                        <option value="3974">Thừa Thiên - Huế</option>
                                                        <option value="3975">Tiền Giang</option>
                                                        <option value="3976">Trà Vinh</option>
                                                        <option value="3977">Tuyên Quang</option>
                                                        <option value="3978">Vĩnh Long</option>
                                                        <option value="3979">Vĩnh Phúc</option>
                                                        <option value="3980">Yên Bái</option>
                                                    </select>
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                              </div> 
                                              <input type="submit" name="submit" id="submit" value="Cập nhật" class="le-button" style="padding: 18px 52px;border-radius: 0;float:right">
                                            </div>
                                          </form>
                                </div><!-- /.billing-address -->

          

                            </div><!-- /.col -->
                        </div><!-- /.container -->    
                    </section><!-- /#checkout-page -->
            </div>
        </div>
    </main>
</asp:Content>

