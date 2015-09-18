<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product-detail.aspx.cs" Inherits="product_detail" %>

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
<!-- ========================================= NAVIGATION : END ========================================= -->
	<div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
        <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemplaceholder">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                </LayoutTemplate>
               <ItemTemplate>
<div id="breadcrumb-alt">
    <div class="container">
        <div class="breadcrumb-nav-holder minimal">
            <ul>
                <li class="dropdown breadcrumb-item">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Trang chủ
                    </a>                   
                </li><!-- /.breadcrumb-item -->
                
                <li class="dropdown breadcrumb-item">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">điện thoại </a>
                    
                </li><!-- /.breadcrumb-item -->

                <li class="dropdown breadcrumb-item">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%# Eval("HangSX") %> </a>
                   
                </li><!-- /.breadcrumb-item -->


                <li class="breadcrumb-item current">
                    <div class="hide" id="codeProduct"><%# Eval("MaSP")%></div>
                    <div class="hide" id="codePeople"><%# Session["mand"]%></div>
                    <a href="#"><%# Eval("TenSP") %></a>
                </li><!-- /.breadcrumb-item -->
            </ul><!-- /.breadcrumb-nav-holder -->
        </div>
    </div><!-- /.container -->
</div><!-- /#breadcrumb-alt -->
<!-- ========================================= BREADCRUMB : END ========================================= --></div>
</header>
<!-- ============================================================= HEADER : END ============================================================= -->		<div id="single-product">
    <div class="container">

         <div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
    <div class="product-item-holder size-big single-product-gallery small-gallery">

        <div id="owl-single-product">
            <div class="single-product-gallery-item" id="slide1">
                <a data-rel="prettyphoto" href="">
                    <img  class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP1")%>" />
                    <div id="ImageProduct" class ="hide"><%#Eval("HinhSP1")%></div>
                </a>
            </div><!-- /.single-product-gallery-item -->

            <div class="single-product-gallery-item" id="slide2">
                <a data-rel="prettyphoto" href="">
                    <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="<%#Eval("HinhSP2")%>" />
                </a>
            </div><!-- /.single-product-gallery-item -->

            <div class="single-product-gallery-item" id="slide3">
                <a data-rel="prettyphoto" href="">
                    <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP3")%>" />
                </a>
            </div><!-- /.single-product-gallery-item -->
        </div><!-- /.single-product-slider -->
        <style type="text/css">
            .owl-wrapper{
                left:107px;
            }
        </style>

        <div class="single-product-gallery-thumbs gallery-thumbs">

            <div id="owl-single-product-thumbnails">
                <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0" href="#slide1">
                    <img width="67" alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP1")%>" />

                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                    <img width="67" alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP2")%>" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                    <img width="67" alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP3")%>" />
                </a>
         
            </div><!-- /#owl-single-product-thumbnails -->

            <div class="nav-holder left hidden-xs">
                <a class="prev-btn slider-prev" data-target="#owl-single-product-thumbnails" href="#prev"></a>
            </div><!-- /.nav-holder -->
            
            <div class="nav-holder right hidden-xs">
                <a class="next-btn slider-next" data-target="#owl-single-product-thumbnails" href="#next"></a>
            </div><!-- /.nav-holder -->

        </div><!-- /.gallery-thumbs -->

    </div><!-- /.single-product-gallery -->
