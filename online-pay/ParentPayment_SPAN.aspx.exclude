<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ParentPayment_SPAN.aspx.vb" Inherits="ParentPayment_SPAN" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Parent Credit Card Payment</title>

<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">
  <div id="header_phone">1-800-247-1526</div>
<div id="headline">Tarjeta de cr&egrave;dito Pago Parent</div>
<div class="header">
  <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"></div>
<div class="swoosh_container"></div>

<div class="body_copy_container_Fullwidth">
<span class="redtext"><strong>Verifique que el c&oacute;digo de la escuela y el nombre de la escuela que aparecen a continuaci&oacute;n sean correctos. De no ser as&iacute;, vuelva a la p&aacute;gina anterior e ingrese nuevamente y con cuidado el c&oacute;digo de su escuela.</strong></span>
</div>
<!--Get unit code from sending html form -->
<form id="form1" runat="server">
<div class="body_copy_container_Fullwidth">
<div class="Green_Text_NEW"><%Response.Write(Session("cAddress"))%>
</div>
</div>
<div class="body_copy_container_Fullwidth" style="padding-bottom:10px">
<ul>
<li class="error_text" style=" margin-bottom:6px"><span class="Text">Grado:</span>
<asp:DropDownList ID="grade" runat="server" Height="22px" Width="105px">
  <asp:ListItem></asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem Value="11"></asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>KINDER</asp:ListItem>
        <asp:ListItem>PRE-KINDER</asp:ListItem>
        <asp:ListItem>OTRO</asp:ListItem>
  </asp:DropDownList>
&nbsp;&nbsp;<span class="Text">&nbsp;&nbsp;&nbsp; Anuario/personalizado:</span>
<asp:DropDownList ID="basic" runat="server" Height="21px" Width="211px" 
        AutoPostBack="True">
</asp:DropDownList>
&nbsp;
<asp:RequiredFieldValidator 
          ControlToValidate="grade" ErrorMessage="Ingrese el grado" 
        ID="RequiredFieldValidator2" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
</li>
</ul>
</div>
<div class="body_copy_container_Fullwidth">
<ul>
<li class="error_textSMALLER">

                        <asp:Panel ID="Panel1" runat="server">
                        <span class="Text">Texto personalizado:</span><br />
                            <span class="Text">Texto de rengl&oacute;n 1</span>&nbsp;
                          <asp:TextBox ID="txtperstext1" runat="server" MaxLength="29" 
                                Width="280px" ></asp:TextBox>
                            <br />
                            <span class="Text">Texto de rengl&oacute;n 2</span>&nbsp;
                          <asp:TextBox ID="txtperstext2" runat="server" MaxLength="29" 
                                Width="280px"></asp:TextBox>
                          <asp:TextBox ID="txtperstext3" runat="server" MaxLength="29" Visible="False" 
                                Width="280px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtperstext1" Enabled="False" 
                                ErrorMessage="Ingrese texto para personalizaci&oacute;n en el rengl&oacute;n 1" Font-Bold="True">
                          </asp:RequiredFieldValidator>
                        </asp:Panel>
                            
                        
</li>
</ul>
  <br />         
                
</div>
<div class="body_copy_container_Fullwidth">
<div id="AuthorizeNetSeal">
<script type="text/javascript" language="javascript">var ANS_customer_id="83749ad4-12da-4e7c-8d95-aa6fa3961da4";</script>
<script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" >
</script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Electronic Commerce</a><br />
<br /><img src="Images/Verisign-Secured.png" alt="" width="86" height="43"/>
</div>
<ul><li style="margin-bottom:6px">Nombre del alumno:</li>
    <li class="error_text">
        <asp:TextBox ID="studname" runat="server" Width="381px"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
          ControlToValidate="studname" ErrorMessage="Ingrese el nombre del alumno"></asp:RequiredFieldValidator>
    </li>
    <li style="margin-bottom:6px">Nombre del maestro:</li>
    <li class="error_text">
        <asp:TextBox ID="teachname" runat="server" Width="381px"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
          ControlToValidate="teachname" ErrorMessage="Ingrese el nombre del maestro"></asp:RequiredFieldValidator>
    </li>
    <li style="margin-bottom:6px">Monto del pago de hoy</li>
    <li class="error_text" style="margin-bottom:6px">
        <asp:TextBox ID="x_amount" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
          ControlToValidate="x_amount" ErrorMessage="Ingrese el monto a pagar"></asp:RequiredFieldValidator>
    </li>
    
