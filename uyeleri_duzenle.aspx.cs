using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class uyeleri_duzenle : System.Web.UI.Page
{
    
    public void GridDoldur()
    {
        string sorgu = "select * from kisiler";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
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
        GridDoldur();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridView1.SelectedIndex = e.NewSelectedIndex;
        Session["SecilenKayit"] = GridView1.DataKeys[e.NewSelectedIndex].Value;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from kisiler where KISIID=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", Session["SecilenKayit"]);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            TextBox1.Text = oku[1].ToString();
            TextBox2.Text = oku[2].ToString();
            TextBox3.Text = oku[3].ToString();
            TextBox4.Text = oku[5].ToString();
            TextBox5.Text = oku[6].ToString();
            TextBox6.Text = oku[7].ToString();
        }
        baglanti.Close();
        ImageButton3.Enabled = true;
        ImageButton2.Enabled = true;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridDoldur();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "insert into kisiler(AD,SOYAD,EPOSTA,TC,DOGUMTARIH,INDIRIM) values(@1,@2,@3,@4,@5,@6)";
        OleDbCommand kaydet = new OleDbCommand(sorgu, baglanti);
        kaydet.Parameters.Add("@1",TextBox1.Text);
        kaydet.Parameters.Add("@2", TextBox2.Text);
        kaydet.Parameters.Add("@3", TextBox3.Text);
        kaydet.Parameters.Add("@4", TextBox4.Text);
        kaydet.Parameters.Add("@5", TextBox5.Text);
        kaydet.Parameters.Add("@6", Convert.ToInt32(TextBox6.Text));
        kaydet.ExecuteNonQuery();
        baglanti.Close();
        GridDoldur();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "update kisiler SET AD=@1, SOYAD=@2, EPOSTA=@3, TC=@4, DOGUMTARIH=@5, INDIRIM=@6 where KISIID=@0";
        OleDbCommand guncelle = new OleDbCommand(sorgu, baglanti);
        guncelle.Parameters.Add("@1", TextBox1.Text);
        guncelle.Parameters.Add("@2", TextBox2.Text);
        guncelle.Parameters.Add("@3", TextBox3.Text);
        guncelle.Parameters.Add("@4", TextBox4.Text);
        guncelle.Parameters.Add("@5", TextBox5.Text);
        guncelle.Parameters.Add("@6", Convert.ToInt32(TextBox6.Text));
        guncelle.Parameters.Add("@0", Session["SecilenKayit"]);
        guncelle.ExecuteNonQuery();
        baglanti.Close();
        GridDoldur();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "delete from kisiler where KISIID=@1";
        OleDbCommand Sil = new OleDbCommand(sorgu, baglanti);
        Sil.Parameters.Add("@1", Session["SecilenKayit"]);
        Sil.ExecuteNonQuery();
        baglanti.Close();
        GridDoldur();
        ImageButton2.Enabled = false;
        ImageButton3.Enabled = false;
    }
}