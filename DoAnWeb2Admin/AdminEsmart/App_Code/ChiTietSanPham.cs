using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ChiTietSanPham
/// </summary>
public class ChiTietSanPham
{
    public string MaSP { get; set; }
    public string SKU { get; set; }
    public string Model { get; set; }
    public string ManHinh { get; set; }
    public string TrongLuong { get; set; }
    public string MauSac { get; set; }
    public string KichThuocManHinh { get; set; }
    public string BoNhoTrong { get; set; }
    public string BoNhoNgoai { get; set; }
    public string Camera { get; set; }
    public string HeDieuHanh { get; set; }
    public string LoaiPin { get; set; }
    public string CongKetNoi { get; set; }
    public string BaoHanh { get; set; }
    public string CPU { get; set; }
    public ChiTietSanPham( string masp, string sku, string model,string manhinh,string trongluong,string mausac,string kichthuocmh,string bonhotrong,string bonhongoai,string camera,string hedieuhanh,string loaipin,string congketnoi,string baohanh, string cpu)
    {
        MaSP = masp;
        SKU = sku;
        Model = model;
        ManHinh = manhinh;
        TrongLuong = trongluong;
        MauSac = mausac;
        KichThuocManHinh = kichthuocmh;
        BoNhoTrong = bonhotrong;
        BoNhoNgoai = bonhongoai;
        Camera = camera;
        HeDieuHanh = hedieuhanh;
        LoaiPin = loaipin;
        CongKetNoi = congketnoi;
        BaoHanh = baohanh;
        CPU = cpu;
    }
	public ChiTietSanPham()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}