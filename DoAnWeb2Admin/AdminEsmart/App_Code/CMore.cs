using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for CMore
/// </summary>
public class CMore
{
    public CMore()
    {
    }

    public static string GetMD5Hash(string input)
    {
        System.Security.Cryptography.MD5CryptoServiceProvider x = new System.Security.Cryptography.MD5CryptoServiceProvider();
        byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
        bs = x.ComputeHash(bs);
        System.Text.StringBuilder s = new System.Text.StringBuilder();
        foreach (byte b in bs)
        {
            s.Append(b.ToString("x2").ToLower());
        }
        string password = s.ToString();
        return password;
    }
    public static string MaHoaPass(string Password, string Format)
    {
        if (Format == "")
            Format = "MD5";
        return FormsAuthentication.HashPasswordForStoringInConfigFile(Password, Format);
    }
}