<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="orderdetail-user.aspx.cs" Inherits="orderdetail_user" %>

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
                            <a href="order-user.aspx">Đơn hàng của bạn</a>
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
<div class="container" id="tableCart">
    
<%--        <div class="alert alert-success" role="alert" style="text-align:center">Không có sản phẩm nào trong giỏ hàng</div>
        <div class="le-quantity">
                <form>
                    <a class="minus" href="#reduce"></a>
                   
                    <input id='soluong_capnhat_" + s.MaSP + "' readonly="readonly" name="quantity" type='text' class='form-control text-center' value='" + s.SoLuong + "'>
                    <a class="plus" href="#add"></a>
                </form>
            </div>
        <button type="button" class="le-button huge button" style="font-size: 20px; margin-left: 35%; float: none;">
          <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> <a href="/" style="color:#FFF;">Tiếp tục mua hàng </a> <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
        </button>--%>
    
	<table id="cart" class="table table-hover table-condensed">
                       
    				<thead>
                        
						<tr>
							<th style="width:50%">Sản phẩm</th>
							<th style="width:10%">Giá(VNĐ)</th>
							<th style="width:8%">Số lượng</th>
							<th style="width:22%" class="text-center">Thành tiền</th>
                            
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
                       <asp:ListView ID="listSP" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
                               <tr class="hide">
                                    <th style="border: none;font-size: 35px;" >Hoá đơn: <span id="orderMaHD"><%# Eval("MaDH")%></span></th>
                                </tr>
						<tr class="row_<%# Eval("ID") %>">
							<td data-th="Sản phẩm">
								<div class="row">
                                    <div id="orderMaSP" class="hide"><%# Eval("MaSP") %></div>
                                    <div id="orderMaCTDH" class="hide"><%# Eval("ID") %></div>
                                    <a href="product-detail.aspx?masp=<%# Eval("MaSP") %>" target="_blank">
									<div class="col-sm-2 hidden-xs"><img src="<%# Eval("HinhSP") %>" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin" style="line-height: 60px;"><%# Eval("TenSP") %></h4>
										<%--<p><%# Eval("TinhTrang") %></p>--%>
									</div>
                                        </a>
								</div>
							</td>
							<td data-th="Giá"><%# Eval("Gia", "{0:N0}") %> VND </td>
                            <div id="GiaOrder_<%# Eval("ID") %>" class="hide"><%# Eval("Gia") %></div>
							<td data-th="Số lượng">
								<input type="number" name="orderSoLuong" id="orderSoLuong_<%# Eval("ID") %>" min ="0" max="10" class="form-control text-center" value="<%# Eval("SoLuong") %>">
							</td>
							<td data-th="Thành tiền" id="thanhTien" class="text-center"><%# Eval("ThanhTien", "{0:N0}") %> VND</td>
							<td class="actions" data-th="">
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible='<%# Eval("TinhTrang").ToString() == "Chưa Thanh Toán" %>'>
                                    <button class="btn btn-info btn-sm"  onclick="checkOrder('<%#Eval("ID")%>'); return false" ><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm" onclick="deleteOrder('<%#Eval("ID")%>'); return false"><i class="fa fa-trash-o"></i></button>								

                                </asp:PlaceHolder>
                               
								
                               
							</td>
						</tr>
                             
                       </ItemTemplate>
                             </asp:ListView>
					</tbody>
                                
					<tfoot>
						
						<tr>
							<td><a href="order-user.aspx" class="btn btn-warning" style="padding: 18px 41px; border-radius: 0; font-size: 16px; font-weight: bold;"><i class="fa fa-angle-left"></i> Quay lại hoá đơn</a></td>
							<td colspan="2" class="hidden-xs" style="  font-size: 25px;; font-weight:bold">Tổng tiền </td>
                           <asp:ListView ID="listDonHang" runat="server" ItemPlaceholderID="itemplaceholder1">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemplaceholder1" runat="server" />
                            </LayoutTemplate>
                           <ItemTemplate>
							<td class="hidden-xs text-center"><strong style="  font-size: 25px;"><%# Eval("TongTien","{0:N0}") %> VNĐ</strong></td>
                                </ItemTemplate>
                               </asp:ListView>
							<%--<td><a href="#" class="btn btn-success btn-block" style=" padding: 18px 41px; border-radius: 0; font-size: 16px; font-weight: bold;">Cập nhật đơn hàng <i class="fa fa-angle-right"></i></a></td>--%>
						</tr>
					</tfoot>
				</table>
                    </div>
            </div>
        </div>
    </main>
    <script type="text/javascript">

        function deleteOrder(mactdh) {
            if (!confirm("Bạn có muốn xoá đơn hàng không?")) {
                return;
            }

            var action = "deleteOrder";

            var data = { "action": action, "ctdh": mactdh };

            $.getJSON(urlAjax, data)

              .done(function (response) {
                  console.log("JSON Data: " + response);
                  if (response.status == false) {
                      alert("Giỏ hàng có lỗi xảy ra! Vui lòng quay lại sau");
                  }
                  else {
                      //widown.location.reload();
                      //window.location.href = "/order-user.aspx";
                      $(".row_" + mactdh).remove();
                  }
              })
              .fail(function (jqxhr, textStatus, error) {
                  var err = textStatus + ", " + error;
                  console.log("Request Failed: " + err);
                  alert("Server bị lỗi! Vui lòng quay lại sau! :)");
              });
        }

        function checkOrder(mactdh) {

            //var masp = $("#orderMaSP").html();
            var mahd = $("#orderMaHD").html();
            var giasp = $("#GiaOrder_" + mactdh).html();
            var soluong = $("#orderSoLuong_" + mactdh).val();
            //var ctdh = $("#orderMaCTDH").html();


            var action = "updateOrder";

            var data = { "action": action, "giasp": giasp, "soluong": soluong, "ctdh": mactdh, "mahoadon": mahd };

            $.getJSON(urlAjax, data)

              .done(function (response) {
                  console.log("JSON Data: " + response);
                  if (response.status == false) {
                      alert("Giỏ hàng có lỗi xảy ra! Vui lòng quay lại sau");
                  }
                  else {
                      $("#cart").remove();
                      $("#tableCart").append(response.message);

                      //window.location.reload(true);
                      //window.location.href = "/";
                  }
              })
              .fail(function (jqxhr, textStatus, error) {
                  var err = textStatus + ", " + error;
                  console.log("Request Failed: " + err);
                  alert("Server bị lỗi! Vui lòng quay lại sau! :)");
              });
        }



    </script>
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
</asp:Content>

