<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YeniUye.aspx.cs" Inherits="YeniUye" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 400px;
            font-family: Calibri;
        }
        .style2
        {
            text-align: right;
        }
        .style3
        {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align=center>
    
        <table cellpadding="2" cellspacing="4" class="style1" bgcolor="#FFCC99">
            <tr>
                <td class="style2" width="200px">
                    Ad :</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" width="200px">
                    Soyad :</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" width="200px">
                    E-Posta :</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" width="200px">
                    Sifre :</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" width="200px">
                    T.C. No :</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" width="200px">
                    Doğum Tarihiniz :</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" 
                        Text="Tüm Alanları Doldurunuz  " Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Kaydol" 
                        Width="83px" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
