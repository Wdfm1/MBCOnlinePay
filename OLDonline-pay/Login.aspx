<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>

<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
    <style type="text/css">
        .style1
        {
            width: 173px;
        }
    </style>
    </head>
<body background="Images/background.jpg" link="blue">
    <form id="form1" runat="server">
<div id="page">
 <div id="header_phone">1-800-247-1526</div>
<div id="headline">Login</div>
<div class="header">
  <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"/></div>
<div class="swoosh_container">
</div>


<div class="body_copy_container_Fullwidth" style="text-align:center; padding-bottom:30px">
<div align="left">
   <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
                        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                        Font-Size="0.8em" ForeColor="#333333" Height="145px" 
                        DestinationPageUrl="~/Admin/Administration.aspx" 
        Width="354px">
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <LayoutTemplate>
      <table cellpadding="0" style="height:145px;width:auto;">
    <tr><td align="center" colspan="2" style="color:White;background-color:#666666;font-size:0.9em;font-weight:bold;">Log In</td></tr>
    <tr>
      <td width="138" align="right"><div class="name_password">
        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Schcode:</asp:Label>
      </div></td>
       <td class="style1"><asp:TextBox ID="UserName" runat="server" Font-Size="Small" Width="234px" Height="22px"></asp:TextBox><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator></td></tr>
    <tr><td align="right"><div class="name_password"><asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></div></td>
       <td class="style1"><asp:TextBox ID="Password" runat="server" Font-Size="Small" 
               TextMode="Password" Width="235px" Height="22px"></asp:TextBox><asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator></td></tr>
         
    <tr><td colspan="2"></td></tr>
    <tr><td align="center" colspan="2" style="color:Red;"> <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></td></tr>
    <tr><td align="right" colspan="2">
		<asp:Button ID="LoginButton" runat="server" 
            BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
            CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" 
            Text="Log In" ValidationGroup="Login1"  
            style="height: 18px" onclick="LoginButton_Click"  /></td></tr></table>   
    </LayoutTemplate>
                        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                        <TextBoxStyle Font-Size="0.8em" />
                        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                            ForeColor="White" /></asp:Login>
</div>
<asp:SqlDataSource ID="dslogin" runat="server" 
        ConnectionString="server=ts1;User Id=root;password=3l3phant1;Persist Security Info=True;database=mbc" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>"></asp:SqlDataSource>
      


</div>

<div style="clear:left"></div>
<div class="orange_spacer">
    
    </div>
 
<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 
</div>
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
    </form>
</body>
</html>
