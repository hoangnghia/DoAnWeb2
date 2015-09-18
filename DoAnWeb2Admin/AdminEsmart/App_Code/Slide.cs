using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Slide
/// </summary>
public class Slide
{
    public string MaSL { get; set; }
    public string HinhAnh { get; set; }
    public string Link { get; set; }
    public Slide(string masl,string hinh, string link)
    {
        MaSL = masl;
        HinhAnh = hinh;
        Link = link;
    }
	public Slide()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}