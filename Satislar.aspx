<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Satislar.aspx.cs" Inherits="Satislar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 500px;
        font-family: Calibri;
    }
    .style14
    {
        text-align: right;
        width: 200px;
    }
    .style15
    {
        text-align: left;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        DataKeyNames="HAREKETID" 
        onselectedindexchanging="GridView1_SelectedIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Image" HeaderText="Seç" 
                SelectImageUrl="~/resimler/sec.png" ShowSelectButton="True" />
            <asp:TemplateField HeaderText="Satış ID">
                <ItemTemplate>
                    <%#Eval("HAREKETID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ürün ID">
                <ItemTemplate>
                    <%#Eval("URUNID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kişi">
                <ItemTemplate>
                    <%#Eval("AD")%>&nbsp;<%#Eval("SOYAD")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Miktar">
                <ItemTemplate>
                    <%#Eval("MIKTAR") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tarih">
                <ItemTemplate>
                    <%#Eval("TARIH") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kargosu">
                <ItemTemplate>
                    <%#Eval("KARGOAD") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ücret">
                <ItemTemplate>
                    <%#Eval("UCRET") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <table bgcolor="#FFFF99" cellpadding="2" cellspacing="4" class="style13">
        <tr>
            <td colspan="2">
                Adres Bilgileri</td>
        </tr>
        <tr>
            <td class="style14">
                Adres :</td>
            <td class="style15">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style14">
                İlçe :</td>
            <td class="style15">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style14">
                İl :</td>
            <td class="style15">
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Telefon :</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

