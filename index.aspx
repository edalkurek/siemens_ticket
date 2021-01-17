<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
                <h2>Anasayfa</h2>
            </div>
        </div>
        <div class="cont">
            <div class="contic">
               <asp:Button ID="randolustur" class="btngit" runat="server" Text="Randevu Oluştur" OnClick="randolustur_Click" />
                <asp:Button ID="randduz" class="btngit" runat="server" Text="Randevu Görüntüle" OnClick="randduz_Click" />
            </div>
        </div>
        <div class="footer">Siemens 2019</div>
    </div>
             </form>
</body>
</html>
