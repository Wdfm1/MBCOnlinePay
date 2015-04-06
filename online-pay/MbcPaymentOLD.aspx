<%@ Page Language="vb" AutoEventWireup="false" Codefile="MbcPayment.aspx.vb" Inherits="MbcPayment" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Payment</title>
<style>
.black_overlay
{

display:none;
position: absolute;
top: 0%;
left: 0%;
width: 100%;
height: 250%;
background-color:black;
z-index:2001;
-moz-opacity: 0.1;
opacity:.10;
filter: alpha(opacity=10);
}
.white_content 
{

display:none;
z-index:4;
position: absolute;
top: 45%;
left: 30%;
width: 500px;
height:500px;
padding: 0px;
text-align:center;
background-color: transparent;
z-index:2002;
overflow: auto;
}
.label
{font-size:22px;
 
}

</style>
<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
</head>
<body background="Images/background.jpg" link="blue">

<div id="light" class="white_content"> 
    <asp:Label ID="Label11" runat="server" 
                    Text="Contacting payment portal. Please be patient." 
            Font-Bold="True" ForeColor="Black" style="display:none" ></asp:Label> 
   <asp:Image ID="Image1" runat="server" style="display:none"
        ImageUrl="~/MBCSecure/Images/loading.gif" Height="62px" Width="74px" /><br /><br />
                  </div>

<div id="fade" class="black_overlay"></div>

<div id="page">
  <form id="form1" runat="server">


 <div id="headline">Payments</div>



<div class="header">
  <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"/>
  <asp:Label
      ID="lblschname" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White"></asp:Label>
&nbsp;<asp:Label
      ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White">PAY SITE</asp:Label> &nbsp;</div>


<div class="swoosh_container">

</div>

<div class="body_copy_container_Fullwidth" style="text-align:center; padding-bottom:30px">
<div style="height: 36px">  
    <asp:RadioButtonList ID="rbpaytype" runat="server" 
        RepeatDirection="Horizontal" AutoPostBack="True">
        <asp:ListItem Selected="True" Value="CC">Pay With Credit Card</asp:ListItem>
        <asp:ListItem Value="EC">Pay With E-Check</asp:ListItem>
    </asp:RadioButtonList>    
      </div>
     <div align="left" style="height: 84px">
     <div style="width: 414px; float: left; height: 75px;">
         <asp:Label ID="Label3" runat="server" Text="Amount To Be Charged:"></asp:Label> 
         <asp:Label ID="lblamount" runat="server" Text="0.00" Font-Bold="True"></asp:Label> 
     
         <br />
         <asp:Label ID="Label5" runat="server" Text="Order Id:"></asp:Label>
         <asp:Label ID="lblorderid" runat="server" Font-Bold="True"></asp:Label>
         <br />
         <asp:Label ID="Label6" runat="server" Text="Email Address:"></asp:Label>
         <asp:Label ID="lblemailaddress" runat="server" Font-Bold="True"></asp:Label>
         <asp:HiddenField ID="hfschcode" runat="server" />
         <asp:HiddenField ID="hfschinvoicenumber" runat="server" />
          <asp:HiddenField ID="hfpaytype" runat="server" Value="CC" />
     </div>
    <div style="width: 237px; float: right;">
    
<script type="text/javascript" language="javascript">    var ANS_customer_id = "83749ad4-12da-4e7c-8d95-aa6fa3961da4";</script>
<script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" >
</script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Electronic Commerce</a><br />
<br /><img src="Images/Verisign-Secured.png" alt="" width="86" height="43"/>

    </div>
         
     </div>
 <div id="feature1"></div>
<div id="feature2"></div>
  <asp:Panel ID="CCPanel" runat="server">
<div align="left">
    <asp:Label ID="Label1" runat="server" Text="Credit Card Information" 
        Font-Bold="True" Font-Size="Large"></asp:Label>
    <br />
    <br />
    </div>
<div align="left" style="height: 34px"> <img src="Images/visa1_37x23_a.jpg" alt="Visa" height="22" border="0" />
<img src="Images/mc_accpt_023_gif.jpg" alt="Master Card" height="20" border="0" />
<img src="Images/discover.jpg" alt="Discover" border="0" style="width: 36px; height: 20px" /> 
<img src="Images/pay_logo_amex.gif" alt="Amerex" width="33" height="20" border="0" /> 
    <br />
    </div>
