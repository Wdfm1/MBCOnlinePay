<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OrderDetail.aspx.vb" Inherits="Admin_OrderDetail" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Receipt</title>
    <!-- Bootstrap core CSS -->
    <link href="../new_look/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
.style1 {
	font-family: "Open Sans", Arial, sans-serif;
}
#pageZZ {
	width: 90%;
	max-width:900px;
	margin-top: 0px;
	margin-right: auto;
	margin-left: auto;
	z-index: 10;
	background-color: #FFF;
	padding-left:2%;
	padding-right:2%;
}
.headerASP {
	text-align:center;
}
.headline {
	float: left;
	padding-bottom: 50px;
	padding-left: 20px;
	height: 30px;
	z-index: 50;
	margin-top:20px;
	font-size: 30px;
	font-weight: normal;
	color: #666;
	width: 98%;
	text-decoration: none;
	font-family: "Open Sans", Arial, sans-serif;
}
.headline2 {
	float: left;
	padding-left: 20px;
	padding-bottom: 40px;
	height: 30px;
	z-index: 50;
	margin-top:10px;
	font-size: 20px;
	font-weight: normal;
	color: #666;
	width: 95%;
	text-decoration: none;
	font-family: "Open Sans", Arial, sans-serif;
}
.pay_contain {
	width:800px;
	height:697px;
	background-repeat:no-repeat;
	display:block;
	float:left
}
.code_contain {
	width:100%;
	display:block;
	float:left;
	background-color:#FFF
}
.page_footer {
	text-align: center;
	padding: 2em;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #FFF;
}
.formDivs {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
}
.formDivsTITLE {
	padding-left: 20px;
	padding-top: 8px;
	padding-bottom: 8px;
	font-family: "Open Sans", Arial, sans-serif;
	font-size: 20px;
	font-weight: bold;
	font-style: oblique;
}
.formDivsBottom {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:20px;
	font-family: "Open Sans", Arial, sans-serif;
}
.formContHolder {
	width:100%;
}
.formCont {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
}
.formCont30 {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
	width:30%;
	float:left;
	display:block;
}
.formCont50 {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
	width:50%;
	float:left;
	display:block;
}
    body,td,th {
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
}
    body {
	background-color: #E5E4E4;
}
.redtext {
	font-size: 10pt;
	font-style: normal;
	line-height: 12pt;
	color: #C00;
	text-decoration: none;
	font-family: Arial, Helvetica, sans-serif;
}
.Green_Text_NEW {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #060;
	text-decoration: none;
	float: left;
	width: 100%;
	padding-top:6px;
	padding-bottom:6px;
	padding-left:20px;
}
.error_text {
	font-family: "Open Sans", Arial, sans-serif;
	list-style:none;
	color:#E80F12;
	font-weight:bold;
}
</style>
<script src="../new_look/modernizr.js"></script>
    <!--[if lt IE 9]><script src="new_look/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
<body background-color="#333" link="blue">
<div id="pageZZ">
<div class="code_contain">
    <div class="hidden-xs headerASP">
    <a href="http://memorybook.com/"><img src="../new_look/headbig.jpg" alt="Memory Book Header" width="90%" border="0" /></a></div>
    <div class="visible-xs headerASP"><img src="../new_look/logo-1.png" width="70%" alt="" style="margin-top:1em"/></div>
<form id="form1" runat="server">
    <div class="hidden-xs headline">Order Detail</div>
    <div class="visible-xs headline2">Order Detail</div>
<div class="code_contain">
	<div class="formDivs">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="dsorder">
        <ItemTemplate>
<div class="formDivs">
School Name:  
    <asp:Label ID="lblschname" 
        runat="server" Text='<%# bind("schname") %>' Font-Bold="True"></asp:Label>
</div>
<div class="formDivs">
Schcode:
    <asp:Label ID="lblschcode" runat="server" Font-Bold="True" 
            Text='<%# bind("schcode") %>'></asp:Label>
