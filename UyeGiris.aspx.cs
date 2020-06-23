using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Collections;


public partial class UyeGiris : System.Web.UI.Page
{
    OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/onlineticaret.mdb"));
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["KullaniciEposta"] = TextBox1.Text;
        Session["KullaniciSifre"] = TextBox2.Text;
        baglanti.Close();
        baglanti.Open();
        string sorgu = "select * from kisiler where EPOSTA=@1";
        OleDbCommand kontrol = new OleDbCommand(sorgu, baglanti);
        kontrol.Parameters.Add("@1", Session["KullaniciEposta"].ToString());
        OleDbDataReader oku;
        oku = kontrol.ExecuteReader();
        while (oku.Read())
        {
            Session["CtrlEposta"] = oku[3].ToString();
            Session["CtrlSifre"] = oku[4].ToString();
            Session["Indirim"] = oku[7].ToString();
            Session["CKisiID"] = oku[0].ToString();
            Session["mastericinad"] = oku[1].ToString();
            Session["mastericinsoyad"] = oku[2].ToString();
        }
        if (Session["CtrlEposta"] != null)
        {
            if ((Session["CtrlEposta"].ToString() == TextBox1.Text) && (Session["CtrlSifre"].ToString() == TextBox2.Text))
            {
                Response.Redirect("Olusturma.aspx");
            }
            else
            {
                Label1.Text = "E-Posta veya şifre hatalı";
            }
        }
        else
        {
            Label1.Text = "Böyle bir yönetici kayıtlı değil";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("YeniUye.aspx");
    }
}