</ul>

<img src="Images/visa1_37x23_a.jpg" alt="Visa" height="22" border=0></a> 
<img src="Images/mc_accpt_023_gif.jpg" alt="Master Card" height="20" border=0></a> 
<img src="Images/discover.jpg" alt="Discover" border="0" style="width: 36px; height: 20px" /> </a>
<img src="Images/pay_logo_amex.gif" width="33" height="20" border="0" />
</div>
<div class="body_copy_container_Fullwidth" style="padding-bottom:40px">
<ul><li class="Text">N&uacute;mero de tarjeta de cr&eacute;dito:&nbsp;
        <asp:TextBox ID="x_card_num" runat="server" Width="130px" MaxLength="16"></asp:TextBox>
  &nbsp;&nbsp;<span class="Text" style="margin-bottom:6px">C&oacute;digo de seguridad</span>:&nbsp;
        <asp:TextBox ID="x_card_code" runat="server" Width="51px" MaxLength="16"></asp:TextBox>
    </li>
    <li class="error_text" style="margin-left:80px">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
          ControlToValidate="x_card_code" ErrorMessage="Ingrese un n&uacute;mero de tarjeta"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
          ControlToValidate="x_card_code" ErrorMessage="Ingrese un c&oacute;digo de seguridad"></asp:RequiredFieldValidator>
    </li>
<li style="margin-bottom:6px">
        <span class="Text" style="margin-bottom:6px">Nombre:&nbsp;</span>
        <asp:TextBox ID="x_first_name" runat="server" Width="200px" 
             CausesValidation="True"></asp:TextBox>
       &nbsp;&nbsp;&nbsp;<span class="Text" style="margin-bottom:6px">Apellido:</span>&nbsp;
        <asp:TextBox ID="x_last_name" runat="server" Width="200px" 
             CausesValidation="True"></asp:TextBox>
       &nbsp;</li>
    <li class="error_text" style="margin-left:75px">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
          ControlToValidate="x_first_name" ErrorMessage="Ingrese el nombre"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
          ControlToValidate="x_last_name" ErrorMessage="Ingrese el apellido"></asp:RequiredFieldValidator>
    </li>    
    <li class="Text" style="margin-bottom:6px">Ingrese la fecha de vencimiento de la tarjeta:&nbsp;&nbsp;<asp:DropDownList AutoPostBack="True" CssClass="Text" ID="ddlmonth" 
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
&nbsp;Mes&nbsp;
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
&nbsp;A&ntilde;o</li>
    <li class="Text"><span class="error_text">
  <asp:RequiredFieldValidator 
          ControlToValidate="ddlmonth" 
          ErrorMessage="Ingrese un mes para la fecha de vencimiento" 
            ID="RequiredFieldValidator8" runat="server" candrag="error_text"></asp:RequiredFieldValidator>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
          ControlToValidate="ddlyear" 
          ErrorMessage="Ingrese un a&ntilde;o para la fecha de vencimiento"></asp:RequiredFieldValidator> </span></li>
    <li class="error_text" style="margin-left:280px">
    </li>    
 <li style="margin-bottom:6px">Ingrese una direcci&oacute;n de correo electr&oacute;nico a la cual enviar el recibo: 
        <asp:TextBox ID="txtcustemail" runat="server" Width="391px"></asp:TextBox>
    </li>
    <li class="error_text">
        <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
          ControlToValidate="txtcustemail" ErrorMessage="Formato no válido para direcci&oacute;n de correo electr&oacute;nico" 
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
          Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
          runat="server" ControlToValidate="txtcustemail" 
          ErrorMessage="Se requiere una direcci&oacute;n de correo electr&oacute;nico." 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </li>   
    </ul>

<!-- (c) 2005, 2013. Authorize.Net is a registered trademark of CyberSource Corporation -->



<asp:Button ID="Button2" runat="server" Text="Enviar pago" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />
    <asp:HiddenField ID="x_exp_date" runat="server" />
    <asp:HiddenField ID="x_schcode" runat="server" />
    <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc" 
                    ProviderName="MySql.Data.MySqlClient" 
                    SelectCommand="SELECT cust.* FROM cust"> </asp:SqlDataSource>
</div>
</form>
<div style="clear:left"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 
</div>
</div>
</body>
</html>