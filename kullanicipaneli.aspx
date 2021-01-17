<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kullanicipaneli.aspx.cs" Inherits="panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Randevu</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    </head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="header">
            <div class="logo"><a href="index.aspx"><img src="img/siemens.png"></a>
                <h2>Randevu Görüntüle</h2>
            </div>
        </div>
        <div class="cont">
            <div class="contic">
                             <h3>
                                 <asp:Label ID="lblisim" runat="server" ></asp:Label> </h3>
                             <div class="getir">
                                     <asp:dropdownlist id="getirdrop" runat="server">
                                         
        </asp:dropdownlist>
                                 <asp:Button ID="btnsil" class="btncleft" UseSubmitBehavior="true" runat="server" OnClick="btnsil_Click" Text="Kaydı Sil"  /><img class="bilgi" src="img/bilgi.svg" title="Seri Numarasına Göre Seçtiğiniz Kayıt Silinecektir" />
                           </div>
                <asp:repeater id="myRepeater" runat="server">



    <itemtemplate>   
               <br> <table class="kullanicipaneltable">
                            <tr>
                        <td>Tarih</td>
                        <td><asp:TextBox disabled ID="TextBox2" runat="server" value='<%# Eval("tarih") %>'></asp:TextBox></td>
                                </tr>
                         <tr>
                        <td>Ad Soyad</td>
                        <td><asp:TextBox disabled ID="TextBox3" runat="server" value='<%# Eval("ad_soyad") %>'></asp:TextBox></td>
                                </tr>
                              <tr>
                        <td>Mail Adresi</td>
                        <td><asp:TextBox disabled ID="TextBox4" runat="server" value='<%# Eval("mail") %>'></asp:TextBox></td>
                                </tr>
                         <tr>
                        <td>Telefon Numarası</td>
                        <td><asp:TextBox disabled ID="TextBox5" runat="server" value='<%# Eval("tel_no") %>'></asp:TextBox></td>
                                </tr>
                        <tr>
                        <td>Seri No</td>
                        <td><asp:TextBox disabled ID="TextBox8" runat="server" value='<%# Eval("pc_serino") %>'></asp:TextBox></td>
                                </tr>

                         <tr>
                        <td>Lokasyon</td>
                        <td>
                          <asp:TextBox disabled ID="TextBox9" runat="server" value='<%# Eval("lokasyon") %>'></asp:TextBox>
                             </td>
                                </tr>
                        </table>
          </itemtemplate>
   </asp:repeater>
       
            </div>
        </div>
        <div class="footer">Siemens 2019</div>
    </div>
    </form>
</body>
</html>
