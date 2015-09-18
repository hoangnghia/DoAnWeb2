using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ChiTietDonHang
/// </summary>
public class ChiTietDonHang
{
    public int ID { get; set; }
    public int MaDH { get; set; }
    public string MaSP { get; set; }
    public int SoLuong { get; set; }
    public long DonGia { get; set; }
    public long ThanhTien { get; set; }
    public int Status { get; set; }
    public ChiTietDonHang()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public ChiTietDonHang(int id, int madh, string masp, int soluong, long dongia, long thanhtien, int status)
    {
        ID = id;
        MaDH = madh;
        MaSP = masp;
        SoLuong = soluong;
        DonGia = dongia;
        ThanhTien = thanhtien;
        Status = status;
    }
}