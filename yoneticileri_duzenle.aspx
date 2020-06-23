<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="yoneticileri_duzenle.aspx.cs" Inherits="yoneticileri_duzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .style13
        {
            text-align: center;
            font-family: Calibri;
        }
    .style14
    {
        text-align: left;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    DataKeyNames="YONETICIID" 
                    onselectedindexchanging="GridView1_SelectedIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Seç" 
                            SelectImageUrl="~/resimler/sec.png" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Yönetici ID">
                            <ItemTemplate>
                                <%#Eval("YONETICIID") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Yönetici E-Posta">
                            <ItemTemplate>
                                <%#Eval("EPOSTA") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Şifresi">
                            <ItemTemplate>
                                <%#Eval("SIFRE") %>
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
            </td>
            <td>&nbsp; &nbsp; &nbsp;</td>
            <td>
                
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
                            
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style14">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        E-Posta : </td>
                                    <td class="style14">
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style14">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        Şifresi : </td>
                                    <td class="style14">
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;</td>
                                    <td class="style14">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style13" colspan="2">
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                                            ImageUrl="~/resimler/ekle_but.png" Width="70px" 
                                            onclick="ImageButton1_Click" />
&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" 
                                            ImageUrl="~/resimler/guncelle_but.png" Width="70px" 
                                            onclick="ImageButton2_Click" />
&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" 
                                            ImageUrl="~/resimler/sil_but.png" Width="70px" 
                                            onclick="ImageButton3_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13" colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            
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
                            </td>
                    </tr>
                </table></td>
        </tr>
    </table>
</asp:Content>

