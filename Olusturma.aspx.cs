using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Olusturma : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ArrayList sepet = new ArrayList();
            Session["yukleme"] = sepet;

            ArrayList resim1 = new ArrayList();
            Session["resim1"] = resim1;

            ArrayList stok1 = new ArrayList();
            Session["stok1"] = stok1;

            ArrayList alinacak = new ArrayList();
            Session["alinacak"] = alinacak;

            ArrayList fiyat1 = new ArrayList();
            Session["fiyat1"] = fiyat1;

            ArrayList toplamfiyat = new ArrayList();
            Session["toplamfiyat"] = toplamfiyat;
        }
        Response.Redirect("urunler.aspx");

    }
}