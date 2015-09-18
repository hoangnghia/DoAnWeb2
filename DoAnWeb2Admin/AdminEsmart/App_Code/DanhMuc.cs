using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DanhMuc
/// </summary>
public class DanhMuc
{
    public int ID { get; set; }
    public int MaDM { get; set; } 
    public string TenDM { get; set; }
    public int Status { get; set; }

    public DanhMuc(int id, string tendm, int status)
    {
        MaDM = id;
        TenDM = tendm;
        Status = status;
    }
    public DanhMuc( string tendm, int status)
    {
        TenDM = tendm;
        Status = status;
    }
	public DanhMuc()
	{

		
	}
}