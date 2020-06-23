using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class urun_duzenle : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    public void DropDoldur()
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from markalar";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        DropDownList1.DataSource = data;
        DropDownList1.DataBind();
        baglanti.Close();
    }
    public void UrunGridDoldur()
    {
        string sorgu = "SELECT urunler.URUNID, markalar.MARKA, urunler.URUNAD, urunler.BIRIMFIYAT, urunler.STOK, urunler.ANASAYFAGOSTERIM, urunler.ANASAYFASIRA, urunler.KATEGORI, urunler.KATEGORISIRA FROM markalar INNER JOIN urunler ON markalar.MARKAID = urunler.MARKAID;";
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
        UrunGridDoldur();
        if (!Page.IsPostBack)
        {
            DropDoldur();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        UrunGridDoldur();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
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
            TextBox1.Text = oku[2].ToString();
            TextBox2.Text = oku[3].ToString();
            Session["_markaId"] = oku[1].ToString();
            if (oku[7].ToString() == "E")
            {
                CheckBox1.Checked = true;
            }
            else
            {
                CheckBox1.Checked = false;
            }
            TextBox4.Text = oku[6].ToString();
            TextBox5.Text = oku[9].ToString();
            TextBox3.Text = oku[5].ToString();
            Image1.ImageUrl = "~/urun_resim/" + oku[4].ToString();
            Session["guncellemeicin"] = oku[4].ToString();//guncellerken resim kontrolu için aldım
            if (Convert.ToString(oku[8]) == "BBB")
            {
                RadioButton1.Checked = true;
            }
            if (Convert.ToString(oku[8]) == "BNB")
            {
                RadioButton2.Checked = true;
            }
            if (Convert.ToString(oku[8]) == "BGB")
            {
                RadioButton3.Checked = true;
            }
            if (Convert.ToString(oku[8]) == "EBB")
            {
                RadioButton4.Checked = true;
            }
            if (Convert.ToString(oku[8]) == "ENB")
            {
                RadioButton5.Checked = true;
            }
            if (Convert.ToString(oku[8]) == "EGB")
            {
                RadioButton6.Checked = true;
            }
            TextBox6.Text=oku[10].ToString();
        }

        ImageButton3.Enabled = true;
        ImageButton2.Enabled = true;
        Panel1.Visible = true;
        OleDbCommand drop = new OleDbCommand("select * from markalar where MARKAID=@1", baglanti);
        drop.Parameters.Add("@1", Session["_markaId"]);
        OleDbDataReader oku1;
        oku1 = drop.ExecuteReader();
        while (oku1.Read())
        {
            DropDownList1.Text = oku1[1].ToString();
        }

        baglanti.Close();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "delete from urunler where URUNID=@1";
        OleDbCommand Sil = new OleDbCommand(sorgu, baglanti);
        Sil.Parameters.Add("@1", Session["SecilenKayit"]);
        Sil.ExecuteNonQuery();
        baglanti.Close();
        UrunGridDoldur();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from markalar where MARKA=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", DropDownList1.SelectedValue);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            Session["markaekleme"] = oku[0].ToString();
        }
        //markanın ıdsini aldık.

        string sorgu2 = "insert into urunler(MARKAID,URUNAD,BIRIMFIYAT,ACIKLAMA,ANASAYFASIRA,ANASAYFAGOSTERIM,KATEGORI,KATEGORISIRA,RESIM,STOK) values(@1,@2,@3,@4,@5,@6,@7,@8,@9,@10)";
        OleDbCommand kaydet = new OleDbCommand(sorgu2, baglanti);
        kaydet.Parameters.Add("@1", Convert.ToInt32(Session["markaekleme"]));
        kaydet.Parameters.Add("@2", TextBox1.Text);
        kaydet.Parameters.Add("@3", TextBox2.Text);
        kaydet.Parameters.Add("@4", TextBox3.Text);
        kaydet.Parameters.Add("@5", Convert.ToInt32(TextBox4.Text));
        
        if (CheckBox1.Checked)
        {
            kaydet.Parameters.Add("@6", "E");
        }
        else
        {
            kaydet.Parameters.Add("@6", "H");
        }

        string kategori = "BBB";
        {//burda kategori adı belirleniyor
            if (RadioButton1.Checked)
            {
                kategori = "BBB";
            }
            if (RadioButton2.Checked)
            {
                kategori = "BNB";
            }
            if (RadioButton3.Checked)
            {
                kategori = "BGB";
            }
            if (RadioButton4.Checked)
            {
                kategori = "EBB";
            }
            if (RadioButton5.Checked)
            {
                kategori = "ENB";
            }
            if (RadioButton6.Checked)
            {
                kategori = "EGB";
            }
        }
        kaydet.Parameters.Add("@7", kategori);
        kaydet.Parameters.Add("@8", Convert.ToInt32(TextBox5.Text));
        if (FileUpload1.FileName == "")
        {
            kaydet.Parameters.Add("@9", "nopic.png");
        }
        else
        {
            kaydet.Parameters.Add("@9", FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("urun_resim/") + FileUpload1.FileName);
        }
        kaydet.Parameters.Add("@10", Convert.ToInt32(TextBox6.Text));

        kaydet.ExecuteNonQuery();



        baglanti.Close();
        UrunGridDoldur();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from markalar where MARKA=@1";
        OleDbCommand TekKayitBilgisi = new OleDbCommand(sorgu, baglanti);
        TekKayitBilgisi.Parameters.Add("@1", DropDownList1.SelectedValue);
        OleDbDataReader oku;
        oku = TekKayitBilgisi.ExecuteReader();
        while (oku.Read())
        {
            Session["markaguncelleme"] = oku[0].ToString();
        }
        string sorgu2 = "update urunler SET MARKAID=@1,URUNAD=@2, BIRIMFIYAT=@3, RESIM=@4, ACIKLAMA=@5, ANASAYFASIRA=@6, ANASAYFAGOSTERIM=@7, KATEGORI=@8, KATEGORISIRA=@9, STOK=@10 where URUNID=@0";
        OleDbCommand guncelle = new OleDbCommand(sorgu2, baglanti);

        guncelle.Parameters.Add("@1", Session["markaguncelleme"]);
        guncelle.Parameters.Add("@2", TextBox1.Text);
        guncelle.Parameters.Add("@3", TextBox2.Text);
        if (FileUpload1.FileName == "")
        {
            guncelle.Parameters.Add("@4", Session["guncellemeicin"]);
        }
        else
        {
            FileUpload1.SaveAs(Server.MapPath("urun_resim/") + FileUpload1.FileName);
            guncelle.Parameters.Add("@4", FileUpload1.FileName);
            Image1.ImageUrl = "urun_resim/" + FileUpload1.FileName;
        }
        guncelle.Parameters.Add("@5", TextBox3.Text);
        guncelle.Parameters.Add("@6", Convert.ToInt32(TextBox4.Text));
        string gosterim = "H";
        if (CheckBox1.Checked)
        {
            gosterim = "E";
            guncelle.Parameters.Add("@7", gosterim);
        }
        else
        {
            gosterim = "H";
            guncelle.Parameters.Add("@7", gosterim);
        }
        //kategori için
        string kategori = "BBB";
        {
            if (RadioButton1.Checked)
            {
                kategori = "BBB";
            }
            if (RadioButton2.Checked)
            {
                kategori = "BNB";
            }
            if (RadioButton3.Checked)
            {
                kategori = "BGB";
            }
            if (RadioButton4.Checked)
            {
                kategori = "EBB";
            }
            if (RadioButton5.Checked)
            {
                kategori = "ENB";
            }
            if (RadioButton6.Checked)
            {
                kategori = "EGB";
            }
            guncelle.Parameters.Add("@8", kategori);
            guncelle.Parameters.Add("@9", Convert.ToInt32(TextBox5.Text));
            guncelle.Parameters.Add("@10",Convert.ToInt32(TextBox6.Text));
            guncelle.Parameters.Add("@0", Convert.ToInt32(Session["SecilenKayit"]));
            guncelle.ExecuteNonQuery();
            baglanti.Close();
            UrunGridDoldur();
        }
    }
}