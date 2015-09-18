using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DonHanh
/// </summary>
public class DonHang
{
    public int ID { get; set; }
    public string MaND { get; set; }
    public double TongTien { get; set; }
    public string NgayLap { get; set; }
    public string TinhTrang { get; set; }
    public DonHang(int madh,string mand,double tongtien,string ngaylap,string tinhtrang)
    {
        ID = madh;
        MaND = mand;
        TongTien = tongtien;
        NgayLap = ngaylap;
        TinhTrang = tinhtrang;
    }
    public DonHang(int madh, double tongtien,string tinhtrang, string ngaylap)
    {
        ID = madh;
        TongTien = tongtien;
        TinhTrang = tinhtrang;
        NgayLap = ngaylap;
    }
    public DonHang(double tongtien, string ngaylap)
    {
        TongTien = tongtien;
        NgayLap = ngaylap;
    }
	public DonHang()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}