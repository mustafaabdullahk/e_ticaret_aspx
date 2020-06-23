<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="SeciliUrun.aspx.cs" Inherits="SeciliUrun" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="font-family: Calibri">
        <tr>
            <td class="style8">
                Ürün ID :</td>
            <td class="style9">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style8">
                Markası : </td>
            <td class="style9">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="MARKA" 
                    Visible="False">
                </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td class="style8">
                Ürün Adı :</td>
            <td class="style9">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Fiyatı :</td>
            <td class="style9">
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Adedi :</td>
            <td class="style9">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Ürün Açıklaması :</td>
            <td class="style9">
                <asp:TextBox ID="TextBox1" runat="server" Height="130px" ReadOnly="True" 
                    TextMode="MultiLine" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Ürün Resmi :</td>
            <td class="style9">
                <asp:Image ID="Image1" runat="server" Height="400px" Width="280px" />
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="2" align="center">
                &nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#CC0000" 
                    Text="Ürün sayısı giriniz. Stoktan fazla giremezsiniz." Visible="False"></asp:Label>
                <asp:TextBox ID="TextMik" runat="server" Width="34px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="TextMik_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" TargetControlID="TextMik" 
                    FilterType="Numbers">
                </asp:FilteredTextBoxExtender>
&nbsp;tane
                <asp:Button ID="Button1" runat="server" Text="Sepete Ekle" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="2" align="center">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

