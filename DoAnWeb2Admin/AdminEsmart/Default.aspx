<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .menu-dow {
            font-size:20px;
        }
        span.menu-dow:hover {
          color: #939393;
        }
    </style>
    
    <div id="top-banner-and-menu">
	<div class="container">
		
		<div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">
			<!-- ================================== TOP NAVIGATION ================================== -->
<div class="side-menu animate-dropdown">
    <div class="head"><i class="fa fa-list"></i> Tất cả danh mục</div>        
    <nav class="yamm megamenu-horizontal" role="navigation">
        <ul class="nav"> 
          
            <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemplaceholder">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                </LayoutTemplate>
               <ItemTemplate>
                <li class="dropdown menu-item">
                
                 <a href="product.aspx?danhmuc=<%# Eval("MaDM") %>"><%# Eval("TenDM") %></a>
                
            </li><!-- /.menu-item -->
                   </ItemTemplate>
            </asp:ListView>
               <li class="dropdown menu-item">
                <a href="news.aspx" >Tin tức</a>
               
            </li><!-- /.menu-item -->
           
           
         
         
        </ul><!-- /.nav -->
    </nav><!-- /.megamenu-horizontal -->
</div><!-- /.side-menu -->
<!-- ================================== TOP NAVIGATION : END ================================== -->		</div><!-- /.sidemenu-holder -->

		<div class="col-xs-12 col-sm-8 col-md-9 homebanner-holder">
			<!-- ========================================== SECTION – HERO ========================================= -->
			
<div id="hero">
	<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
		
		<div class="item">
			 <a href="#"><img src="assets/images/sliders/slider01.jpg" /></a>
            <%--<div class="container-fluid">
				<div class="caption vertical-center text-left">
					<div class="big-text fadeInDown-1">
					Save up to a<span class="big"><span class="sign">$</span>400</span>
					</div>

					<div class="excerpt fadeInDown-2">
					    on selected laptops<br>
						& desktop pcs or<br>
						smartphones
					</div>
					<div class="small fadeInDown-2">
						terms and conditions apply
					</div>
					<div class="button-holder fadeInDown-3">
						<a href="product-detail.aspx" class="big le-button ">mua ngay</a>
					</div>
				</div><!-- /.caption -->
			</div>--%><!-- /.container-fluid -->
		</div><!-- /.item -->
        	
		<div class="item" >
	        <a href="#"><img src="assets/images/sliders/slider03.jpg" /></a>
            <%--<div class="container-fluid">
				<div class="caption vertical-center text-left">
					<div class="big-text fadeInDown-1">
					Want a<span class="big"><span class="sign">$</span>200</span>Discount?
					</div>

					<div class="excerpt fadeInDown-2">
						on selected <br>desktop pcs<br>
					</div>
					<div class="small fadeInDown-2">
					terms and conditions apply
					</div>
					<div class="button-holder fadeInDown-3">
						<a href="product-detail.aspx" class="big le-button ">mua ngay</a>
					</div>
				</div><!-- /.caption -->
			</div>--%><!-- /.container-fluid -->
           
		</div><!-- /.item -->
   

	</div><!-- /.owl-carousel -->
</div>
			
<!-- ========================================= SECTION – HERO : END ========================================= -->			
		</div><!-- /.homebanner-holder -->

	</div><!-- /.container -->
</div><!-- /#top-banner-and-menu -->
        <!-- ========================================= HOME BANNERS ========================================= -->
<section id="banner-holder" class="wow fadeInUp">
    <div class="container">
        <div class="col-xs-12 col-lg-6 no-margin banner">
            <a href="/">
                <%--<div class="banner-text theblue">
                    <h1>Galaxy S5</h1>
                    <span class="tagline">Nâng tầm cuộc sống</span>
                </div>--%>
                <img class="banner-image" alt="" src="assets/images/blank.gif" data-echo="assets/images/banners/banner-narrow-01.jpg" />
            </a>
        </div>
        <div class="col-xs-12 col-lg-6 no-margin text-right banner">
            <a href="/">
                <%--<div class="banner-text right">
                    <h1> Đồng hồ thông minh</h1>
                    <span class="tagline">Quản lí mọi thứ</span>
                </div>--%>
                <img class="banner-image" alt="" src="assets/images/blank.gif" data-echo="assets/images/banners/banner-narrow-02.jpg" />
            </a>
        </div>
    </div><!-- /.container -->
