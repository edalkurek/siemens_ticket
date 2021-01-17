<%@ Page Language="C#" AutoEventWireup="true" CodeFile="randevuolustur.aspx.cs" Inherits="randevuolustur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Randevu</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
</head>
<body>
     <form id="form1" runat="server">
    <div class="container">
        <div class="header">
            <div class="logo"><a href="index.aspx"><img src="img/siemens.png"></a>
                <h2>Randevu Oluştur</h2>
            </div>
        </div>
        <div class="cont">
            <div class="contic">
                <h3>Windows 10'a Geçiş</h3>
                <table>
                  
                    <tr>
                        <td>*Ad Soyad :</td>
                        <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>*Mail Adresi :</td>
                        <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>*Telefon Numarası :</td>
                        <td><asp:TextBox ID="TextBox3" runat="server"   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type = "number" maxlength = "11"></asp:TextBox><img src="img/bilgi.svg" title="Örnek format: 05323334455" /></td>
                    </tr>
                    <tr>
                        <td>*Seri Numarası :</td>
                        <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><img src="img/bilgi.svg" title="Bilgisayarınızın altında yazan Seri Numarası" />
                        </td>
                    </tr>
                    <tr>
                        <td>*Lokasyon :</td>
                        <td>
                                                   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
                            <asp:DropDownList UseSubmitBehavior="False" ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                <asp:ListItem>Seçiniz</asp:ListItem>
                                <asp:ListItem>Kartal</asp:ListItem>
                                <asp:ListItem>Gebze</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
    
                               <div id="cal1" runat="server">
            <asp:Calendar style="display:;" UseSubmitBehavior="False" ID="kartal" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="6pt" ForeColor="#003399" Height="50px" Width="400px" OnDayRender="kartal_DayRender" OnVisibleMonthChanged="theVisibleMonthChangedKartal">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <DayStyle BackColor="#5ABD37" />
                <NextPrevStyle Font-Size="6pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="8pt" ForeColor="#CCCCFF" Height="15px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle  BackColor="#CCCCFF" />
                            </asp:Calendar>
                          </div>

                             <div id="cal2" runat="server">
            <asp:Calendar style="display:;"  UseSubmitBehavior="False" ID="gebze" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="6pt" ForeColor="#003399" Height="50px" Width="400px" OnDayRender="gebze_DayRender" OnVisibleMonthChanged="theVisibleMonthChangedGebze">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <DayStyle BackColor="#5ABD37" />
                <NextPrevStyle Font-Size="6pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="8pt" ForeColor="#CCCCFF" Height="15px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle  BackColor="#CCCCFF" />
                            </asp:Calendar>
                                  </div>
              
       </ContentTemplate>
</asp:UpdatePanel>
        </td>
                    </tr>
                </table>
               <img class="lejand"  src="img/lejand.PNG" />
                <br />
               <br>
                <asp:Button  ID ="btnolustur" class="btncl" runat="server" Text="Gönder" OnClick="btnolustur_Click" UseSubmitBehavior="False" /> &nbsp;&nbsp;&nbsp;<br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Yıldızlı Alanlar Boş Bırakılamaz" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Yıldızlı Alanlar Boş Bırakılamaz" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Yıldızlı Alanlar Boş Bırakılamaz" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Yıldızlı Alanlar Boş Bırakılamaz" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Yıldızlı Alanlar Boş Bırakılamaz" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="footer">Siemens 2019 </div>
</body>
     </form>
   </html>
