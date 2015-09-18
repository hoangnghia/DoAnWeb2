<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="errorPage.aspx.cs" Inherits="errorPage" %>

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
    <!-- ========================================= NAVIGATION : END ========================================= -->
 
</header>
    <main id="blog" class="inner-bottom-xs">
        <div class="container" style="background: url('http://static-01.lazada.vn/images/maintenance/maintenance_bg.png') no-repeat;  padding-top: 150px;
">
            <div class="row" style="width: 50%; margin: auto; margin-top: 80px;">
                <div class="oops-block toclear">
                <div class="oops-block__main lang--vn" style="float: left;">
                    <img src="http://static-02.lazada.vn/images/maintenance/404-vn.png" class="oops-block__main-img" style="position: relative; width: 192px; height: 216px; top: -53px;">
                </div>
                <div class="oops-block__description breakword" style="float: left;">
                    <div class="line-orange"></div>
                    <div class="oops-block__description-txt" style="position: relative; float: left; width: 174px; height: 163px; margin-left: 28px; font-size: 16px; line-height: 18px; text-align: left;">Có vẻ như các trang mà bạn đang cố gắng tiếp cận không tồn tại nữa hoặc có thể nó vừa di chuyển. Nếu bạn đang tìm kiếm một sản phẩm, hãy thử tìm kiếm nâng cao hơn.</div>
                </div>
            </div>
         </div>
      </div>
    </main>
</asp:Content>