</div>
<div class="formDivs">
Order Date:<asp:Label ID="lblorderdate" runat="server" Font-Bold="True" 
            Text='<%# bind("orddate") %>'></asp:Label>
</div>
<div class="formDivs">
Email Address:
    <asp:Label ID="lblemail" runat="server" Font-Bold="True" 
        Text='<%# bind("emailaddress") %>'></asp:Label>
</div>
<div class="formDivs">
Order Id:
        <asp:Label ID="lblorderid" runat="server" Font-Bold="True" 
               Text='<%# bind("orderid") %>'></asp:Label>
</div>
<div class="formDivs">
Transaction Id:<asp:Label ID="lbltansactionid" runat="server" 
                            Text='<%# bind("transid") %>'></asp:Label>
</div>
<div class="formDivs">
Authorization Code:<asp:Label ID="lblauthcode" runat="server" Font-Bold="True" 
                            Text='<%# bind("authcode") %>'></asp:Label>
</div>             
        </ItemTemplate>
    </asp:FormView>
</div>
 <div class="formDivs">
<asp:GridView ID="gv1" runat="server" Width="838px" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" DataSourceID="dsorder">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Qty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("itemqty") %>'></asp:Label>
                    @<br />
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("itemamount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Student\Book Type">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("studentfname") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("studentlname") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("booktype") %>'></asp:Label>
                    <br />
                </ItemTemplate>
                <ItemStyle Width="250px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Teacher\Grade">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("teacher") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("grade") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Line 1 Text\Line 2 Text">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("perstext1") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("perstext2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("itemtotal") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="75px" HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
</div>
<div class="formDivs" style="text-align:right">
    <asp:FormView ID="FormView2" runat="server" DataSourceID="dstotal">
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text="Total: "></asp:Label>
        <asp:TextBox ID="txttotal" runat="server" ReadOnly="True" Width="60px" 
                Text='<%# bind("total") %>'></asp:TextBox>
        </ItemTemplate>

    </asp:FormView>
</div>
  <asp:SqlDataSource ID="dsorder" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
       
        SelectCommand="SELECT invoiceinfo.schname, `orders`.id, `orders`.grade, `orders`.booktype, `orders`.teacher, `orders`.perstext1, `orders`.perstext2, `orders`.emailaddress, `orders`.schcode, `orders`.itemamount, `orders`.schinvoicenumber, `orders`.orderid, `orders`.itemqty, `orders`.orddate, `orders`.paytype, `orders`.itemtotal, payment.authcode, payment.transid, payment.ccnum, payment.schinvoicenumber AS Expr1, payment.paytype AS Expr2, `orders`.studentfname, `orders`.studentlname FROM invoiceinfo INNER JOIN `orders` ON invoiceinfo.schcode = `orders`.schcode INNER JOIN payment ON `orders`.orderid = payment.orderid WHERE (`orders`.orderid = @orderid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="@orderid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dstotal" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT SUM(itemtotal) AS total FROM `orders` WHERE (orderid = @orderid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="@orderid" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
  </form>
</div>
<div class="page_footer"> Memory Book Company • © Copyright 2015 • All rights reserved</div>
</div>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-355460-1']);
  _gaq.push(['_setDomainName', 'memorybook.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<!-- Start of Async HubSpot Analytics Code 
    <script type="text/javascript">
        (function(d,s,i,r) {
            if (d.getElementById(i)){return;}
            var n=d.createElement(s),e=d.getElementsByTagName(s)[0];
            n.id=i;n.src='//js.hubspot.com/analytics/'+(Math.ceil(new Date()/r)*r)+'/306026.js';
            e.parentNode.insertBefore(n, e);
        })(document,"script","hs-analytics",300000);
    </script>-->
<!-- End of Async HubSpot Analytics Code -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../new_look/bootstrap.min.js"></script>
    <script src="../new_look/docs.min.js"></script>
    <script src="../dist/js/respond.min.js"></script>
    
</body>
</html>
