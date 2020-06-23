<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="uyeleri_duzenle.aspx.cs" Inherits="uyeleri_duzenle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
            background-image: url('arkaplanlar/kisi_table/orta.png');
            background-repeat: repeat;
            text-align: right;
            font-family: Calibri;
            font-size: medium;
        }
        .style15
        {
            background-image: url('arkaplanlar/kisi_table/orta.png');
            background-repeat: repeat;
            text-align: left;
        }
        .style16
        {
            width: 100%;
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
</asp:ToolkitScriptManager>
    
    <table cellpadding="0" cellspacing="0" class="style13">
        <tr>
            <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="KISIID" CellPadding="4" ForeColor="#333333" GridLines="None" 
        onrowdeleting="GridView1_RowDeleting" AllowPaging=True
        onselectedindexchanging="GridView1_SelectedIndexChanging" 
        onpageindexchanging="GridView1_PageIndexChanging" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ButtonType="Image" HeaderText="Seç" 
            SelectImageUrl="~/resimler/sec.png" ShowSelectButton="True" />
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                 <%#Eval("KISIID") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Adı">
            <ItemTemplate>
                <%#Eval("AD") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Soyadı">
            <ItemTemplate>
                <%#Eval("SOYAD") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="E-Posta">
            <ItemTemplate>
                <%#Eval("EPOSTA") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Şifre">
            <ItemTemplate>
                <%#Eval("SIFRE") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Kimlik Numarası">
            <ItemTemplate>
                <%#Eval("TC") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Doğum Tarihi">
            <ItemTemplate>
                <%#Eval("DOGUMTARIH") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="İndirim (%)">
            <ItemTemplate>
                <%#Eval("INDIRIM") %>
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

            <td>
            
                <table width="300px" height="220px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class=kisi_table_sol_ust>
                            </td>
                        <td class=kisi_table_ust colspan="2" align=left>
                            
                            </td>
                        <td class=kisi_table_sag_ust>
                            </td>
                    </tr>
                    <tr>
                        <td class=kisi_table_sol rowspan="7">
                            </td>
                        <td class=style14 >

                            Adı :&nbsp</td>
                        <td class=style15 >

                            <asp:TextBox ID="TextBox1" runat="server" Font-Names="Calibri"></asp:TextBox>

                            </td>
                        <td class=kisi_table_sag rowspan="7">
                            </td>
                    </tr>
                    <tr>
                        <td class=style14 >

                            Soyadı:&nbsp</td>
                        <td class=style15 >

                            <asp:TextBox ID="TextBox2" runat="server" Font-Names="Calibri"></asp:TextBox>

                            </td>
                    </tr>
                    <tr>
                        <td class=style14 >

                            E-Posta :&nbsp</td>
                        <td class=style15 >

                            <asp:TextBox ID="TextBox3" runat="server" Font-Names="Calibri"></asp:TextBox>

                            </td>
                    </tr>
                    <tr>
                        <td class=style14 >

                            T.C. No :&nbsp</td>
                        <td class=style15 >

                            <asp:TextBox ID="TextBox4" runat="server" Font-Names="Calibri" MaxLength="11"></asp:TextBox>

                            </td>
                    </tr>
                    <tr>
                        <td class=style14 >

                            Doğum Tarihi:&nbsp</td>
                        <td class=style15 >

                            <asp:TextBox ID="TextBox5" runat="server" Font-Names="Calibri"></asp:TextBox>

                            </td>
                    </tr>
                    <tr>
                        <td class=style14 >

                            İndirim ( % ) :&nbsp</td>
                        <td class=style15 >

                            <asp:TextBox ID="TextBox6" runat="server" Font-Names="Calibri" MaxLength="3"></asp:TextBox>

                            </td>
                    </tr>
                    <tr>
                        <td class=style14 colspan="2" >

                            <table align="center" cellpadding="0" cellspacing="0" class="style16">
                                <tr>
                                    <td style="text-align: center">
                                        <asp:ImageButton ID="ImageButton1" runat="server"
                                            ImageUrl="~/resimler/ekle_but.png" Height="20px" Width="70px" 
                                            onclick="ImageButton1_Click" />
&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" 
                                            ImageUrl="~/resimler/guncelle_but.png" Height="20px" Width="70px" 
                                            onclick="ImageButton2_Click" />
&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" 
                                            ImageUrl="~/resimler/sil_but.png" Height="20px" Width="70px" 
                                            onclick="ImageButton3_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class=kisi_table_sol_alt>
                            </td>
                        <td class=kisi_table_alt colspan="2">
                            </td>
                        <td class=kisi_table_sag_alt>
                            </td>
                    </tr>
                </table>
            
                </td>
        </tr>
    </table>



    


    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Lütfen isim giriniz." ControlToValidate="TextBox1" 
        Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"
            runat="server" TargetControlID="RequiredFieldValidator1" PopupPosition="Left">
            </asp:ValidatorCalloutExtender>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Lütfen soyad giriniz." ControlToValidate="TextBox2" Display="None"></asp:RequiredFieldValidator>
    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
            runat="server" TargetControlID="RequiredFieldValidator2" PopupPosition="Left">
            </asp:ValidatorCalloutExtender>

    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Lütfen uygun bir e-posta adresi giriniz." 
        ControlToValidate="TextBox3" Display="None" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3"
            runat="server" TargetControlID="RegularExpressionValidator1" PopupPosition="Left">
            </asp:ValidatorCalloutExtender>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Lütfen bir e-posta adresi giriniz" ControlToValidate="TextBox3" 
        Display="None"></asp:RequiredFieldValidator>
    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4"
            runat="server" TargetControlID="RequiredFieldValidator3" PopupPosition="Left">
            </asp:ValidatorCalloutExtender>
    
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox4" FilterType="Numbers">
    </asp:FilteredTextBoxExtender>
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
        PopupPosition="Left" TargetControlID="TextBox5">
    </asp:CalendarExtender>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Lütfen doğum tarihi giriniz." Display="None" 
        ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5"
            runat="server" TargetControlID="RequiredFieldValidator4" PopupPosition="Left">
            </asp:ValidatorCalloutExtender>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
        runat="server" TargetControlID="TextBox6" FilterType="Numbers">
    </asp:FilteredTextBoxExtender>
    </asp:Content>