<div align="left">
<ul><li class="Text">Credit Card Number:&nbsp;
        <asp:TextBox ID="x_card_num" runat="server" Width="130px" MaxLength="16"></asp:TextBox>
  &nbsp;&nbsp;<span class="Text" style="margin-bottom:6px">Security Code</span>:&nbsp;
        <asp:TextBox ID="x_card_code" runat="server" Width="51px" MaxLength="16"></asp:TextBox>
    </li>
    <li class="error_text" style="margin-left:130px">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="x_card_num" Display="Dynamic" EnableClientScript="False" 
            ErrorMessage="Enter a card number"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
          ControlToValidate="x_card_code" ErrorMessage="Enter a security code" 
            Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
    </li>
<li style="margin-bottom:6px">
        <span class="Text" style="margin-bottom:6px">First Name:&nbsp;</span>
        <asp:TextBox ID="x_first_name" runat="server" Width="200px" 
             CausesValidation="True" MaxLength="30"></asp:TextBox>
       &nbsp;&nbsp;&nbsp;<span class="Text" style="margin-bottom:6px">Last Name:</span>&nbsp;
        <asp:TextBox ID="x_last_name" runat="server" Width="200px" 
             CausesValidation="True" MaxLength="30"></asp:TextBox>
       &nbsp;</li>
    <li class="error_text" style="margin-left:75px">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
          ControlToValidate="x_first_name" ErrorMessage="Enter a first name" 
            EnableClientScript="False"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
          ControlToValidate="x_last_name" ErrorMessage="Enter last name" 
            EnableClientScript="False"></asp:RequiredFieldValidator>
    </li>    
    <li class="Text" style="margin-bottom:6px">Enter Card Expiration Date:&nbsp;&nbsp;<asp:DropDownList 
            CssClass="Text" ID="ddlmonth" 
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
        <asp:DropDownList CssClass="Text" ID="ddlyear" 
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
            <asp:ListItem>2022</asp:ListItem>
            <asp:ListItem>2023</asp:ListItem>
        </asp:DropDownList>
&nbsp;Year&nbsp;&nbsp;<span class="error_text"><asp:RequiredFieldValidator 
          ControlToValidate="ddlmonth" 
          ErrorMessage="Enter a month for expiration date" 
            ID="RequiredFieldValidator8" runat="server" candrag="error_text" 
            EnableClientScript="False"></asp:RequiredFieldValidator>
        </span></li>
    <li class="error_text" style="margin-left:280px">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
          ControlToValidate="ddlyear" 
          ErrorMessage="Enter a year for expiration date" EnableClientScript="False"></asp:RequiredFieldValidator>
    </li>    
    </ul>
    </div>
<div>
<div align="left">
<asp:Label ID="Label4" runat="server" 
                    Text="Contacting payment portal. Please be patient." 
            Font-Bold="True" ForeColor="Black" style="display:none" ></asp:Label> 
   <asp:Image ID="Image2" runat="server" style="display:none"
        ImageUrl="~/MBCSecure/Images/loading.gif" Height="62px" Width="74px" />
                  </div>

