using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.OleDb;

public partial class panel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["oturumadmkadi"]!=null)
        {
            btnadmlog.Text = Session["oturumadmkadi"].ToString();
        }
        else
        {
            Response.Redirect("admgiris.aspx");
        }
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        /*
        // Add Column for the DataTable.
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("Column1"));

        // Add Rows to DataTable.
        for (int i = 1; i < 5; i++)
        {
            DataRow dr = dt.NewRow();
            dr["Column1"] = "Old Value" + i;
            dt.Rows.Add(dr);
        }

        GridView1.DataSource = dt;
        */
        GridView1.DataBind();
    }

    protected void btnadmcik_Click(object sender, EventArgs e)
    {
        Session.Remove("oturumadmkadi");
        Response.Redirect("admgiris.aspx");
    }

    protected void btnexcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment ; filename=Rapor.xls");
        Response.ContentType = "application/excel";

        StringWriter stringWriter = new StringWriter();
        HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

   
        foreach (TableCell tableCell in GridView1.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }

       
        foreach (GridViewRow gridViewRow in GridView1.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }


        GridView1.RenderControl(htmlTextWriter);
        Response.Write(stringWriter.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
   
    }


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void gvTestGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Set the edit index.
        GridView1.EditIndex = e.NewEditIndex;

        //Bind data to the GridView control.
        BindGrid();
    }

    protected void gvTestGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Get the new Values.
        GridViewRow row = GridView1.Rows[e.RowIndex];
        //Satır kotrol
        CheckBox check = ((CheckBox)row.Cells[2].Controls[0]);
        String serino = ((TextBox)row.Cells[8].Controls[0]).Text;
        String onay = check.Checked.ToString();

        // Code to update the DataSource.
        //.....
        if (onay == "True")
        {
            Boolean valid = true;
            String adminName = Session["oturumadmkadi"].ToString();
            OleDbConnection bagekle = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
            bagekle.Open();
            OleDbCommand guncelle = new OleDbCommand("UPDATE kullanici SET onaylayan = @a, onay = @c WHERE [pc_serino] = @b", bagekle);
            guncelle.Parameters.AddWithValue("a", adminName);
            guncelle.Parameters.AddWithValue("c", valid);
            guncelle.Parameters.AddWithValue("b", serino);
            guncelle.ExecuteNonQuery();
        }
        else
        {
            Boolean invalid = false;
            String empty = ".";
            OleDbConnection bagekle = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data//veri.accdb"));
            bagekle.Open();
            OleDbCommand guncelle = new OleDbCommand("UPDATE kullanici SET onaylayan = @a, onay = @c WHERE [pc_serino] = @b", bagekle);
            guncelle.Parameters.AddWithValue("a", empty);
            guncelle.Parameters.AddWithValue("c", invalid);
            guncelle.Parameters.AddWithValue("b", serino);
            guncelle.ExecuteNonQuery();
        }
        //Reset the edit index.
        GridView1.EditIndex = -1;

        //Bind data to the GridView control.
        BindGrid();
    }

    protected void gvTestGrid_RowCancelingEdit(object sender,
                                               GridViewCancelEditEventArgs e)
    {
        //Reset the edit index.
        GridView1.EditIndex = -1;

        //Bind data to the GridView control.
        BindGrid();
    }

}