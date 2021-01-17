<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admgiris.aspx.cs" Inherits="admgiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Randevu</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

</head>
  <form id="form1" runat="server">
    <body>
    <div class="container">
        <div class="header">
            <div class="logo"><a href="index.aspx"><img src="img/siemens.png"></a>
                <h2>Admin Giriş</h2>
            </div>
        </div>
        <div class="cont">
            <div class="contic">
                <table>
                    <tr>
                        <td>Kullanıcı Adı :</td>
                        <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Şifre :</td>
                        <td> <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    
                </table>
                
                
                <asp:Button ID="btnadmgir" runat="server" class="btncl" Text="Giriş" OnClick="btnadmgir_Click" />
            </div>
        </div>
        <div class="footer">Siemens 2019</div>
    </div>
</body>
    </form>
</body>
</html>