</div><!-- /.gallery-holder -->        
        <div class="no-margin col-xs-12 col-sm-7 body-holder">
    <div class="body">   
        
        <div class="star-holder inline"><div class="star" data-score="2"></div></div>
        <div class="availability" style="font-size: 15px;"><label>Tình trạng:</label><span class="available"><%# Eval("TinhTrang") %></span></div>

        <div class="title"><a id="ProductName" href="product-detail.aspx"><%# Eval("TenSP") %></a></div>
        <div class="brand"><%# Eval("HangSX") %></div>

        <div class="social-row">
            <span class="st_facebook_hcount"></span>
            <span class="st_twitter_hcount"></span>
            <span class="st_pinterest_hcount"></span>
        </div>

        <%--<div class="buttons-holder">
            <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
            <a class="btn-add-to-compare" href="#">add to compare list</a>
        </div>--%>

        <div class="excerpt" style="margin:0;">
            <div class="tab-pane">
                    <ul class="tabled-data">                                           
                        <li>
                            <label>CPU</label>
                            <div class="value"><%# Eval("CPU") %></div>
                        </li>                       
                        <li>
                            <label>Màn hình</label>
                            <div class="value"><%# Eval("ManHinh") %></div>
                        </li>
                        <li>
                            <label>Màu</label>
                            <div class="value"><%# Eval("MauSac") %></div>
                        </li>
                        <li>
                            <label>Kích cỡ màn hình (inches)</label>
                            <div class="value"><%# Eval("KichThuocManHinh") %></div>
                        </li>
                        <li>
                            <label>Bộ nhớ trong (MB)</label>
                            <div class="value"><%# Eval("BoNhoTrong") %></div>
                        </li>
                        <li>
                            <label>Bộ nhớ ngoài (GB)</label>
                            <div class="value"><%# Eval("BoNhoNgoai") %></div>
                        </li>
                        <li>
                            <label>Độ phân giải camera (MP)</label>
                            <div class="value"><%# Eval("Camera") %></div>
                        </li>
                        <li>
                            <label>Hệ điều hành</label>
                            <div class="value"><%# Eval("HeDieuHanh") %></div>
                        </li>
                        <li>
                            <label>Bảo hành</label>
                            <div class="value"><%# Eval("BaoHanh") %></div>
                        </li>
                        <li style="border-bottom: 1px solid #e0e0e0;">
                            <label>Loại pin</label>
                            <div class="value"><%# Eval("LoaiPin") %></div>
                        </li>
                    </ul><!-- /.tabled-data -->

                    </div><!-- /.meta-row -->
        </div>
        
        <div class="prices">
            <div  class="price-current"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
            <div id="ProductPrice" class="hide"><%# Eval("GiaMoi")%></div>
            <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
        </div>
         

        <div class="qnt-holder">
            <div class="le-quantity">
                <form>
                    <a class="minus" href="#reduce"></a>
                    <input name="quantity" id="ProductQuantity" readonly="readonly" type="text" name="ProductQuantity" value="1" />
                    <a class="plus" href="#add"></a>
                </form>
            </div>
            <a id="addto-cart" <%--href="cart.aspx?giohang=<%# Eval("MaSP")%>"--%> onclick="checkCart(); return false;" class="le-button huge button" style="cursor:pointer">Thêm vào giỏ hàng</a>
        </div><!-- /.qnt-holder -->
    </div><!-- /.body -->
               
</div><!-- /.body-holder -->
    </div><!-- /.container -->
</div><!-- /.single-product -->

