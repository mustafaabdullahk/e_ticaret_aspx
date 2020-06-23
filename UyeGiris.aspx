<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UyeGiris.aspx.cs" Inherits="UyeGiris" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 400px;
        }
        .style2
        {
            font-family: Calibri;
        }
        .style3
        {
            text-align: right;
            width: 171px;
        }
        .style4
        {
            font-family: Calibri;
            text-align: right;
            width: 171px;
        }
        .style5
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align=center>
    
        <table cellpadding="2" cellspacing="4" class="style1" bgcolor="#CCFFCC">
            <tr>
                <td class="style4">
                    E-Posta :</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Şifre :</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" CssClass="style2" 
                        onclick="Button1_Click" Text="Giriş" />
                </td>
                <td class="style5">
                    <asp:Button ID="Button2" runat="server" Text="Yeni Üye" 
                        onclick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                        style="font-family: Calibri" Text="E-Posta veya Şifre Hatalı "></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
