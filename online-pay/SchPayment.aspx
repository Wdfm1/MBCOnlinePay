<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SchPayment.aspx.vb" Inherits="SchPayment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>School Payment</title>

<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">
 <div id="header_phone">1-800-247-1526</div>
<div id="headline">For School Payment Only</div>
<div class="header">
  <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"></div>
<div class="swoosh_container">
</div>
<div class="body_copy_container_Fullwidth">
<span class="redtext"> <strong>Check that your School Code and School Name below are correct. If they are not, return to the previous page and carefully re-enter your School Code. </strong></span>
</div>
<div class="body_copy_container_Fullwidth">
<div class="Green_Text" id="form_div"><%Response.Write(Session("cAddress"))%>
</div>
</div>
<!--Get unit code from sending html form -->
<form id="form1" runat="server">

<div class="body_copy_container_Fullwidth" style="padding-bottom:40px">
<div id="AuthorizeNetSeal">
<script type="text/javascript" language="javascript">var ANS_customer_id="83749ad4-12da-4e7c-8d95-aa6fa3961da4";</script>
<script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" >
</script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Electronic Commerce</a><br />
<br /><img src="Images/Verisign-Secured.png" alt="" width="86" height="43"/>
</div>
<ul>
<li class="Text" style="margin-bottom:6px">Today's Payment Amount (Please use standard format $0.00)</li>
<li class="error_text"><asp:TextBox ID="x_amount" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
          ControlToValidate="x_amount" ErrorMessage="Enter an amount to be paid"></asp:RequiredFieldValidator></li>

<li class="Text" style="margin-bottom:6px"></li>
<li style="margin-bottom:6px"><img src="Images/visa1_37x23_a.jpg" alt="Visa" height="22" border=0></a> <img src="Images/mc_accpt_023_gif.jpg" alt="Master Card" height="20" border=0></a> <img src="Images/discover.jpg" alt="Discover" border="0" style="width: 36px; height: 20px" /> </a><img src="Images/pay_logo_amex.gif" width="33" height="20" border="0" /></li>
<li class="Text">Credit Card Number:&nbsp;
  <asp:TextBox ID="x_card_num" runat="server" Width="130px" MaxLength="16"></asp:TextBox>
  &nbsp;&nbsp;<span class="Text" style="margin-bottom:6px">Security Code</span>:&nbsp;
<asp:TextBox ID="x_card_code" runat="server" Width="51px" MaxLength="16"></asp:TextBox></li>
<li class="error_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
          ControlToValidate="x_card_code" ErrorMessage="Enter a card number"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
          ControlToValidate="x_card_code" ErrorMessage="Enter a security code"></asp:RequiredFieldValidator></li>
<li class="Text" style="margin-bottom:6px"><span class="Text" style="margin-bottom:6px">First Name:&nbsp;</span>
  <asp:TextBox ID="x_first_name" class="Test" runat="server" Width="200px" 
             CausesValidation="True"></asp:TextBox>
       &nbsp;&nbsp;&nbsp;<span class="Text" style="margin-bottom:6px">Last Name:</span>&nbsp;
       <asp:TextBox ID="x_last_name" class="Text" runat="server" Width="200px" 
             CausesValidation="True"></asp:TextBox>
       &nbsp;</li>
<li class="error_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
          ControlToValidate="x_first_name" ErrorMessage="Enter a first name"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
          ControlToValidate="x_last_name" ErrorMessage="Enter last name"></asp:RequiredFieldValidator></li>
<li class="Text" style="margin-bottom:6px">Enter Card Expiration Date:&nbsp;&nbsp;<asp:DropDownList AutoPostBack="True" CssClass="Text" ID="ddlmonth" 
          runat="server" causesvalidation="True" validationgroup="1">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>01</asp:ListItem>
    <asp:ListItem>02</asp:ListItem>
    <asp:ListItem>03</asp:ListItem>
    <asp:ListItem>04</asp:ListItem>
    <asp:ListItem>05</asp:ListItem>
    <asp:ListItem>06</asp:ListItem>
    <asp:ListItem>07</asp:ListItem>
    <asp:ListItem>08</asp:ListItem>
    <asp:ListItem>09</asp:ListItem>
    <asp:ListItem>10</asp:ListItem>
    <asp:ListItem>11</asp:ListItem>
    <asp:ListItem>12</asp:ListItem>
  </asp:DropDownList>
&nbsp;Month&nbsp;
<asp:DropDownList AutoPostBack="True" CssClass="Text" ID="ddlyear" 
          runat="server" causesvalidation="True" validationgroup="1">
  <asp:ListItem></asp:ListItem>
  <asp:ListItem>2012</asp:ListItem>
  <asp:ListItem>2013</asp:ListItem>
  <asp:ListItem>2014</asp:ListItem>
  <asp:ListItem>2015</asp:ListItem>
  <asp:ListItem>2016</asp:ListItem>
  <asp:ListItem>2017</asp:ListItem>
  <asp:ListItem>2018</asp:ListItem>
  <asp:ListItem>2019</asp:ListItem>
  <asp:ListItem>2020</asp:ListItem>
  <asp:ListItem>2021</asp:ListItem>
</asp:DropDownList>
&nbsp;Year&nbsp;&nbsp;<span class="error_text"><asp:RequiredFieldValidator 
          ControlToValidate="ddlmonth" 
          ErrorMessage="Enter a month for expiration date" ID="RequiredFieldValidator8" runat="server" candrag="error_text"></asp:RequiredFieldValidator></span></li>
<li class="error_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
          ControlToValidate="ddlyear" 
          ErrorMessage="Enter a year for expiration date"></asp:RequiredFieldValidator></li>
<li class="Text" style="margin-bottom:6px">Enter email address for receipt to your inbox: 
<asp:TextBox ID="txtcustemail" runat="server" Width="391px"></asp:TextBox></li>
<li class="error_text"> <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
          ControlToValidate="txtcustemail" ErrorMessage="Invalid format for email address" 
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
          Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
          runat="server" ControlToValidate="txtcustemail" 
          ErrorMessage="Email address is required." Display="Dynamic"></asp:RequiredFieldValidator></li>
</ul>

<!-- (c) 2005, 2013. Authorize.Net is a registered trademark of CyberSource Corporation -->

<asp:Button ID="Button2" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />
    <asp:HiddenField ID="x_exp_date" runat="server" />
    <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc" 
                    ProviderName="MySql.Data.MySqlClient" 
                    SelectCommand="SELECT cust.* FROM cust"> </asp:SqlDataSource></div>
</form>
<div style="clear:left"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 
</div>
</div>
</div>

</body>
</html>