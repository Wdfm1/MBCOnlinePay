<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Receipt_SPAN.aspx.vb" Inherits="receipt_SPAN" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Error</title>
<style type="text/css">
<!--
p {
	margin-top: 0px;
	margin-bottom: 6px;
}
    .style1
    {
    }
    .style2
    {
        height: 31px;
    }
-->
</style>
<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">
 <div id="header_phone">1-800-247-1526</div>
<div id="headline">Gracias por su pago</div>
<div class="header">
  <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"></div>
<div class="swoosh_container">
</div>
<div class="body_copy_container_Fullwidth" style="text-align:center; padding-bottom:30px">
<p><%Response.Write(Session("ordermessage")) %>&nbsp;</p>
              <p>Imprima esta información para su propio registro.&nbsp;              
              <p>&nbsp; </p>
</div>

<div style="clear:left"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 
</div>
</div>
</div>

</body>
</html>