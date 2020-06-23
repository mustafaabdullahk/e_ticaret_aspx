using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class Satislar : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    public void GridDoldur()
    {
        string sorgu = "SELECT hareket.HAREKETID, kisiler.AD, kisiler.SOYAD, hareket.MIKTAR, hareket.TARIH, hareket.KARGOAD, hareket.UCRET, hareket.URUNID FROM kisiler INNER JOIN hareket ON kisiler.KISIID = hareket.KISIID; ";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        GridDoldur();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridView1.SelectedIndex = e.NewSelectedIndex;
        Session["SecilenKayit1"] = GridView1.DataKeys[e.NewSelectedIndex].Value;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from hareket where HAREKETID=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", Session["SecilenKayit1"]);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            //ADRES OKUTMA
            OleDbCommand TKB = new OleDbCommand("select * from kisi_adres where ADRESID=@1",baglanti);
            TKB.Parameters.Add("@1",oku[6]);
            OleDbDataReader read;
            read = TKB.ExecuteReader();
            while (read.Read())
            {
                Label1.Text = read[2].ToString();
                Label2.Text = read[4].ToString();
                Label3.Text = read[3].ToString();
            }
        }
    }
}