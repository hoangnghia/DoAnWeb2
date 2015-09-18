using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ESmart.Entities
{
    public class BaoLoi
    {
        public Int32 ID { get; set; }
        public String DuongDan { get; set; }
        public String NoiDung { get; set; }
        public String NgayBao { get; set; }

        public BaoLoi(){}
        public BaoLoi(String duongdan, String noidung, String ngaybao)
        {
            this.DuongDan = duongdan;
            this.NoiDung = noidung;
            this.NgayBao = ngaybao; 
        }

    }
}