</div>
 <div align="right">
     <asp:Button ID="ccsubmit" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />
        <br />
     Please only click the button once.</div>


    </asp:Panel>
  
  <asp:Panel ID="ECPanel" runat="server" Visible="False">
    <div align="left" style="height: 29px">
        <asp:Label ID="Label2" runat="server" Text="E-Check Information" Font-Bold="True" 
            Font-Size="Large"></asp:Label>
       
    </div>
    <div align="left">
   
       <ul>
        <li class="Text"><span class="Text">Customer&#39;s Name (as it appears on bank 
            account):</span></li>
        <li class="error_text">
            <asp:TextBox ID="x_bank_acct_name" runat="server" Width="260px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfCustName" runat="server" 
                ControlToValidate="x_bank_acct_name" 
                ErrorMessage="Bank customer name is required" EnableClientScript="False"></asp:RequiredFieldValidator>
        </li>
        <li class="Text" style="margin-bottom:6px">Bank Name:</li>
        <li class="error_text">
            <asp:TextBox ID="x_bank_name" runat="server" ToolTip="Name of bank" 
                Width="260px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfbankname" runat="server" 
                ControlToValidate="x_bank_name" ErrorMessage="Bank name is required" 
                Display="Dynamic" EnableClientScript="False"></asp:RequiredFieldValidator>
        </li>
        <li class="Text" style="margin-bottom:6px">Bank Account Type: (choose one)</li>
        <li class="error_text">
            <asp:DropDownList ID="x_bank_acct_type" runat="server" AutoPostBack="True" 
                Height="24px" Width="260px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem>CHECKING</asp:ListItem>
                <asp:ListItem Value="BUSINESSCHECKING">BUSINESS CHECKING</asp:ListItem>
                <asp:ListItem>SAVINGS</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfacctype" runat="server" 
                ControlToValidate="x_bank_acct_type" 
                ErrorMessage="Account type is required" Display="Dynamic" 
                EnableClientScript="False"></asp:RequiredFieldValidator>
        </li>
        <li class="Text" style="margin-bottom:6px">Bank&#39;s ABA Routing Number:
            <span class="Textlink" onmouseout="MM_showHideLayers('feature1','','hide')" 
                onmouseover="MM_showHideLayers('feature1','','show')">What&#39;s This</span></li>
        <li class="error_text">
            <asp:TextBox ID="x_bank_aba_code" runat="server" causesvalidation="True" 
                MaxLength="9" ToolTip="First nine digits on check" Width="260px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfRoutingnume" runat="server" 
                ControlToValidate="x_bank_aba_code" 
                ErrorMessage="Routing number is required" Display="Dynamic" 
                EnableClientScript="False"></asp:RequiredFieldValidator>
        </li>
        <li class="Text" style="margin-bottom:6px">Bank Account Number: &nbsp;
            <span class="Textlink" onmouseout="MM_showHideLayers('feature2','','hide')" 
                onmouseover="MM_showHideLayers('feature2','','show')">What&#39;s This</span></li>
        <li class="error_text">
            <asp:TextBox ID="x_bank_acct_num" runat="server" MaxLength="16" 
                ToolTip="Last section of digits on check" Width="260px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfBankAcc" runat="server" 
                ControlToValidate="x_bank_acct_num" 
                ErrorMessage="Bank account number is required" Display="Dynamic" 
                EnableClientScript="False"></asp:RequiredFieldValidator>
        </li>
        </ul>
    </div>
    <div align="right">
        <asp:Button ID="ecsubmit" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />
        <br />
        Please only click the button once</div>
    </asp:Panel>
    <asp:SqlDataSource ID="dsorder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MbcConn %>" 
        ProviderName="<%$ ConnectionStrings:MbcConn.ProviderName %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dstemporders" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MbcConn %>" 
        ProviderName="<%$ ConnectionStrings:MbcConn.ProviderName %>"></asp:SqlDataSource>
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
</div>
</form>
<div style="clear:both"></div>
<div style="clear:left"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 

</div>
 <script type="text/javascript">
      
     $(document).ready(function () {
         $("#ccsubmit").click(function () {
             document.getElementById('Image2').style.display = 'inherit';
             document.getElementById('Label4').style.display = 'inherit';
             $(this).prop("disabled", true);
             return true;
         });
     });

    </script> 
<script 'javascript'>  

//function showoverlay ()
//{
//    document.getElementById('light').style.display = 'block'; document.getElementById('fade').style.display = 'block';
//    setTimeout('hideoverlay()', 10000);
//}
//function hideoverlay() {
//    document.getElementById('light').style.display = 'none'; document.getElementById('fade').style.display = 'none';
//}
</script>
<script type="text/javascript" language ="javascript">

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
  <script type="text/javascript">
      function MM_showHideLayers() { //v9.0
          var i, p, v, obj, args = MM_showHideLayers.arguments;
          for (i = 0; i < (args.length - 2); i += 3)
              with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
                  v = args[i + 2];
                  if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
                  obj.visibility = v;
              }
      }
</script>
</div>
</body>
</html>
