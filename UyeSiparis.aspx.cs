using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UyeSiparis : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source="+HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    public void GridDoldur()
    {
        string sorgu = "SELECT hareket.URUNID, urunler.RESIM, hareket.MIKTAR, hareket.TARIH, hareket.KARGOAD, hareket.UCRET FROM kisi_telefon INNER JOIN (kisi_adres INNER JOIN (urunler INNER JOIN hareket ON urunler.URUNID = hareket.URUNID) ON kisi_adres.ADRESID = hareket.ADRESID) ON kisi_telefon.TELEFONID = hareket.TELEFONID WHERE (((hareket.KISIID)=" + Convert.ToString(Session["CKisiID"]) + "));";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu,baglanti);
        DataTable dt = new DataTable();
        doldur.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        GridDoldur();
    }
}