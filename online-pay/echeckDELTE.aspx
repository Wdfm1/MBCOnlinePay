<%@ Page Language="VB" AutoEventWireup="false" CodeFile="echeck.aspx.vb" Inherits="echeck" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Pay by eCheck</title>
    <!-- Bootstrap core CSS -->
    <link href="new_look/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
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
.formContHolder {
	width:100%;
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
#AuthorizeNetSeal {
	float: right;
	width: 150px;
	z-index: 44;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10pt;
	font-style: normal;
	font-weight: normal;
	text-decoration: none;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 0px;
	padding-right: 0px;
	margin-right: 40px;
	margin-top: 0px;
}
.Textlink {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10pt;
	font-style: normal;
	line-height: 12pt;
	font-weight: normal;
	color: #00C;
	text-decoration: underline;
}
#feature3 {
	position: absolute;
	left: auto;
	width: 300px;
	height: 173px;
	z-index: 70;
	margin-left: 50px;
	visibility: hidden;
	background-image: url(new_look/check.jpg);
	border-top-width: 3px;
	border-right-width: 3px;
	border-bottom-width: 3px;
	border-left-width: 3px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	margin-top: 30px;
}
#feature4 {
	position: absolute;
	left: auto;
	width: 300px;
	height: 173px;
	z-index: 70;
	margin-left: 50px;
	visibility: hidden;
	background-image: url(new_look/check2.jpg);
	border-top-width: 3px;
	border-right-width: 3px;
	border-bottom-width: 3px;
	border-left-width: 3px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	margin-top: 25px;
}
</style>
<script src="new_look/modernizr.js"></script>
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
    <div class="visible-xs headerASP"><img src="new_look/logo-1.png" width="70%" alt="" style="margin-top:1em"/></div>
<form id="form1" runat="server">
	<div class="hidden-xs headline">Echeck Payment Page
	</div>
    <div class="visible-xs headline2">Echeck Payment Page
</div>
<div class="formDivs">
<div id="AuthorizeNetSeal">
 <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Electronic Commerce</a><br />
<br /><img src="Images/Verisign-Secured.png" alt="" width="86" height="43"/>
</div>
   <span class="redtext"><strong>Check that your School Code and School Name below are correct. If they are not, return to the previous page and carefully re-enter your School Code.</strong></span></div>
<div class="Green_Text_NEW"><%Response.Write(Session("cAddress"))%></div>

<div class="formContHolder">
<div class="formDivs">
Customer's Name (as it appears on bank account):<br>
<asp:TextBox ID="x_bank_acct_name" runat="server" Width="260px"></asp:TextBox>
&nbsp;&nbsp;
 <span class="error_text"><asp:RequiredFieldValidator ID="rfCustName" runat="server" 
              ControlToValidate="x_bank_acct_name" 
              ErrorMessage="Bank customer name is required"></asp:RequiredFieldValidator>
</span></div>
<div id="feature4"></div>
<div class="formDivs">
Bank Name:<br>
<asp:TextBox ID="x_bank_name" runat="server" Width="260px" 
              ToolTip="Name of bank"></asp:TextBox>&nbsp;&nbsp;
          <span class="error_text"><asp:RequiredFieldValidator ID="rfbankname" runat="server" 
              ControlToValidate="x_bank_name" ErrorMessage="Bank name is required"></asp:RequiredFieldValidator></span>
</div>
<div class="formDivs">
Bank Account Type: (choose one)<br>
<asp:DropDownList ID="x_bank_acct_type" runat="server" 
            Height="24px" Width="260px">
            <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>CHECKING</asp:ListItem>
            <asp:ListItem Value="BUSINESSCHECKING">BUSINESS CHECKING</asp:ListItem>
            <asp:ListItem>SAVINGS</asp:ListItem>
        </asp:DropDownList>
    &nbsp;&nbsp;
      <span class="error_text"><asp:RequiredFieldValidator ID="rfacctype" runat="server" 
              ControlToValidate="x_bank_acct_type" ErrorMessage="Account type is required"></asp:RequiredFieldValidator></span>
</div>
<div id="feature3"></div>
<div class="formDivs" style="margin-bottom:6px">Bank's ABA Routing Number: <span class="Textlink" onmouseover="MM_showHideLayers('feature3','','show')" onmouseout="MM_showHideLayers('feature3','','hide')">What's This</span></div>
<div class="formDivs">
<asp:TextBox ID="x_bank_aba_code" runat="server" Width="260px" 
            causesvalidation="True" MaxLength="9" ToolTip="First nine digits on check"></asp:TextBox>&nbsp;&nbsp;
<span class="error_text"><asp:RequiredFieldValidator ID="rfRoutingnume" runat="server" 
            ControlToValidate="x_bank_aba_code" ErrorMessage="Routing number is required"></asp:RequiredFieldValidator></span>
</div>
<div class="formDivs" style="margin-bottom:6px">Bank Account Number: &nbsp; <span class="Textlink" onmouseover="MM_showHideLayers('feature4','','show')" onmouseout="MM_showHideLayers('feature4','','hide')">What's This</span>
</div>
<div class="formDivs">
<asp:TextBox ID="x_bank_acct_num" runat="server" Width="260px" MaxLength="16" 
              ToolTip="Last section of digits on check"></asp:TextBox>
       &nbsp;&nbsp;
<span class="error_text"><asp:RequiredFieldValidator ID="rfBankAcc" runat="server" 
              ControlToValidate="x_bank_acct_num" 
              ErrorMessage="Bank account number is required"></asp:RequiredFieldValidator></span>
</div>
<div class="formDivs">
Today's Payment Amount (Please use standard format $0.00)<br>
<asp:TextBox ID="x_amount" runat="server" Width="260px"></asp:TextBox> 
    &nbsp;&nbsp;
     <span class="error_text"><asp:RequiredFieldValidator ID="rfpayment" runat="server" 
            ControlToValidate="x_amount" ErrorMessage="Payment amount is required"></asp:RequiredFieldValidator></span>
</div>
<div class="formDivs">
Email Address for receipt to be sent:<br>
<asp:TextBox ID="email1" 
              runat="server" Width="260px"></asp:TextBox>&nbsp;&nbsp;
    <span class="error_text"><asp:RequiredFieldValidator ID="rfEmail" runat="server" 
              ControlToValidate="email1" ErrorMessage="Email address is required"></asp:RequiredFieldValidator></span>
</div>
<div class="formDivs">
<asp:HiddenField ID="x_echeck_type" 
                  runat="server" Value="WEB" />
            
            <asp:HiddenField 
              ID="x_method" runat="server" Value="ECHECK" /> 
            <asp:HiddenField ID="x_recurring_billing" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_relay_response" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_delim_data" runat="server" Value="TRUE" />
            <asp:Button ID="Button2" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />  
            &nbsp;&nbsp;
            <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc" 
                    ProviderName="MySql.Data.MySqlClient" 
                    SelectCommand="SELECT cust.* FROM cust"> </asp:SqlDataSource>
</div>
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
    <script type="text/javascript">
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="new_look/bootstrap.min.js"></script>
    <script src="new_look/docs.min.js"></script>
    <script src="dist/js/respond.min.js"></script>
<script type="text/javascript" language="javascript">var ANS_customer_id="83749ad4-12da-4e7c-8d95-aa6fa3961da4";</script>
<script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" >
</script>    
</body>
</html>
