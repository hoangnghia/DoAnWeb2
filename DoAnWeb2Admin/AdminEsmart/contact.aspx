<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            initialize();
        });
    	</script>
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
                            <a href="Default.aspx">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item current">
                            <a href="contact.aspx">Liên hệ</a>
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
    <style type="text/css">
        .google_maps_lienhe {
          
          width: 100%;
          
          margin-left: 3px;
          border: 1px solid rgba(48, 41, 41, 0.18);
        }
      
    </style>
    <main id="contact-us" class="inner-bottom-md">
	    

	<div class="container">
		<div class="row">
			
			<div class="col-md-8">
				<section class="section leave-a-message">
					<h2 class="bordered">Để lại lời nhắn cho chúng tôi</h2>
                    <p><strong>ESmart.vn rất hân hạnh được phục vụ quý khách!</strong></p>
					<p>Mọi thắc mắc hoặc góp ý, quý khách vui lòng điền vào nội dung bên dưới.</p>			
                        <div class="col-lg-6" style="width: 100%;">
                        <% if (Session["mand"] != null){%>
                               
                         <asp:ListView ID="listNguoiDung" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
                           

                           <div class="row field-row">
                               <div class="col-xs-12 col-sm-6">
                                    <label for="InputName">Họ tên</label>
                                    <div class="input-group ">
                                        <input type="text" class="le-input" name="InputName" id="InputNameContact" value="<%#Eval("HoTen") %>" required>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <label for="InputEmail">Email</label>
                                    <div class="input-group">
                                        <input type="email" class="le-input" id="InputEmail" name="InputEmailContact" value="<%#Eval("Email") %>" required>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                </div>                           
                          </div>
                             <div class="form-group">
                            <label for="InputTitle">Tiêu đề</label>
                            <div class="input-group">
                              <input type="text" class="le-input" id="InputTitleContact" name="InputTitle"  placeholder="Xin quý khách vui lòng mô tả chi tiết." required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                          <div class="form-group">
                            <label for="InputMsg">Tin nhắn của bạn:</label>
                            <div class="input-group">
                               <textarea rows="8" class="le-input" id="msgContact" placeholder="Tin nhắn của bạn"></textarea>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                               <div class="row">
                                <div class="col-sm-12">
                                    <span id="lbLoiContact" style="color:#FF0004; line-height:35px;" ></span>                                     
                                </div>                                
                            </div>
                           
                           
                        <input type="submit" onclick="sendContact(); return false;" name="submit" id="submit" value="Gửi tin nhắn" class="le-button" style="padding: 18px 52px;border-radius: 0;float:right">
                                   </ItemTemplate>
                             </asp:ListView>
                    <%} else{ %>
                                <div class="row field-row">
                               <div class="col-xs-12 col-sm-6">
                                    <label for="InputName">Họ tên</label>
                                    <div class="input-group ">
                                        <input type="text" class="le-input" name="InputName" id="InputNameContact" placeholder="Nhập họ tên của bạn" required>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <label for="InputEmail">Email</label>
                                    <div class="input-group">
                                        <input type="email" class="le-input" id="InputEmail" name="InputEmailContact" placeholder="Nhập email của bạn" required>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                                </div>                           
                          </div>
                             <div class="form-group">
                            <label for="InputTitle">Tiêu đề</label>
                            <div class="input-group">
                              <input type="text" class="le-input" id="InputTitleContact" name="InputTitle"  placeholder="Xin quý khách vui lòng mô tả chi tiết." required  >
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                          <div class="form-group">
                            <label for="InputMsg">Tin nhắn của bạn:</label>
                            <div class="input-group">
                               <textarea rows="8" class="le-input" id="msgContact" placeholder="Tin nhắn của bạn"></textarea>
                              <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
                          </div> 
                            <div class="row">
                                <div class="col-sm-12">
                                    <span id="lbLoiContact" style="color:#FF0004; line-height:35px;" ></span>                                     
                                </div>                                
                            </div>
                           
                           
                        <input type="submit" name="submit" onclick="sendContact(); return false;" id="submit" value="Gửi tin nhắn" class="le-button" style="padding: 18px 52px;border-radius: 0;float:right">

                            <%} %>
                    </div><!-- /.contact-form -->
				</section><!-- /.leave-a-message -->
			</div><!-- /.col -->

			<div class="col-md-4">
				<section class="our-store section inner-left-xs">
					<h2 class="bordered">Địa chỉ ESmart</h2>
					<address>
						227 Nguyễn Văn Cừ <br/>
						Phường 7, Quận 5 <br/>
						Thành phố Hồ Chí Minh
					</address>
					<h3>Giờ làm việc</h3>
					<ul class="list-unstyled operation-hours">
						
							<span class="day">Làm tất các các ngày trừ thứ 7 và chủ nhật:</span>
							<span class="day">Sáng: 7h-11h / Chiều: 14h-18h</span>                            
											
					</ul>
					<h3>Tuyển dụng</h3>
					<p>Nếu bạn quan tâm đến cơ hội việc làm tại ESmart, xin vui lòng email cho chúng tôi: <a href="mailto:esmart@gmail.com">esmart@gmail.com</a></p>
				</section><!-- /.our-store -->
			</div><!-- /.col -->

		</div><!-- /.row -->

	</div><!-- /.container -->
       <div class="container" style="  margin-top: 35px;">
                 <section class="google-map map-holder">
		        <div class="google_maps_lienhe">
                    <div id="div_id" style="height:500px; width:100%"></div>
                </div>
		        <!-- Begin Code Google maps tham khao trên mạng -->
            <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>

  
            <script type="text/javascript">
                var map;
                function initialize() {
                    var myLatlng = new google.maps.LatLng(10.762928, 106.682302);
                    var myOptions = {
                        zoom: 16,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
                    map = new google.maps.Map(document.getElementById("div_id"), myOptions);
                    // Biến text chứa nội dung sẽ được hiển thị
                    var text;
                    text = "<b style='color:red' " +
                             "style='text-align:center'>ESmart<br /> 227 Nguyễn Văn Cừ, Quận 5 <br />" + "<img src='assets/images/logo.png'>"
                    "</b>";
                    var infowindow = new google.maps.InfoWindow(
                     {
                         content: text,
                         size: new google.maps.Size(100, 50),
                         position: myLatlng
                     });
                    infowindow.open(map);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        title: "Trường ĐH KHTN TP.HCM!"
                    });
                }
            </script>
    
        <!-- Begin Code Google maps tham khao trên mạng -->
	        </section>
     </div>
    
</main>
</asp:Content>

