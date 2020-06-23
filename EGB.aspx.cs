using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class EGB : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    char tirnak = '"';
    public void GridDoldur()
    {
        string sorgu = "SELECT urunler.URUNID, urunler.RESIM, markalar.MARKA, urunler.URUNAD, urunler.BIRIMFIYAT, urunler.STOK FROM markalar INNER JOIN urunler ON markalar.MARKAID = urunler.MARKAID WHERE (((urunler.KATEGORI)=" + tirnak + "EGB" + tirnak + ")) ORDER BY urunler.KATEGORISIRA;";
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
        Button1.Enabled = true;
        GridView1.SelectedIndex = e.NewSelectedIndex;
        Session["SecilenKayit"] = GridView1.DataKeys[e.NewSelectedIndex].Value;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from urunler where URUNID=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", Session["SecilenKayit"]);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            Session["UrunId"] = oku[0].ToString();
            Session["MarkaId"] = oku[1].ToString();
            Session["UrunAd"] = oku[2].ToString();
            Session["Fiyat"] = oku[3].ToString();
            Session["Resim"] = oku[4].ToString();
            Session["Aciklama"] = oku[5].ToString();
            Session["Adet"] = oku[10].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SeciliUrun.aspx");
    }
}