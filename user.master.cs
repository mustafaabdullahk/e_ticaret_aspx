using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class user : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["CtrlEposta"] == null) || (Session["CtrlSifre"] == null))
        {
            Response.Redirect("UyeGiris.aspx");
        }
        Session.Timeout = 10;

        ArrayList sayim = (ArrayList)Session["yukleme"];
        Label1.Text = Convert.ToString(sayim.Count);
        Label2.Text = Convert.ToString(Session["mastericinad"]) + " " + Convert.ToString(Session["mastericinsoyad"]);
    }
}
