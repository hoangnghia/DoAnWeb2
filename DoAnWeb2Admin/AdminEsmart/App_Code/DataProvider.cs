
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
namespace ESmart
{
    public static class DataProvider
    {
        private static SqlConnection conn;
        private static SqlCommand command;

        static DataProvider()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ESmart"].ToString();
            conn = new SqlConnection(connectionString);
            command = new SqlCommand("", conn);
        } 
       
        public static ArrayList LayDanhMuc()
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM DanhMuc WHERE  Status = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int madm = reader.GetInt32(0);
                    string tendm = reader.GetString(1);
                    int status = reader.GetInt32(2);
                    DanhMuc danhmuc = new DanhMuc(madm, tendm, status);
                    list.Add(danhmuc);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }

        public static void InsertDanhMuc(string tendm)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO DanhMuc(TenDM,Status) values(N'" + tendm + "',1)", conn);
            cmd.ExecuteNonQuery();
            conn.Close();

        }
        public static void DeleteDanhMuc(int ma)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE DanhMuc SET Status = 0 WHERE MaDM = " + ma + "", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateDanhMuc(DanhMuc dm)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Update DanhMuc Set TenDM = N'" + dm.TenDM + "' WHERE MaDM = " + dm.ID + "", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable KiemTraInsertDanhMuc(string ten)
        {
            DataTable dtb = new DataTable();
            conn.Open();
            string tv = string.Format("SELECT * FROM DanhMuc WHERE TenDM = N'" + ten + "' and Status = 1");
            SqlDataAdapter da = new SqlDataAdapter(tv,conn);
            da.Fill(dtb);
            conn.Close();
            
            return dtb;
        }
        public static ArrayList LayTungDanhMuc(int ma)
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM DanhMuc WHERE MaDM = " + ma + " and Status = 1"); 

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int madm = reader.GetInt32(0);
                    string tendm = reader.GetString(1);
                    int status = reader.GetInt32(2);
                    DanhMuc danhmuc = new DanhMuc(madm, tendm, status);
                    list.Add(danhmuc);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }
        public static DataTable  KiemTraDangNhap(string ten, string pass)
        {
            DataTable dtb = new DataTable();
            conn.Open();
            string tv = string.Format("SELECT * FROM NguoiDung WHERE TaiKhoan = '" + ten + "' and MatKhau = '" + pass + "' and Quyen = 'admin'");
            SqlDataAdapter da = new SqlDataAdapter(tv, conn);
            // Đổ dữ liệu vào DataSet
            da.Fill(dtb);
            conn.Close();

            return dtb;
           
        }
        public static string GetLast(this string source, int tail_length)
        {
            if (tail_length >= source.Length)
                return source;
            return source.Substring(source.Length - tail_length);
        }
        public static ArrayList LayDanhSachSanPham()
        {
            ArrayList list = new ArrayList();

            string query = String.Format("SELECT SP.MaSP, SP.TenSP, SP.GiaCu, SP.GiaMoi,  HSX.TenHSX, DM.TenDM ,SP.HinhSP, SP.MoTa, SP.TinhTrang FROM SanPham As SP, HangSanXuat as HSX, DanhMuc as DM WHERE SP.MaHSX = HSX.MaHSX and SP.MaDM = DM.MaDM and SP.Status = 1 Order by NgayThemSP desc");
           
            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string masp = reader.GetString(0);
                    string tensp = reader.GetString(1);
                    Int64 giamoi = reader.GetInt64(2);
                    Int64 giacu = reader.GetInt64(3);                    
                    string hangsx = reader.GetString(4);
                    
                    string madm = reader.GetString(5);
                    string hinhsp = reader.GetString(6);
                    string mota = reader.GetString(7);
                    string res = mota.GetLast(20); 
                    string tinhtrang = reader.GetString(8);
                    SanPham sp = new SanPham(masp, tensp, giamoi, giacu, hangsx, madm, hinhsp, res, tinhtrang);
                    list.Add(sp);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }

        public static DataTable LayDanhSachChiTietSanPham2(string ma)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("SELECT SP.MaSP, SP.TenSP, SP.GiaCu, SP.GiaMoi,  HSX.TenHSX, DM.TenDM ,SP.HinhSP, SP.MoTa, SP.TinhTrang FROM SanPham As SP, HangSanXuat as HSX, DanhMuc as DM WHERE SP.MaSP = '" + ma + "' and SP.MaHSX = HSX.MaHSX and SP.MaDM = DM.MaDM and SP.Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static DataTable LayDanhSachSanPhamChoCollectionPage()
        {
            DataTable tb = new DataTable();
            string sql = string.Format("SELECT SP.MaSP, SP.TenSP, SP.GiaCu, SP.GiaMoi,  HSX.TenHSX, DM.TenDM ,SP.HinhSP,SUBSTRING(SP.MoTa, 1, 15) + '.....' as mota, SP.TinhTrang FROM SanPham As SP, HangSanXuat as HSX, DanhMuc as DM WHERE SP.MaHSX = HSX.MaHSX and SP.MaDM = DM.MaDM and SP.Status = 1 Order by NgayThemSP desc");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static ArrayList SuaSanPham(string ma)
        {
            ArrayList list = new ArrayList();

            string query = String.Format("SELECT SP.MaSP, SP.TenSP, SP.GiaCu, SP.GiaMoi,  HSX.TenHSX, DM.TenDM ,SP.HinhSP, SP.MoTa, SP.TinhTrang FROM SanPham As SP, HangSanXuat as HSX, DanhMuc as DM WHERE SP.MaSP = '"+ ma +"' and SP.MaHSX = HSX.MaHSX and SP.MaDM = DM.MaDM and SP.Status = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string masp = reader.GetString(0);
                    string tensp = reader.GetString(1);
                    Int64 giamoi = reader.GetInt64(2);
                    Int64 giacu = reader.GetInt64(3);
                    string hangsx = reader.GetString(4);
                    string madm = reader.GetString(5);
                    string hinhsp = reader.GetString(6);
                    string mota = reader.GetString(7);
                    string tinhtrang = reader.GetString(8);
                    SanPham sp = new SanPham(masp, tensp, giamoi, giacu, hangsx, madm, hinhsp, mota, tinhtrang);
                    list.Add(sp);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }
        public static void InsertSanPham(string masp, string tensp, double giacu, double giamoi, string hangsx, string madm, string hinhsp, string mota, string tinhtrang, int stt, string ngaythem)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO SanPham(MaSP,TenSP,GiaCu,GiaMoi,MaHSX,MaDM,HinhSP,MoTa,TinhTrang,Status,NgayThemSP) values('" + masp + "','" + tensp + "'," + giacu + "," + giamoi + ",'" + hangsx + "','" + madm + "','" + hinhsp + "','" + mota + "','" + tinhtrang + "', " + stt + ",'"+ ngaythem +"')", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void DeleteSanPham(string ma)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE SanPham SET Status = 0 WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateSanPham1(string masp, string tensp, double giacu, double giamoi, string hangsx, string madm, string hinhsp, string mota, string tinhtrang, int stt)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE  SanPham SET TenSP = N'" + tensp + "',GiaCu =" + giacu + ", GiaMoi = " + giamoi + ",MaHSX = '" + hangsx + "',MaDM = '" + madm + "',HinhSP = '" + hinhsp + "',MoTa = N'" + mota + "',TinhTrang = N'" + tinhtrang + "',Status = " + stt + " WHERE MaSP = '" + masp + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateSanPham2(string masp, string tensp, double giacu, double giamoi, string hangsx, string madm, string mota, string tinhtrang, int stt)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE  SanPham SET TenSP = N'" + tensp + "',GiaCu =" + giacu + ", GiaMoi = " + giamoi + ",MaHSX = '" + hangsx + "',MaDM = '" + madm + "',MoTa = N'" + mota + "',TinhTrang = N'" + tinhtrang + "',Status = " + stt + " WHERE MaSP = '" + masp + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void DeleteCTSPSanPham(string ma)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE ChiTietSanPham SET STT = 0 WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void DeleteHinhSanPham(string ma)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Delete HinhSanPham WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void InsertChiTietSanPham(string masp, string sku, string model, string manhinh, string trongluong, string mausac, string ktmh, string bonhotrong, string bonhongoai, string camera, string hdh, string loaipin, string congketnoi, string baohanh, string cpu, int stt)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO ChiTietSanPham(MaSP,SKU,Model,ManHinh,TrongLuong,MauSac,KichThuocManHinh,BoNhoTrong,BoNhoNgoai,Camera,HeDieuHanh,LoaiPin,CongKetNoi,BaoHanh,CPU,STT) values('" + masp + "','" + sku + "','" + model + "','" + manhinh + "','" + trongluong + "',N'" + mausac + "','" + ktmh + "','" + bonhotrong + "','" + bonhongoai + "','" + camera + "','" + hdh + "','" + loaipin + "','" + congketnoi + "','" + baohanh + "','" + cpu + "', " + stt + ")", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void InsertHinhSanPham(string masp, string hinh1,  string hinh2, string hinh3)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO HinhSanPham(MaSP,HinhAnh1,HinhAnh2,HinhAnh3) values('" + masp + "','" + hinh1 + "','" + hinh2 + "','" + hinh3 + "')", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static ArrayList LayHangSanXuat()
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM HangSanXuat WHERE  Status = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string mahsx = reader.GetString(1);
                    string tenhsx = reader.GetString(2);
                    int status = reader.GetInt32(3);
                    HangSanXuat danhmuc = new HangSanXuat(mahsx, tenhsx, status);
                    list.Add(danhmuc);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }
        public static ArrayList LayDanhSachChiTietSanPham(string ma)
        {
            ArrayList list = new ArrayList();

            string query = String.Format("SELECT * FROM ChiTietSanPham WHERE MaSP = '"+ ma +"' and STT = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string masp = reader.GetString(1);
                    string sku = reader.GetString(2);
                    string model = reader.GetString(3);
                    string manhinh = reader.GetString(4);
                    string trongluong = reader.GetString(5);
                    string mausac = reader.GetString(6);
                    string kichthuocmanhinh = reader.GetString(7);
                    string bonhotrong = reader.GetString(8);
                    string bonnhongoai = reader.GetString(9);
                    string camera = reader.GetString(10);
                    string hedieuhanh = reader.GetString(11);
                    string loaipin = reader.GetString(12);
                    string congketnoi = reader.GetString(13);
                    string baohanh = reader.GetString(14);
                    string cpu = reader.GetString(15);
                    ChiTietSanPham sp = new ChiTietSanPham(masp, sku, model, manhinh, trongluong, mausac, kichthuocmanhinh, bonhotrong,bonnhongoai,camera,hedieuhanh,loaipin,congketnoi,baohanh,cpu);
                    list.Add(sp);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static ArrayList LayHinhSanPham(string ma)
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT * FROM HinhSanPham WHERE MaSP = '"+ ma +"'");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while(reader.Read())
                {
                    string hinh1 = reader.GetString(1);
                    string hinh2 = reader.GetString(2);
                    string hinh3 = reader.GetString(3);
                    string masp = reader.GetString(4);
                    HinhSanPham hinhSp = new HinhSanPham(masp,hinh1,hinh2,hinh3);
                    list.Add(hinhSp);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static ArrayList LayDanhSacHinhSanPham()
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT * FROM HinhSanPham");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string hinh1 = reader.GetString(1);
                    string hinh2 = reader.GetString(2);
                    string hinh3 = reader.GetString(3);
                    string masp = reader.GetString(4);
                    HinhSanPham hinhSp = new HinhSanPham(masp, hinh1, hinh2, hinh3);
                    list.Add(hinhSp);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static void UpdateHinhSanPham(string ma, string hinh1, string hinh2, string hinh3)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh1 = '"+ hinh1 +"', HinhAnh2 = '"+ hinh2 +"', HinhAnh3 = '"+ hinh3 +"' WHERE MaSP = '"+ ma +"'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateHinhSanPham1(string ma, string hinh1)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh1 = '" + hinh1 + "' WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateHinhSanPham2(string ma, string hinh2)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh2 = '" + hinh2 + "' WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateHinhSanPham3(string ma, string hinh3)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh3 = '" + hinh3 + "' WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateHinhSanPham4(string ma, string hinh1, string hinh2)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh1 = '" + hinh1 + "', HinhAnh2 = '" + hinh2 + "'  WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateHinhSanPham5(string ma, string hinh2, string hinh3)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh2 = '" + hinh2 + "', HinhAnh3 = '" + hinh3 + "'  WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateHinhSanPham6(string ma, string hinh1, string hinh3)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE HinhSanPham SET HinhAnh1 = '" + hinh1 + "', HinhAnh3 = '" + hinh3 + "'  WHERE MaSP = '" + ma + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateChiTietSanPham(string masp, string sku,string model, string manhinh,string trongluong, string mausac,string ktmh,string bonhotrong,string bonhongoai,string camera, string hedieuhanh,string loaipin,string congketnoi, string baohanh,string cpu,int stt)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE ChiTietSanPham SET SKU = '" + sku + "',Model = '" + model + "',ManHinh = '" + manhinh + "', TrongLuong= '" + trongluong + "',MauSac = '" + mausac + "',KichThuocManHinh = '" + ktmh + "',BoNhoTrong = '" + bonhotrong + "',BoNhoNgoai = '" + bonhongoai + "',Camera = '" + camera + "',HeDieuHanh = '" + hedieuhanh + "',LoaiPin = '" + loaipin + "',CongKetNoi = '" + congketnoi + "',BaoHanh = '" + baohanh + "',CPU = '" + cpu + "',STT = " + stt + " WHERE MaSP = '"+ masp +"'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static ArrayList LayDonHang()
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT * FROM DonHang WHERE YEAR(NgayLap) = 2015");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    int madh = reader.GetInt32(1);
                    string makh = reader.GetString(2);
                    double tongtien = reader.GetDouble(3);
                    DateTime ngaylap1 = reader.GetDateTime(4);
                    string ngaylap = (ngaylap1.ToString("yyyy-MM-dd").ToString()); 
                    string tinhtrang = reader.GetString(5);
                    DonHang dh = new DonHang(madh,makh,tongtien,ngaylap,tinhtrang);
                    list.Add(dh);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static DataTable ReportNam(string nam)
        {
            conn.Open();
            DataTable dtb = new DataTable();
            string tv = string.Format("SELECT TongTien, NgayLap FROM DonHang WHERE YEAR(NgayLap) = '"+ nam +"'");
            SqlDataAdapter da = new SqlDataAdapter(tv, conn);
            // Đổ dữ liệu vào DataSet
            da.Fill(dtb);
            conn.Close();
            return dtb;
        }
        public static DataTable ReportThang(string thang, string nam)
        {
            conn.Open();
            DataTable dtb = new DataTable();
            string tv = string.Format("SELECT TongTien, NgayLap FROM DonHang WHERE MONTH(NgayLap) = '"+ thang +"' and YEAR(NgayLap) = '" + nam + "'");
            SqlDataAdapter da = new SqlDataAdapter(tv, conn);
            // Đổ dữ liệu vào DataSet
            da.Fill(dtb);
            conn.Close();
            return dtb;
        }
        public static DataTable ReportQuy1(string nam)
        {
            conn.Open();
            DataTable dt = new DataTable();
            string sql = String.Format("SELECT TongTien , NgayLap FROM DonHang WHERE YEAR(NgayLap) = '"+ nam +"' and MONTH(NgayLap) < 4");
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public static DataTable ReportQuy2(string nam)
        {
            conn.Open();
            DataTable dt = new DataTable();
            string sql = String.Format("SELECT TongTien , NgayLap FROM DonHang WHERE YEAR(NgayLap) = '" + nam + "' and 3 < MONTH(NgayLap) and MONTH(NgayLap) < 7");
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public static DataTable ReportQuy3(string nam)
        {
            conn.Open();
            DataTable dt = new DataTable();
            string sql = String.Format("SELECT TongTien , NgayLap FROM DonHang WHERE YEAR(NgayLap) = '" + nam + "' and 6 < MONTH(NgayLap) and MONTH(NgayLap) < 10");
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public static DataTable ReportQuy4(string nam)
        {
            conn.Open();
            DataTable dt = new DataTable();
            string sql = String.Format("SELECT TongTien , NgayLap FROM DonHang WHERE YEAR(NgayLap) = '" + nam + "' and 9 < MONTH(NgayLap) ");
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public static DataTable KiemTraInsertSP(string ma)
        {
            DataTable dtb = new DataTable();
            conn.Open();
            string tv = string.Format("SELECT * FROM SanPham WHERE MaSP = '" + ma + "' and Status = 1");
            SqlDataAdapter da = new SqlDataAdapter(tv, conn);
            da.Fill(dtb);
            conn.Close();
            return dtb;
        }
        public static DataTable KiemTraInsertCTSP(string ma)
        {
            DataTable dtb = new DataTable();
            conn.Open();
            string tv = string.Format("SELECT * FROM ChiTietSanPham WHERE MaSP = '" + ma + "' and STT = 1");
            SqlDataAdapter da = new SqlDataAdapter(tv, conn);
            da.Fill(dtb);
            conn.Close();

            return dtb;
        }
        public static ArrayList LaySlide()
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT * FROM Slide WHERE Status = 1");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string masl = reader.GetString(1);
                    string hinh = reader.GetString(2);
                    string link = reader.GetString(3);
                    Slide sd = new Slide(masl, hinh, link);
                    list.Add(sd);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static ArrayList LaySlideTheoMa(string ma)
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT * FROM Slide WHERE MaSL = '"+ ma +"' and Status = 1");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string masl = reader.GetString(1);
                    string hinh = reader.GetString(2);
                    string link = reader.GetString(3);
                    Slide sd = new Slide(masl,hinh, link);
                    list.Add(sd);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static void ThemSlide(string ma ,string hinh, string link)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Slide(MaSL,HinhAnh,Link, Status) values('"+ ma +"','"+ hinh +"', '"+ link +"',1)",conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void DeleteSlide(string ma)
        {
            conn.Open();
            string sql = "UPDATE Slide SET Status = 0 WHERE MaSL = '"+ ma +"'";
            SqlCommand cmd = new SqlCommand(sql,conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateSlide1(string ma, string hinh, string link, int stt)
        {
            conn.Open();
            string sql = "UPDATE Slide SET HinhAnh = '"+ hinh +"', Link = '"+ link +"', Status = "+ stt +" WHERE MaSL = '"+ ma +"'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void UpdateSlide2(string ma, string link, int stt)
        {
            conn.Open();
            string sql = "UPDATE Slide SET Link = '" + link + "', Status = " + stt + " WHERE MaSL = '" + ma + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable KiemTraInsertSlide(string ma)
        {
            DataTable dt = new DataTable();
            conn.Open();
            string sql = string.Format("SELECT * FROM Slide WHERE MaSL = '" + ma + "' and Status = 1 ");
            SqlDataAdapter adap = new SqlDataAdapter(sql, conn);
            adap.Fill(dt);
            conn.Close();
            return dt;
        }
        public static ArrayList LayThacMac()
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT Ten, Email, TieuDe, NoiDung FROM ThacMac WHERE Status = 1");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string ten = reader.GetString(0);
                    string email = reader.GetString(1);
                    string tieude = reader.GetString(2);
                    string noidung = reader.GetString(3);
                    
                    ThacMac tm = new ThacMac(ten,email,tieude,noidung);
                    list.Add(tm);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static ArrayList LayThacMacTheoEmail(string mail)
        {
            ArrayList list = new ArrayList();
            string sql = String.Format("SELECT * FROM ThacMac WHERE Email = '"+ mail +"' and Status = 1");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string ten = reader.GetString(1);                    
                    string email = reader.GetString(2);
                    string tieude = reader.GetString(3);
                    string noidung = reader.GetString(4);
                    ThacMac tm = new ThacMac(ten,  email, tieude, noidung);
                    list.Add(tm);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;
        }
        public static void XoaThacMac(string email)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE ThacMac SET Status = 0 WHERE Email= '"+ email +"'",conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable ReportHome(int thang, string nam)
        {
            conn.Open();
            DataTable dtb = new DataTable();
            string tv = string.Format("SELECT TongTien, NgayLap FROM DonHang WHERE MONTH(NgayLap) = " + thang + " and YEAR(NgayLap) = '" + nam + "' And TinhTrang = N'Đã thanh toán'");
            SqlDataAdapter da = new SqlDataAdapter(tv, conn);
            da.Fill(dtb);
            conn.Close();
            return dtb;
        }
        public static DataTable LayDonHangMoiNhat(int ngay)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("SELECT * FROM DonHang WHERE DAY(NgayLap) BetWeen " + ngay + " - 3  and " + ngay + "And TinhTrang = N'Chưa thanh toán'");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        //public static ArrayList LayDonHangMoiNhat(int ngay)
        //{
        //    ArrayList list = new ArrayList();
        //    string sql = String.Format("SELECT * FROM DonHang WHERE DAY(NgayLap) BetWeen " + ngay + " - 3  and " + ngay + "And TinhTrang = N'Chưa thanh toán'");
        //    try
        //    {
        //        conn.Open();
        //        command.CommandText = sql;
        //        SqlDataReader reader = command.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            int madh = reader.GetInt32(0);
        //            float tongtien = reader.GetFloat(2);
        //            DateTime ngaylap1 = reader.GetDateTime(4);
        //           string ngaylap = (ngaylap1.ToString("yyyy-MM-dd"));

        //            string tinhtrang = reader.GetString(5);
        //            DonHang dh = new DonHang(madh, tongtien, tinhtrang, ngaylap);
        //            list.Add(dh);
        //        }
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //    return list;
        //}
        //----------------------------------------------------hãng sản xuất-----------------------------------------

        public static ArrayList LayHangSX()
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM HangSanXuat WHERE Status = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string mahangsx = reader.GetString(1);
                    string tenhangsx = reader.GetString(2);
                    int status = reader.GetInt32(3);
                    HangSanXuat hangsanxuat = new HangSanXuat(id, mahangsx, tenhangsx, status);
                    list.Add(hangsanxuat);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }
        public static ArrayList LayChiTietHangSX(string mh)
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM HangSanXuat WHERE Status = 1 and MaHSX = '" + mh + "'");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string mahangsx = reader.GetString(1);
                    string tenhangsx = reader.GetString(2);
                    int status = reader.GetInt32(3);
                    string hinhhsx = reader.GetString(4);
                    HangSanXuat hangsanxuat = new HangSanXuat(id, mahangsx, tenhangsx, status, hinhhsx);
                    list.Add(hangsanxuat);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }
        public static void XoaHangSX(string mahangsx)
        {
            conn.Open();
            string sql = string.Format("update HangSanXuat set Status = 0 where MaHSX = N'" + mahangsx + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void LayLaiHSX(string mahangsx)
        {
            conn.Open();
            string sql = string.Format("update HangSanXuat set Status = 0 where MaHSX = N'" + mahangsx + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable KiemTraTonTaiHSX(string mahsx)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from HangSanXuat where MaHSX = N'" + mahsx + "' and Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static void SuaHangSX(string mahangsx, string tenhangsx, int status, string hinhanh)
        {
            conn.Open();
            string sql = string.Format("update HangSanXuat set TenHSX = N'" + tenhangsx + "', HinhHangSX = '" + hinhanh + "', Status = '" + status + "' where MaHSX = N'" + mahangsx + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }

        public static void SuaHangSX1(string mahangsx, string tenhangsx, int status)
        {
            conn.Open();
            string sql = string.Format("update HangSanXuat set TenHSX = N'" + tenhangsx + "', Status = '" + status + "' where MaHSX = N'" + mahangsx + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void ThemHangSX(string mahangsx, string tenhangsx, string hinhhangsx, int status)
        {
            conn.Open();
            string sql = string.Format("insert into HangSanXuat(MaHSX, TenHSX, HinhHangSX, Status) values(N'" + mahangsx + "',N'" + tenhangsx + "','" + hinhhangsx + "','" + status + "')");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable KiemTraTonTai(string mahsx)
        {
            DataTable tb = new DataTable();
            string query = String.Format("SELECT * FROM HangSanXuat WHERE MaHSX = N'" + mahsx + "' and Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(query, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        //--------------------------------------------người dùng ----------------------------------------
        public static ArrayList LayNguoiDung()
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM NguoiDung WHERE STT = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int mand = reader.GetInt32(0);
                    string quyen = reader.GetString(1);
                    string taikhoan = reader.GetString(2);
                    string matkhau = reader.GetString(3);
                    string hoten = reader.GetString(4);
                    DateTime ngaysinh1 = reader.GetDateTime(5);
                    String ngaysinh = (ngaysinh1.ToString("dd-MM-yyyy").ToString()); 
                    // string ngaysinh = reader.GetDateTime(5).ToShortDateString();
                    //string ng = string.Format(reader.GetString(5));
                    //DateTime ngaysinh = DateTime.ParseExact(ng, "yyyy-MM-dd", new CultureInfo("en-US"));
                    string gioitinh = reader.GetString(6);
                    string diachi = reader.GetString(7);
                    string thanhpho = reader.GetString(8);
                    string email = reader.GetString(9);
                    string dienthoai = reader.GetString(10);
                    int stt = reader.GetInt32(11);
                    NguoiDung nguoidung = new NguoiDung(mand, quyen, taikhoan, matkhau, hoten, ngaysinh, gioitinh, diachi, thanhpho, email, dienthoai, stt);
                    list.Add(nguoidung);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }

        public static ArrayList LayNguoiDungTheoMa(int mand)
        {
            ArrayList list = new ArrayList();
            string query = String.Format("SELECT * FROM NguoiDung where MaND = '" + mand + "' and STT = 1");

            try
            {
                conn.Open();
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                  //  int mand = reader.GetInt32(0);
                    string quyen = reader.GetString(1);
                    string taikhoan = reader.GetString(2);
                    string matkhau = reader.GetString(3);
                    string hoten = reader.GetString(4);
                    DateTime ngaysinh1 = reader.GetDateTime(5);
                    String ngaysinh = (ngaysinh1.ToString("dd-MM-yyyy").ToString());
                    // string ngaysinh = reader.GetDateTime(5).ToShortDateString();
                    //string ng = string.Format(reader.GetString(5));
                    //DateTime ngaysinh = DateTime.ParseExact(ng, "yyyy-MM-dd", new CultureInfo("en-US"));
                    string gioitinh = reader.GetString(6);
                    string diachi = reader.GetString(7);
                    string thanhpho = reader.GetString(8);
                    string email = reader.GetString(9);
                    string dienthoai = reader.GetString(10);
                    int stt = reader.GetInt32(11);
                    NguoiDung nguoidung = new NguoiDung(mand, quyen, taikhoan, matkhau, hoten, ngaysinh, gioitinh, diachi, thanhpho, email, dienthoai, stt);
                    list.Add(nguoidung);
                }
            }
            finally
            {
                conn.Close();
            }

            return list;
        }

        public static DataTable LayNguoiDungChoi(int ma)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from NguoiDung where MaND = '" + ma + "' and STT = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static void XoaNguoiDung(int mand)
        {
            conn.Open();
            string sql = string.Format("update NguoiDung set STT = 0 where MaND = '" + mand + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void LayLaiNguoiDung(int mand)
        {
            conn.Open();
            string sql = string.Format("update NguoiDung set STT = 1 where MaND = '" + mand + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void Them(string quyen, string taikhoan, string matkhau, string hoten, DateTime ngaysinh, string gioitinh, string diachi, string thanhpho, string email, string dienthoai, int stt)
        {
            conn.Open();
            string sql = string.Format("insert into NguoiDung(Quyen, TaiKhoan, MatKhau, HoTen, NgaySinh,GioiTinh,DiaChi,ThanhPho,Email,DienThoai,STT) values(N'" + quyen + "',N'" + taikhoan + "','" + matkhau + "',N'" + hoten + "','" + ngaysinh.ToShortDateString() + "',N'" + gioitinh + "',N'" + diachi + "',N'" + thanhpho + "','" + email + "','" + dienthoai + "','" + stt + "')");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }


        public static DataTable KiemTraTonTaiNguoiDung(string taikhoan)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from NguoiDung where TaiKhoan = '" + taikhoan + "' and STT = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static DataTable KiemTraTonTaiEmail(string email)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from NguoiDung where Email = '" + email + "' and STT = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static ArrayList LayChiTietNguoiDung(int mand)
        {
            ArrayList list = new ArrayList();
            string sql = string.Format("select * from NguoiDung where MaND = '" + mand + "' and STT = 1");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    int mand1 = reader.GetInt32(0);
                    string quyen = reader.GetString(1);
                    string taikhoan = reader.GetString(2);
                    string matkhau = reader.GetString(3);
                    string hoten = reader.GetString(4);
                    DateTime ngaysinh1 = reader.GetDateTime(5);
                    String ngaysinh = (ngaysinh1.ToString("yyyy-MM-dd").ToString()); 
                    // string ngaysinh = reader.GetDateTime(5).ToShortDateString();
                    //string ng = string.Format(reader.GetString(5));
                    //DateTime ngaysinh = DateTime.ParseExact(ng, "yyyy-MM-dd", new CultureInfo("en-US"));
                    string gioitinh = reader.GetString(6);
                    string diachi = reader.GetString(7);
                    string thanhpho = reader.GetString(8);
                    string email = reader.GetString(9);
                    string dienthoai = reader.GetString(10);
                    int stt = reader.GetInt32(11);
                    NguoiDung nguoidung = new NguoiDung(mand, quyen, taikhoan, matkhau, hoten, ngaysinh, gioitinh, diachi, thanhpho, email, dienthoai, stt);
                    list.Add(nguoidung);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;

        }
        public static ArrayList LayQuyenGioiTinhNguoiDung()
        {
            ArrayList list = new ArrayList();
            string sql = string.Format("select DISTINCT NguoiDung.Quyen, NguoiDung.GioiTinh from NguoiDung where STT = 1");
            try
            {
                conn.Open();
                command.CommandText = sql;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string quyen = reader.GetString(0);
                    string gioitinh = reader.GetString(1);
                    NguoiDung nguoidung = new NguoiDung(quyen, gioitinh);
                    list.Add(nguoidung);
                }
            }
            finally
            {
                conn.Close();
            }
            return list;

        }
        public static void SuaNguoiDung(int mand, string quyen, string taikhoan, string hoten, DateTime ngaysinh, string gioitinh, string diachi, string thanhpho, string email, string dienthoai)
        {
            conn.Open();
            string sql = string.Format("update NguoiDung set Quyen = N'" + quyen + "', TaiKhoan = N'" + taikhoan + "', HoTen = N'" + hoten + "', NgaySinh = '" + ngaysinh.ToShortDateString() + "', GioiTinh = N'" + gioitinh + "', DiaChi = N'" + diachi + "', ThanhPho = N'" + thanhpho + "', Email = '" + email + "', DienThoai = '" + dienthoai + "' where MaND = '" + mand + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void CapNhapThongTinAdmin(int mand, string taikhoan, string hoten, DateTime ngaysinh, string gioitinh, string diachi, string thanhpho, string email, string dienthoai)
        {
            conn.Open();
            string sql = string.Format("update NguoiDung set TaiKhoan = N'" + taikhoan + "', HoTen = N'" + hoten + "', NgaySinh = '" + ngaysinh.ToShortDateString() + "', GioiTinh = N'" + gioitinh + "', DiaChi = N'" + diachi + "', ThanhPho = N'" + thanhpho + "', Email = '" + email + "', DienThoai = '" + dienthoai + "' where MaND = '" + mand + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void ThayDoiMatKhauAdmin(int mand, string mk)
        {
            conn.Open();
            string sql = string.Format("update NguoiDung set MatKhau = N'" + mk + "' where MaND = '" + mand + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        /*-------------------------------------------Đơn hàng----------------------------------------*/

        public static DataTable LayDonHang1()
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select DISTINCT nd.*,dh.* from NguoiDung nd, DonHang dh where dh.MaND = nd.MaND and dh.Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static DataTable LayDonHangTheoTinhTrang(string ttrang)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select DISTINCT nd.*,dh.* from NguoiDung nd, DonHang dh where dh.MaND = nd.MaND and dh.Status = 1 and dh.TinhTrang = N'" + ttrang + "'");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static void XoaDonHang(int madh)
        {
            conn.Open();
            string sql = string.Format("update DonHang set Status = 0 where ID = '" + madh + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void SuaDonHangKhiXoaChiTiet(int madh, long tt)
        {
            conn.Open();
            string sql = string.Format("update DonHang set TongTien = '" + tt + "' where ID = '" + madh + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void ThanhToanDonHang(int madh)
        {
            conn.Open();
            string sql = string.Format("update DonHang set TinhTrang = N'Đã Thanh Toán' where ID = '" + madh + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }

        public static void ThemDonHang(int mand, long tongtien, DateTime ngaylap, string tinhtrang, string loaithanhtoan, int status)
        {
            conn.Open();
            string sql = string.Format("insert into DonHang(MaND, TongTien,NgayLap,TinhTrang,LoaiThanhToan,Status) values('" + mand + "', '" + tongtien + "', '" + ngaylap.ToShortDateString() + "', N'" + tinhtrang + "', N'" + loaithanhtoan + "', '" + status + "')");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        /*------------------------------------chi tiết đơn hàng----------------------------------*/
        public static DataTable LayChiTietDonHang(int madh)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select ct.*,sp.*, dh.*,nd.*, dh.TinhTrang as ttdh from SanPham sp,NguoiDung nd, DonHang dh, ChiTietDonHang ct where ct.MaSP = sp.MaSP and MaDH = '" + madh + "' and ct.Status = 1 and dh.ID = ct.MaDH and dh.MaND = nd.MaND");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static void XoaChiTietDonHang(int madh)
        {
            conn.Open();
            string sql = string.Format("update ChiTietDonHang set Status = 0 where MaDH = '" + madh + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }

        public static void CapNhapDonHangKhiThemChiTiet(int madh, string tt, long tongtien)
        {
            conn.Open();
            string sql = string.Format("update DonHang set TongTien = (TongTien +'" + tongtien + "'), TinhTrang = N'" + tt + "' where ID = '" + madh + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable LaySanPhamChoDonHang()
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from SanPham where Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static DataTable LaySanPhamChoChiTiet(string masp)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from SanPham where MaSP = '" + masp + "' Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static DataTable LayGiaSPChoDonHang(string masp)
        {
            conn.Open();
            DataTable tb = new DataTable();
            string sql = string.Format("select * from SanPham where Status = 1 and MaSP = '" + masp + "'");

            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static DataTable LayDonHangChoDonHang()
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from DonHang where Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static DataTable LayDonHangChoDonHangTheoMa(int id)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from DonHang ID = '" + id + "' where Status = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static void ThemChiTietDonHang(int madh, string masp, int soluong, long dongia, long thanhtien, int stt)
        {
            conn.Open();
            string sql = string.Format("insert into ChiTietDonHang(MaDH, MaSP, SoLuong,DonGia,ThanhTien,Status) values('" + madh + "', N'" + masp + "', '" + soluong + "', '" + dongia + "', '" + thanhtien + "', '" + stt + "')");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        /* ------------đăng nhập-------------------------------------*/
        //public static DataTable KiemTraDangNhap(string ten, string pass)
        //{
        //    DataTable dtb = new DataTable();
        //    conn.Open();
        //    string tv = string.Format("SELECT * FROM NguoiDung WHERE TaiKhoan = N'" + ten + "' and MatKhau = '" + pass + "' and Quyen = N'Admin'");
        //    SqlDataAdapter da = new SqlDataAdapter(tv, conn);
        //    // Đổ dữ liệu vào DataSet
        //    da.Fill(dtb);
        //    conn.Close();
        //    return dtb;

        //}
        /* ------------bình luận-------------------------------------*/
        public static DataTable LayBinhLuan()
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select DISTINCT bl.MaBL as mabinhluan, bl.MaND as mand, bl.NgayBL as ngaybinhluan, SUBSTRING(bl.NoiDung, 1, 15) + '.....' as noidung, nd.*, sp.* from BinhLuan bl, NguoiDung nd, SanPham sp where bl.MaND = nd.MaND and bl.MaSP = sp.MaSP and bl.STT = 1");
           // conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }
        public static DataTable LayChiTietBinhLuan(int mabl)
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select bl.*, nd.*, sp.* from BinhLuan bl, NguoiDung nd, SanPham sp where bl.MaND = nd.MaND and bl.MaSP = sp.MaSP and bl.MaBL = '" + mabl + "' and bl.STT = 1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }


        public static void XoaBinhLuan(int mabl)
        {
            conn.Open();
            string sql = string.Format("update BinhLuan set STT = 0 where MaBL= '" + mabl + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }

        public static void ThemBinhLuan(int mand, string noidung, DateTime ngaybl, int stt, string masp)
        {
            conn.Open();
            string sql = string.Format("insert into BinhLuan(MaND, NoiDung,NgayBL,STT,MaSP) values('" + mand + "', N'" + noidung + "', '" + ngaybl.ToShortDateString() + "', '" + stt + "', N'" + masp + "')");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
        public static void CapNhapBinhLuan(int mabl, int mand, string noidung, DateTime ngaybl, string masp)
        {
            conn.Open();
            string sql = string.Format("update BinhLuan set MaND = '" + mand + "', NoiDung = N'" + noidung + "', NgayBL = '" + ngaybl.ToShortDateString() + "', MaSP = N'" + masp + "' where MaBL = '" + mabl + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();

        }
        /*----------------------- quản lý lỗi hệ thống----------------------------*/
        public static DataTable LayLoiHeThong()
        {
            DataTable tb = new DataTable();
            string sql = string.Format("select * from LoiHeThong where STT =1");
            conn.Open();
            SqlDataAdapter ds = new SqlDataAdapter(sql, conn);
            ds.Fill(tb);
            conn.Close();
            return tb;
        }

        public static void XoaLoiHeThong(int id)
        {
            conn.Open();
            string sql = string.Format("update LoiHeThong set STT = 0 where ID = '" + id + "'");
            SqlCommand cn = new SqlCommand(sql, conn);
            cn.ExecuteNonQuery();
            conn.Close();
        }
    }
}