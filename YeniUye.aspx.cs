using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class YeniUye : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text==""||TextBox2.Text==""||TextBox3.Text==""||TextBox4.Text==""||TextBox5.Text==""||TextBox6.Text=="")
        {
            Label1.Visible=true;
        }
        else
	    {
            baglanti.Close();
            baglanti.Open();
            string sorgu = "insert into kisiler(AD,SOYAD,EPOSTA,SIFRE,TC,DOGUMTARIH,INDIRIM) values(@1,@2,@3,@4,@5,@6,@7)";
            OleDbCommand kaydet = new OleDbCommand(sorgu, baglanti);
            int a = 0;
            kaydet.Parameters.Add("@1", TextBox1.Text);
            kaydet.Parameters.Add("@2", TextBox2.Text);
            kaydet.Parameters.Add("@3", TextBox3.Text);
            kaydet.Parameters.Add("@4", TextBox4.Text);
            kaydet.Parameters.Add("@5", TextBox5.Text);
            kaydet.Parameters.Add("@6", TextBox6.Text);
            kaydet.Parameters.Add("@7", Convert.ToInt32(a));
            kaydet.ExecuteNonQuery();
	    }
        Response.Redirect("UyeGiris.aspx");
    }
}