using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Collections;
using System.Collections.Generic;


public partial class SeciliUrun : System.Web.UI.Page
{
    public bool kontrol;
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    protected void Page_Load(object sender, EventArgs e)
    {
        Label6.Visible = false;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from markalar";
        OleDbDataAdapter doldur = new OleDbDataAdapter(sorgu, baglanti);
        DataTable data = new DataTable();
        doldur.Fill(data);
        DropDownList1.DataSource = data;
        DropDownList1.DataBind();

        OleDbCommand drop = new OleDbCommand("select * from markalar where MARKAID=@1", baglanti);
        drop.Parameters.Add("@1", Session["MarkaId"]);
        OleDbDataReader oku1;
        oku1 = drop.ExecuteReader();
        while (oku1.Read())
        {
            DropDownList1.Text = oku1[1].ToString();
        }

        baglanti.Close();

        Label1.Text=Session["UrunId"].ToString();
        Label2.Text = DropDownList1.Text;
        Label3.Text=Session["UrunAd"].ToString();
        Label4.Text = Session["Fiyat"].ToString();
        Label5.Text = Session["Adet"].ToString();
        TextBox1.Text=Session["Aciklama"].ToString();
        Image1.ImageUrl="urun_resim/"+Session["Resim"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        ArrayList stok1 = (ArrayList)Session["stok1"];
        ArrayList resim1 = (ArrayList)Session["resim1"];
        ArrayList sepet = (ArrayList)Session["yukleme"];
        ArrayList alinacak = (ArrayList)Session["alinacak"];
        ArrayList fiyat1 = (ArrayList)Session["fiyat1"];

        if (TextMik.Text=="0"||TextMik.Text==""||Convert.ToInt32(TextMik.Text)>Convert.ToInt32(Session["Adet"]))
        {
            Label6.Visible = true;
        }
        else
	    {
            kontrol = false;
            if (sepet.Count == 0)
            {
                sepet.Add(Session["UrunId"].ToString());
                resim1.Add(Session["Resim"].ToString());
                stok1.Add(Session["Adet"].ToString());
                alinacak.Add(TextMik.Text);
                fiyat1.Add(Session["Fiyat"].ToString());
            }
            else
            {
                for (int i = 0; i < sepet.Count; i++)
                {
                    if (sepet[i].ToString() == Session["UrunId"].ToString())
                    {
                        kontrol = true;
                        i = sepet.Count;
                    }
                }
                if (kontrol == false)
                {
                    sepet.Add(Session["UrunId"].ToString());
                    resim1.Add(Session["Resim"].ToString());
                    stok1.Add(Session["Adet"].ToString());
                    alinacak.Add(TextMik.Text);
                    fiyat1.Add(Session["Fiyat"].ToString());
                }

            }
            Session["yukleme"] = sepet;
            Session["resim1"] = resim1;
            Session["stok1"] = stok1;
            Session["alinacak"] = alinacak;
            Session["fiyat1"] = fiyat1;
            Response.Redirect("SeciliUrun.aspx");
                
	    }
        
    }
}