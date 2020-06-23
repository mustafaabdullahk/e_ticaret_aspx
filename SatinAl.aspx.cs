using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Collections;


public partial class SatinAl : System.Web.UI.Page
{

    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    public void DropDoldur()
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from kargolar";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        DropDownList1.DataSource = data;
        DropDownList1.DataBind();
        baglanti.Close();
    }
    public void TelDoldur()
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from kisi_telefon where KISIID=" + Convert.ToString(Session["CKisiID"]);
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        DropDownList2.DataSource = data;
        DropDownList2.DataBind();
        baglanti.Close();

        //baglanti.Close();
        //baglanti.Open();
        //string sorgu = "select * from kisi_telefon";
        //OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        //DataTable data = new DataTable();
        //doldur.Fill(data);
        //DropDownList2.DataSource = data;
        //DropDownList2.DataBind();
        //baglanti.Close();
    }

    public void AdresDoldur()
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from kisi_adres where KISIID=" + Convert.ToString(Session["CKisiID"]);
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        DropDownList3.DataSource = data;
        DropDownList3.DataBind();
        baglanti.Close();
        //baglanti.Close();
        //baglanti.Open();
        //string sorgu = "select * from kisi_adres";
        //OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        //DataTable data = new DataTable();
        //doldur.Fill(data);
        //DropDownList3.DataSource = data;
        //DropDownList3.DataBind();
        //baglanti.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
	    {
            DropDoldur();
            TelDoldur();
            AdresDoldur();

	    }
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from kargolar where KARGOAD=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", DropDownList1.Text);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            Label2.Text = oku[1].ToString();
        }


        string sorgu3 = "SELECT * from kisi_telefon where TELEFONID=@3";
        OleDbCommand TekTelefonBilgisi = new OleDbCommand(sorgu3, baglanti);
        TekTelefonBilgisi.Parameters.Add("@3", DropDownList2.Text);
        OleDbDataReader oku3;
        oku3 = TekTelefonBilgisi.ExecuteReader();
        while (oku3.Read())
        {
            Label9.Text = oku3[2].ToString();
        }

        string sorgu4 = "SELECT * from kisi_adres where ADRESID=@3";
        OleDbCommand TekAdresBilgisi = new OleDbCommand(sorgu4, baglanti);
        TekAdresBilgisi.Parameters.Add("@3", DropDownList3.Text);
        OleDbDataReader oku4;
        oku4 = TekAdresBilgisi.ExecuteReader();
        while (oku4.Read())
        {
            Label11.Text = oku4[2].ToString();
            Label12.Text = oku4[4].ToString();
            Label13.Text = oku4[3].ToString();
        }


        string sorgu2 = "select * from kisiler where KISIID=@1";
        OleDbCommand TekKisiBilgisi = new OleDbCommand(sorgu2, baglanti);
        TekKisiBilgisi.Parameters.Add("@1", Session["CKisiID"].ToString());
        OleDbDataReader oku2;
        oku2 = TekKisiBilgisi.ExecuteReader();
        while (oku2.Read())
        {
            Label3.Text=oku2[1].ToString();
            Label4.Text = oku2[2].ToString();
            Label5.Text = oku2[3].ToString();
            Label6.Text = oku2[5].ToString();
            Label7.Text = oku2[6].ToString();
            Label8.Text = oku2[7].ToString();
        }

        Label10.Text =Convert.ToString(Convert.ToDouble(Session["top2"]) + Convert.ToDouble(Label2.Text));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text==""||TextBox3.Text=="")
        {
            Label14.Visible = true;
        }
        else
        {
            ArrayList sepet = (ArrayList)Session["yukleme"];
            ArrayList alinacak = (ArrayList)Session["alinacak"];
            ArrayList stok = (ArrayList)Session["stok1"];
            ArrayList hareketicin = (ArrayList)Session["hareketicin"];

            for (int i = 0; i < sepet.Count; i++)
            {
                baglanti.Close();
                baglanti.Open();
                string kayit = "insert into hareket(KISIID,URUNID,MIKTAR,TARIH,KARGOAD,ADRESID,TELEFONID,UCRET) values(@1,@2,@3,@4,@5,@6,@7,@8)";
                OleDbCommand kaydet = new OleDbCommand(kayit, baglanti);
                kaydet.Parameters.Add("@1", Convert.ToDouble(Session["CKisiID"]));
                kaydet.Parameters.Add("@2", Convert.ToDouble(sepet[i].ToString()));
                kaydet.Parameters.Add("@3", Convert.ToInt32(alinacak[i].ToString()));
                kaydet.Parameters.Add("@4", Convert.ToString(DateTime.Now));
                kaydet.Parameters.Add("@5", DropDownList1.Text);
                kaydet.Parameters.Add("@6", DropDownList3.Text);
                kaydet.Parameters.Add("@7", DropDownList2.Text);
                kaydet.Parameters.Add("@8", Convert.ToString(hareketicin[i]));
                kaydet.ExecuteNonQuery();////BURADA HATA VERİYOR

                baglanti.Close();
                baglanti.Open();
                string sorgu2 = "update urunler SET STOK=@1 where URUNID=@0";
                OleDbCommand guncelle = new OleDbCommand(sorgu2, baglanti);
                guncelle.Parameters.Add("@1", Convert.ToInt32(stok[i])-Convert.ToInt32(alinacak[i]));
                guncelle.Parameters.Add("@0", Convert.ToInt32(sepet[i]));
                guncelle.ExecuteNonQuery();
                baglanti.Close();
                
            }
            Response.Redirect("Olusturma.aspx");
        
        }
    }
}