<!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
<section id="single-product-tab">
    <div class="container">
        <div class="tab-holder">
            
            <ul class="nav nav-tabs simple" >
                <li class="active"><a href="#description" data-toggle="tab">Mô tả sản phẩm</a></li>
                <li><a href="#additional-info" data-toggle="tab">Chi tiết sản phẩm</a></li>
                <li><a href="#reviews" data-toggle="tab">Bình luận</a></li>
            </ul><!-- /.nav-tabs -->

            <div class="tab-content">
                <div class="tab-pane active" id="description">
                    <%--Mô ta--%>
                    <div id="tab_description" class="ctpage">
                                <%# Eval("MoTa") %>
                  
                    </div><!-- /.meta-row -->
                </div><!-- /.tab-pane #description -->

                <div class="tab-pane" id="additional-info">
                    <ul class="tabled-data">
                        <li>
                            <label>SKU</label>
                            <div class="value"><%# Eval("SKU") %></div>
                        </li>
                        <li>
                            <label>Giá</label>
                            <div class="value"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                        </li>
                        <li>
                            <label>Model</label>
                            <div class="value"><%# Eval("TenSP") %></div>
                        </li>                      
                        <li>
                            <label>Trọng lượng (KG)</label>
                            <div class="value"><%# Eval("TrongLuong") %></div>
                        </li>
                        <li>
                            <label>Màu</label>
                            <div class="value"><%# Eval("MauSac") %></div>
                        </li>
                        <li>
                            <label>Kích cỡ màn hình (inches)</label>
                            <div class="value"><%# Eval("KichThuocManHinh") %></div>
                        </li>
                        <li>
                            <label>Bộ nhớ trong (MB)</label>
                            <div class="value"><%# Eval("BoNhoTrong") %></div>
                        </li>
                        <li>
                            <label>Bộ nhớ trong (GB)</label>
                            <div class="value"><%# Eval("BoNhoNgoai") %></div>
                        </li>
                        <li>
                            <label>Độ phân giải camera (MP)</label>
                            <div class="value"><%# Eval("Camera") %></div>
                        </li>
                        <li>
                            <label>Hệ điều hành</label>
                            <div class="value"><%# Eval("HeDieuHanh") %></div>
                        </li>
                        <li>
                            <label>Bảo hành</label>
                            <div class="value"><%# Eval("BaoHanh") %></div>
                        </li>
                        <li>
                            <label>Loại pin</label>
                            <div class="value"><%# Eval("LoaiPin") %></div>
                        </li>
                    </ul><!-- /.tabled-data -->

                </div><!-- /.tab-pane #additional-info -->

                 </ItemTemplate>
            </asp:ListView>
                <div class="tab-pane" id="reviews">
                    <div class="comments">                       

                           <asp:ListView ID="listBinhLuan" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>

                        <div class="comment-item">
                            <div class="row no-margin">
                                <div class="col-lg-1 col-xs-12 col-sm-2 no-margin">
                                    <div class="avatar">
                                        <img alt="avatar" src="assets/images/default-avatar.jpg">
                                    </div><!-- /.avatar -->
                                </div><!-- /.col -->

                                <div class="col-xs-12 col-lg-11 col-sm-10 no-margin">
                                    <div class="comment-body">
                                        <div class="meta-info">
                                            <div class="author inline">
                                                <a href="#" class="bold"><%# Eval("HoTen") %></a>
                                            </div>
                                            <div class="star-holder inline">
                                                <div class="star" id="diembinhluan" data-score="4"></div>
                                            </div>
                                            <div class="date inline pull-right">
                                                <%# Eval("NgayBL") %>
                                            </div>
                                        </div><!-- /.meta-info -->
                                        <p class="comment-text">
                                           <%# Eval("NoiDung") %>
                                        </p><!-- /.comment-text -->
                                    </div><!-- /.comment-body -->

                                </div><!-- /.col -->

                            </div><!-- /.row -->
                        </div><!-- /.comment-item -->
                                 </ItemTemplate>
                               </asp:ListView>
                    </div><!-- /.comments -->
                             
                    <div class="add-review row">
                        <div class="col-sm-8 col-xs-12">
                            <div class="new-review-form">
                                <h2>Thêm bình luận</h2>
                                <form id="contact-form" class="contact-form" method="post" >
                                   <%-- <div class="row field-row">
                                        <div class="col-xs-12 col-sm-6">
                                            <label>tên*</label>
                                            <input class="le-input" >
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <label>email*</label>
                                            <input class="le-input" >
                                        </div>
                                    </div><!-- /.field-row -->--%>
                                    
                                    <div class="field-row star-row">
                                        <label>Đánh giá sản phẩm này</label>
                                        <div class="star-holder">
                                            <div class="star big" data-score="0"></div>
                                        </div>
                                    </div><!-- /.field-row -->

                                    <div class="field-row">
                                        <label>Nhập bình luận</label>
                                        <textarea id="comment" rows="8" name="comment-name" class="le-input"></textarea>
                                        <div class="col-sm-6">
                                            <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004; line-height:35px;" ></span> Tối thiểu 10 chữ                                    
                                        </div>
                                        <div class="col-sm-6">
                                            <span id="8char2" class="hide" style="color:#FF0004; line-height:35px;" ></span>                               
                                        </div> 
                                    </div><!-- /.field-row -->
                                    

                                    <div class="buttons-holder">
                                        <button type="button" onclick="addComment(); return false;" class="le-button huge">Bình Luận</button>
                                    </div><!-- /.buttons-holder -->
                                </form><!-- /.contact-form -->
                            </div><!-- /.new-review-form -->
                        </div><!-- /.col -->
                    </div><!-- /.add-review -->

                </div><!-- /.tab-pane #reviews -->
            </div><!-- /.tab-content -->

        </div><!-- /.tab-holder -->
    </div><!-- /.container -->
