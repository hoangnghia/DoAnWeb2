using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ESmart
{
    public class SanPhamGioHang
    {
        public Int32 ID { get; set; }
        public Int32 MaDH { get; set; }

        public Int32 MaND { get; set; }
        public String MaSP { get; set; }
        public String HinhSP { get; set; }
        public String TenSP { get; set; }
        public Int64 Gia { get; set; }
        public Int32 SoLuong { get; set; }
        public Int64 ThanhTien { get; set; }
        public String TinhTrang { get; set; }
        public SanPhamGioHang()
        { }
        public SanPhamGioHang(Int32 madh, Int32 maCTDH, String tenSP, Int32 soluong, Int64 dongia, Int64 thanhTien, String tinhtrang, String hinhSP, String masp)
        {
            this.MaDH = madh;
            this.ID = maCTDH;
            this.TenSP = tenSP;
            this.SoLuong = soluong;
            this.Gia = dongia;
            this.ThanhTien = thanhTien;
            this.TinhTrang = tinhtrang;
            this.HinhSP = hinhSP;
            this.MaSP = masp;
        }
        public SanPhamGioHang(Int32 ID, Int32 MaND, String MaSP, String HinhSanPham, String TenSP, Int64 Gia, Int32 SoLuong, Int64 ThanhTien)
        {
            this.ID = ID;
            this.MaND = MaND;
            this.HinhSP = HinhSanPham;
            this.TenSP = TenSP;
            this.Gia = Gia;
            this.SoLuong = SoLuong;
            this.ThanhTien = ThanhTien;
        
                
        }

    }
}