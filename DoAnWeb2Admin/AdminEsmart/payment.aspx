<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" %>

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
                            <a href="cart.aspx">Giỏ hàng</a>
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
                <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    
        <div class="alert alert-success col-xs-12" role="alert" style="text-align:center">
            <img src="assets/images/shop-cart-icon.png" style="width: 200px;" />
             <span class="col-xs-12">Đơn hàng của quý khách đã được đặt thành công với thời gian dự kiến giao hàng từ 4 - 6 ngày làm việc (tùy khu vực giao hàng)</span>

        </div>     
    <div class="clearfix">
                <div class="payment_desc padding20px">
                    <!--- Start CMS checkout_success_cashondelivery_info-->
                <p><b>Thanh toán khi nhận hàng</b></p> 
                <p>1. Quý khách hoàn toàn kiểm tra được tình trạng đơn hàng tại  <a href="/order-user.aspx" target="_blank">Đơn hàng của tôi</a></p> 
                <p>2. Quý khách cũng có thể tham khảo một số câu hỏi thường gặp tại  <a href="#" target="_blank"> http://localhost:60571/payment.aspx </a></p> 
                <p>3. Mọi thắc mắc hoặc hỗ trợ khác, quý khách vui lòng để lại lời nhắn tại  <a href="/contact.aspx" target="_blank"> Liên hệ với chúng tôi  </a></p> 
                <p>4. Nếu quý khách có nhu cầu xuất hóa đơn, vui lòng gửi thông tin tại <a href="#" target="_blank">http://localhost:60571/payment.aspx</a> (gồm tên công ty, địa chỉ công ty, mã số thuế) ngay sau khi đặt hàng thành công tại website. Sau khi đơn hàng đã chuyển sang trạng thái "Đơn hàng đã được ESmart.vn xác nhận" , ESmart xin phép được từ chối hỗ trợ. </p>
                <p><b>Hiện tại ESmart chỉ xuất hóa đơn cho sản phẩm được bán và giao hàng bởi ESmart. Chúng tôi chưa hỗ trợ cho sản phẩm của đối tác bán hàng.</b></p>
                <p><b>Lưu ý:</b> Đơn hàng của quý khách có thể sẽ được giao thành nhiều kiện nếu có sản phẩm được bán bởi các đơn vị Thương nhân khác nhau. </p>




                <!--- End CMS checkout_success_cashondelivery_info-->
                </div>
            </div>
    <div style="text-align:center">
        <button type="button" class="le-button huge button" style="font-size: 20px; float: none;">
          <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> <a href="/" style="color:#FFF;">Quay lại trang chủ</a> <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
        </button>
        </div>
                    </div>
            </div>
        </div>
    </main>
</asp:Content>

