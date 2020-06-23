using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class admingiris : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["eposta"] = TextBox1.Text;
        Session["sifre"] = TextBox2.Text;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from yoneticiler where EPOSTA=@1";
        OleDbCommand kontrol = new OleDbCommand(sorgu, baglanti);
        kontrol.Parameters.Add("@1", Session["eposta"].ToString() );
        OleDbDataReader oku;
        oku = kontrol.ExecuteReader();
        while (oku.Read())
        {
            Session["kontrol_eposta"] = oku[1].ToString();
            Session["kontrol_sifre"] = oku[2].ToString();
         }
        if (Session["kontrol_eposta"] != null)
        {
            if ((Session["kontrol_eposta"].ToString() == TextBox1.Text) && (Session["kontrol_sifre"].ToString() == TextBox2.Text))
            {
                Response.Redirect("uyeleri_duzenle.aspx");//burası admin olacak
            }
            else
            {
                Panel1.Visible = true;
                Label1.Text = "E-Posta veya şifre hatalı";
            }
        }
        else
        {
            Panel1.Visible = true;
            Label1.Text = "Böyle bir yönetici kayıtlı değil";
        }

        
    }
}