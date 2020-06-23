<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="sepet.aspx.cs" Inherits="sepet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            font-family: Calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:GridView ID="gvarray" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Urun ID" HeaderText="Urun ID" />
            <asp:ImageField DataImageUrlField="Resmi" 
                DataImageUrlFormatString="~/urun_resim/{4}" HeaderText="Resmi">
            </asp:ImageField>
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
    <div align =center>
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="UrunId" HeaderText="Urun ID" />
            <asp:ImageField DataImageUrlField="Resim" HeaderText="Resim">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="Stok" HeaderText="Stok" />
            <asp:BoundField DataField="Miktar" HeaderText="Alacağınız Miktar" />
            <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" />
            <asp:BoundField DataField="Toplam" HeaderText="Toplamı" />
            <asp:BoundField DataField="Indirim" HeaderText="İndirimli" />
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
        <span class="style8">TOPLAM = </span><strong>
        <asp:Label ID="Label2" runat="server" CssClass="style8" Text="Label"></asp:Label>
        </strong><span class="style8"><strong>&nbsp;TL</strong></span><br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Satın Al" 
            Width="162px" />
    </div>
    


</asp:Content>

