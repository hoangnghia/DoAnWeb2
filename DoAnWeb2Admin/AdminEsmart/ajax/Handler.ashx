<%@ WebHandler Language="C#" Class="Handler" %>
using ESmart.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

public class Result
{
    //{status=true, erroMessage="", message = ""}
    public Boolean status;
    public String errorMessage;
    public String message;
    public Object data;

    public Result(Boolean _status, String _erroMessage, String _message)
    {
        status = _status;
        errorMessage = _erroMessage;
        message = _message;
    }
    public Result()
    {
        status = true;
        errorMessage = "";
        message = "OK";
    }

}

/// <summary>
/// Summary description for ajax
/// </summary>
public class Handler : IHttpHandler, IRequiresSessionState
{

    public string CreatePassword(int length)
    {
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
    }
    public void sendMail(string emailFrom, string emailTo, string subJect, string body, bool isHTMLBody)
    {
        MailMessage mail = new MailMessage(emailFrom, emailTo);
        SmtpClient client = new SmtpClient();
        client.Port = 587;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;

        client.Host = "smtp.gmail.com";
        mail.Subject = subJect;
        mail.Body = body;
        mail.IsBodyHtml = isHTMLBody;
        client.UseDefaultCredentials = false;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;

        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = emailFrom;
        NetworkCred.Password = "HONmachusE1";
        client.UseDefaultCredentials = true;
        client.Credentials = NetworkCred;
        client.Send(mail);


    }


    public HttpContext context;
    public HttpRequest request;
    public HttpResponse response;

