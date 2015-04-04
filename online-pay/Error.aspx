<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Error.aspx.vb" Inherits="_Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Error</title>

<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">
  <form id="form1" runat="server">

 <div id="header_phone">1-800-247-1526</div>
 <div id="headline">Error</div>



<div class="header">
  <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"/>
  </div>

<div class="swoosh_container">

</div>

<div class="body_copy_container_Fullwidth" style="text-align:center; padding-bottom:30px">
<div align="left">

<asp:Label ID="lblerror" runat="server" Font-Size="Large" 
        
		
        
        Text="A technical error has occurred. Please try placing your order again or contact Memorybook customer service at 1-800-247-1526" 
        Font-Bold="True"></asp:Label>
  
</div>

  

      
</div>
</form>
<div style="clear:both"></div>
<div style="clear:left"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 

</div>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-355460-1']);
    _gaq.push(['_setDomainName', 'memorybook.com']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>
  
</body>
</html>
