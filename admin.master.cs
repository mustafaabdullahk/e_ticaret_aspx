using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["kontrol_eposta"] == null) || (Session["kontrol_sifre"] == null))
        {
            Response.Redirect("admingiris.aspx");
        }
        Session.Timeout = 10;
        Page.Culture = "Auto";
        Page.UICulture = "Auto";
    }
}
