<%@ Page Language="VB" AutoEventWireup="false" CodeFile="table.aspx.vb" Inherits="Admin_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:SqlDataSource ID="dstable" runat="server" 
            ConnectionString="server=memserver;User Id=root;password=3l3phant1;Persist Security Info=True;database=kinderkraft5" 
            ProviderName="MySql.Data.MySqlClient"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
