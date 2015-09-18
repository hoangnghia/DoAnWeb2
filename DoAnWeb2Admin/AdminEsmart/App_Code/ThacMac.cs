using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ThacMac
/// </summary>
public class ThacMac
{
    public string Ten { get; set; }
    public string DiaChi { get; set; }
    public string Email { get; set; }
    public string TieuDe { get; set; }
    public string NoiDung { get; set; }
    public ThacMac(string ten,string email, string tieude, string noidung)
    {
        Ten = ten;
        Email = email;
        TieuDe = tieude;
        NoiDung = noidung;
    }
	public ThacMac()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}