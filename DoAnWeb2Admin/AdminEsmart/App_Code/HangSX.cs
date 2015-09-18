using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HangSX
/// </summary>
public class HangSX
{
     public int ID { get; set; }
    public string MaHSX{ get; set; }
    public string TenHSX { get; set; }
    public int Status { get; set; }

    public HangSX(int id, string mahsx, string tenhsx, int status)
    {
        ID = id;
        MaHSX = mahsx;
        TenHSX = tenhsx;
        Status = status;
    }
    public HangSX(string mahsx, string tenhsx, int status)
    {
        MaHSX = mahsx;
        TenHSX = tenhsx;
        Status = status;
    }
	public HangSX()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}