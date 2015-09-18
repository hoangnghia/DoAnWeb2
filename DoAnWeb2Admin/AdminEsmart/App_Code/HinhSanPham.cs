using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HinhSanPham
/// </summary>
public class HinhSanPham
{
    public string MaSP { get ; set ; }
    public string HinhAnh1 { get; set; }
    public string HinhAnh2 { get; set; }
    public string HinhAnh3 { get; set; }
    public HinhSanPham(string masp, string hinh1, string hinh2,string hinh3)
    {
        MaSP = masp;
        HinhAnh1 = hinh1;
        HinhAnh2 = hinh2;
        HinhAnh3 = hinh3;
    }
	public HinhSanPham()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}