</section><!-- /#banner-holder -->
<!-- ========================================= HOME BANNERS : END ========================================= -->
<div id="products-tab" class="wow fadeInUp">
    <div class="container">
        <div class="tab-holder">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" >
                <li class="active"><a href="#featured" data-toggle="tab">Bán chạy</a></li>
                <li><a href="#new-arrivals" data-toggle="tab">Mới</a></li>
                <li><a href="#top-sales" data-toggle="tab">Nổi bật</a></li>
            </ul>
        <style type="text/css">

            #ctl00_ContentPlaceHolder1_datalistSP tr{
              float:left;
              
            }
               #ctl00_ContentPlaceHolder1_datalistSP .col-md-3 {
                width:100%;
            }
        </style>
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="featured">
                    
                        <div class="product-grid-holder" style="float:left">
                            <div class ="loadmoreBanChay">
                           <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="itemplaceholder">
                                    <LayoutTemplate>
                                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                    </LayoutTemplate>
                                   <ItemTemplate>
                                    <div class="col-sm-4 col-md-3 no-margin product-item-holder hover">
                                        <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>">
                                        <div class="product-item">
                                            <div class="ribbon blue"><span>Mới!</span></div> 
                                            <div class="ribbon green"><span>Bán chạy</span></div> 
                                            <div class="image">
                                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:156px;" />
                                            </div>
                                            <div class="body">
                                                <div class="label-discount clear"></div>
                                                <div class="title">
                                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                                </div>
                                                <div class="brand"><%# Eval("HangSX") %></div>
                                            </div>
                                            <div class="prices">
                                                <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                                <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                            </div>
                                            <div class="hover-area">
                                                <div class="add-cart-button">
                                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                                </div>

                                            </div>
                                        </div>
                                            </a>
                                    </div>
                                            </ItemTemplate>
                               </asp:ListView>
                                </div>
                                  </div>
                    <div class="loadmore-holder text-center">
                        <a onclick="loadmoreBanChay();return false" class="btn-loadmore" href="#">
                            <i class="fa fa-plus"></i>
                            Xem thêm sản phẩm</a>
                    </div> 
                  

                </div>
                  
                <div class="tab-pane" id="new-arrivals">
                     
                        
                    <div class="product-grid-holder" style="float:left">
                        <div class ="loadmoreMoi">
                        <asp:ListView ID="listSanPhaMoi" runat="server" ItemPlaceholderID="itemplaceholder1">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                        </LayoutTemplate>
                       <ItemTemplate>
                         <div class="col-sm-4 col-md-3 no-margin product-item-holder hover">
                            <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>">
                            <div class="product-item">
                                <div class="ribbon blue"><span>Mới!</span></div> 
                                <div class="ribbon green"><span>Bán chạy</span></div> 
                                <div class="image">
                                    <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:156px;"/>
                                </div>
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                    </div>
                                    <div class="brand"><%# Eval("HangSX") %></div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                    <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                </div>
                                <div class="hover-area">
                                    <div class="add-cart-button">
                                        <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                    </div>

                                </div>
                            </div>
                                </a>
                        </div> 
                                                
                      </ItemTemplate>
                         </asp:ListView>  
                       </div>
                    </div>
                    <div class="loadmore-holder text-center">
                        <a onclick="loadmoreMoi();return false" class="btn-loadmoreMoi" style="color: #575757; display: inline-block; text-align: center; margin: 21px 0; text-transform: capitalize;" href="#">
                            <i class="fa fa-plus"></i>
                            Xem thêm sản phẩm</a>
                    </div> 
                </div>

             

                <div class="tab-pane" id="top-sales">
                    <div class="product-grid-holder"  style="float:left">
                         <div class ="loadmoreNoiBat">
                         <asp:ListView ID="listSanPhanNoiBat" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
                        <div class="col-sm-4 col-md-3 no-margin product-item-holder hover">
                            <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>">
                            <div class="product-item">
                                <div class="ribbon blue"><span>Mới!</span></div> 
                                <div class="ribbon green"><span>Bán chạy</span></div> 
                                <div class="image">
                                    <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:156px;" />
                                </div>
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                    </div>
                                    <div class="brand"><%# Eval("HangSX") %></div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                    <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                </div>
                                <div class="hover-area">
                                    <div class="add-cart-button">
                                        <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                    </div>

                                </div>
                            </div>
                                </a>
                        </div>  
                               </ItemTemplate>
                             </asp:ListView>  
                             </div>           

                    </div>
                    <div class="loadmore-holder text-center">
                        <a onclick="loadmoreNoiBat();return false" class="btn-loadmoreNoiBat" style="color: #575757; display: inline-block; text-align: center; margin: 21px 0; text-transform: capitalize;" href="#">
                            <i class="fa fa-plus"></i>
                            Xem thêm sản phẩm</a>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ========================================= BEST SELLERS ========================================= -->
