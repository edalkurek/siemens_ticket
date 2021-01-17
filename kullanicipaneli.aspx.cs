using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Web.UI.HtmlControls;

public partial class panel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (Session["etlogmail"] !=null)
        {
            lblisim.Text = Session["etadi"] + " " + Session["etsoyadi"];
            OleDbConnection bag = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
        OleDbCommand sec = new OleDbCommand("select * from kullanici where mail=@a", bag);
        sec.Parameters.Add("a", Session["etlogmail"].ToString());
         OleDbDataReader reader;
            try
            {
         
                bag.Open();
                reader = sec.ExecuteReader();
                myRepeater.DataSource = reader;
                myRepeater.DataBind();
                reader.Close();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Bir Hata Oluştu.');</script>");
            }
            finally
            {
                bag.Dispose();
                bag.Close();
            }

            OleDbConnection bag2 = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
            OleDbCommand sec2 = new OleDbCommand("select * from kullanici where mail=@a", bag2);
            sec2.Parameters.Add("a", Session["etmail"].ToString());
            OleDbDataReader reader2;
            try
            {
                bag2.Open();
                reader2 = sec2.ExecuteReader();
                getirdrop.DataSource = reader2;
                getirdrop.DataValueField = "pc_serino";
                getirdrop.DataTextField = "pc_serino";
                getirdrop.DataBind();
                reader2.Close();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Bir Hata Oluştu.');</script>");
            }
            finally
            {
                bag2.Close();
            }
        }
        else
        {
            Response.Redirect("index.aspx");// intranet logine gidecek
        }
    }
    protected void btnsil_Click(object sender, EventArgs e)
    {
        OleDbConnection bagsil = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
        bagsil.Open();
        OleDbCommand secsil = new OleDbCommand("Delete from kullanici where pc_serino=@a", bagsil);
        try
        {
            secsil.Parameters.Add("a", getirdrop.SelectedItem.Text);
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Silinecek Kayıt Kalmadı.');</script>");
            Session.Remove("sesmail");
            Response.Redirect("index.aspx");
        }

        try
        {
            secsil.ExecuteNonQuery();
        }
        catch (Exception)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Silinecek Kayıt Kalmadı.');</script>");
            Session.Remove("sesmail");
            Response.Redirect("index.aspx");
        }
        bagsil.Dispose();
        bagsil.Close();
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
      
    
}