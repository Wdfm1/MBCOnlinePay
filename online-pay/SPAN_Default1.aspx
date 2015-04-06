<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SPAN_Default1.aspx.vb" Inherits="SPAN_Default1" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pago para padres</title>

<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">
<form id="form1" runat="server">


<div id="headline">
<asp:Label ID="lblpaytype" runat="server" >Página de pago para padres</asp:Label>
</div>

<div class="header">
    <a href="http://memorybook.com/"> <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"/></a></div>

<div class="swoosh_container">

</div>

<div class="body_copy_container_Fullwidth">

    <asp:HyperLink ID="h1" runat="server" Font-Size="14px" 
        NavigateUrl="~/Default.aspx">HyperLink</asp:HyperLink>
        <br />
    <br />
   Ingrese el código de pago en el cuadro de texto de más abajo y haga clic en Next (Siguiente) para continuar.
</div>

<!--Get unit code from sending html form -->
<div class="body_copy_container_FullwidthMOREPAD" style="height:57px">
&nbsp;<!-- (c) 2005, 2013. Authorize.Net is a registered trademark of CyberSource Corporation --><ul>
		<li class="error_text">
			<asp:TextBox ID="CustomerCode" runat="server" Width="124px" MaxLength="5" 
                      CausesValidation="True" style="height: 22px" 
        EnableViewState="False"></asp:TextBox>
              &nbsp;&nbsp;
                  <asp:RequiredFieldValidator  ControlToValidate="CustomerCode" 
                      ErrorMessage="Se requiere código de pago"  ID="RequiredFieldValidator1" 
        runat="server" precondition="error_text"></asp:RequiredFieldValidator>
		</li>
	</ul>
</div>

<div class="body_copy_container_FullwidthMOREPAD" style="padding-bottom:20px;padding-top:0px">
<div id="wrapper1"> <font color="red"><%Response.Write(Session("defaulterrormessage"))%><br />
      </font></div>
<div id="wrapper2">
<%  If Session("custtype") =”parent” Then
        Response.Write("<a style='color:blue' href='https://secure.memorybook.com/online-pay/SPAN_Default.aspx?paytype=parent'>(Para espa&ntilde;ol haga clic aqu&iacute;)</a>")
        End If%>
</div>

           
<br />
 
<br />
    
                 <asp:Button ID="Button1" runat="server" Text="Siguiente" 
        style="width:100px" OnClick="Button1_Click" />
                 <br />
                 <br />
 Si tiene preguntas acerca de cómo solicitar su anuario, <br />
                 comuníquese con el asesor de anuarios de su escuela. 

    
</div>
                 <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
                    SelectCommand="SELECT cust.* FROM cust">
      </asp:SqlDataSource>

</form>
<div style="clear:both"></div>
<div style="clear:left"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2014 • All rights reserved 
</div>
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
<!-- Start of Async HubSpot Analytics Code -->
    <script type="text/javascript">
        (function(d,s,i,r) {
            if (d.getElementById(i)){return;}
            var n=d.createElement(s),e=d.getElementsByTagName(s)[0];
            n.id=i;n.src='//js.hubspot.com/analytics/'+(Math.ceil(new Date()/r)*r)+'/306026.js';
            e.parentNode.insertBefore(n, e);
        })(document,"script","hs-analytics",300000);
    </script>
<!-- End of Async HubSpot Analytics Code -->
</body>
</html>
