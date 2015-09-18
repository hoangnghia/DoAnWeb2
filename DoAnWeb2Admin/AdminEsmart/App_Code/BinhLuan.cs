using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BinhLuan
/// </summary>
public class BinhLuan
{
    public int MaBL { get; set; }
    public int MaND { get; set; }
    public string NoiDung { get; set; }
    public string NgayBL { get; set; }
    public int STT { get; set; }
    public string MaSP { get; set; }
    public BinhLuan()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public BinhLuan(int mabl, int mand, string noidung, string ngaybl, int stt, string masp)
    {
        MaBL = mabl;
        MaND = mand;
        NoiDung = noidung;
        NgayBL = ngaybl;
        STT = stt;
        MaSP = masp;
    }
}