<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>School Payment</title>
    <!-- Bootstrap core CSS -->
    <link href="new_look/bootstrap.min.css" rel="stylesheet">

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
	width: 95%;
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
.formDivsBottom {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:20px;
	font-family: "Open Sans", Arial, sans-serif;
}
    body,td,th {
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
}
    body {
	background-color: #E5E4E4;
}
.error_text {
	font-family: "Open Sans", Arial, sans-serif;
	list-style:none;
	color:#E80F12;
	font-weight:bold;
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
	<div class="hidden-xs headline">
	  <asp:Label ID="lblpaytype" runat="server" >School Payment Page</asp:Label>
	</div>
    <div class="visible-xs headline2">School Payment Page
	</div>
<div class="formDivs">
        <asp:HyperLink ID="h1" runat="server" Font-Size="14px" 
        NavigateUrl="~/Default1.aspx">HyperLink</asp:HyperLink>
        <br />
    <br />
    Enter your pay code in the textbox below and click next to proceed.
</div>
<!--Get unit code from sending html form -->
<div class="formDivs">
<!-- (c) 2005, 2013. Authorize.Net is a registered trademark of CyberSource Corporation -->
			<asp:TextBox ID="CustomerCode" runat="server" Width="124px" MaxLength="6" 
                      CausesValidation="True" style="height: 22px" 
       EnableViewState="False"></asp:TextBox>
             &nbsp;&nbsp;
        </li>
        <asp:RequiredFieldValidator 
                      ControlToValidate="CustomerCode" 
                      ErrorMessage="Code is required" ID="RequiredFieldValidator1" 
        runat="server" precondition="error_text"></asp:RequiredFieldValidator>
			<asp:CustomValidator ID="cv11" runat="server" 
				ErrorMessage="You are on School Pay. Requires a 6 digit code." 
				ControlToValidate="CustomerCode"></asp:CustomValidator>

</div>

<div class="formDivs"> <font color="red"><%Response.Write(Session("defaulterrormessage"))%></font></div>
<div class="formDivs">
<asp:LinkButton runat="server" ID="lbspanish" ForeColor="Blue">(Haga clic en para la versión en español)</asp:LinkButton>  
</div>

<br />
<div class="formDivs">
	<asp:Button ID="Button1" runat="server" Text="Next" style="width:100px" OnClick="Button1_Click" />
</div>
<div class="formDivsBottom">
If you have any questions about ordering your yearbook contact your school's yearbook advisor.
</div>    
                 <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
                    SelectCommand="SELECT cust.* FROM cust">
      </asp:SqlDataSource>
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
    <script src="new_look/bootstrap.min.js"></script>
    <script src="new_look/docs.min.js"></script>
    <script src="dist/js/respond.min.js"></script>
    
</body>
</html>