<section id="bestsellers" class="color-bg wow fadeInUp">
    <div class="container">
        <h1 class="section-title">Sản phẩm Apple</h1>

        <div class="product-grid-holder medium">
            <div class="col-xs-12 no-margin">
                
                <div class="row no-margin">
                     <asp:ListView ID="listSanPhamApple" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
			


                               <div class="col-sm-4 col-md-3 no-margin product-item-holder hover" >
                        <div class="product-item">
                            <div class="image">
                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:150px;" />
                            </div>
                            <div class="body">
                                <div class="label-discount clear"></div>
                                <div class="title">
                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                </div>
                                <div class="brand"><%# Eval("HangSX") %></div>
                            </div>
                            <div class="prices">
                                <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                 <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                            </div>
                            <div class="hover-area">
                                <div class="add-cart-button">
                                      <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                </div>
                              <%--  <div class="wish-compare">
                                    <a class="btn-add-to-wishlist" href="#">Add to Wishlist</a>
                                    <a class="btn-add-to-compare" href="#">Compare</a>
                                </div>--%>
                            </div>
                        </div>
                    </div><!-- /.product-item-holder -->
            </ItemTemplate>
                    </asp:ListView>
                   

               

                </div><!-- /.row -->
                
                
            </div><!-- /.col -->
         

        </div><!-- /.product-grid-holder -->
    </div><!-- /.container -->
</section><!-- /#bestsellers -->
    <!-- ========================================= laptop ========================================= -->
<section id="maytinhbang" style="padding: 24px 0 63px 0;" class="color-bg wow fadeInUp">
    <div class="container">
        <h1 class="section-title">Sản phẩm Sam Sung</h1>

        <div class="product-grid-holder medium">
            <div class="col-xs-12">
                
                <div class="row no-margin">
                     <div class="row no-margin">
                     <asp:ListView ID="listSanPhamSamSung" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
			


                               <div class="col-sm-4 col-md-3 no-margin product-item-holder hover" >
                        <div class="product-item">
                            <div class="image">
                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:150px;" />
                            </div>
                            <div class="body">
                                <div class="label-discount clear"></div>
                                <div class="title">
                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                </div>
                                <div class="brand"><%# Eval("HangSX") %></div>
                            </div>
                            <div class="prices">
                                <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                 <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                            </div>
                            <div class="hover-area">
                                <div class="add-cart-button">
                                      <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                </div>
                              <%--  <div class="wish-compare">
                                    <a class="btn-add-to-wishlist" href="#">Add to Wishlist</a>
                                    <a class="btn-add-to-compare" href="#">Compare</a>
                                </div>--%>
                            </div>
                        </div>
                    </div><!-- /.product-item-holder -->
            </ItemTemplate>
                    </asp:ListView>


                </div><!-- /.row -->
            </div><!-- /.col -->
            

        </div><!-- /.product-grid-holder -->
    </div><!-- /.container -->
