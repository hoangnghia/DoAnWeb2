using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LoiHeThong
/// </summary>
public class LoiHeThong
{
    public int ID { get; set; }
    public string DuongDan { get; set; }
    public string NoiDung { get; set; }
    public string NgayBao { get; set; }
    public int STT { get; set; }
    public LoiHeThong(int id, string ddan, string ndung, string ngbao, int stt)
    {
        ID = id;
        DuongDan = ddan;
        NoiDung = ndung;
        NgayBao = ngbao;
        STT = stt;
    }

    public LoiHeThong()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}