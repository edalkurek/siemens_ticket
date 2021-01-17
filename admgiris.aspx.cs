using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class admgiris : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnadmgir_Click(object sender, EventArgs e)
    {
        OleDbConnection bag = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
        bag.Open();
        OleDbCommand sec = new OleDbCommand("select * from admin where kullanici_adi=@a and sifre=@b", bag);
        sec.Parameters.Add("a", TextBox1.Text);
        sec.Parameters.Add("b", TextBox2.Text);
        OleDbDataReader oku = sec.ExecuteReader();
        if (oku.Read())
        {
            Session["oturumadmkadi"] = TextBox1.Text;
            Response.Redirect("panel.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Hatalı Kullanıcı Adı Veya Şifre');</script>");
        }
        bag.Dispose();
        bag.Close();
    }
}