</section><!-- /#may tinh bang -->
<!-- ========================================= may tinh bang : END ========================================= -->
        <!-- ========================================= laptop ========================================= -->
<section id="laptop" style="padding: 24px 0 63px 0;" class="color-bg wow fadeInUp">
    <div class="container">
        <h1 class="section-title">Sản phẩm Nokia</h1>

        <div class="product-grid-holder medium">
            <div class="col-xs-12">
                
                <div class="row no-margin">
                    <asp:ListView ID="listSPNoKia" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
			


                               <div class="col-sm-4 col-md-3 no-margin product-item-holder hover" >
                        <div class="product-item">
                            <div class="image">
                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:150px;" />
                            </div>
                            <div class="body">
                                <div class="label-discount clear"></div>
                                <div class="title">
                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                </div>
                                <div class="brand"><%# Eval("HangSX") %></div>
                            </div>
                            <div class="prices">
                                <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                 <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                            </div>
                            <div class="hover-area">
                                <div class="add-cart-button">
                                      <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                </div>
                              <%--  <div class="wish-compare">
                                    <a class="btn-add-to-wishlist" href="#">Add to Wishlist</a>
                                    <a class="btn-add-to-compare" href="#">Compare</a>
                                </div>--%>
                            </div>
                        </div>
                    </div><!-- /.product-item-holder -->
            </ItemTemplate>
                    </asp:ListView>

                    

                </div><!-- /.row -->
            </div><!-- /.col -->
            

        </div><!-- /.product-grid-holder -->
    </div><!-- /.container -->
</section><!-- /#laptop -->
            <!-- ========================================= phukien ========================================= -->
<section id="phukien" style="padding: 24px 0 63px 0;" class="color-bg wow fadeInUp">
    <div class="container">
        <h1 class="section-title">Sản phẩm HTC</h1>

        <div class="product-grid-holder medium">
            <div class="col-xs-12">
                
                <div class="row no-margin">
                   <asp:ListView ID="listSPHTC" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
			


                               <div class="col-sm-4 col-md-3 no-margin product-item-holder hover" >
                        <div class="product-item">
                            <div class="image">
                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:150px;" />
                            </div>
                            <div class="body">
                                <div class="label-discount clear"></div>
                                <div class="title">
                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                </div>
                                <div class="brand"><%# Eval("HangSX") %></div>
                            </div>
                            <div class="prices">
                                <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                 <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                            </div>
                            <div class="hover-area">
                                <div class="add-cart-button">
                                      <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                </div>
                              <%--  <div class="wish-compare">
                                    <a class="btn-add-to-wishlist" href="#">Add to Wishlist</a>
                                    <a class="btn-add-to-compare" href="#">Compare</a>
                                </div>--%>
                            </div>
                        </div>
                    </div><!-- /.product-item-holder -->
            </ItemTemplate>
                    </asp:ListView>

                    

                </div><!-- /.row -->
            </div><!-- /.col -->
            

        </div><!-- /.product-grid-holder -->
    </div><!-- /.container -->
</section><!-- /#phukien -->
<!-- ========================================= laptop : END ========================================= -->
<!-- ========================================= RECENTLY VIEWED ========================================= -->
<section id="recently-reviewd" class="wow fadeInUp">
	<div class="container">
		<div class="carousel-holder hover">
			
			<div class="title-nav">
				<h2 class="h1">Có thể bạn muốn mua</h2>
				<div class="nav-holder">
					<a href="#prev" data-target="#owl-recently-viewed" class="slider-prev btn-prev fa fa-angle-left"></a>
					<a href="#next" data-target="#owl-recently-viewed" class="slider-next btn-next fa fa-angle-right"></a>
				</div>
			</div><!-- /.title-nav -->

			<div id="owl-recently-viewed" class="owl-carousel product-grid-holder">

                <asp:ListView ID="listSanPhamNgauNhien" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
				<div class="no-margin carousel-item product-item-holder size-small hover">
					  
                       <div class="product-item">
                                            <div class="ribbon blue"><span>Ngẫu nhiên</span></div> 
                                            
                                            <div class="image">
                                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:150px;" />
                                            </div>
                                            <div class="body">
                                                <div class="label-discount clear"></div>
                                                <div class="title">
                                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                                </div>
                                                <div class="brand"><%# Eval("HangSX") %></div>
                                            </div>
                                            <div class="prices">
                                               <%-- <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>--%>
                                                <div class="price-current "><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                            </div>
                                            <div class="hover-area">
                                                <div class="add-cart-button">
                                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
                                                </div>

                                            </div>
                                        </div>
                   
				</div><!-- /.product-item-holder -->
            </ItemTemplate>
                    </asp:ListView>
				
				</div><!-- /.product-item-holder -->


		



			
			</div><!-- /#recently-carousel -->

		</div><!-- /.carousel-holder -->
	</div><!-- /.container -->
