using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["etlogmail"] !=null)
        {
            
        }
        else
        {
            Response.Redirect("index.aspx");// intranet logine gidecek
        }
    }
    protected void randolustur_Click(object sender, EventArgs e)
    {
        Response.Redirect("randevuolustur.aspx");
    }

    protected void randduz_Click(object sender, EventArgs e)
    {
        if (Session["etlogmail"] != null)
        {
            Response.Redirect("kullanicipaneli.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kayıt Bulunmamaktadır.');</script>");
        }
    }

}