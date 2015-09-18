<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        #checkout-page #subtotal-holder .tabled-data li .value {
          float: right;
          width: auto;
        }   
        #checkout-page #subtotal-holder .tabled-data li label {
          min-width: 0;
        }
   </style>
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
                         <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="itemplaceholder">
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
                            <a href="cart.aspx">Thanh toán</a>
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
			
            <style type="text/css">
               .dong {
                    border-bottom: 1px solid #e0e0e0;
                    margin-bottom: 10px;
                }
                .InputColor
                    {
                      color: #3D3D3D;
                      float:right;
                    }
            </style>
			<div class="col-md-8">
				 <section id="your-order">
                <h2 class="border h1">Hoá đơn của bạn</h2>
                <form>
                    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemplaceholder">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                    </LayoutTemplate>
                   <ItemTemplate>
                      
                    <div class="row no-margin order-item dong" >
                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a href="#" id ="SoLuong" class="qty"> <%# Eval("SoLuong") %> x</a>
                        </div>
                        <div id="MaND" class="hide"><%= (Session["mand"]) %></div>
                        <div id="MaSanPham" class="hide"><%# Eval("MaSP")%></div>
                        <div class="col-xs-12 col-sm-7 ">
                            <div class="title"><a href="product-detail.aspx?masp=<%# Eval("MaSP")%>" target="_blank"> <%# Eval("TenSP") %></a></div>
                            <div class="brand">iPhone</div>
                        </div>

                        <div class="col-xs-12 col-sm-2 no-margin">
                            <div class="price" id="Gia"> <%# Eval("Gia", "{0:N0}") %> VND</div>
                        </div>
                        <div class="col-xs-12 col-sm-2 no-margin">
                            <div class="price" id="ThanhTien"> <%# Eval("ThanhTien", "{0:N0}") %> VND</div>
                        </div>
                    </div><!-- /.order-item -->
                        </ItemTemplate>
                       </asp:ListView>
                    
                </form>
            </section><!-- /#your-order -->
                

            <div id="total-area" class="row no-margin">
                <div class="col-xs-6" style="float: right;margin-top:10px;">
                    <div id="subtotal-holder">
                        <ul class="tabled-data inverse-bold no-border">
                            <li>
                                <label>Tổng cộng hoá đơn</label>
                                
                                 <span class="valuePrice">0</span> <span class="sign"> VND</span>
                            </li>                          
                            <li>
                                <label>Phí thực hiện đơn hàng</label>
                                <div class="value ">Miễn phí</div>
                            </li>
                            <div class="hide" id="TongTien"></div>
                        </ul><!-- /.tabled-data -->

                        <ul id="total-field" class="tabled-data inverse-bold ">
                            <li>
                                <label>Thành tiền</label>
                                
                                <span class="valuePrice">0</span> <span class="sign"> VND</span>
                            </li>
                        </ul><!-- /.tabled-data -->

                    </div><!-- /#subtotal-holder -->
                </div><!-- /.col -->
            </div><!-- /#total-area -->
			</div><!-- /.col -->

			<div class="col-md-4">
				<section class="our-store section inner-left-xs" style="margin:0">
					   <% if(Session["username"] != null) {%>
            <asp:ListView ID="lstNguoiDung" runat="server" ItemPlaceholderID="placehodel">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="placehodel" runat="server"/>
                </LayoutTemplate>
                <ItemTemplate>               

            <div class="billing-address">
                <h2 class="border h1" style="line-height:normal;">Địa chỉ thanh toán</h2>
                   <form role="form" action="" method="post" >
                        <div class="col-lg-6" style="width: 100%;">
                        
                          <div class="form-group">
                              <% if (Session["gioitinh"].ToString() == "Nam"){%>
                            <label  for="InputName">
                                Anh/chú: 
                            </label>
                              <%} else{ %>
                              <label for="InputName">Chị/cô: </label>
                              <%} %>
                              <label class="InputColor" for="InputName"><%# Eval("HoTen") %></label>
                           
                          </div>
                          <div class="form-group">
                            <label for="InputEmail">Email: </label>
                             <label class="InputColor" for="InputEmail"><%# Eval("Email") %></label>
                          </div> 
                            <div class="form-group">
                            <label for="InputPhone">Điện Thoại: </label>
                           <label class="InputColor" for="InputPhone"><%# Eval("SoDienThoai") %></label>
                        
                          </div> 
                             <div class="form-group">
                            <label for="InputAddress">Địa Chỉ: </label>
                            <label class="InputColor" for="InputAddress"><%# Eval("DiaChi") %></label>
                          </div> 
                             <div class="form-group">
                            <label for="InputCity">Tỉnh/Thành phố: </label>
                             <label class="InputColor" for="InputCity"><%# Eval("ThanhPho") %></label>
                          </div> 
                          <a href="changeprofile.aspx"><input name="submit" value="Thay đổi" id="submit" class="le-button" style="border-radius: 0;float:right; cursor:pointer; text-align:center"></a>
                        </div>
                      </form>
            </div><!-- /.billing-address -->
                    </ItemTemplate>                
            </asp:ListView>
            <%} else{ %>
                    <div class="billing-address">
                <h2 class="border h1">Địa chỉ thanh toán</h2>
                   <form role="form" action="" method="post" >
                        <div class="col-lg-6" style="width: 100%;">
                        
                          <div class="form-group">
                            <label for="InputName">Họ tên</label>
                            <div class="input-group ">
                              <input type="text" class="le-input" name="InputName" id="InputName1" placeholder="Họ tên của bạn"  required>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div>
                          <div class="form-group">
                            <label for="InputEmail">Email</label>
                            <div class="input-group">
                              <input type="email" class="le-input" id="InputEmail1" name="InputEmail" placeholder="Nhập email .." required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                            <div class="form-group">
                            <label for="InputPhone">Điện Thoại</label>
                            <div class="input-group">
                              <input type="text" class="le-input" id="InputPhone1" name="InputPhone" placeholder="Nhập số điện thoại .." required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                             <div class="form-group">
                            <label for="InputAddress">Địa Chỉ</label>
                            <div class="input-group">
                              <input type="text" class="le-input" id="InputAddress1" placeholder="Số nhà, đường, (toà nhà), phường/xã, huyện.." required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                             <div class="form-group">
                            <label for="InputCity">Tỉnh/Thành phố</label>
                            <div class="input-group">
                              <select class="input-text accountCreateBirthYear le-input" style="width: 100%;"">
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

            <%} %>
				</section><!-- /.our-store -->
			</div><!-- /.col -->

		</div><!-- /.row -->

	</div><!-- /.container -->
        <div class="container">
            <div class="row">
               <section id="checkout-page">
    <div class="container">
        <div class="col-xs-12 no-margin">
         




            <div id="payment-method-options">
                <h2 class="border h1">Chọn phương thức thanh toán</h2>
                <form>
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" id="orDerNhanHang" name="group2" value="Nhận Hàng">
                        <div class="radio-label bold ">Thanh toán khi nhận hàng<br>
                            <p style="margin-top: 10px;">Bạn sẽ thanh toán bằng tiền mặt khi nhận hàng tại nhà</p>
                            
                        </div>
                    </div><!-- /.payment-method-option -->
                    
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" id="orDerNganHang" name="group2" value="Ngân Hàng">
                        <div class="radio-label bold ">Thanh toán qua Ngân Lượng</div>
                        <div class="payment-methods ">
                           
                            <a target="_blank" href="https://www.nganluong.vn/button_payment.php?receiver=hoangnghiagll@gmail.com&product_name= 'HD01' &price=(6000000)&return_url=(http://localhost:60571/payment.aspx)&comments=(Sản phẩm của chúng tôi luôn chất lượng tốt nhất)">
                            <img src="https://www.nganluong.vn/data/images/buttons/11.gif" border="0" /></a>                       
                       
                        </div>
                    </div><!-- /.payment-method-option -->
                    
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="paypal">
                        <div class="radio-label bold ">Thẻ ATM nội địa</div>
                        <h5 style="  margin-top: 10px;">Để thực hiện việc thanh toán, bắt buộc thẻ ATM của bạn đã có đăng ký sử dụng dịch vụ Internet Banking.</h5>
                        <p style="margin-top: 5px;">ESmart hiện đã hỗ trợ thanh toán qua 25 ngân hàng tại Việt Nam. Thẻ ATM của bạn cần phải được đăng ký sử dụng Internet Banking để sử dụng tính năng này.</p>
                    </div><!-- /.payment-method-option -->
                </form>
            </div><!-- /#payment-method-options -->
            
            <div class="place-order-button">
                <button class="le-button big" onclick="checkpayment();return false;" >Đặt hoá đơn</button>
            </div><!-- /.place-order-button -->

        </div><!-- /.col -->
    </div><!-- /.container -->    
</section><!-- /#checkout-page -->
            </div>
        </div>
    </main>
    <style type="text/css">
    .payment-methods li {
           display: inline-block;
          width: 70px;
          margin-left: 25px;
        }
    </style>
</asp:Content>

