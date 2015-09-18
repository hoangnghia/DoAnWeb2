<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .title-link {
            font: 700 16px arial;
            color: #333;
        }
        .title-link a {
            text-decoration: none;
            color: black;
        }
        .description{
            font-size:18px;
            float: left;
            width: 100%;
            margin-top: 10px;
        }
           .description ul {
            display:none;
           }
        .description a {
            float:left;
            margin-right: 10px;
            margin-top: 5px;
        }
        .datepup {
             font-size:15px;   
             float: right;  
        }
        .news-content {
              width: 480px;
                margin: auto;
        }
        .news {
            border-bottom: 1px dotted #e2e2e3;
            margin-bottom: 10px;
            padding-bottom: 10px;
              float: left;
        }
        .title-link a:hover {
              color: #3228C5;
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
                          <asp:ListView ID="listDanhMuc" runat="server" ItemPlaceholderID="itemplaceholder">
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
                            <a href="news.aspx">Tin Tức</a>
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
</header>
    <main id="blog" class="inner-bottom-xs">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptRSS" runat="server">
                <ItemTemplate>
                  
                            <div class="post format-standard">
                                <!-- /.format-wrapper -->
                                <div class="post-content">
                             
                                    <h2 class="post-title" style="font-size: 28px; color: #434343; line-height: 120%; font-weight: 400 !important;">
                                         <asp:HyperLink runat="server" ID="title" Text='<%# Eval("title")%>' Target="_blank" NavigateUrl='<%# "news-detals.aspx?url=" + Eval("link") %>'></asp:HyperLink>
                                    </h2>
                                    <ul class="meta">
                                        <li>Posted By : Admin</li>
                                        <li><a href="#"> Ngày đăng: <%# Eval("pubDate") %></a>
                                    </ul>
                           
                                    <!-- /.meta -->
                                      
                                    <div class="description">
                                    <asp:HyperLink runat="server" ID="description" Text='<%# Eval("description").ToString().Replace("href=\"", "href=\"news-detals.aspx?url=") %>'></asp:HyperLink>
                                    
                                        <a> <asp:HyperLink runat="server" ID="HyperLink1" class="le-button huge"  Text="Đọc tin" Target="_blank" NavigateUrl='<%# "news-detals.aspx?url=" + Eval("link") %>'></asp:HyperLink></a>
                                      </div>
                                          </a>
                                          
                                </div>
                                <!-- /.post-content -->
                            </div>
                            <!-- /.post -->
                   <div class="clear" style="border-bottom: 1px dotted #e2e2e3; margin-top: 125px; margin-bottom: 15px;"></div>
                </ItemTemplate>
            </asp:Repeater>
         </div>
      </div>
    </main>

</asp:Content>

