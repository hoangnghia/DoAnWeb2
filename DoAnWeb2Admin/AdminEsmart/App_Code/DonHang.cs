﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DonHanh
/// </summary>
public class DonHang
{
    public int ID { get; set; }
    public int MaND { get; set; }
    public double TongTien { get; set; }
    public string NgayLap { get; set; }
    public string TinhTrang { get; set; }
    public string LoaiThanhToan { get; set; }
    public DonHang(int madh,int mand,double tongtien,string ngaylap,string tinhtrang)
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
    public DonHang(int id, int mand, Int64 tongtien, String nl, String tt, String ltt)
    {
        this.ID = id;
        this.MaND = mand;
        this.TongTien = tongtien;
        this.NgayLap = nl;
        this.TinhTrang = tt;
        this.LoaiThanhToan = ltt;
    }
}