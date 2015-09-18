<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order-user.aspx.cs" Inherits="order_user" %>

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
                            <a href="order-user.aspx">Đơn hàng</a>
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
                <style>
                    .titleOrder:hover {
                        color:#c7254e;
                        text-decoration:none;
                          transition: all 0.5s ease;
                    }
                </style>
                <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
                    <div class="container">  
                        <h2 class="titleOrder" style="font-size: 25px; cursor:pointer;text-decoration: underline; margin-bottom: 10px;">Danh sách các đơn hàng của bạn</h2> 
                        <asp:PlaceHolder ID="listOerderNull" runat="server">
                                    
                            <div class="row margin-0 alert alert-success" style="text-align:center">
                                <span>Hiện tại bạn chưa có đơn hàng nào. Vui lòng đặt mua sản phẩm</span>
                            </div>
                         </asp:PlaceHolder>       
                          <asp:ListView ID="listDonHang" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>     
                                
                            <div class="row margin-0 alert alert-success">
                                <div class="col-md-2">
                                    <div class="cell">
                                        <div class="propertyname">
                                            Mã đơn hàng:   <span class="mobile-isrequired"><%# Eval("ID") %></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="cell">
                                        <div class="type">
                                            <code>Tổng tiền: <%# Eval("TongTien", "{0:N0}") %> VND</code>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="cell">
                                        <div class="isrequired">
                                            Ngày lập: <%# Eval("NgayLap") %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="cell">
                                        <div class="description">
                                            Tình trạng: <%# Eval("TinhTrang") %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="cell">
                                        <div class="description">
                                            <a href="orderdetail-user.aspx?mahoadon=<%# Eval("ID") %>">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                             
                               </ItemTemplate>

                          </asp:ListView>                
                        </div>
                    </div>
            </div>
        
    </main>               
</asp:Content>

