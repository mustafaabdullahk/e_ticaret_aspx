<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="SatinAl.aspx.cs" Inherits="SatinAl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            text-align: right;
        }
        .style9
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="font-family: Calibri">

    Kargo Seçin :
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataTextField="KARGOAD">
    </asp:DropDownList>
&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp; TL<br />
    <br />
    <asp:Panel ID="Panel1" runat="server">
        <table cellpadding="2" cellspacing="4">
            <tr>
                <td class="style8">
                    İsim :</td>
                <td class="style9">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    Soyad :
                </td>
                <td class="style9">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    E-Posta :</td>
                <td class="style9">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    T.C. No :</td>
                <td class="style9">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    Doğum Tarihi :</td>
                <td class="style9">
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    İndirim :
                </td>
                <td class="style9">
                    %
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    Telefon :</td>
                <td class="style9">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataTextField="TELEFONID">
                    </asp:DropDownList>
                </td>
                <td style="text-align: left">
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Adres :</td>
                <td class="style9">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataTextField="ADRESID">
                    </asp:DropDownList>
                </td>
                <td style="text-align: left">
                    <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                    <br />
                    İlçe :<asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                    <br />
                    Şehir :<asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Ödenecek Tutar :</td>
                <td class="style9">
                    <asp:Label ID="Label10" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                    &nbsp;<strong>TL</strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    Kredi Kartı Numarası :</td>
                <td class="style9">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    Son Kullanma Tarihi :</td>
                <td class="style9">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8" colspan="3">
                    <asp:Label ID="Label14" runat="server" ForeColor="Red" 
                        Text="Tüm Alanları Doldurun." Visible="False"></asp:Label>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="SATIN AL!" Width="172px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</div>
</asp:Content>

