<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TimeOut.aspx.vb" Inherits="TimeOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<META HTTP-EQUIV="refresh" CONTENT="2;URL=http://www.memorybook.com/online-pay/">
    <title>Time Out</title>
</head>
<body>
    <form id="form1" runat="server">
   <div id="content" style="font-size: xx-large; color: #000000;">
   <div align="center">
        <asp:SqlDataSource ID="cust11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>">
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        Your Session has timed out please re-enter your order.<br />
        </div>
           
    </div>
    </form>
</body>
</html>
