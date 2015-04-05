<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Information.aspx.vb" Inherits="Information" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

   
   


</script>

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
<div class="Col_one_fullpad"><span class="redtext"> <strong>Check that your Unit Code and Unit Name below are correct. If they are not, return to the previous page and carefully re-enter your Unit Code. </strong></span>
</div>
<!--Get unit code from sending html form -->
<form id="form1" runat="server">
<div class="Green_Text" id="form_div"><%Response.Write(Session("cAddress"))%>
</div>
<div class="form_element">
<div id="feature1"></div>
<div id="feature2"></div>
<ul>
    <li class="error_text" style=" margin-bottom:9px"><span class="Text">Branch:</span>
        <asp:DropDownList ID="grade" runat="server" Height="25px" Width="105px">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>ARMY</asp:ListItem>
            <asp:ListItem>OTHER</asp:ListItem>
            <asp:ListItem>AIR FORCE</asp:ListItem>
            <asp:ListItem>NAVY</asp:ListItem>
            <asp:ListItem>MARINES</asp:ListItem>
            <asp:ListItem>COAST GUARD</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;<span class="Text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Basic/Personalized:<asp:DropDownList 
            ID="basic" runat="server" AutoPostBack="True" Height="23px" Width="235px">
        </asp:DropDownList>
        </span>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="grade" ErrorMessage="Enter Branch" 
            mm_ta_nowrap="error_text" Display="Dynamic" Font-Size="Smaller"></asp:RequiredFieldValidator>
            <br />
           <span class="Text"> Amount to be paid:<asp:Label ID="lblamount" 
            runat="server"></asp:Label></span>
&nbsp;</li>

<li class="Text" style="margin-bottom:6px">
<asp:Panel ID="Panel1" runat="server">
                          <span class="Text">Peronalized Text:</span><br />
                            <span class="Text">Line 1 Text</span>&nbsp;<asp:TextBox ID="txtperstext1" runat="server" MaxLength="29" 
                                Width="384px"></asp:TextBox>
                            <br />
                            <span class="Text">Line 2 Text</span>&nbsp;<asp:TextBox ID="txtperstext2" runat="server" MaxLength="29" 
                                Width="384px"></asp:TextBox>
                            <br />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtperstext1" Enabled="False" 
                                ErrorMessage="Enter Text For Personalization in Line 1" Font-Bold="True"></asp:RequiredFieldValidator>
                        </asp:Panel>
 </li>

<br />
 <li class="error_text" style=" margin-bottom:9px">
                         
                         <span class="Text">Shipping Address:</span>&nbsp; 
                            <asp:TextBox ID="txtaddr" runat="server" Width="476px" 
                                Height="22px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                             ControlToValidate="txtaddr" Display="Dynamic" 
                             ErrorMessage="Address Required" Font-Size="Smaller"></asp:RequiredFieldValidator>
    </li>
    <li class="error_text" style=" margin-bottom:9px">
                         
                         &nbsp;&nbsp;&nbsp;&nbsp;<span class="Text">City: <asp:TextBox ID="txtcity" runat="server" Height="21px" 
                                Width="230px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp; </span><span class="Text">State: </span><asp:TextBox ID="txtstate" 
                                runat="server" Height="21px" Width="40px" MaxLength="3"></asp:TextBox>
                            &nbsp; <span class="Text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         Postal Code: </span><asp:TextBox ID="txtzip" runat="server" 
                                Height="21px" Width="56px" MaxLength="5"></asp:TextBox></br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                             Display="Dynamic" ErrorMessage="City Required" ControlToValidate="txtcity" 
                             Font-Size="Smaller"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator 
                             ID="RequiredFieldValidator15" runat="server" 
                             Display="Dynamic" ErrorMessage="State Required" 
                             ControlToValidate="txtstate" Font-Size="Smaller"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                             Display="Dynamic" ErrorMessage="Postal Code Required" 
                             ControlToValidate="txtzip" Font-Size="Smaller"></asp:RequiredFieldValidator>
    </li>
    <li class="error_text" style=" margin-bottom:9px">
      <span class="Text"> Email Address:</span>
        <asp:TextBox ID="txtemail" runat="server" Width="294px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                             Display="Dynamic" ErrorMessage="Email Address Required" 
                             ControlToValidate="txtemail" Font-Size="Smaller"></asp:RequiredFieldValidator>
                        
       </li>
                       
</ul>
    <ul>
                      
  <li class="error_text" style=" margin-bottom:9px">
                         
                         <span class="Text">First Name:</span>&nbsp; 
                            <asp:TextBox ID="fname" runat="server" Width="237px"></asp:TextBox>
                       
&nbsp; <span class="Text">Last Name:<asp:TextBox ID="lname" runat="server" Width="236px"></asp:TextBox>
                       
                         </span>
&nbsp;<br  />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
          ControlToValidate="fname" ErrorMessage="Enter  First Name" Display="Dynamic" 
                             Font-Size="Smaller"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
          ControlToValidate="lname" ErrorMessage="Enter  Last Name" Display="Dynamic" 
                             Font-Size="Smaller"></asp:RequiredFieldValidator>
    </li>
        <li class="error_text" style=" margin-bottom:9px"><span class="Text">Unit Leader:</span>&nbsp; 
                            <asp:TextBox ID="teachname" runat="server" Width="381px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="teachname" ErrorMessage="Unit Leader" 
                Display="Dynamic" Font-Size="Smaller"></asp:RequiredFieldValidator>
    </li>                     
                       
</ul>
</div>
<div class="form_element_submitbutton">
<asp:Button ID="Button2" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />  
&nbsp;
            
            <asp:HiddenField 
              ID="x_method" runat="server" Value="ECHECK" /> 
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
            <asp:HiddenField ID="x_recurring_billing" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_relay_response" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_delim_data" runat="server" Value="TRUE" />
    <asp:HiddenField ID="x_schcode" runat="server" />
            
            &nbsp;&nbsp;
            <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MilitaryConn %>" 
                    ProviderName="<%$ ConnectionStrings:MilitaryConn.ProviderName %>" 
                    SelectCommand="SELECT cust.* FROM cust"> </asp:SqlDataSource>
</div>

</form>
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
  <strong class="Text10boldwhite">Printed In the USA:10px; background-color:#666633">
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
} catch(err) {}</script>
</body>
</html>
