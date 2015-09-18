<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .product-card__describtion--full li {
           width: 195px;          
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
                         <asp:ListView ID="ListView3" runat="server" ItemPlaceholderID="itemplaceholder">
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">tìm kiếm </a>
                   
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
       
            <!-- ========================================= FEATURED PRODUCTS ========================================= -->
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
            <!-- ========================================= FEATURED PRODUCTS : END ========================================= -->
        </div>
        <!-- ========================================= SIDEBAR : END ========================================= -->

        <!-- ========================================= CONTENT ========================================= -->

        <div class="col-xs-12 col-sm-9 no-margin wide sidebar">

            <!-- /.carousel-holder -->
            <section id="gaming">
                <div class="grid-list-products">
                    <h2 class="section-title">Các sản phẩm đã được tìm thấy</h2>

                    <div class="control-bar">
                        <%--<div id="popularity-sort" class="le-select">
                            <select data-placeholder="sort by popularity">
                                <option value="1">1-100 players</option>
                                <option value="2">101-200 players</option>
                                <option value="3">200+ players</option>
                            </select>
                        </div>

                        <div id="item-count" class="le-select">
                            <select>
                                <option value="1">24 per page</option>
                                <option value="2">48 per page</option>
                                <option value="3">32 per page</option>
                            </select>
                        </div>--%>

                        <div class="grid-list-buttons">
                            <ul>
                                <li class="grid-list-button-item active"><a data-toggle="tab" href="#grid-view"><i class="fa fa-th-large"></i> Grid</a></li>
                                <li class="grid-list-button-item "><a data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i> List</a></li>
                            </ul>
                        </div>
                    </div>
                  
               
                          
                    <div class="tab-content">
                        <div id="grid-view" class="products-grid fade tab-pane in active">

                            <div class="product-grid-holder">
                                <div class="row no-margin">
                                       <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemplaceholder">
                                                <LayoutTemplate>
                                                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                                </LayoutTemplate>
                                               <ItemTemplate> 
                                    <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover">
                                         
                                        <div class="product-item">
                                            
                                            <div class="image">
                                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" style="height:156px;"/>
                                            </div>
                                            <div class="body">                                               
                                                <div class="title">
                                                    <a href="product-detail.aspx"><%# Eval("TenSP") %></a>
                                                </div>
                                               
                                            </div>
                                            <div class="prices">
                                                <div class="price-prev"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                                <div class="price-current pull-right"><%# Eval("GiaCu","{0:N0}") %> VND</div>
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
                                </div>
                                </div>
                                    <!-- /.product-item-holder -->
    
                                   
                            <!-- /.product-grid-holder -->

                          <%--  <div class="pagination-holder">
                                <div class="row">

                                    <div class="col-xs-12 col-sm-6 text-left">
                                        <ul class="pagination ">
                                            <li class="current"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">Tiếp</a></li>
                                        </ul>
                                    </div>

                                    <div class="col-xs-12 col-sm-6">
                                        <div class="result-counter">
                                            Showing <span>1-9</span> of <span>11</span> results
                                        </div>
                                    </div>

                                </div>
                                <!-- /.row -->
                            </div>--%>
                            <!-- /.pagination-holder -->
                        </div>
                        <!-- /.products-grid #grid-view -->

                        <div id="list-view" class="products-grid fade tab-pane ">
                            <div class="products-list">
                                  <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="itemplaceholder">
                                    <LayoutTemplate>
                                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                    </LayoutTemplate>
                                    <ItemTemplate> 
                                <div class="product-item product-item-holder">
                                    <div class="ribbon red"><span>giảm giá</span></div>
                                    <div class="ribbon blue"><span>mới!</span></div>
                                    <div class="row">
                                        <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                            <div class="image">
                                                <img alt="" src="assets/images/blank.gif" data-echo="<%# Eval("HinhSP") %>" />
                                            </div>
                                        </div>
                                        <!-- /.image-holder -->
                                        <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                            <div class="body">
                                                <div class="label-discount green">-50% giảm giá</div>
                                                <div class="title">
                                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>"><%# Eval("TenSP") %></a>
                                                </div>
                                                <div class="brand">sony</div>
                                                <div class="excerpt">
                                                    <div class="star-holder">
                                                        <div class="star" data-score="2"></div>
                                                    </div>
                                                        <div class="product-card__describtion--full">
                                                            <ul class="prd-attributesList ui-listBulleted">
                                                                <li class=""><span>Hàng chính hãng 1 đổi 1</span></li>
                                                                <li class=""><span>Màn hình 4.7" IPS HD</span></li>
                                                                <li class=""><span>Camera iSight 8MP</span></li>
                                                                <li class=""><span>Bộ nhớ trong 16GB</span></li>
                                                                <li class=""><span>Bảo mật bằng cảm biến vân tay</span></li>
                                                                <li class=""><span>Pin: 1890mAh</span></li>
                                                                <li class=""><span>Công nghệ Mỹ</span></li>
                                                            </ul>
                                                        </div>
                                                </div>
                                                <%--<div class="addto-compare">
                                                    <a class="btn-add-to-compare" href="#">add to compare list</a>
                                                </div>--%>
                                            </div>
                                        </div>
                                        <!-- /.body-holder -->
                                        <div class="no-margin col-xs-12 col-sm-3 price-area">
                                            <div class="right-clmn">
                                                <div class="price-current"><%# Eval("GiaCu","{0:N0}") %> VND</div>
                                                <div class="price-prev"><%# Eval("GiaMoi","{0:N0}") %> VND</div>
                                                <div class="availability">
                                                    <label>Tình trạng:</label><span class="available">  Còn hàng</span></div>
                                                <a class="le-button" href="product-detail.aspx">Mua ngay</a>
                                                <%--<a class="btn-add-to-wishlist" href="#">add to wishlist</a>--%>
                                            </div>
                                        </div>
                                        <!-- /.price-area -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                          </ItemTemplate>
                                              </asp:ListView>
                                <!-- /.product-item -->


                                

                            </div>
                            <!-- /.products-list -->

                        <%--    <div class="pagination-holder">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 text-left">
                                        <ul class="pagination">
                                            <li class="current"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">next</a></li>
                                        </ul>
                                        <!-- /.pagination -->
                                    </div>
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="result-counter">
                                            Showing <span>1-9</span> of <span>11</span> results
                                        </div>
                                        <!-- /.result-counter -->
                                    </div>
                                </div>
                                <!-- /.row -->
                            </div>--%>
                            <!-- /.pagination-holder -->

                        </div>
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