    public void ProcessRequest(HttpContext _context)
    {
        context = _context;
        request = _context.Request;
        response = _context.Response;

        context.Response.ContentType = "application/json";
        context.Response.ContentEncoding = Encoding.UTF8;

        //Bat dau kiem tra request la gi de xu ly cong viec tuong ung:

        String action = context.Request["action"];//lay tu url xuong
        //context.Request.Form["board"];//lay name control tu form
        //sendMail2();
        //writeJson(new Result(false, "Okeee", "Okeee"));
        //return;


        //if(context.Session["mand"] == null){
        //    writeJson(new Result(false, "Chua login", ""));
        //}

        if (action == null)
        {
            writeJson(new Result(false, "Thieu tham so action", ""));
        }
        else
        {
            Result rs = new Result();



            switch (action)
            {
                case "login":
                    //do somthing
                    //String username = context.Request.Form["username"];
                    String username = context.Request["username"];
                    String password = context.Request["password"];

                    Boolean success = true;
                    List<String> messages = new List<string>();//["loi 1", "loi 2", "loi 3", .....] -> "loi 1, loi 2, loi 3"

                    if (username == null || (username != null && username.Trim() == ""))
                    {
                        success = false;
                        messages.Add("Vui long nhap username");
                    }
                    if (password == null || (password != null && password.Trim() == ""))
                    {
                        success = false;
                        messages.Add("Vui long nhap password");
                    }

                    if (success)
                    {
                        NguoiDung nd = ESmart.DataProvider.LayNguoiDungDangNhap(username, CMore.MaHoaPass(password, "MD5"));

                        if (nd == null)
                        {
                            success = false;
                            messages.Add("Nguoi dung nay khong ton tai.");
                        }
                        else
                        {
                            //session tao session ....
                            context.Session["fullname"] = nd.HoTen;
                            context.Session["username"] = nd.TaiKhoan;
                            context.Session["gioitinh"] = nd.GioiTinh;
                            context.Session["mand"] = nd.MaND;
                            //HttpContext.Current.Session.Add("username", nd.HoTen);

                        }
                    }


                    rs.status = success;
                    rs.errorMessage = String.Join(",", messages.ToArray());
                    break;


                case "signup":
                    NguoiDung nguoidung = new NguoiDung();
                    Boolean success1 = true;
                    List<String> messages1 = new List<string>();
                    nguoidung.TaiKhoan = context.Request["username"];
                    nguoidung.MatKhau = CMore.MaHoaPass(context.Request["password"], "MD5");
                    nguoidung.HoTen = context.Request["fullname"];
                    nguoidung.NgaySinh = context.Request["birthday"];
                    nguoidung.GioiTinh = context.Request["sex"];
                    nguoidung.DiaChi = context.Request["address"];
                    nguoidung.ThanhPho = context.Request["city"];
                    nguoidung.Email = context.Request["email"];
                    nguoidung.SoDienThoai = context.Request["phone"];
                    if (success1)
                    {
                        NguoiDung user = ESmart.DataProvider.LayNguoiDungDangNhapTheoTen(context.Request["username"]);

                        if (user != null || ESmart.DataProvider.ThemNguoiDung(nguoidung) == 0)
                        {
                            success1 = false;
                        }

                        else
                        {
                            //session tao session ....
                            context.Session["fullname"] = nguoidung.HoTen;
                            context.Session["username"] = nguoidung.TaiKhoan;
                            context.Session["mand"] = nguoidung.MaND;
                            context.Session["gioitinh"] = nguoidung.GioiTinh;
                            //HttpContext.Current.Session.Add("username", nd.HoTen);

                        }

                    }


                    rs.status = success1;
                    rs.errorMessage = String.Join(",", messages1.ToArray());
                    break;
                case "addCart":

                    int soluong = int.Parse(context.Request["quantity"]);
                    int gia = int.Parse(context.Request["price"]);
                    long thanhtien = soluong * gia;
                    String MaSP = context.Request["masp"];
                    String HinhSanPham = context.Request["img"];
                    String TenSP = context.Request["name"];

                    ESmart.SanPhamGioHang sp = new ESmart.SanPhamGioHang();
                    sp.MaSP = MaSP;
                    sp.TenSP = TenSP;
                    sp.HinhSP = HinhSanPham;
                    sp.Gia = gia;
                    sp.ThanhTien = thanhtien;
                    sp.SoLuong = soluong;

                    //Lay gio hang tu session:
                    List<ESmart.SanPhamGioHang> gh = (List<ESmart.SanPhamGioHang>)context.Session["giohang"];

                    var tontai = false;
                    if (gh == null)
                    {
                        gh = new List<ESmart.SanPhamGioHang>();
                        gh.Add(sp);
                        rs = new Result(true, "", "da add gio hang = null");
                    }
                    else
                    {
                        foreach (ESmart.SanPhamGioHang s in gh)
                        {
                            if (s.MaSP == sp.MaSP)
                            {
                                s.SoLuong += 1;
                                s.ThanhTien = s.Gia * s.SoLuong;
                                tontai = true;
                                break;
                            }

                        }
                        if (tontai == false)
                        {
                            gh.Add(sp);
                        }

                        rs = new Result(true, "", "da add gio hang khac null");
                    }

                    context.Session["giohang"] = gh;


                    break;

                case "viewCart":
                    String rowCartHtml = "";//"<tr> <td data-th='Sản phẩm'> <div class='row'> <a href='product-detail.aspx'> <div class='col-sm-2 hidden-xs'><img src='assets/images/products/gallery-thumb-01.jpg' alt='...' class='img-responsive'></div> <div class='col-sm-10'> <h4 class='nomargin' style='line-height: 60px;'>Apple iPhone 5C Đen 64GB</h4> </div> </a> </div> </td> <td data-th='Giá'>13.400.000</td> <td data-th='Số lượng'> <input type='number' class='form-control text-center' value='1'> </td> <td data-th='Thành tiền' class='text-center'>13.400.000 </td> <td class='actions' data-th=''> <button class='btn btn-info btn-sm'><i class='fa fa-refresh'></i></button> <button class='btn btn-danger btn-sm'><i class='fa fa-trash-o'></i></button> </td> </tr>";

                    //Lay gio hang tu session:
                    List<ESmart.SanPhamGioHang> ghViewCart = (List<ESmart.SanPhamGioHang>)context.Session["giohang"];
                    CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    long tongtien = 0;
                    long tongtien2 = 0;
                    int tongsoluong = 0;
                    if (ghViewCart == null || (ghViewCart != null && ghViewCart.Count == 0))
                    {
                        rowCartHtml = "<div class='alert alert-success' role='alert' style='text-align:center'>Không có sản phẩm nào trong giỏ hàng</div> <button type='button' onclick = 'closePopup()' class='le-button huge button' style='font-size: 20px; float: none;'> <span class='glyphicon glyphicon-shopping-cart' aria-hidden='true'></span> <a href='#' style='color:#FFF;'>Tiếp tục mua hàng </a> <i class='fa fa-angle-right'></i><i class='fa fa-angle-right'></i> </button>";
                    }
                    else
                    {
                        rowCartHtml = "<table id='cart' class='table table-hover table-condensed'> <thead> <tr> <th style='width:50%'>Sản phẩm</th> <th style='width:10%'>Giá(VNĐ)</th> <th style='width:8%'>Số lượng</th> <th style='width:22%' class='text-center'>Thành tiền</th> <th style='width:10%'></th> </tr> </thead> <tbody>"; //  \"" + s.MaSP + "\" Eval("GiaCu","{0:N0}")


                        foreach (ESmart.SanPhamGioHang s in ghViewCart)
                        {
                            string dongiatext = s.Gia.ToString("#,###", cul.NumberFormat);
                            string thanhtientext = s.ThanhTien.ToString("#,###", cul.NumberFormat);
                            rowCartHtml += "<tr> <td data-th='Sản phẩm'> <div class='row'> <a href='product-detail.aspx?masp=" + s.MaSP + "'> <div class='col-sm-2 hidden-xs'><img src='" + s.HinhSP + "' alt='...' class='img-responsive'></div> <div class='col-sm-10'> <h4 class='nomargin' style='line-height: 60px;'> " + s.TenSP + " </h4> </div> </a> </div> </td> <td data-th='Giá'>" + dongiatext + "</td> <td data-th='Số lượng'> <input id='soluong_capnhat_" + s.MaSP + "' type='number' class='form-control text-center' value='" + s.SoLuong + "'> </td> <td data-th='Thành tiền' class='text-center'>" + thanhtientext + " VND </td> <td class='actions' data-th=''> <button onclick = 'capnhapgiohang(\"" + s.MaSP + "\")' class='btn btn-info btn-sm'><i class='fa fa-refresh'></i></button> <button onclick = 'xoagiohang(\"" + s.MaSP + "\")' class='btn btn-danger btn-sm'><i class='fa fa-trash-o'></i></button> </td> </tr>";
                            tongtien += s.ThanhTien;
                            tongtien2 += s.ThanhTien;
                        }

                        string tongtientext = tongtien.ToString("#,###", cul.NumberFormat) + " VND";
                        tongsoluong = ghViewCart.Count();

                        rowCartHtml += "</tbody> <tfoot> <tr> <td><a href='#' onclick = 'closePopup()' class='btn btn-warning' style='padding: 18px 41px; border-radius: 0; font-size: 16px; font-weight: bold;'><i class='fa fa-angle-left'></i> Tiếp tục mua hàng</a></td> <td colspan='2' class='hidden-xs' style=' font-size: 25px;; font-weight:bold'>Tổng tiền </td> <td class='hidden-xs text-center'><strong style=' font-size: 25px;'>" + tongtientext + "</strong></td> <td><a href='checkout.aspx' onclick='return payment();' class='btn btn-success btn-block' style=' padding: 18px 41px; border-radius: 0; font-size: 16px; font-weight: bold;'>Đặt hàng <i class='fa fa-angle-right'></i></a></td> </tr> </tfoot> </table>";
                    }




                    rs = new Result(true, "", rowCartHtml);
                    List<String> ghphu = new List<String>();
                    ghphu.Add(tongsoluong.ToString());

                    if (tongtien == 0)
                    {
                        ghphu.Add(0.ToString());
                    }
                    else
                    {
                        ghphu.Add(tongtien.ToString("#,###", cul.NumberFormat));

                    }
                    ghphu.Add(tongtien2.ToString());
                    rs.data = ghphu;


                    break;
                case "updateOrder":
                    int user_id = int.Parse(context.Session["mand"].ToString());
                    Boolean success10 = true;
                    List<String> messages10 = new List<string>();
                    ESmart.SanPhamGioHang spgh = new ESmart.SanPhamGioHang();

                    CultureInfo cul5 = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"

                    //spgh.MaSP = context.Request["masp"];
                    spgh.SoLuong = Int32.Parse(context.Request["soluong"]);
                    spgh.Gia = Int64.Parse(context.Request["giasp"]);
                    spgh.ID = Int32.Parse(context.Request["ctdh"]);
                    spgh.MaDH = Int32.Parse(context.Request["mahoadon"]);
                    Int64 thanhtien2 = spgh.SoLuong * spgh.Gia;
                    spgh.ThanhTien = thanhtien2;
                    Int64 tongtienOrder = 0;
                    if (ESmart.DataProvider.CapNhatChiTietDonHang(spgh) == 0)
                    {
                        success10 = false;
                        messages10.Add("Update that bai");
                    }
                    else
                    {

                        List<ESmart.SanPhamGioHang> listSPGH = ESmart.DataProvider.LayDanhSachChiTietDonHangTheoMaHoaDon(spgh.MaDH);
                        String htmlOrder = "<table id='cart' class='table table-hover table-condensed'> <thead> <tr> <th style='width:50%'>Sản phẩm</th> <th style='width:10%'>Giá(VNĐ)</th> <th style='width:8%'>Số lượng</th> <th style='width:22%' class='text-center'>Thành tiền</th> <th style='width:10%'></th> </tr> </thead> <tbody><tr class='hide'> <th style='border: none;font-size: 35px;' >Hoá đơn: <span id='orderMaHD'>" + spgh.MaDH + "</span></th> </tr>";

                        foreach (ESmart.SanPhamGioHang s in listSPGH)
                        {
                            string dongiatext = s.Gia.ToString("#,###", cul5.NumberFormat);
                            string thanhtientext = s.ThanhTien.ToString("#,###", cul5.NumberFormat);
                            htmlOrder += "<tr class='row_" + s.ID + "'> <td data-th='Sản phẩm'> <div class='row'> <div id='orderMaSP'  <a href='product-detail.aspx?masp=" + s.MaSP + "' target='_blank'> <div class='col-sm-2 hidden-xs'><img src='" + s.HinhSP + "' alt='...' class='img-responsive'></div> <div class='col-sm-10'> <h4 class='nomargin' style='line-height: 60px;'>" + s.TenSP + "</h4> <p>" + s.TenSP + "</p> </div> </a> </div> </td> <td data-th='Giá'>" + dongiatext + " VND </td> <td data-th='Số lượng'> <input type='number' name='orderSoLuong' id='orderSoLuong_" + s.ID + "' min='0' max='10' class='form-control text-center' value='" + s.SoLuong.ToString() + "'> </td> <td data-th='Thành tiền' id='thanhTien' class='text-center'>" + thanhtientext + " VND</td> <td class='actions' data-th=''> <button class='btn btn-info btn-sm' onclick='checkOrder(" + s.ID + "); return false'><i class='fa fa-refresh'></i></button> <button class='btn btn-danger btn-sm' onclick='deleteOrder(" + s.ID + "); return false'><i class='fa fa-trash-o'></i></button> </td> </tr>";
                            tongtienOrder += s.ThanhTien;
                        }


                        string tongtientext = tongtienOrder.ToString("#,###", cul5.NumberFormat) + " VND";
                        htmlOrder += "</tbody> <tfoot> <tr> <td><a href='order-user.aspx' class='btn btn-warning' style='padding: 18px 41px; border-radius: 0; font-size: 16px; font-weight: bold;'><i class='fa fa-angle-left'></i> Về trang chủ</a></td> <td colspan='2' class='hidden-xs' style=' font-size: 25px;; font-weight:bold'>Tổng tiền </td> <td class='hidden-xs text-center'><strong style=' font-size: 25px;'>" + tongtientext + " </strong></td> </tr> </tfoot> </table>";
                        rs.message = htmlOrder;
                        ESmart.DataProvider.CapNhatDonHang(tongtienOrder, spgh.MaDH);

                    }


                    rs.status = success10;
                    rs.errorMessage = String.Join(",", messages10.ToArray());
                    break;
                case "deleteOrder":

                    Boolean success15 = true;
                    List<String> messages15 = new List<string>();


                    int mactdh = Int32.Parse(context.Request["ctdh"]);

                    if (ESmart.DataProvider.XoaChiTietDonHang(mactdh) == 0)
                    {
                        success15 = false;
                        messages15.Add("Xoa don chi tiet don hang that bai");
                    }


                    rs.status = success15;
                    rs.errorMessage = String.Join(",", messages15.ToArray());
                    break;
                case "updateCart":
                    String masp = context.Request["masp"];
                    int soluong1 = int.Parse(context.Request["soluong"]);
                    List<ESmart.SanPhamGioHang> ghupdate = (List<ESmart.SanPhamGioHang>)context.Session["giohang"];


                    if (ghupdate == null)
                    {
                        rs = new Result(false, "", "Giỏ hàng đã bị xoá! Vui lòng load lại trang");
                    }
                    else
                    {
                        foreach (ESmart.SanPhamGioHang s in ghupdate)
                        {
                            if (s.MaSP == masp)
                            {
                                s.SoLuong = soluong1;
                                s.ThanhTien = s.Gia * s.SoLuong;
                                break;
                            }

                        }


                        rs = new Result(true, "", "da cap nhat thanh cong");
                    }

                    context.Session["giohang"] = ghupdate;


                    break;
                case "deleteCart":
                    masp = context.Request["masp"];

                    List<ESmart.SanPhamGioHang> ghdalete = (List<ESmart.SanPhamGioHang>)context.Session["giohang"];


                    if (ghdalete == null)
                    {
                        rs = new Result(false, "", "Giỏ hàng đã bị xoá! Vui lòng load lại trang");
                    }
                    else
                    {
                        foreach (ESmart.SanPhamGioHang s in ghdalete)
                        {
                            if (s.MaSP == masp)
                            {
                                ghdalete.Remove(s);
                                break;
                            }

                        }


                        rs = new Result(true, "", "da xoa thanh cong");
                    }

                    context.Session["giohang"] = ghdalete;


                    break;

                case "saveOrder":
                    DateTime today1 = DateTime.Now;

                    DonHang dh = new DonHang();
                    dh.TongTien = Int64.Parse(context.Request["tongtien"]);
                    dh.NgayLap = today1.ToString("yyyy-MM-dd");
                    dh.MaND = int.Parse(context.Request["mand"]);
                    dh.LoaiThanhToan = context.Request["loaithanhtoan"];
                    if (ESmart.DataProvider.ThemDonHang1(ref dh))
                    {

                        List<ESmart.SanPhamGioHang> ghOrder = (List<ESmart.SanPhamGioHang>)context.Session["giohang"];
                        foreach (ESmart.SanPhamGioHang s in ghOrder)
                        {
                            ChiTietDonHang ctdh = new ChiTietDonHang();

                            ctdh.MaDH = dh.ID;
                            ctdh.MaSP = s.MaSP;
                            ctdh.SoLuong = (int)s.SoLuong;
                            ctdh.DonGia = s.Gia;
                            ctdh.ThanhTien = s.ThanhTien;

                            ESmart.DataProvider.ThemChiTietDonHang(ctdh);


                        }


                    }
                    else
                    {
                        rs.status = false;
                        rs.errorMessage = "Thanh toán không thành công, vui lòng liê hệ Admin để được hỗ trợ thêm.";

                    }

                    break;
                case "changepassword":
                    Boolean success3 = true;
                    List<String> messages3 = new List<string>();

                    string matkhau = context.Request["password"];
                    String matkhau_mahoa1 = CMore.MaHoaPass(matkhau, "MD5");
                    int mand = int.Parse(context.Session["mand"].ToString());
                    if (ESmart.DataProvider.DoiMatKhauTheoMaNguoiDung(matkhau_mahoa1, mand) == 0)
                    {
                        success3 = false;
                    }
                    rs.status = success3;
                    rs.errorMessage = String.Join(",", messages3.ToArray());
                    break;

                case "changeProfile":
                    NguoiDung nguoidung1 = new NguoiDung();
                    Boolean success4 = true;
                    List<String> messages4 = new List<string>();

                    nguoidung1.HoTen = context.Request["fullname"];
                    nguoidung1.NgaySinh = context.Request["birthday"];
                    nguoidung1.GioiTinh = context.Request["sex"];
                    nguoidung1.DiaChi = context.Request["address"];
                    nguoidung1.ThanhPho = context.Request["city"];
                    nguoidung1.Email = context.Request["email"];
                    nguoidung1.SoDienThoai = context.Request["phone"];
                    nguoidung1.MaND = int.Parse(context.Session["mand"].ToString());

                    if (ESmart.DataProvider.DoiThongTinTheoMaNguoiDung(nguoidung1) == 0)
                    {
                        success4 = false;
                    }
                    rs.status = success4;
                    rs.errorMessage = String.Join(",", messages4.ToArray());
                    break;
                case "sendcontact":
                    ThacMac thacmac = new ThacMac();
                    Boolean success5 = true;
                    List<String> messages5 = new List<string>();


                    thacmac.Ten = context.Request["name"];
                    thacmac.Email = context.Request["email"];
                    thacmac.TieuDe = context.Request["title"];
                    thacmac.NoiDung = context.Request["content"];



                    if (ESmart.DataProvider.ThemThacMac(thacmac) == 0)
                    {
                        success5 = false;
                    }
                    rs.status = success5;
                    rs.errorMessage = String.Join(",", messages5.ToArray());
                    break;
                case "search":
                    Boolean success6 = true;
                    List<String> messages6 = new List<string>();
                    string keyword = context.Request["keyword"];
                    string tendanhmuc = context.Request["tendanhmuc"];
                    if (tendanhmuc == "")
                    {
                        context.Session["search"] = ESmart.DataProvider.LayDanhSachSanPhamTheoTuKhoa(keyword);

                    }
                    else if (tendanhmuc != "")
                    {
                        context.Session["search"] = ESmart.DataProvider.LayDanhSachSanPhamTheoTuKhoaDanhMuc(keyword, tendanhmuc);

                    }
                    else
                    {
                        rs.status = false;
                        rs.errorMessage = "Tìm kiếm thất bại";

                    }
                    break;
                case "loadmoreBanChay":
                    string htmlbanchay = "";
                    int pageBanChay = int.Parse(context.Request["pagebanchay"].ToString());
                    CultureInfo cul2 = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    List<ESmart.SanPham> listSP = ESmart.DataProvider.LayDanhSachSanPhamLoadMoreBanChay(pageBanChay);

                    foreach (ESmart.SanPham s in listSP)
                    {
                        string dongiamoi = s.GiaMoi.ToString("#,###", cul2.NumberFormat);
                        string dongiacu = s.GiaCu.ToString("#,###", cul2.NumberFormat);
                        htmlbanchay += "<div class='col-sm-4 col-md-3 no-margin product-item-holder hover'> <a href='product-detail.aspx?masp=" + s.MaSP + "'> </a><div class='product-item'><a href='product-detail.aspx?masp=" + s.MaSP + "'> <div class='ribbon blue'><span>Mới!</span></div> <div class='image'> <img alt='' src='" + s.HinhSP + "' style='height: 156px;'> </div> </a><div class='body'><a href='product-detail.aspx?masp=" + s.MaSP + "'> <div class='label-discount clear'></div> </a><div class='title'><a href='product-detail.aspx?masp=" + s.MaSP + "'> </a><a href='product-detail.aspx?masp=" + s.MaSP + "'>" + s.TenSP + "</a> </div> <div class='brand'>" + s.HangSX + "</div> </div> <div class='prices'> <div class='price-prev'>" + dongiacu + " VND</div> <div class='price-current pull-right'>" + dongiamoi + " VND</div> </div> <div class='hover-area'> <div class='add-cart-button'> <a href='product-detail.aspx?masp=" + s.MaSP + "' class='le-button'>Mua ngay</a> </div> </div> </div> </div>";
                    }
                    rs.message = htmlbanchay;
                    rs.status = true;

                    break;
                case "loadmoreMoi":
                    string htmlMoi = "";
                    int pageMoi = int.Parse(context.Request["pageMoi"].ToString());
                    CultureInfo cul1 = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    List<ESmart.SanPham> listSPMoi = ESmart.DataProvider.LayDanhSachSanPhamLoadMoreMoiNhat(pageMoi);

                    foreach (ESmart.SanPham s in listSPMoi)
                    {
                        string dongiamoi = s.GiaMoi.ToString("#,###", cul1.NumberFormat);
                        string dongiacu = s.GiaCu.ToString("#,###", cul1.NumberFormat);
                        htmlMoi += "<div class='col-sm-4 col-md-3 no-margin product-item-holder hover'>  <a href='product-detail.aspx?masp=" + s.MaSP + "'><div class='product-item'> <div class='ribbon blue'><span>Mới!</span></div> <div class='image'> <img alt='' src='" + s.HinhSP + "'style='height: 156px;'> </div> <div class='body'> <div class='label-discount clear'></div> <div class='title'> <a href='product-detail.aspx?masp=" + s.MaSP + "'>" + s.TenSP + "</a> </div> <div class='brand'>" + s.HangSX + "</div> </div> <div class='prices'> <div class='price-prev'>" + dongiacu + " VND</div> <div class='price-current pull-right'>" + dongiamoi + " VND</div> </div> <div class='hover-area'> <div class='add-cart-button'> <a href='product-detail.aspx?masp=" + s.MaSP + "' class='le-button'>Mua ngay</a> </div> </div> </div>  </a></div>";
                    }
                    rs.message = htmlMoi;
                    rs.status = true;

                    break;
                case "loadmoreNoiBat":
                    string htmlNoiBat = "";
                    int pageNoiBat = int.Parse(context.Request["pageNoiBat"].ToString());
                    CultureInfo cul3 = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    List<ESmart.SanPham> listSPNOiBat = ESmart.DataProvider.LayDanhSachSanPhamLoadMoreNoiBat(pageNoiBat);

                    foreach (ESmart.SanPham s in listSPNOiBat)
                    {
                        string dongiamoi = s.GiaMoi.ToString("#,###", cul3.NumberFormat);
                        string dongiacu = s.GiaCu.ToString("#,###", cul3.NumberFormat);
                        htmlNoiBat += "<div class='col-sm-4 col-md-3 no-margin product-item-holder hover'> <a href='product-detail.aspx?masp=" + s.MaSP + "'><div class='product-item'> <div class='ribbon blue'><span>Mới!</span></div> <div class='image'> <img alt='' src='" + s.HinhSP + "'style='height: 156px;'> </div> <div class='body'> <div class='label-discount clear'></div> <div class='title'> <a href='product-detail.aspx?masp=" + s.MaSP + "'>" + s.TenSP + "</a> </div> <div class='brand'>" + s.HangSX + "</div> </div> <div class='prices'> <div class='price-prev'>" + dongiacu + " VND</div> <div class='price-current pull-right'>" + dongiamoi + " VND</div> </div> <div class='hover-area'> <div class='add-cart-button'> <a href='product-detail.aspx?masp=" + s.MaSP + "' class='le-button'>Mua ngay</a> </div> </div> </div> </a></div>";
                    }
                    rs.message = htmlNoiBat;
                    rs.status = true;

                    break;
                case "sendPassWordEmail":

                    List<String> messages7 = new List<string>();
                    Boolean success7 = true;

                    string email = context.Request["emailPassword"];


                    if (success7)
                    {
                        NguoiDung checkEmail = ESmart.DataProvider.LayNguoiDungDangNhapTheoEMail(email);

                        if (checkEmail == null)
                        {
                            success7 = false;
                            messages7.Add("Nguoi dung nay khong ton tai.");
                        }
                        else
                        {
                            string hoten = checkEmail.HoTen;
                            int mangDung = checkEmail.MaND;
                            string passwordMoi = CreatePassword(8);
                            sendMail("hoangnghiagll@gmail.com", email, "ESmart kính chào quí khách", "<table class='auto-style1'> <tr> <td colspan='2'>Trung tâm thương mại ESmart xin kính chào quý khách! :) <br /> Chào " + hoten + " ,bạn đã yêu cầu gửi lại mật khẩu mới cho bạn!</td> <br /> </tr> <tr> <td class='auto-style3'>Mật khẩu mới của bạn là:</td> <td>" + passwordMoi + "</td> </tr> <tr> <td class='auto-style2' colspan='2'>Vui lòng vào trang chủ <a href='http://ESmart.vn'>&nbsp;Esmart.vn</a> để đăng nhập lại!</td> </tr> </table>", true);

                            String matkhau_mahoa = CMore.MaHoaPass(passwordMoi, "MD5");
                            ESmart.DataProvider.DoiMatKhauTheoMaNguoiDung(matkhau_mahoa, mangDung);
                            success7 = true;
                        }
                    }


                    rs.status = success7;

                    rs.errorMessage = String.Join(",", messages7.ToArray());
                    break;
                case "addcomment":

                    List<String> messages11 = new List<string>();
                    Boolean success11 = true;
                    string htmlComment = "";
                    DateTime today = DateTime.Now;
                    BinhLuan bl = new BinhLuan();

                    bl.MaND = Int32.Parse(context.Session["mand"].ToString());
                    bl.MaSP = context.Request["masp"];
                    bl.NoiDung = context.Request["comment"];
                    bl.NgayBL = today.ToString("HH:mm:ss dd-MM-yyyy"); //"yyyy/MM/dd"
                    bl.DanhGIa = int.Parse(context.Request["diemsp"].ToString());

                    if (ESmart.DataProvider.ThemBinhLuan(bl) == 0)
                    {
                        success11 = false;
                        messages11.Add("Thêm bình luận thất bại");
                    }

                    htmlComment = "<div class='comment-item'> <div class='row no-margin'> <div class='col-lg-1 col-xs-12 col-sm-2 no-margin'> <div class='avatar'> <img alt='avatar' src='assets/images/default-avatar.jpg'> </div><!-- /.avatar --> </div><!-- /.col --> <div class='col-xs-12 col-lg-11 col-sm-10 no-margin'> <div class='comment-body'> <div class='meta-info'> <div class='author inline'> <a href='#' class='bold'>" + context.Session["fullname"].ToString() + "</a> </div> <div class='star-holder inline'> <div class='star' data-score='" + bl.DanhGIa + "' style='cursor: pointer; width: 80px;'><img src='assets/images/star-on.png' alt='1' title='bad'><img src='assets/images/star-on.png' alt='2' title='poor'><img src='assets/images/star-on.png' alt='3' title='regular'><img src='assets/images/star-off.png' alt='4' title='good'><img src='assets/images/star-off.png' alt='5' title='gorgeous'><input type='hidden' name='score' value='3'></div> </div> <div class='date inline pull-right'> " + bl.NgayBL + " </div> </div><!-- /.meta-info --> <p class='comment-text'> " + bl.NoiDung + " </p><!-- /.comment-text --> </div><!-- /.comment-body --> </div><!-- /.col --> </div><!-- /.row --> </div>";
                    rs.message = htmlComment;
                    rs.status = success11;

                    rs.errorMessage = String.Join(",", messages11.ToArray());

                    break;

                case "addError":
                    String htmlError = "";
                    List<String> messages13 = new List<string>();
                    Boolean success13 = true;
                    DateTime todayErr = DateTime.Now;
                    ESmart.Entities.BaoLoi baoloi = new ESmart.Entities.BaoLoi();

                    baoloi.NoiDung = context.Request["msgerr"];
                    baoloi.DuongDan = context.Request["linkerr"];
                    baoloi.NgayBao = todayErr.ToString("HH:mm:ss dd-MM-yyyy");

                    if (ESmart.DataProvider.ThemBaoLoi(baoloi) == 0)
                    {
                        success13 = true;
                        messages13.Add("Thêm báo lỗi thất bại");
                    }
                    htmlError = " <div class='alert alert-success' style='font-size: 17px; text-align: center; color: #BE1616;' role='alert' >Cám ơn bạn đã báo lỗi bài này. ESmart sẽ cố gắng sửa nhanh nhất lỗi bạn đã báo. Bạn sẽ có thể báo lỗi bài này lại sau 24 tiếng.</div>";
                    rs.message = htmlError;
                    rs.status = success13;

                    rs.errorMessage = String.Join(",", messages13.ToArray());

                    break;


            }




            //Tra du lieu json ve cho ajax:
            writeJson(rs);
        }



    }




    public void writeJson(object _object)
    {
        JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
        string jsondata = javaScriptSerializer.Serialize(_object);
        context.Response.Write((jsondata));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}