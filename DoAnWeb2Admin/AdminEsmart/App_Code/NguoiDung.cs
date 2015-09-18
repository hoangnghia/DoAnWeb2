using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NguoiDung
/// </summary>
public class NguoiDung
{
    public int MaND { get; set; }
    public string Quyen { get; set; }
    public string TaiKhoan { get; set; }
    public string MatKhau { get; set; }
    public string HoTen { get; set; }
    public String NgaySinh { get; set; }
    public string GioiTinh { get; set; }
    public string DiaChi { get; set; }
    public string ThanhPho { get; set; }
    public string Email { get; set; }
    public string DienThoai { get; set; }
    public int STT { get; set; }
    public NguoiDung(int mand, string quyen, string taikhoan, string matkhau, string hoten, String ngaysinh, string gioitinh, string diachi, string thanhpho,string email, string dienthoai, int stt)
    {
        MaND = mand;
        Quyen = quyen;
        TaiKhoan = taikhoan;
        MatKhau = matkhau;
        HoTen = hoten;
        NgaySinh = ngaysinh;
        GioiTinh = gioitinh;
        DiaChi = diachi;
        ThanhPho = thanhpho;
        Email = email;
        DienThoai = dienthoai;
        STT = stt;
    }
    public NguoiDung(string quyen, string gioitinh)
    {
        Quyen = quyen;
        GioiTinh = gioitinh;
    }
    public NguoiDung()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}