using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class randevuolustur : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["etlogmail"] != null)
        {
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            TextBox1.Text = Session["etadi"] + " " + Session["etsoyadi"];
            TextBox2.Text = Session["etmail"].ToString();
        }
        else
        {
            Response.Redirect("index.aspx");// intranet logine gidecek
        }
        OleDbConnection bagekle = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
        bagekle.Open();
        OleDbDataAdapter verigetir = new OleDbDataAdapter("select tarih from kullanici ", bagekle);
        verigetir.Fill(ds);
        OleDbDataAdapter verigetir2 = new OleDbDataAdapter("select resmitarih from tatiller ", bagekle);
        verigetir2.Fill(ds2);
        bagekle.Close();
        bagekle.Dispose();

        if (DropDownList2.SelectedItem.Text == "Seçiniz")
        {
            cal1.Attributes.Add("style", "display:none");
            cal2.Attributes.Add("style", "display:none");
        }
    }
    DataTable ds = new DataTable();
    DataTable ds2 = new DataTable();
    protected void btnolustur_Click(object sender, EventArgs e)
    {
        int flag = 0;
        if (DropDownList2.Text == "Seçiniz")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Lokasyon seçmeniz gerekmektedir');</script>");                                                                                         
            flag = 1;
        }
        else if (DropDownList2.SelectedItem.Text == "Kartal" && kartal.SelectedDate.Year < 2019)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Tarih seçmeniz gerekmektedir');</script>");
            flag = 1;
            DropDownList2.Text = "Seçiniz";
            cal1.Attributes.Add("style", "display:none");
            cal2.Attributes.Add("style", "display:none");
        }
        else if (DropDownList2.SelectedItem.Text == "Gebze" && gebze.SelectedDate.Year < 2019)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Tarih seçmeniz gerekmektedir');</script>");
            flag = 1;
            DropDownList2.Text = "Seçiniz";
            cal1.Attributes.Add("style", "display:none");
            cal2.Attributes.Add("style", "display:none");
        }
        if(flag == 0)
        { 
            OleDbConnection bagekle = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
            bagekle.Open();
            OleDbCommand ekle = new OleDbCommand("insert into kullanici (ad_soyad,mail,tel_no,pc_serino,lokasyon,tarih) values(@a,@b,@c,@f,@g,@h)", bagekle);
            ekle.Parameters.Add("a", TextBox1.Text);
            ekle.Parameters.Add("b", TextBox2.Text);
            ekle.Parameters.Add("c", TextBox3.Text);
            ekle.Parameters.Add("f", TextBox6.Text);
            ekle.Parameters.Add("g", DropDownList2.Text);
            if (DropDownList2.SelectedItem.Text == "Kartal")
            {
                ekle.Parameters.Add("h", kartal.SelectedDate.ToString("dd/MM/yyyy"));
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Bilgisayarınızı saat 09:00 da IT departmanına(22 Giriş A) getirmeniz gerekmektedir.');</script>");
            }

            if (DropDownList2.SelectedItem.Text == "Gebze")
            {
                ekle.Parameters.Add("h", gebze.SelectedDate.ToString("dd/MM/yyyy"));
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Bilgisayarınızı saat 09:00 da IT departmanına (1-3 Eğitim Salonu) getirmeniz gerekmektedir.');</script>");
            }
            ekle.ExecuteNonQuery();
            bagekle.Dispose();
            bagekle.Close();
            Response.AppendHeader("Refresh", "1;url=kullanicipaneli.aspx");
        }
    }
    protected void theVisibleMonthChangedKartal(Object sender, MonthChangedEventArgs e)
    {
        DateTime currentDate = DateTime.Now;
        DateTime dateOfMonthToDisable = currentDate.AddMonths(-1);
        if (e.NewDate.Year == 2020 || e.NewDate.Month == dateOfMonthToDisable.Month)
        {
            kartal.VisibleDate = e.PreviousDate;
            // Custom date formats are explained in [2] 

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('31.12.2019 Sonrasına Randevu Alınamamaktadır.');</script>");
        }
    }

    protected void theVisibleMonthChangedGebze(Object sender, MonthChangedEventArgs e)
    {
        DateTime currentDate = DateTime.Now;
        DateTime dateOfMonthToDisable = currentDate.AddMonths(-1);
        if (e.NewDate.Year == 2020 || e.NewDate.Month == dateOfMonthToDisable.Month)
        {
            gebze.VisibleDate = e.PreviousDate;
            // Custom date formats are explained in [2] 
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('31.12.2019 Sonrasına Randevu Alınamamaktadır.');</script>");
        }
    }

    protected void kartal_DayRender(object sender, DayRenderEventArgs e)
    {
        int i = 0;
        int hol = 0;
        int kartal = 0;
        try
        {
            foreach (var item in ds.Rows)
            {
                DateTime dt = Convert.ToDateTime(ds.Rows[i][0]);
                i++;
                if (e.Day.Date == dt)
                {
                    kartal++;
                    if (kartal >= 5)
                    {
                        e.Day.IsSelectable = false;
                        e.Cell.BackColor = System.Drawing.Color.DarkRed;
                    }
                }
            }
            foreach (var item in ds2.Rows)
            {
                DateTime dt2 = Convert.ToDateTime(ds2.Rows[hol][0]);
                hol++;
                if (e.Day.Date == dt2)
                {

                    e.Day.IsSelectable = false;
                    e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.LightGray });

                }
            }

        }
        
        catch (Exception)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert(ds.Rows[i][0].ToString);</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('EXCEPTION1');</script>");
        }
        
        if ((e.Day.Date.DayOfWeek != DayOfWeek.Sunday && e.Day.Date.DayOfWeek != DayOfWeek.Saturday && e.Day.Date.CompareTo(DateTime.Today) > 0) && e.Day.Date.Year == 2019) return;
        {
        e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.LightGray });
        e.Day.IsSelectable = false;
        }
    }
    protected void gebze_DayRender(object sender, DayRenderEventArgs e)
    {
        int i = 0;
        int gebze = 0;
        int hol = 0;
        try
        {
            foreach (var item in ds.Rows)
            {
                DateTime dt = Convert.ToDateTime(ds.Rows[i][0]);
                i++;
                if (e.Day.Date == dt)
                {
                    gebze++;
                    if (gebze >= 2)
                    {
                        e.Day.IsSelectable = false;
                        e.Cell.BackColor = System.Drawing.Color.DarkRed;
                    }
                }
            }
            foreach (var item in ds2.Rows)
            {
                DateTime dt2 = Convert.ToDateTime(ds2.Rows[hol][0]);
                hol++;
                if (e.Day.Date == dt2)
                {
                   
                        e.Day.IsSelectable = false;
                    e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.LightGray });

                }
            }
        }
        
        catch (Exception)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert(ds.Rows[i][0].ToString);</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('EXCEPTION2');</script>");
        }
      


        if ((e.Day.Date.DayOfWeek != DayOfWeek.Sunday && e.Day.Date.DayOfWeek != DayOfWeek.Saturday && e.Day.Date.CompareTo(DateTime.Today) > 0) && e.Day.Date.Year == 2019) return;
        {
            e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.LightGray });
            e.Day.IsSelectable = false;
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text == "Seçiniz")
        {
            cal2.Attributes.Add("style", "display:none");
            cal2.Attributes.Add("style", "display:none");
        }
        if (DropDownList2.SelectedItem.Text == "Gebze")
        {
            cal2.Attributes.Add("style", "display:block");
            cal1.Attributes.Add("style", "display:none");
        }
        if(DropDownList2.SelectedItem.Text == "Kartal")
        {
            cal1.Attributes.Add("style", "display:block");
            cal2.Attributes.Add("style", "display:none");
        }

    }
}