</section><!-- /#recently-reviewd -->
<!-- ========================================= RECENTLY VIEWED : END ========================================= -->
<!-- ========================================= TOP BRANDS ========================================= -->

<!-- ========================================= TOP BRANDS : END ========================================= -->	
    <script>
        var pagebanchay = 0;
        var pageMoi = 0;
        var pageNoiBat = 0;

        function loadmoreBanChay() {
            loaddingStart();
            pagebanchay++;
            var action = "loadmoreBanChay";

            var data = { "action": action, "pagebanchay": pagebanchay };

            $.getJSON(urlAjax, data)

              .done(function (response) {
                  loaddingStop();
                  console.log("JSON Data: " + response);
                  if (response.status == false) {
                      alert("Có lỗi xảy ra! Vui lòng quay lại sau");
                  }
                  else {

                      $(".loadmoreBanChay").append(response.message);
                      //alert(response.message);
                      if (response.message == "") {
                          $(".btn-loadmore").hide();
                      }
                      loaddingStop();
                  }
              })
              .fail(function (jqxhr, textStatus, error) {
                  loaddingStop();
                  var err = textStatus + ", " + error;
                  console.log("Request Failed: " + err);
                  alert("Server bị lỗi! Vui lòng quay lại sau! :)");
              });
        }
        function loadmoreNoiBat() {
            loaddingStart();
            pageNoiBat++;
            var action = "loadmoreNoiBat";

            var data = { "action": action, "pageNoiBat": pageNoiBat };

            $.getJSON(urlAjax, data)

              .done(function (response) {
                  loaddingStop();
                  console.log("JSON Data: " + response);
                  if (response.status == false) {
                      alert("Có lỗi xảy ra! Vui lòng quay lại sau");
                  }
                  else {

                      $(".loadmoreNoiBat").append(response.message);
                      //alert(response.message);
                      if (response.message == "") {
                          $(".btn-loadmoreNoiBat").hide();
                      }
                      loaddingStop();

                  }
              })
              .fail(function (jqxhr, textStatus, error) {
                  loaddingStop();
                  var err = textStatus + ", " + error;
                  console.log("Request Failed: " + err);
                  alert("Server bị lỗi! Vui lòng quay lại sau! :)");
              });
        }
        function loadmoreMoi() {
            loaddingStart();
            pageMoi++;
            var action = "loadmoreMoi";

            var data = { "action": action, "pageMoi": pageMoi };

            $.getJSON(urlAjax, data)

              .done(function (response) {
                  loaddingStop();
                  console.log("JSON Data: " + response);
                  if (response.status == false) {
                      alert("Có lỗi xảy ra! Vui lòng quay lại sau");
                  }
                  else {

                      $(".loadmoreMoi").append(response.message);
                      //alert(response.message);
                      if (response.message == "") {
                          $(".btn-loadmoreMoi").hide();
                      }
                      loaddingStop();
                  }
              })
              .fail(function (jqxhr, textStatus, error) {
                  loaddingStop();
                  var err = textStatus + ", " + error;
                  console.log("Request Failed: " + err);
                  alert("Server bị lỗi! Vui lòng quay lại sau! :)");
              });
        }
    </script>
</asp:Content>

