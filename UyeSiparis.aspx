<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="UyeSiparis.aspx.cs" Inherits="UyeSiparis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="URUNID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Ürün ID">
                <ItemTemplate>
                    <%#Eval("URUNID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Resmi">
                <ItemTemplate>
                    <img alt="" src="urun_resim/<%#Eval("RESIM") %>" style="height: 100px; width: 75px" />
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
            <asp:TemplateField HeaderText="Kargo">
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
</asp:Content>

