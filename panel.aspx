<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panel.aspx.cs" Inherits="panel" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Randevu</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
     <script language="javascript" type="text/javascript">
        function Print(str)
        {
        var prtContent = document.getElementById('<%= GridView1.ClientID %>');
            prtContent.border = 0; //set no border here
            var WinPrint = window.open('','','left=100,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="header">
            <div class="logo"><a href="index.aspx"><img src="img/siemens.png"></a>
                <h2>Admin Paneli</h2>
            </div>
        </div>
        <div class="cont">
            <div class="contic">
                                
                
                <asp:Button ID="btnadmcik" runat="server" class="btncl" Text="Çıkış Yap" OnClick="btnadmcik_Click" />
            
                <asp:Label ID="btnadmlog" runat="server" class="adminlabel"/>
            
                <br />
                <br />
                <br />
                <div ID="grid">
                    <div >
                        
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" Auto xmlns:asp="#unknown" AllowSorting="True" OnRowCancelingEdit="gvTestGrid_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="gvTestGrid_RowUpdating">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />  
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />   
                                <asp:CheckBoxField dataField="onay" HeaderText="onay" SortExpression="onay">
                                    <controlstyle Width="70px" />
                                </asp:CheckBoxField>
                                <asp:BoundField DataField="onaylayan" HeaderText="onaylayan" SortExpression="onaylayan" />
                                <asp:BoundField DataField="not" HeaderText="not" SortExpression="not" />
                                <asp:BoundField DataField="ad_soyad" HeaderText="ad_soyad" SortExpression="ad_soyad" />
                                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                                <asp:BoundField DataField="tel_no" HeaderText="tel_no" SortExpression="tel_no" />
                                <asp:BoundField DataField="pc_serino" HeaderText="pc_serino" SortExpression="pc_serino" />
                                <asp:BoundField DataField="tarih" HeaderText="tarih" SortExpression="tarih" ControlStyle-Width="100px" />
                                <asp:BoundField DataField="lokasyon" HeaderText="lokasyon" SortExpression="lokasyon" />
                                 
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div></div>
                 <asp:Button ID="btnPrint" runat="server" class="btncl2" Text="Print" OnClientClick="Print('grid');" />

                <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues" DataFile="~/App_Data/veri.accdb" DeleteCommand="DELETE FROM [kullanici] WHERE [id] = ? AND [onay] = ? AND (([onaylayan] = ?) OR ([onaylayan] IS NULL AND ? IS NULL)) AND (([not] = ?) OR ([not] IS NULL AND ? IS NULL)) AND (([ad_soyad] = ?) OR ([ad_soyad] IS NULL AND ? IS NULL)) AND (([mail] = ?) OR ([mail] IS NULL AND ? IS NULL)) AND (([tel_no] = ?) OR ([tel_no] IS NULL AND ? IS NULL)) AND (([pc_serino] = ?) OR ([pc_serino] IS NULL AND ? IS NULL)) AND (([tarih] = ?) OR ([tarih] IS NULL AND ? IS NULL)) AND (([lokasyon] = ?) OR ([lokasyon] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [kullanici] ([id], [onay], [onaylayan], [not], [ad_soyad], [mail], [tel_no], [pc_serino], [tarih], [lokasyon]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [kullanici]" UpdateCommand="UPDATE [kullanici] SET [onay] = ?, [onaylayan] = ?, [not] = ?, [ad_soyad] = ?, [mail] = ?, [tel_no] = ?, [pc_serino] = ?, [tarih] = ?, [lokasyon] = ? WHERE [id] = ? AND [onay] = ? AND (([onaylayan] = ?) OR ([onaylayan] IS NULL AND ? IS NULL)) AND (([not] = ?) OR ([not] IS NULL AND ? IS NULL)) AND (([ad_soyad] = ?) OR ([ad_soyad] IS NULL AND ? IS NULL)) AND (([mail] = ?) OR ([mail] IS NULL AND ? IS NULL)) AND (([tel_no] = ?) OR ([tel_no] IS NULL AND ? IS NULL)) AND (([pc_serino] = ?) OR ([pc_serino] IS NULL AND ? IS NULL)) AND (([tarih] = ?) OR ([tarih] IS NULL AND ? IS NULL)) AND (([lokasyon] = ?) OR ([lokasyon] IS NULL AND ? IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_onay" Type="Boolean" />
                        <asp:Parameter Name="original_onaylayan" Type="String" />
                        <asp:Parameter Name="original_onaylayan" Type="String" />
                        <asp:Parameter Name="original_not" Type="String" />
                        <asp:Parameter Name="original_not" Type="String" />
                        <asp:Parameter Name="original_ad_soyad" Type="String" />
                        <asp:Parameter Name="original_ad_soyad" Type="String" />
                        <asp:Parameter Name="original_mail" Type="String" />
                        <asp:Parameter Name="original_mail" Type="String" />
                        <asp:Parameter Name="original_tel_no" Type="String" />
                        <asp:Parameter Name="original_tel_no" Type="String" />
                        <asp:Parameter Name="original_pc_serino" Type="String" />
                        <asp:Parameter Name="original_pc_serino" Type="String" />
                        <asp:Parameter Name="original_tarih" Type="String" />
                        <asp:Parameter Name="original_tarih" Type="String" />
                        <asp:Parameter Name="original_lokasyon" Type="String" />
                        <asp:Parameter Name="original_lokasyon" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="onay" Type="Boolean" />
                        <asp:Parameter Name="onaylayan" Type="String" />
                        <asp:Parameter Name="not" Type="String" />
                        <asp:Parameter Name="ad_soyad" Type="String" />
                        <asp:Parameter Name="mail" Type="String" />
                        <asp:Parameter Name="tel_no" Type="String" />
                        <asp:Parameter Name="pc_serino" Type="String" />
                        <asp:Parameter Name="tarih" Type="String" />
                        <asp:Parameter Name="lokasyon" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="onay" Type="Boolean" />
                        <asp:Parameter Name="onaylayan" Type="String" />
                        <asp:Parameter Name="not" Type="String" />
                        <asp:Parameter Name="ad_soyad" Type="String" />
                        <asp:Parameter Name="mail" Type="String" />
                        <asp:Parameter Name="tel_no" Type="String" />
                        <asp:Parameter Name="pc_serino" Type="String" />
                        <asp:Parameter Name="tarih" Type="String" />
                        <asp:Parameter Name="lokasyon" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_onay" Type="Boolean" />
                        <asp:Parameter Name="original_onaylayan" Type="String" />
                        <asp:Parameter Name="original_onaylayan" Type="String" />
                        <asp:Parameter Name="original_not" Type="String" />
                        <asp:Parameter Name="original_not" Type="String" />
                        <asp:Parameter Name="original_ad_soyad" Type="String" />
                        <asp:Parameter Name="original_ad_soyad" Type="String" />
                        <asp:Parameter Name="original_mail" Type="String" />
                        <asp:Parameter Name="original_mail" Type="String" />
                        <asp:Parameter Name="original_tel_no" Type="String" />
                        <asp:Parameter Name="original_tel_no" Type="String" />
                        <asp:Parameter Name="original_pc_serino" Type="String" />
                        <asp:Parameter Name="original_pc_serino" Type="String" />
                        <asp:Parameter Name="original_tarih" Type="String" />
                        <asp:Parameter Name="original_tarih" Type="String" />
                        <asp:Parameter Name="original_lokasyon" Type="String" />
                        <asp:Parameter Name="original_lokasyon" Type="String" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <asp:Button ID="btnexcel" runat="server" class="btncl2" OnClick="btnexcel_Click" Text="Export Excel" />
            </div>
        </div>
        <div class="footer">Siemens 2019</div>
    </div>
    </form>
</body>
</html>
