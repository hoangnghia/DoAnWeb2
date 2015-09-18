using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ESmart
{
    public class SanPham
    {
        public int ID { get; set; }
        public string MaSP { get; set; }
        public string TenSP { get; set; }
        public double GiaCu { get; set; }
        public double GiaMoi { get; set; }
        public string HangSX { get; set; }
        public string MaDM { get; set; }
        public string HinhSP { get; set; }
        public string MoTa { get; set; }
        public string TinhTrang { get; set; }
        public int Status { get; set; }
        public string SKU { get; set; }
        public string Model { get; set; }
        public string ManHinh { get; set; }
        public string TrongLuong { get; set; }
        public string MauSac { get; set; }
        public string KichThuocManHinh { get; set; }
        public string BoNhoTrong { get; set; }
        public string BoNhoNgoai { get; set; }
        public string Camera { get; set; }
        public string HeDieuHanh { get; set; }
        public string LoaiPin { get; set; }
        public string CongKetNoi { get; set; }
        public string BaoHanh { get; set; }
        public string CPU { get; set; }
        public DateTime NgayThemSanPham { get; set; }
        public string HinhSP1 { get; set; }
        public string HinhSP2 { get; set; }
        public string HinhSP3 { get; set; }
        public SanPham()
        {

        }
        public SanPham(int id, string masp, string tensp, double giacu, double giamoi, string hangsx, string madm, string hinhsp, string tinhtrang, DateTime ngaytao)
        {
            ID = id;
            MaSP = masp;
            TenSP = tensp;
            GiaCu = giacu;
            GiaMoi = giamoi;
            HangSX = hangsx;
            HinhSP = hinhsp;
            TinhTrang = tinhtrang;
            MaDM = madm;
            NgayThemSanPham = ngaytao;
        }
        public SanPham(string masp, string tensp, double giacu, double giamoi, string hangsx, string madm, string hinhsp, string mota, string tinhtrang)
        {
            MaSP = masp;
            TenSP = tensp;
            GiaCu = giacu;
            GiaMoi = giamoi;
            HangSX = hangsx;
            MaDM = madm;
            HinhSP = hinhsp;
            MoTa = mota;
            TinhTrang = tinhtrang;
        }
        public SanPham(string masp, string tensp)
        {
            MaSP = masp;
            TenSP = tensp;
        }
           public SanPham(string masp, string tensp, Int64 giacu, Int64 giamoi, string hinhsp, string hangsx)
        {
            MaSP = masp;
            TenSP = tensp;
            GiaCu = giacu;
            GiaMoi = giamoi;
            HangSX = hangsx;
            HinhSP = hinhsp;
        }
    }
}