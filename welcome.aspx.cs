using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["etgid"] = Request.QueryString["gid"];
        Session["etmail"] = Request.QueryString["mail"];
        Session["etadi"] = Request.QueryString["name"];
        Session["etsoyadi"] = Request.QueryString["surname"];
        Session["ettime"] = Request.QueryString["time"];
        Session["ethash"] = Request.QueryString["hash"];
        Session["etdep"] = Request.QueryString["department"];

        String time = Session["ettime"].ToString();
        String gid = Session["etgid"].ToString();
        String mail = Session["etmail"].ToString();
        String name = Session["etadi"].ToString();
        String surname = Session["etsoyadi"].ToString();
        String privateKey = "FKDLFKu4eRandevu*Xkl";

        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

        String input = (privateKey + time + gid + mail + name + surname);

        byte[] hash = Encoding.UTF8.GetBytes(input);

        hash = md5.ComputeHash(hash);

        StringBuilder sb = new StringBuilder();

        foreach (byte b in hash)
        {
            sb.Append(b.ToString("x2").ToLower());
        }

        String result = sb.ToString();
        if (result == Session["ethash"].ToString())
        {
            Session["etlogmail"] = Session["etmail"];
        }
        else
        {
            Response.Redirect("index.aspx");// intranet logine gidecek
        }
    }

    protected void devam_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}