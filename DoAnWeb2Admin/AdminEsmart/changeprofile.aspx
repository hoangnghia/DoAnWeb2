<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="changeprofile.aspx.cs" Inherits="changeprofile" %>

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
                        <p class="text-center">Vui lòng nhập đầy đủ thông tin để thay đổi</p>
                        <form role="form" id="aspnetForm" class="login-form cf-style-1">
						<div id="logginForm" <%--style="height: 500px; overflow: auto; overflow-x: visible;"--%>>
                               <div class="form-group">
                            <label for="InputUserName">Tên tài khoản</label>
                            <div class="input-group">
                              <input type="username" disabled="" class="le-input" id="InputUserNameUD" value=" <%#Eval("TaiKhoan") %>" name="InputUserName"  required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                  <label for="lbLoi" class="lbLoi hide"></label>   
                          </div>
                       <div class="form-group">
                            <label for="InputName">Họ tên</label>
                            <div class="input-group ">
                              <input type="text" class="le-input" name="InputName" id="InputNameUD" value=" <%#Eval("HoTen") %>" required>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                            <label for="lbLoi" class="lbLoi hide"></label>   
                          </div>
                          <div class="form-group">
                            <label for="InputEmail">Email</label>
                            <div class="input-group">
                              <input type="email" class="le-input" id="InputEmailUD" value=" <%#Eval("Email") %>" name="InputEmail"  required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                               <label for="lbLoi" class="lbLoi hide"></label>   
                          </div>
                          
                            
                              <div class="form-group">
                             <label for="InputEmail">Ngày sinh</label> 
                           <div class="collection">
                                <select name="InputNamSinh" class="le-input" style="width: 32%;" id="InputNamSinhUD">                                 
                                    
                                    <option selected="selected" value="-">Chọn năm</option>
                                    <option value="1941">1941</option>
                                    <option value="1942">1942</option>
                                    <option value="1943">1943</option>
                                    <option value="1944">1944</option>
                                    <option value="1945">1945</option>
                                    <option value="1946">1946</option>
                                    <option value="1947">1947</option>
                                    <option value="1948">1948</option>
                                    <option value="1949">1949</option>
                                    <option value="1950">1950</option>
                                    <option value="1951">1951</option>
                                    <option value="1952">1952</option>
                                    <option value="1953">1953</option>
                                    <option value="1954">1954</option>
                                    <option value="1955">1955</option>
                                    <option value="1956">1956</option>
                                    <option value="1957">1957</option>
                                    <option value="1958">1958</option>
                                    <option value="1959">1959</option>
                                    <option value="1960">1960</option>
                                    <option value="1961">1961</option>
                                    <option value="1962">1962</option>
                                    <option value="1963">1963</option>
                                    <option value="1964">1964</option>
                                    <option value="1965">1965</option>
                                    <option value="1966">1966</option>
                                    <option value="1967">1967</option>
                                    <option value="1968">1968</option>
                                    <option value="1969">1969</option>
                                    <option value="1970">1970</option>
                                    <option value="1971">1971</option>
                                    <option value="1972">1972</option>
                                    <option value="1973">1973</option>
                                    <option value="1974">1974</option>
                                    <option value="1975">1975</option>
                                    <option value="1976">1976</option>
                                    <option value="1977">1977</option>
                                    <option value="1978">1978</option>
                                    <option value="1979">1979</option>
                                    <option value="1980">1980</option>
                                    <option value="1981">1981</option>
                                    <option value="1982">1982</option>
                                    <option value="1983">1983</option>
                                    <option value="1984">1984</option>
                                    <option value="1985">1985</option>
                                    <option value="1986">1986</option>
                                    <option value="1987">1987</option>
                                    <option value="1988">1988</option>
                                    <option value="1989">1989</option>
                                    <option value="1990">1990</option>
                                    <option value="1991">1991</option>
                                    <option value="1992">1992</option>
                                    <option value="1993">1993</option>
                                    <option value="1994">1994</option>
                                    <option value="1995">1995</option>
                                    <option value="1996">1996</option>
                                    <option value="1997">1997</option>
                                    <option value="1998">1998</option>
                                    <option value="1999">1999</option>
                                    <option value="2000">2000</option>
                                    <option value="2001">2001</option>
                                    <option value="2002">2002</option>
                                    <option value="2003">2003</option>
                                    <option value="2004">2004</option>
                                    <option value="2005">2005</option>
                                    <option value="2006">2006</option>
                                    <option value="2007">2007</option>
                                    <option value="2008">2008</option>
                                    <option value="2009">2009</option>
                                    <option value="2010">2010</option>
                                    <option value="2011">2011</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                </select>
                                <select name="InputThangSinh" class="le-input" style="width: 32%;"  id="InputThangSinhUD">
                                      <option selected="selected" value="-">Chọn tháng</option>
                                    <option value="01">Tháng một</option>
                                    <option value="02">Tháng hai</option>
                                    <option value="03">Tháng ba</option>
                                    <option value="04">Tháng tư</option>
                                    <option value="05">Tháng năm</option>
                                    <option value="06">Tháng sáu</option>
                                    <option value="07">Tháng bảy</option>
                                    <option value="08">Tháng tám</option>
                                    <option value="09">Tháng chín</option>
                                    <option value="10">Tháng mười</option>
                                    <option value="11">Tháng mười một</option>
                                    <option value="12">Tháng mười hai</option>
                                </select>
                                <select name="InputNgaySinh" class="le-input" style="width: 32%;" id="InputNgaySinhUD">
                                     <option selected="selected" value="-">Chọn ngày</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>    
                                    </select>                           
                            </div> 
                                   <label for="lbLoi" class="lbLoi hide"></label>   
                              </div>
                            
                       <div class="form-group">
                           <label>Giới tính</label>
                            <div class="btn-group" style="width: 100%;">                                                             
                                    <select class="le-input" name="InputNGioiTinh" id="InputNGioiTinhUD"> 
                                         <option value=" <%#Eval("GioiTinh") %>"> <%#Eval("GioiTinh") %></option>                                         
                                        <option value="-" selected="selected">Chọn giới tính</option>
                                        <option value="Nam" >Nam</option>
                                        <option value="Nữ">Nữ</option>
                                    </select>                              
                            </div>
                           <label for="lbLoi" class="lbLoi hide"></label>   
                       </div>
                        <div class="form-group">
                        <label>Địa chỉ(đường, xã, phường, huyện....)</label>
                            <div class="input-group">
                                <input type="text" class="le-input" name="InputDiaChi" id="InputDiaChiUD" value=" <%#Eval("DiaChi") %>" required>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>                                 
                            </div>
                             <label for="lbLoi" class="lbLoi hide"></label>   
                        </div>
                        <div class="form-group">
                        <label>Tỉnh/ Thành phố</label>
                            <div class="btn-group" style="width: 100%;">  
                                                                                               
                                    <select name="InputThanhPho" id="InputThanhPhoUD" class="le-input"> 
                                         <option value=" <%#Eval("ThanhPho") %>"> <%#Eval("ThanhPho") %></option>                                       
                                    <option value="-">Chọn tỉnh/thành phố</option>
                                     <option value="An Giang">An Giang</option>
                                    <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Bình Định">Bình Định</option>
                                    <option value="Bình Phước">Bình Phước</option>
                                    <option value="Bình Thuận">Bình Thuận</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Kạn">Bắc Kạn</option>
                                    <option value="Bạc Liêu">Bạc Liêu</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bến Tre">Bến Tre</option>
                                    <option value="Cà Mau">Cà Mau</option>
                                    <option value="Cần Thơ">Cần Thơ</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Đà Nẵng">Đà Nẵng</option>
                                    <option value="Đắk Lắk">Đắk Lắk</option>
                                    <option value="Đắk Nông">Đắk Nông</option>
                                    <option value="Điện Biên">Điện Biên</option>
                                    <option value="Đồng Nai">Đồng Nai</option>
                                    <option value="Đồng Tháp">Đồng Tháp</option>
                                    <option value="Gia Lai">Gia Lai</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hà Nam">Hà Nam</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                                    <option value="Hòa Bình">Hòa Bình</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Hậu Giang">Hậu Giang</option>
                                    <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Khánh Hòa">Khánh Hòa</option>
                                    <option value="Kiên Giang">Kiên Giang</option>
                                    <option value="Kon Tum">Kon Tum</option>
                                    <option value="Lâm Đồng">Lâm Đồng</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Lai Châu">Lai Châu</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Long An">Long An</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Nghệ An">Nghệ An</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Ninh Thuận">Ninh Thuận</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Phú Yên">Phú Yên</option>
                                    <option value="Quảng Bình">Quảng Bình</option>
                                    <option value="Quảng Nam">Quảng Nam</option>
                                    <option value="Quảng Ngãi">Quảng Ngãi</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Quảng Trị">Quảng Trị</option>
                                    <option value="Sóc Trăng">Sóc Trăng</option>
                                    <option value="Sơn La">Sơn La</option>
                                    <option value="Tây Ninh">Tây Ninh</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Thanh Hóa">Thanh Hóa</option>
                                    <option value="Thừa Thiên - Huế">Thừa Thiên - Huế</option>
                                    <option value="Tiền Giang">Tiền Giang</option>
                                    <option value="Trà Vinh">Trà Vinh</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Long">Vĩnh Long</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                    <option value="Yên Bái">Yên Bái</option>
                                    </select>                              
                            </div>
                        </div>
                          <div class="form-group">
                            <label for="InputReal">Số điện thoại</label>
                            <div class="input-group">
                              <input type="text" class="le-input" name="InputReal" id="InputPhoneUD" value="<%#Eval("SoDienThoai") %>" required>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                               <label for="lbLoi" class="lbLoi hide"></label>   
                          </div>                         
                         </div><!-- /#loginForm -->
                        <div class="buttons-holder">
                            <button type="submit" name="submit" class="le-button huge" onclick="changeprofile(); return false;">Cập nhật</button>
                                   
                        </div><!-- /.buttons-holder -->
					</form><!-- /.cf-style-1 -->
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
</asp:Content>

