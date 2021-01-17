<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="index" %>

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
                <h2>IT Randevu Sistemine Hoşgeldiniz</h2>
            </div>
        </div>
        <div class="cont">
            <div class="contic">
                <div class=warning runat="server"><span>Randevu almadan önce dikkat etmeniz gerekenler:</span><br>
                    <br />
                    <br>1- Bilgisayarınızın belleği(RAM) 4 GB ise belleğinizi 8 GB&#39;a yükseltip daha sonra randevu almanız gerekmektedir.<br />
                    Bellek kapasitenizi öğrenmek için <a target="_blank" href="img/bilgozel.jpg">tıklayınız</a>.<br />
                    <br>2- Bilgisayarınız 3 yıldan uzun süredir kullanımdaysa yeni bilgisayar sipariş etmeniz önerilmektedir. (Yeni bilgisayarınız içinde Windows 10 yüklü olarak size gelecektir.)<br />
                    Sipariş vermek için: <a target="_blank"  href="https://webapps.siemens.com.tr/tulipv3/UI/?SM_CONTEXT_NAME=SM99114P8086&actAsUserName=61322&actAsSid=60zxzvv3z940719v560x33y72w9z74v4919279808689&realUserName=61322&realUserSid=60zxzvv3z940719v560x33y72w9z74v4919279808689">tıklayınız (Tulip)</a>.<br />
                    Bilgisayar kullanım sürenizi öğrenmek için Selma Onuk Orhan&#39;a mail atabilirsiniz: <a href="mailto:selma.onuk@siemens.com">selma.onuk@siemens.com</a><br />
                    <br>3- En geç randevu tarihi 31 Aralık 2019&#39;dur.</div>
                <asp:Button ID="devam" class="btngit" runat="server" Text="Anladım ve Devam Etmek İstiyorum" OnClick="devam_Click" />
            </div>
        </div>
        <div class="footer">Siemens 2019</div>
    </div>
             </form>
</body>
</html>
