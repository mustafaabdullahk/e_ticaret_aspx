using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Design;
using System.Collections;
using System.Data;
using System.Data.OleDb;

public partial class sepet : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindGridview();
            //GridResYukle();
            GridView1.DataSource = GetData();
            GridView1.DataBind();
            ArrayList toplamfiyat = (ArrayList)Session["toplamfiyat"];
            Session["Top"] = 0;
            for (int i = 0; i < toplamfiyat.Count; i++)
            {
                Session["Top"] = Convert.ToDouble(Session["Top"]) + Convert.ToDouble(toplamfiyat[i]);
            }
            Label2.Text = Convert.ToString(Session["Top"]);
            
            for (int i = 0; i < toplamfiyat.Count; i++)
            {
                toplamfiyat[i]=0;
            }
        }
        Session["top2"] = Label2.Text;
    }
   public DataTable GetData()
    {
        ArrayList sepet = (ArrayList)Session["yukleme"];
        ArrayList resim = (ArrayList)Session["resim1"];
        ArrayList stok = (ArrayList)Session["stok1"];
        ArrayList alinacak=(ArrayList)Session["alinacak"];
        ArrayList fiyat1 = (ArrayList)Session["fiyat1"];
        ArrayList toplamfiyat = (ArrayList)Session["toplamfiyat"];

        DataTable dt = new DataTable();

        dt.Columns.Add(new DataColumn("UrunId", typeof(string)));
        dt.Columns.Add(new DataColumn("Resim", typeof(string)));
        dt.Columns.Add(new DataColumn("Stok", typeof(string)));
        dt.Columns.Add(new DataColumn("Miktar", typeof(string)));
        dt.Columns.Add(new DataColumn("Fiyat", typeof(string)));
        dt.Columns.Add(new DataColumn("Toplam", typeof(string)));
        dt.Columns.Add(new DataColumn("Indirim", typeof(string)));

        ArrayList hareketicin = new ArrayList();
        Session["toplamfiyat"] = 0;
        for (int i = 0; i < sepet.Count; i++)
        {
            DataRow dr = dt.NewRow();
            dr["UrunId"] = Convert.ToString(sepet[i]);
            dr["Resim"] = ResolveUrl("~/urun_resim/" + resim[i].ToString());
            dr["Stok"] = Convert.ToString(stok[i]);
            dr["Miktar"] = alinacak[i];
            dr["Fiyat"] = fiyat1[i]+" TL";
            dr["Toplam"] = Convert.ToString(Convert.ToInt32(fiyat1[i]) * Convert.ToInt32(alinacak[i]))+" TL";
            double asd = Convert.ToDouble(Convert.ToInt32(fiyat1[i]) * Convert.ToInt32(alinacak[i]));
            dr["Indirim"] = (asd-(asd*Convert.ToDouble(Session["Indirim"]))/100)+" TL";
            double asdf=(asd-(asd*Convert.ToDouble(Session["Indirim"]))/100);
            hareketicin.Add((asd - (asd * Convert.ToDouble(Session["Indirim"])) / 100));
            dt.Rows.Add(dr);
            toplamfiyat.Add(asdf);
            
        }
        Session["hareketicin"] = hareketicin;
        Session["toplamfiyat"] = toplamfiyat;
        return dt;
        // This method creates a DataTable with four rows.  Each row has the
        // following schema:
        //   PictureID      int
        //   PictureURL     string
        //   Title          string
        //   DateAdded      datetime
        //DataTable dt = new DataTable();
        // define the table's schema
        //dt.Columns.Add(new DataColumn("UrunId", typeof(string)));
        //dt.Columns.Add(new DataColumn("Resim", typeof(string)));
        //dt.Columns.Add(new DataColumn("Title", typeof(string)));
        //dt.Columns.Add(new DataColumn("DateAdded", typeof(DateTime)));
        // Create the four records
        //DataRow dr = dt.NewRow();
        //dr["UrunId"] = 1;
        //dr["Resim"] = ResolveUrl("~/urun_resim/" + resim[0].ToString());
        //dr["Title"] = "Blue Hills";
        //dr["DateAdded"] = new DateTime(2005, 1, 15);
        //dt.Rows.Add(dr);
        //dr = dt.NewRow();
        //dr["PictureID"] = 2;
        //dr["PictureURL"] = ResolveUrl("~/DisplayingImages/Images/Sunset.jpg");
        //dr["Title"] = "Sunset";
        //dr["DateAdded"] = new DateTime(2005, 1, 21);
        //dt.Rows.Add(dr);
        //dr = dt.NewRow();
        //dr["PictureID"] = 3;
        //dr["PictureURL"] =
        //  ResolveUrl("~/DisplayingImages/Images/Water lilies.jpg");
        //dr["Title"] = "Water Lilies";
        //dr["DateAdded"] = new DateTime(2005, 2, 1);
        //dt.Rows.Add(dr);
        //dr = dt.NewRow();
        //dr["PictureID"] = 4;
        //dr["PictureURL"] = ResolveUrl("~/DisplayingImages/Images/Winter.jpg");
        //dr["Title"] = "Winter";
        //dr["DateAdded"] = new DateTime(2005, 2, 18);
        //dt.Rows.Add(dr);
        //return dt;
    }

    //private void BindGridview()
    //{
    //    ArrayList sepet = (ArrayList)Session["yukleme"];
    //    ArrayList resim = (ArrayList)Session["resim1"];
    //    ArrayList stok = (ArrayList)Session["stok1"];
    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("Urun ID");
    //    dt.Columns.Add("Resmi");
    //    for (int i = 0; i < sepet.Count; i++)
    //    {
    //        dt.Rows.Add();
    //        dt.Rows[i]["Urun ID"] = sepet[i].ToString();
    //        dt.Rows[i]["Resmi"] ="~/urun_resim/"+resim[i].ToString();
    //    }
        
    //    gvarray.DataSource = dt;
    //    gvarray.DataBind();
        
    //}
    //public void GridResYukle()
    //{
    //    baglanti.Close();
    //    baglanti.Open();
    //    OleDbDataAdapter goster = new OleDbDataAdapter("select * from urunler", baglanti);
    //    DataTable dt = new DataTable();
    //    goster.Fill(dt);
    //    gvarray.DataSource = dt;
    //    gvarray.DataBind();
    //    baglanti.Close();
    //}
   protected void Button1_Click(object sender, EventArgs e)
   {
       Response.Redirect("SatinAl.aspx");
   }
}