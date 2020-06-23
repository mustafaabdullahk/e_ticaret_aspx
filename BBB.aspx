<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="BBB.aspx.cs" Inherits="BBB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Button ID="Button1" runat="server" Text="Seçili Ürüne Git " 
        onclick="Button1_Click" Width="201px" Enabled="False" />
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanging="GridView1_SelectedIndexChanging" 
        DataKeyNames="URUNID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Image" HeaderText="Seç" 
                SelectImageUrl="~/resimler/sec.png" ShowSelectButton="True" />
            <asp:TemplateField HeaderText="Ürün ID">
                <ItemTemplate>
                    <%#Eval("URUNID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Resmi">
                <ItemTemplate>
                    <img alt="" src="urun_resim/<%#Eval("RESIM") %>" style="width: 90px; height: 110px" /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Markası">
                <ItemTemplate>
                    <%#Eval("MARKA") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ürün Adı">
                <ItemTemplate>
                    <%#Eval("URUNAD") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fiyatı">
                <ItemTemplate>
                    <%#Eval("BIRIMFIYAT") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Adedi">
                <ItemTemplate>
                    <%#Eval("STOK") %>
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
</asp:Content>

