<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admingiris.aspx.cs" Inherits="admingiris" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 100%;
            height: 20px;
            background-color:Gray;
            
        }
        body
        {
            margin:0px 0px 0px 0px;
            padding:0px 0px 0px 0px;
        }
        .style2
        {
            width: 456px;
            height: 323px;
        }
        .giris
        {
            background-image:url(admin_giris_resimler/giris.png);
            background-repeat:no-repeat;
            width:135px;
            height:43px;
        }
        .giris_alt
        {
            background-image:url(admin_giris_resimler/giris_alt.png);
            background-repeat:no-repeat;
            width:135px;
            height:18px;
        }
        .giris_sag
        {
            background-image:url(admin_giris_resimler/giris_sag.png);
            background-repeat:no-repeat;
            width:143px;
            height:61px;
        }
        .giris_sol
        {
            background-image:url(admin_giris_resimler/giris_sol.png);
            background-repeat:no-repeat;
            width:41px;
            height:61px;
        }
        .orta1
        {
            background-image:url(admin_giris_resimler/orta1.png);
            background-repeat:no-repeat;
            width:319px;
            height:134px;
        }
        .orta2
        {
            background-image:url(admin_giris_resimler/orta2.png);
            background-repeat:no-repeat;
            width:319px;
            height:44px;
        }
        .orta3
        {
            background-image:url(admin_giris_resimler/orta3.png);
            background-repeat:no-repeat;
            width:319px;
            height:21px;
        }
        .orta4
        {
            background-image:url(admin_giris_resimler/orta4.png);
            background-repeat:no-repeat;
            width:319px;
            height:44px;
        }
        .orta5
        {
            background-image:url(admin_giris_resimler/orta5.png);
            background-repeat:no-repeat;
            width:319px;
            height:19px;
        }
        .sag
        {
            background-image:url(admin_giris_resimler/sag.png);
            background-repeat:no-repeat;
            width:17px;
            height:323px;
        }
        .sol
        {
            background-image:url(admin_giris_resimler/sol.png);
            background-repeat:no-repeat;
            width:120px;
            height:323px;
        }
        .arkaplan
        {
            background-repeat:repeat-x;
            background-image:url("arkaplanlar/admin_bg.jpg");
            background-position:left bottom;
            background-attachment:fixed;
            background-color:#CFCFCF;
        }
        .hata
        {
            background-image:url("admin_giris_resimler/hata.png");
            background-position:center top;
            background-repeat:no-repeat;
            width:241px;
            height:47px;
        }
    </style>
</head>
<body class="arkaplan" >
    <form id="form1" runat="server" >
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager> <%--AJAX'ta bu eklenmek zorunda--%>
    <div>

    
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div align="center" >

    <br />
    <br />
    <br />
    <br />
    <br />
        <table cellpadding="0" cellspacing="0" class="style2">
            <tr>
                <td rowspan="7" class="sol">
                    &nbsp;</td>
                <td colspan="3" class="orta1">
                    &nbsp;</td>
                <td rowspan="7" class="sag">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center" valign="middle" class="orta2">
                    <asp:TextBox ID="TextBox1" runat="server" BackColor="#EEEEEE" 
                        BorderStyle="None" Font-Bold="True" Font-Names="Calibri" Font-Size="Large" 
                        ForeColor="#4F4F4F" Width="280px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Uygun bir e-posta adresi giriniz" Display="None" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" 
                        TargetControlID="RegularExpressionValidator1" PopupPosition="Right">
                    </asp:ValidatorCalloutExtender>

                </td>
            </tr>
            <tr>
                <td colspan="3" class="orta3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center" valign="middle" class="orta4">
                    <asp:TextBox ID="TextBox2" runat="server" BackColor="#EEEEEE" 
                        BorderStyle="None" Font-Bold="True" Font-Names="Calibri" Font-Size="Large" 
                        ForeColor="#4F4F4F" TextMode="Password" Width="280px"></asp:TextBox>
                        
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        Display="None" ErrorMessage="Parolanızı giriniz" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" 
                        TargetControlID="RequiredFieldValidator2" PopupPosition="Right">
                    </asp:ValidatorCalloutExtender>
                      
                </td>
            </tr>
            <tr>
                <td colspan="3" class="orta5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td rowspan="2" class="giris_sol">
                    &nbsp;</td>
                <td class="giris">
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/admin_giris_resimler/giris.png" onclick="ImageButton1_Click" />
                </td>
                <td rowspan="2" class="giris_sag">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="giris_alt">
                    </td>
            </tr>
            <tr>
            <td colspan="5">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table cellpadding=0 cellspacing=0 align=center valign=top class="hata">
                <tr>
                <td>

                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Calibri" 
                        Font-Size="Large" ForeColor="White"></asp:Label>

                </td>
                </tr>
                </table>
                </asp:Panel>
            </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

