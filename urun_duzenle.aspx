<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="urun_duzenle.aspx.cs" Inherits="urun_duzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 100%;
        }
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
        .style14
        {
            font-family: Calibri;
            text-align: center;
        }
        .style15
        {
            text-align: left;
        }
        .style16
        {
            font-family: Calibri;
            text-align: right;
        }
        .style17
        {
            font-family: Calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align=center cellpadding="0" cellspacing="0" class="style13">
        <tr>
            <td align=center>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    onpageindexchanging="GridView1_PageIndexChanging" DataKeyNames="URUNID" 
                    onselectedindexchanging="GridView1_SelectedIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Seç" 
                            SelectImageUrl="~/resimler/sec.png" ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <%#Eval("URUNID") %>
                                
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Markası">
                            <ItemTemplate>
                                <%#Eval("MARKA") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Adı">
                            <ItemTemplate>
                                <%#Eval("URUNAD") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Fiyatı">
                            <ItemTemplate>
                                                                <asp:Button ID="Button1" runat="server" Text="Button" />

                                <%#Eval("BIRIMFIYAT") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Stok">
                            <ItemTemplate>
                               <%#Eval("STOK")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Anasayfa Gosterim">
                            <ItemTemplate>
                                <%#Eval("ANASAYFAGOSTERIM") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Anasayfa Sıra">
                            <ItemTemplate>
                                <%#Eval("ANASAYFASIRA") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kategorisi">
                            <ItemTemplate>
                                <%#Eval("KATEGORI") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kategori Sıra">
                            <ItemTemplate>
                                <%#Eval("KATEGORISIRA") %>
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
        </tr>
        <tr>
            <td align=center>
                <br />
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table align=center cellpadding="0" cellspacing="0">
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
                            <table align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="style16">
                                        Markası :
                                    </td>
                                    <td class="style15">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="MARKA" 
                                            DataValueField="MARKA">
                                        </asp:DropDownList>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Ürün Adı :
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Fiyatı :
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        <span class="style17">TL</span></td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Stok :</td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Anasayfada Gösterim :
                                    </td>
                                    <td class="style15">
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Anasayfadaki Sırası :
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Kategorisi :</td>
                                    <td class="style15">
                                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="ktgr" 
                                            Text="Bayan Büyük Beden" />
                                        <br />
                                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="ktgr" 
                                            Text="Bayan Normal Beden" />
                                        <br />
                                        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="ktgr" 
                                            Text="Bayan Genç Beden" />
                                        <br />
                                        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="ktgr" 
                                            Text="Erkek Büyük Beden" />
                                        <br />
                                        <asp:RadioButton ID="RadioButton5" runat="server" GroupName="ktgr" 
                                            Text="Erkek Normal Beden" />
                                        <br />
                                        <asp:RadioButton ID="RadioButton6" runat="server" GroupName="ktgr" 
                                            Text="Erkek Genç Beden" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Kategorideki Sırası :
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        Ürün Açıklaması :
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Height="132px" 
                                            Width="202px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14" colspan="2">
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                                            ImageUrl="~/resimler/ekle_but.png" Width="70px" 
                                            onclick="ImageButton1_Click" />
&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" Enabled="False" Height="20px" 
                                            ImageUrl="~/resimler/guncelle_but.png" Width="70px" 
                                            onclick="ImageButton2_Click" />
&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" Enabled="False" Height="20px" 
                                            ImageUrl="~/resimler/sil_but.png" Width="70px" 
                                            onclick="ImageButton3_Click" />
                                    </td>
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
                </table>
                <br />
                <br />
                <table align=center cellpadding="0" cellspacing="0">
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
                            
                            <table cellpadding="2" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        &nbsp;<asp:Image ID="Image1" runat="server" />

                                    </td>
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
                </table>
                </asp:Panel>
        </tr>
    </table>
</asp:Content>

