<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Receipt.aspx.vb" Inherits="receipt" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

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
    <link href="file:///C|/Users/msadler/AppData/Local/Microsoft/Windows/Temporary Internet Files/Content.Outlook/57H5QNNH/new_look/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
/*Randy Styles*/
.shoppingcart {border:2px solid #000;font-size:small}
        .shoppingcart .header{background-color:#800000;color:#ffffff;width:100%!important;height:auto!important;padding:5px 0px 5px 2px}
        .shoppingcart .header .column{float:left;width:120px;font-weight:bold;display:block }
        .shoppingcart .row{padding:3px;margin:0px !important}
        .shoppingcart .rowAlt{background-color:gainsboro;padding:3px;margin:0px !important}
        .shoppingcart .rowAlt .column{float:left;width:120px;}
        .shoppingcart .row .column{float:left;width:120px;}
        .smalltext{font-size:8px;font-style:italic}
        .columnEmpty{width:60px!important}
        .columnQty {width:50px!important;text-align:center!important;}
        .columnStudent {width:200px!important;}
        .columnTeacher {width:150px!important;}
        .columnIcons {width:260px!important;}
        .columnTotal{float:right!important;text-align:right!important;padding-right:10px}
        .shoppingcart .footer{text-align:right;float:right;width:100%!important}
        .shoppingcart .footer .column{background-color:white;border:2px solid #a8a8a8;width:120px;float:right;text-align:right;font-weight:bold;padding:10px}
         .clear {clear:left;}
        .floatLeft {float:left;}
        .submit1{width: 840px;
                padding-left: 0px;
                float:right; 
                text-align:right;
                font-family: "Titillium Web";
                font-size: 14px;
                font-weight: normal;color: #333;
                text-decoration: none;
	            line-height: 17px;
	            padding-top: 2px;
	            padding-right: 0px;
               
	       }


  /*Mikes Styles*/
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
.pay_sidebar {
	width:266px;
	background-image:url(file:///C|/Users/msadler/AppData/Local/Microsoft/Windows/Temporary%20Internet%20Files/Content.Outlook/57H5QNNH/online-pay/new_look/sidebar.jpg);
	height:697px;
	background-repeat:no-repeat;
	display:block;
	float:left
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
.loginBox {
	background-color: #DEDFE3;
	max-width: 400px;
	padding: 1em;
	border-radius: 1em;
	text-align: right;
	-webkit-border-radius: 1em;
	-moz-border-radius: 1em;
	border: 2px solid #666;
}
.name_password {
	padding:.5em;
}
</style>
<script src="file:///C|/Users/msadler/AppData/Local/Microsoft/Windows/Temporary Internet Files/Content.Outlook/57H5QNNH/new_look/modernizr.js"></script>
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
    <a href="http://memorybook.com/"><img src="new_look/headbig.jpg" alt="Memory Book Header" width="90%" border="0" /></a></div>
    <div class="visible-xs headerASP"><div class="visible-xs headerASP"><img src="new_look/logo-1.png" width="70%" alt="" style="margin-top:1em"/></div>
    </div>
<form id="form1" runat="server">
	<div class="hidden-xs headline">Thank you for your payment</div>
    <div class="visible-xs headline2">Thank you for your payment</div>

<div style="clear:left"></div>
<div class="formContHolder">
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
Pay Type:<asp:Label ID="lblpaytype" runat="server" Font-Bold="True" 
            Text='<%# bind("paytype") %>'></asp:Label>
</div>        
<div class="formDivs">
Transaction Id:<asp:Label ID="lbltransactionid" runat="server" 
                            Text='<%# bind("transid") %>' Font-Bold="True"></asp:Label>
</div>
<div class="formDivs">
Authorization Code:<asp:Label ID="lblauthcode" runat="server" Font-Bold="True" 
                            Text='<%# bind("authcode") %>'></asp:Label>
</div>
         </ItemTemplate>
    </asp:FormView>
</div>
<div class="formDivs">
<asp:ListView ID="lvItems" class="shoppingcart" runat="server" DataKeyNames="id" DataSourceID="dsorder">
        <AlternatingItemTemplate>
            <div class="rowAlt">
                <div class="column columnQty"><%# Eval("itemqty")%> @  <br /><%# Eval("itemamount")%> </div> 
                <div class="column columnStudent"><%# Eval("studentfname") & " " & Eval("studentlname")%><br /> <%#  Eval("booktype") %> </div> 
                <div class="column columnTeacher"><%# Eval("teacher")%> <br/> <%#   Eval("grade")%></div> 
                <div class="column columnIcons"><%# Eval("perstext1")%> <br />  <div class="smalltext"><%# Eval("cap")%> <br /> <%# Eval("cap1")%></div></div> 
                <div class="column columnTotal"><%# Eval("itemamount")%></div> 
                <div style="clear:left"></div>
            </div>
        </AlternatingItemTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="column columnQty"><%# Eval("itemqty")%> @<br /><%# Eval("itemamount")%>  </div> 
                <div class="column columnStudent"><%# Eval("studentfname") & " " & Eval("studentlname")%><br /> <%#  Eval("booktype") %> </div> 
                <div class="column columnTeacher"><%# Eval("teacher")%> <br/> <%#   Eval("grade")%></div> 
                <div class="column columnIcons"><%# Eval("perstext1")%> <br />  <div class="smalltext"><%# Eval("cap")%> <br /> <%# Eval("cap1")%></div></div> 
                <div class="column columnTotal"><%# Eval("itemamount")%></div> 
                <div style="clear:left"></div>
            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <table runat="server" style="background-color: #fff;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <div class="shoppingcart">
                <div class="header">
               <div class="column columnQty">Qty</div>
                    <div class="column columnStudent">Student\Book Type</div>
                    <div class="column columnTeacher">Teacher\Grade</div>
                    <div class="column columnIcons">Line1 Text\Icons</div>
                    <div class="column columnTotal">Item Total</div>
                    <div class="clear"></div>
                </div>
                <div id="itemPlaceholder" runat="server">

                </div>
                <div class="footer">
                    <div class="clear"></div>
                    <div class="column">Total:<asp:Label ID="lbltotal" runat="server" OnInit="lbltotal_Init" Text="0.00"></asp:Label></div>
                </div>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</div>
<div class="formDivs" style="float: left; font-style: italic;">
For questions about your yearbook order contact you schools yearbook advisor.<br />
<br />
<a href="https://products.memorybook.com/login">Click to order a 2015 graduate banner. The perfect companion to your 2015 yearbook.</a>
</div>
<div style="clear:left"></div>

<div class="formDivs" style="text-align:right">
    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" 
        Font-Size="Medium" ForeColor="Blue">Email Receipt</asp:LinkButton>
</div>
</div>
  <asp:SqlDataSource ID="dsorder" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MbcConn %>" 
            ProviderName="<%$ ConnectionStrings:MbcConn.ProviderName %>" 
       
        SelectCommand="SELECT invoiceinfo.schname, orders.id, orders.grade, orders.booktype, orders.teacher, orders.perstext1, orders.perstext2, orders.emailaddress, orders.schcode, orders.itemamount, orders.schinvoicenumber, orders.orderid, orders.itemqty, orders.orddate, orders.itemtotal, payment.authcode, payment.transid, payment.ccnum, payment.paytype, orders.studentlname, orders.studentfname, concat_ws(',', lookup.caption, lookup_1.caption) AS cap, concat_ws(',', lookup_3.caption, lookup_2.caption) AS cap1 FROM invoiceinfo INNER JOIN orders ON invoiceinfo.schcode = orders.schcode LEFT OUTER JOIN lookup lookup_3 ON orders.icon4 = lookup_3.ivalue LEFT OUTER JOIN lookup lookup_2 ON orders.icon3 = lookup_2.ivalue LEFT OUTER JOIN lookup lookup_1 ON orders.icon2 = lookup_1.ivalue LEFT OUTER JOIN lookup ON orders.icon1 = lookup.ivalue LEFT OUTER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.orderid = @orderid)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="@orderid" 
                    QueryStringField="orderid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dstotal" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MbcConn %>" 
            ProviderName="<%$ ConnectionStrings:MbcConn.ProviderName %>" 
      
        SelectCommand="SELECT SUM(itemtotal) AS total FROM `orders` WHERE (orderid = @orderid)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="17" Name="@orderid" 
                    QueryStringField="orderid" />
            </SelectParameters>
        </asp:SqlDataSource>

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
    <script src="file:///C|/Users/msadler/AppData/Local/Microsoft/Windows/Temporary Internet Files/Content.Outlook/57H5QNNH/new_look/bootstrap.min.js"></script>
    <script src="file:///C|/Users/msadler/AppData/Local/Microsoft/Windows/Temporary Internet Files/Content.Outlook/57H5QNNH/new_look/docs.min.js"></script>
    <script src="file:///C|/Users/msadler/AppData/Local/Microsoft/Windows/Temporary Internet Files/Content.Outlook/57H5QNNH/dist/js/respond.min.js"></script>
    
</body>
</html>
