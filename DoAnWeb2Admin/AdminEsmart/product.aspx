<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .product-card__describtion--full li {
           width: 195px;          <a href="assets/">assets/</a>
          margin-right: 10px;
          float: left;
          overflow: hidden;
          font-size: 15px;
        
        }
      
        .product-card__describtion--full li:before {
          display: inline-block;
          width: 6px;
          height: 6px;
          background: #4c4849;
          border-radius: 50%;
            margin-right: 5px;
          content: '';
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
    <!-- ========================================= NAVIGATION : END ========================================= -->
       <div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">iPhone </a>
                   
                </li><!-- /.breadcrumb-item -->


               
            </ul><!-- /.breadcrumb-nav-holder -->
        </div>
    </div><!-- /.container -->
</div><!-- /#breadcrumb-alt -->
    
</header>
<!-- ============================================================= HEADER : END ============================================================= -->
<section id="category-grid">
    <div class="container">

        <!-- ========================================= SIDEBAR ========================================= -->
        <div class="col-xs-12 col-sm-3 no-margin sidebar narrow">

        
         
            <!-- ========================================= PRODUCT FILTER : END ========================================= -->
            <div class="widget">
                <h2 class="border">Có thể bạn muốn mua</h2>
                <ul class="product-list">
                     <asp:ListView ID="listCoTheMuonXem" runat="server" ItemPlaceholderID="itemplaceholder">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                        </LayoutTemplate>
                        <ItemTemplate>
                           
                    <li>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin">
                                <a href="#" class="thumb-holder">
                                    <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:70px;" />
                                </a>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                 <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                <div class="price">
                                      <div class="price-prev"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                                <div class="price-current pull-right"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                </div>
                            </div>
                        </div>
                    </li>
                     </ItemTemplate>
                         </asp:ListView>
                    

                </ul>
            </div>
            <!-- /.widget -->
            <%--<div class="widget">
                <div class="simple-banner">
                    <a href="#"><img alt="" class="img-responsive" src="assets/images/blank.gif" data-echo="assets/images/banner/banner-simple.jpg" /></a>
                </div>
            </div>--%>
            <!-- ========================================= FEATURED PRODUCTS ========================================= -->
            
            <!-- ========================================= FEATURED PRODUCTS : END ========================================= -->
        </div>
        <!-- ========================================= SIDEBAR : END ========================================= -->

        <!-- ========================================= CONTENT ========================================= -->

        <div class="col-xs-12 col-sm-9 no-margin wide sidebar">

            <section id="recommended-products" class="carousel-holder hover small">

                <div class="title-nav">
                    <h2 class="inverse">Sản phẩm được mua nhiều</h2>
                    <div class="nav-holder">
                        <a href="#prev" data-target="#owl-recommended-products" class="slider-prev btn-prev fa fa-angle-left"></a>
                        <a href="#next" data-target="#owl-recommended-products" class="slider-next btn-next fa fa-angle-right"></a>
                    </div>
                </div>
                <!-- /.title-nav -->

                <div id="owl-recommended-products" class="owl-carousel product-grid-holder">
                    <asp:ListView ID="listSPMuaNhieu" runat="server" ItemPlaceholderID="itemplaceholder">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                        </LayoutTemplate>
                        <ItemTemplate>
                    <div class="no-margin carousel-item product-item-holder hover size-medium">
                       <div class="product-item">                                            
                                            <div class="ribbon green"><span>Bán chạy</span></div> 
                                            <div class="image">
                                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height: 150px;" />
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
                    </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <!-- /.carousel-item -->

                </div>
                <!-- /#recommended-products-carousel .owl-carousel -->
            </section>
            <!-- /.carousel-holder -->
            <section id="gaming">
                <div class="grid-list-products">
                    <h2 class="section-title">Các sản phẩm khác</h2>

                    <div class="control-bar">
                     

                        <div class="grid-list-buttons">
                            <ul>
                                <li class="grid-list-button-item active"><a data-toggle="tab" href="#grid-view"><i class="fa fa-th-large"></i> Grid</a></li>
                                <li class="grid-list-button-item "><a data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i> List</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.control-bar -->

                    <div class="tab-content">
                        <div id="grid-view" class="products-grid fade tab-pane in active">

                            <div class="product-grid-holder">
                                <div class="row no-margin">
                                       <asp:ListView ID="listSanPham" runat="server" ItemPlaceholderID="itemplaceholder">
                                            <LayoutTemplate>
                                                <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                            </LayoutTemplate>
                                           <ItemTemplate>
                                               
                                    <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover">
                                         <div class="product-item">
                                            <div class="ribbon blue"><span>Mới!</span></div> 
                                         
                                            <div class="image">
                                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height: 155px;"/>
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
                                        <!-- /.product-item -->
                                    </div>
                                               </ItemTemplate>
                                           </asp:ListView>
                                    <!-- /.product-item-holder -->


                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.product-grid-holder -->

                           <%-- <div class="loadmore-holder text-center">
                              <a onclick="loadMoreSanPham();return false" class="btn-loadmore" href="#">
                                <i class="fa fa-plus"></i>
                                Xem thêm sản phẩm</a>
                            </div>--%>
                            <!-- /.pagination-holder -->
                        </div>
                        <!-- /.products-grid #grid-view -->

                     
                        <!-- /.products-grid #list-view -->

                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.grid-list-products -->

            </section>
            <!-- /#gaming -->
        </div>
        <!-- /.col -->
        <!-- ========================================= CONTENT : END ========================================= -->
    </div>
    <!-- /.container -->
</section>
<!-- /#category-grid -->
	
</asp:Content>

