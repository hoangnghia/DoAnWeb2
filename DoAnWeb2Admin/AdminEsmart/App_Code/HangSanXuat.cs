using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HangSanXuat
/// </summary>
public class HangSanXuat
{
    public int ID { get; set; }
    public string MaHSX { get; set; }
    public string TenHSX { get; set; }
    public int Status { get; set; }
    public string HinhHangSX { get; set; }
     public HangSanXuat(int id, string mahangsx, string tenhangsx, int stt)
        {
            ID = id;
            MaHSX = mahangsx;
            TenHSX = tenhangsx;
            Status = stt;
        }
     public HangSanXuat(string mahangsx, string tenhangsx, int stt)
     {
         MaHSX = mahangsx;
         TenHSX = tenhangsx;
         Status = stt;
     }
     public HangSanXuat(int id, string mahangsx, string tenhangsx, int stt, string hinhhsx)
	{
        ID = id;
        MaHSX = mahangsx;
        TenHSX = tenhangsx;
        Status = stt;
        HinhHangSX = hinhhsx;
	}
}