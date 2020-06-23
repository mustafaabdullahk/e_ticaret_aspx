<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SILINECEK.aspx.cs" Inherits="SILINECEK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    .kisi_table_sag_ust
        {
            background-image:url(arkaplanlar/kisi_table/sag_ust.png);
            background-position:left bottom;
            background-repeat:no-repeat;
            width:20px;
            height:20px;
        }
        .kisi_table_sag_alt
        {
            background-image:url(arkaplanlar/kisi_table/sag_alt.png);
            background-position:left top;
            background-repeat:no-repeat;
            width:20px;
            height:20px;
        }
        .kisi_table_sol_alt
        {
            background-image:url(arkaplanlar/kisi_table/sol_alt.png);
            background-position:right top;
            background-repeat:no-repeat;
            width:20px;
            height:20px;
        }
        .kisi_table_sol_ust
        {
            background-image:url(arkaplanlar/kisi_table/sol_ust.png);
            background-position:right bottom;
            background-repeat:no-repeat;
            width:20px;
            height:20px;
        }
        .kisi_table_sag
        {
            background-image:url(arkaplanlar/kisi_table/sag.png);
            background-repeat:repeat-y;
            width:20px;
        }
        .kisi_table_sol
        {
            background-image:url(arkaplanlar/kisi_table/sol.png);
            background-repeat:repeat-y;
            width:20px;
        }
        .kisi_table_ust
        {
            background-image:url(arkaplanlar/kisi_table/ust.png);
            background-repeat:repeat-x;
            height:20px;
        }
        .kisi_table_alt
        {
            background-image:url(arkaplanlar/kisi_table/alt.png);
            background-repeat:repeat-x;
            height:20px;
        }
        .kisi_table_orta
        {
            background-image:url(arkaplanlar/kisi_table/orta.png);
            background-repeat:repeat;
            
        }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class=kisi_table_sol_ust>
                            </td>
                        <td class=kisi_table_ust>
                            </td>
                        <td class=kisi_table_sag_ust>
                            </td>
                    </tr>
                    <tr>
                        <td class=kisi_table_sol>
                            </td>
                        <td class=kisi_table_orta>
                            
                            </td>
                        <td class=kisi_table_sag>
                            </td>
                    </tr>
                    <tr>
                        <td class=kisi_table_sol_alt>
                            </td>
                        <td class=kisi_table_alt>
                            &nbsp;</td>
                        <td class=kisi_table_sag_alt>
                            &nbsp;</td>
                    </tr>
                </table>

        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </div>
    </form>
</body>
</html>
