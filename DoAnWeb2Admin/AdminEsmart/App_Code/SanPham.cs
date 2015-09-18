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
        public DateTime NgayTao { get; set; }
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
            NgayTao = ngaytao;
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
    }
}