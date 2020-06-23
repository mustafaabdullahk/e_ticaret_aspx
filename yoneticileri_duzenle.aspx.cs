using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class yoneticileri_duzenle : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    public void YoneticiGridDoldur()
    {
        string sorgu = "select * from yoneticiler";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecilenKayit"] == null)
        {
            ImageButton3.Enabled = false;
            ImageButton2.Enabled = false;
        }
        else
        {
            ImageButton3.Enabled = true;
            ImageButton2.Enabled = true;
        }
        YoneticiGridDoldur();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        baglanti.Close();
        baglanti.Open();
        string sorgu = "insert into yoneticiler(EPOSTA,SIFRE) values(@1,@2)";
        OleDbCommand kaydet = new OleDbCommand(sorgu, baglanti);
        kaydet.Parameters.Add("@1", TextBox1.Text);
        kaydet.Parameters.Add("@2", TextBox2.Text);
        kaydet.ExecuteNonQuery();
        baglanti.Close();
        YoneticiGridDoldur();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridView1.SelectedIndex = e.NewSelectedIndex;
        Session["SecilenKayit"] = GridView1.DataKeys[e.NewSelectedIndex].Value;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from yoneticiler where YONETICIID=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", Session["SecilenKayit"]);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            TextBox1.Text = oku[1].ToString();
            TextBox2.Text = oku[2].ToString();
        }
        baglanti.Close();
        ImageButton3.Enabled = true;
        ImageButton2.Enabled = true;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "update yoneticiler SET EPOSTA=@1, SIFRE=@2 where YONETICIID=@0";
        OleDbCommand guncelle = new OleDbCommand(sorgu, baglanti);
        guncelle.Parameters.Add("@1", TextBox1.Text);
        guncelle.Parameters.Add("@2", TextBox2.Text);
        guncelle.Parameters.Add("@0", Session["SecilenKayit"]);
        guncelle.ExecuteNonQuery();
        baglanti.Close();
        YoneticiGridDoldur();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "delete from yoneticiler where YONETICIID=@1";
        OleDbCommand Sil = new OleDbCommand(sorgu, baglanti);
        Sil.Parameters.Add("@1", Session["SecilenKayit"]);
        Sil.ExecuteNonQuery();
        baglanti.Close();
        YoneticiGridDoldur();
        ImageButton2.Enabled = false;
        ImageButton3.Enabled = false;
    }
}