</section><!-- /#single-product-tab -->
    
<!-- ========================================= SINGLE PRODUCT TAB : END ========================================= -->
<!-- ========================================= RECENTLY VIEWED ========================================= -->
<section id="recently-reviewd" class="wow fadeInUp">
	<div class="container">
		<div class="carousel-holder hover">
			
			<div class="title-nav">
				<h2 class="h1">Sản phẩm liên quan</h2>
				<div class="nav-holder">
					<a href="#prev" data-target="#owl-recently-viewed" class="slider-prev btn-prev fa fa-angle-left"></a>
					<a href="#next" data-target="#owl-recently-viewed" class="slider-next btn-next fa fa-angle-right"></a>
				</div>
			</div><!-- /.title-nav -->

			<div id="owl-recently-viewed" class="owl-carousel product-grid-holder">
                       <asp:ListView ID="listSanPhamLienQuan" runat="server" ItemPlaceholderID="itemplaceholder">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                        </LayoutTemplate>
                        <ItemTemplate>
				<div class="no-margin carousel-item product-item-holder size-small hover">
					<div class="product-item">
						<div class="ribbon green"><span>Liên quan</span></div> 
						<div class="image">
							<img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:150px;"/>
						</div>
						<div class="body">
							<div class="title">
								  <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
							</div>
							 <div class="brand"><%# Eval("HangSX") %></div>
						</div>
						<div class="prices">

							<div class="price-current text-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
						</div>
						<div class="hover-area">
							<div class="add-cart-button">
								 <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" class="le-button">Mua ngay</a>
							</div>
							
						</div>
					</div><!-- /.product-item -->
				</div><!-- /.product-item-holder -->
                            </ItemTemplate>
                           </asp:ListView>
				
			</div><!-- /#recently-carousel -->

		</div><!-- /.carousel-holder -->
	</div><!-- /.container -->
</section><!-- /#recently-reviewd -->

    <style type="text/css">
    #nt_like_wrapper {
        position: fixed;
        bottom: 40%;
        margin-left: 0px;
        float: left;
        background-color: #E7E7E7;
        padding: 2px;
        z-index: 10;
        -moz-border-radius: 0;
        -webkit-border-radius: 0;
        border-radius: 0;
        border: 1px solid #CCCCCC;
    }
    
   
</style>
    <!-- Nút like facebook -->
<div id='nt_like_wrapper'>
    <div style="margin:4px;">
        <div class='nt_button' id='facebook'>
           <div class="fb-like" data-href="<%= HttpContext.Current.Request.Url%>" data-layout="box_count" data-action="like" data-show-faces="true" data-share="true"></div>
        </div>
        <br />
        <div class='nt_button' id='google'>
            <script type="text/javascript" src="https://apis.google.com/js/plusone.js">
            </script>
            <g:plusone size="tall"></g:plusone>
        </div>
         <div class='nt_button' id='error' style="margin-top: 10px;">
            <a href="#" data-toggle="modal" data-target="#error-modal" class="button btnError" style="border: 1px solid #e74c3c;color: #e74c3c;">Báo lỗi</a>
        </div>
        <style>
            div#error:hover {
                  background: rgba(229, 0, 70, 0.26);
                }
        </style>
    </div>
