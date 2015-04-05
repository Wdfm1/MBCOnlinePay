<%@ Page Language="VB" AutoEventWireup="false" CodeFile="error.aspx.vb" Inherits="MilitarySecure_error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Individaul Payment</title>
<link href="css/authnet_forms_mil.css" rel="stylesheet" type="text/css" />
<link href="css/Military_web_styles.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#004080">
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
        <div class="Col_one_fullpad"><span class="redtext"> <strong>&nbsp;</strong></span></div>
<!--Get unit code from sending html form -->
<form id="form1" runat="server">
     <div align="left" style="height: 40px">
     
    
         
     </div>
<div class="form_element">
<div id="feature1"></div>
<div id="feature2"></div>
<asp:Label ID="lblerror" runat="server" Font-Size="Large" 
        
		
        
        Text="A technical error has occurred. Please try placing your order again or contact Memorybook customer service at 1-800-247-1526" 
        Font-Bold="True"></asp:Label>
  
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
    <br />
    <br />
    <br />
    <br />
    <br />
  
</div>
<div class="form_element_submitbutton">

</div>

</form>
</div>

<div class="sidebar_right">
<div class="sidebar_time">
<script type="text/javascript">
    var d = new Date()
    var weekday = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
                    "Friday", "Saturday")
    var monthname = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
                    "Sep", "Oct", "Nov", "Dec")
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
    } catch (err) { }</script>
</body>
</html>
