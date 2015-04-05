<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Receipt_MILITARY.aspx.vb" Inherits="Receipt_Military" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

   
   


</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Receipt</title>
<link href="css/authnet_forms_mil.css" rel="stylesheet" type="text/css" />
<link href="css/Military_web_styles.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#004080">
    <form id="form1" runat="server">
<div id="page">
<div class="header"><img src="Images/membookmilitarybanner.jpg" width="900" height="120" alt="Military Memory Book" /></div>
<div class="wrapper">
   <ul id="nav">
      <li><a href="http://www.militaryyearbookprinting.com/index.html">Home</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/army-yearbooks.html">Army</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/navy-yearbooks.html">Navy</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/air-force-yearbooks.html">Air Force</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/marines-yearbooks.htmll">Marines</a>  </li>
      <li><a href="http://www.militaryyearbookprinting.com/coast-guard-yearbooks.html">Coast Guard</a></li>
      <li class="MenuBarItemSubmenu"><a href="http://www.militaryyearbookprinting.com/military-reunion-book.html">Reunions</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/about-us.html">About Us</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/create-your-military-yearbook.html">Create</a></li>
      <li><a href="http://www.militaryyearbookprinting.com/covers-bindings.html" class="MenuBarItemSubmenu">Covers/Binding</a>
         <ul>
            <li><a href="http://www.militaryyearbookprinting.com/yearbook-cover-designs.html">Covers</a></li>
            <li><a href="http://www.militaryyearbookprinting.com/yearbook-binding-designs.html">Binding</a></li>
            <li><a href="http://www.militaryyearbookprinting.com/enhancements.html">Enhancements</a></li>
         </ul>
      </li>
    </ul>
</div>
<div style="clear:both"></div>
<div class="container">
<div style="float: right; width: 680px; font-size: 14px; font-style: normal; font-weight: bold;  height: 454px;" >
<div style="font-size: large; height: 68px;">
    <br />
    Thank you for your payment. A receipt has been emailed to you or you can 
    print this page.<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </div>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="638px" 
        AutoGenerateRows="False" CellPadding="4" DataSourceID="dsorder" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="orderid" HeaderText="Order Id" 
                SortExpression="orderid" >
            <HeaderStyle BackColor="#A5B1A3" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="orddate" HeaderText="Order Date" 
                SortExpression="orddate" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="schcode" HeaderText="Unit Code" ReadOnly="True" 
                SortExpression="schcode" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="schname" HeaderText="Unit Name" 
                SortExpression="schname" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="studentfname" HeaderText="First Name" 
                SortExpression="studentfname" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="studentlname" HeaderText="Last Name" 
                SortExpression="studentlname" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="emailaddress" HeaderText="Email" 
                SortExpression="emailaddress" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="transid" HeaderText="Trans Action#" 
                SortExpression="transid" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="booktype" HeaderText="Book Type" 
                SortExpression="booktype" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="teacher" HeaderText="Unit Leader" 
                SortExpression="teacher" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="perstext1" HeaderText="Line 1 Text" 
                SortExpression="perstext1">
            <HeaderStyle BackColor="#A5B1A3" />
            <ItemStyle Font-Size="Smaller" />
            </asp:BoundField>
            <asp:BoundField DataField="perstext2" HeaderText="Line 2 Text" 
                SortExpression="perstext2">
            <HeaderStyle BackColor="#A5B1A3" />
            <ItemStyle Font-Size="Smaller" />
            </asp:BoundField>
            <asp:BoundField DataField="itemqty" HeaderText="Qty" SortExpression="itemqty" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="itemtotal" HeaderText="Total" 
                SortExpression="itemtotal" >
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
            <asp:BoundField DataField="paytype" HeaderText="Pay Type" 
                SortExpression="paytype">
            <HeaderStyle BackColor="#A5B1A3" />
            </asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A5B1A3" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <div align="right">
        <eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" 
            CloseButtonUrl="00070301" ControlSkinID="None" HeaderHtml="Dialog Title" 
            Height="216px" Width="320px">
            <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
            <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
            <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
            <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
                BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
                TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
                TopLeftCornerRight="00020202" TopRightCorner="00020204" 
                TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
        </eo:MsgBox>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
  








</div>
</div>
<div class="sidebar_right">
<div class="sidebar_time">
<script type="text/javascript">
    var d=new Date()
    var weekday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday",
                    "Friday","Saturday")
    var monthname=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug",
                    "Sep","Oct","Nov","Dec")
    document.write(weekday[d.getDay()] + ", ")
    document.write(monthname[d.getMonth()] + " ")
	document.write(d.getDate() + ", ")
    document.write(d.getFullYear())
          </script>
</div>
<div class="sidebar_sub" style="text-align:center; padding-top:10px; padding-bottom:10px; background-color:#666633">
  <strong class="Text10boldwhite">Printed In the USA</strong>
</div>
</div>
<div style="clear:both"></div>
<div class="page_footer">
</div>
    <asp:SqlDataSource ID="dsorder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MilitaryConn %>" 
        ProviderName="<%$ ConnectionStrings:MilitaryConn.ProviderName %>" 
        
        SelectCommand="SELECT cust.schcode, cust.schname, orders.booktype, orders.teacher, orders.perstext1, orders.perstext2, orders.studentfname, orders.emailaddress, orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.itemtotal, orders.studentlname, orders.parentpayment, payment.ccnum, payment.transid, payment.paytype FROM cust INNER JOIN orders ON cust.schcode = orders.schcode INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.orderid = 9066)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="9066" Name="orderid" 
                QueryStringField="orderid" />
        </SelectParameters>
    </asp:SqlDataSource>

<div class="footer" id="copyright_footer">Memory Book Company &#8226; © Copyright 2012 &#8226; All rights reserved</div>
</div>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-355460-2");
pageTracker._trackPageview();
} catch(err) {}</script>
    </form>
</body>
</html>
<%session.clear() %>