</div>
            <!-- begin Popup gửi báo lỗi thành công-->
   
 
    <div class="modal fade" id="error-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header login_modal_header">
        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h2 class="modal-title" style=" font-size: 25px; text-align: center; margin-top: 25px;" ></h2>
                  <div class="alert alert-success" style="  font-size: 25px;text-align:center" role="alert" >Báo lỗi bài viết - sản phẩm</div>
                    <div class="popup_error">
                        <div class="popup_error_content">
                            <span style="  font-weight: bold;">NHẬP THÔNG TIN BÁO LỖI VÀO Ô BÊN DƯỚI</span>
                             <textarea class="form-control custom-control" id="txt_error" name="txt_error" rows="3" style="margin-bottom: 10px;  margin-top: 5px;"></textarea>     
                             <div class="row">
                                <div class="col-sm-12" style="text-align:center;  margin-bottom: 10px;">
                                    <span id="lbLoi" style="color:#FF0004;" ></span>                                     
                                </div>                                
                            </div>
                          <button type="button" onclick="closePopup()" class="le-button huge button" style="font-size: 15px; float: none;"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i> <a href="#" style="color:#FFF;">Đóng</a> </button>
                          <button type="button" onclick="send_error()" class="le-button huge button" style="font-size: 15px;" > <a href="#" style="color:#FFF;">Gửi báo lỗi</a> <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i> </button>
                            </div>
                   </div>
      		</div>
      	
      		
    	</div>
  	</div>
            </div>
    <!-- End Popup báo lỗi thành công-->
   
       
         <style type="text/css">
        .table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
    </style>
         <script type="text/javascript">
             $('textarea[name="txt_error"]').keyup(function () {
                 if ($("#txt_error").val().length > 1) {
                     $("#lbLoi").html("");
                 }
             });
             function send_error() {
                 var msgerr = $("#txt_error").val();
                 var linkerr = location.href;
                 if (msgerr == "") {
                     $("#lbLoi").html("Để báo lỗi, bạn cần nhập nội dung có lỗi hoặc thông tin bị sai của sản phẩm.")
                     return;
                 }
                 $("#lbLoi").html("")

                 var action = "addError";

                 var data = { "action": action, "msgerr": msgerr, "linkerr": linkerr };

                 $.getJSON(urlAjax, data)

                   .done(function (response) {
                       console.log("JSON Data: " + response);
                       if (response.status == false) {
                           alert("Có lỗi xảy ra! Vui lòng quay lại sau");
                       }
                       else {
                           $(".popup_error_content").remove();
                           $(".popup_error").append(response.message);


                       }
                   })
                   .fail(function (jqxhr, textStatus, error) {
                       var err = textStatus + ", " + error;
                       console.log("Request Failed: " + err);
                       alert("Server bị lỗi! Vui lòng quay lại sau! :)");
                   });

             }

             var mand = $("#codePeople").html();
             function addComment() {
                 var comment = $("#comment").val();
                 var masp = $("#codeProduct").html();
                 var diemdanhgia = $('input[name="score"]').val();
                 if (comment == "") {
                     $("#8char2").removeClass("hide");
                     $("#8char2").html("Vui lòng nhập nhận xét của bạn! :)");
                     $("#8char2").css("color", "#FF0004");
                     return;
                 }

                 if ($("#comment").val().length <= 10) {
                     return;
                 }
                 var action = "addcomment";

                 var data = { "action": action, "comment": comment, "masp": masp, "diemsp": diemdanhgia };

                 $.getJSON(urlAjax, data)

                   .done(function (response) {
                       console.log("JSON Data: " + response);
                       if (response.status == false) {
                           alert("Có lỗi xảy ra! Vui lòng quay lại sau");
                       }
                       else {
                           $("#reviews .comments").append(response.message);
                           $("#comment").val("");

                       }
                   })
                   .fail(function (jqxhr, textStatus, error) {
                       var err = textStatus + ", " + error;
                       console.log("Request Failed: " + err);
                       alert("Server bị lỗi! Vui lòng quay lại sau! :)");
                   });

             }
             $('.field-row textarea[name="comment-name"]').keyup(function () {
                 if (mand == "") {
                     $("#signup-modal").modal('show');
                 }
                 if ($("#comment").val().length >= 10) {
                     $("#8char").removeClass("glyphicon-remove");
                     $("#8char").addClass("glyphicon-ok");
                     $("#8char").css("color", "#00A41E");
                     $("#8char2").addClass("hide");
                 } else {
                     $("#8char").removeClass("glyphicon-ok");
                     $("#8char").addClass("glyphicon-remove");
                     $("#8char").css("color", "#FF0004");
                     $("#8char2").addClass("hide");
                     return;
                 }
             });

           
             // $("#lbLoi").hide();        
             function showError(errText, ctr) {
                 ctr.parent().next().removeClass("hide").html(errText);
                 ctr.addClass("error");
             }



    </script>
    </header>
</asp:Content>

