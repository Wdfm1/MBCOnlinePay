<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ParentPayment.aspx.vb" Inherits="ParentPayment" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Parent Payment</title>
    <!-- Bootstrap core CSS -->
    <link href="new_look/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
.shoppingcart {border:2px solid #000;}
        .shoppingcart .header{background-color:#800000;color:#ffffff;width:100%!important;height:auto!important;padding:5px 0px 5px 2px}
        .shoppingcart .header .column{float:left;width:120px;font-weight:bold;display:block }
        .shoppingcart .row{padding:3px;margin:0px !important}
        .shoppingcart .rowAlt{background-color:gainsboro;padding:3px;margin:0px !important}
        .shoppingcart .rowAlt .column{float:left;width:100%;}
        .shoppingcart .row .column{float:left;width:100%;}
        .smalltext{font-size:8px;font-style:italic}

         .columnTotal{float:right!important;text-align:right!important;padding-right:10px}
        .shoppingcart .footer{text-align:right;float:right;width:15%!important}
        .shoppingcart .footer .column{background-color:white;border:2px solid #a8a8a8;width:100%;float:right;text-align:right;font-weight:bold;padding:10px}
         .clear {clear:left;}
        .floatLeft {float:left;}

.listcontaino {
	background-color: #eee;
	position:relative;
	overflow:hidden;
	padding:.25em;
}
.infoCol {
	display: inline-block;
	width:25%;
	background-color:#7A090B;
	font-weight:bold;
	color:#FCF9F9;
	font-size:12px;
	padding:.5em;
	text-align:right
}
.ResutoCol {
	width:65%;
	background-color:#fff;
	font-weight:bold;
	color:#000;
	font-size:12px;
	display: inline-block;
	padding:.5em;
}
.deleteSelection {
	display: inline-block;
	width:25%;
	background-color:#eee;
	font-weight:bold;
	font-size:14px;
	padding:.5em;
	text-align:center
}		   
/* Smartphones (portrait and landscape) ----------- 
@media only screen 
and (min-device-width : 320px) 
and (max-device-width : 480px) {
	.columnEmpty{width:30px!important}
	.columnQty {width:20px!important;text-align:center!important;}
	.columnStudent {width:80px!important; font-size:24px}
	.columnTeacher {width:60px!important;}
	.columnIcons {width:60px!important;}
	.shoppingcart .rowAlt .column{float:left;width:60px;}
	.shoppingcart .row .column{float:left;width:60px;}
}*/

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
	width: 98%;
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
.pay_sidebar {
	width:266px;
	background-image:url(online-pay/new_look/sidebar.jpg);
	height:697px;
	background-repeat:no-repeat;
	display:block;
	float:left
}
.pay_contain {
	width:800px;
	height:697px;
	background-repeat:no-repeat;
	display:block;
	float:left
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
.formDivsTITLE {
	padding-left: 20px;
	padding-top: 8px;
	padding-bottom: 8px;
	font-family: "Open Sans", Arial, sans-serif;
	font-size: 20px;
	font-weight: bold;
	font-style: oblique;
}
.formDivsBottom {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:20px;
	font-family: "Open Sans", Arial, sans-serif;
}
.formContHolder {
	width:100%;
}
.formCont {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
}
.formCont30 {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
	width:30%;
	float:left;
	display:block;
}
.formCont50 {
	padding-left:20px;
	padding-top:8px;
	padding-bottom:8px;
	font-family: "Open Sans", Arial, sans-serif;
	width:50%;
	float:left;
	display:block;
}
    body,td,th {
	font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
}
    body {
	background-color: #E5E4E4;
}
.redtext {
	font-size: 10pt;
	font-style: normal;
	line-height: 12pt;
	color: #C00;
	text-decoration: none;
	font-family: Arial, Helvetica, sans-serif;
}
.Green_Text_NEW {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	font-variant: normal;
	color: #060;
	text-decoration: none;
	float: left;
	width: 100%;
	padding-top:6px;
	padding-bottom:6px;
	padding-left:20px;
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
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="formDivsTITLE">
  <asp:Label
      ID="lblschname" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="Black"></asp:Label>
  <asp:Label
      ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="Black">PAY SITE</asp:Label>
</div>
	<div class="hidden-xs headline">Parent Order/Payment
	</div>
    <div class="visible-xs headline2">Parent Order/Payment</div>
<div class="formDivs">
   <span class="redtext"><strong>Check that your Pay Code and School Name below are 
    correct. If they are not, return to the previous page and carefully re-enter 
    your Pay Code.</strong></span>
</div>
<div class="Green_Text_NEW"><%Response.Write(Session("cAddress"))%></div>

<div class="formContHolder">
<div class="col-md-11 formCont">Grade:<br>
<asp:DropDownList ID="ddlgrade" runat="server" 
        Height="26px" Width="62px" AutoPostBack="True" DataSourceID="dsgrade" 
        DataTextField="grade" DataValueField="grade">
  </asp:DropDownList>
  <asp:RequiredFieldValidator 
          ControlToValidate="ddlgrade" ErrorMessage="Select Grade" 
        ID="RequiredFieldValidator2" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
</div>
<div class="col-md-4 formCont">
Basic/Personalized:<br>
<asp:DropDownList ID="basic" runat="server" Height="26px" Width="253px" 
        AutoPostBack="True" Font-Bold="False" Font-Size="9pt">
</asp:DropDownList>
</div>
<div class="col-md-3 formCont">
Teacher:<br>
<asp:TextBox ID="txtteacher" runat="server" style="margin-top: 0px" 
        Visible="False" Height="26px" Width="151px"></asp:TextBox>
&nbsp;</span><asp:DropDownList ID="dlteacher" runat="server" Height="26px" Width="149px" 
        DataSourceID="dsteacher" DataTextField="teacher" DataValueField="teacher">
    </asp:DropDownList>
</div>
<div class="col-md-3 formCont">
QTY:<br>
<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
        Width="32px" Height="26px">1</asp:TextBox>
        <asp:RequiredFieldValidator 
          ControlToValidate="dlteacher" ErrorMessage="Select Teacher" 
        ID="rfteacher" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
</div>
</div>
<div style="clear:left; height:0px"></div>



<div id="shpinfo" runat="server" visible="false">
            <div class="formDivsTITLE">
               <asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="Large"
                    Text="Shipping Information"></asp:Label>
            </div>
	<div class="formCont">
            Name:<br>
          <asp:TextBox ID="txtname" runat="server" Height="26px"
         Width="400px" MaxLength="90"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                    ControlToValidate="txtname" Display="Dynamic" ErrorMessage=" Name Required"
                    Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <div class="formCont">
                Address:<br>
              <asp:TextBox ID="txtaddress" runat="server" Height="26px" Width="361px" MaxLength="75"></asp:TextBox>
                &nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
          ControlToValidate="txtaddress" Display="Dynamic"
          ErrorMessage="Address Required" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <div class="formCont">City:<br>
              <asp:TextBox ID="txtcity" runat="server" Width="305px" MaxLength="45"></asp:TextBox>
&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
          ControlToValidate="txtcity" Display="Dynamic" ErrorMessage="City Required"
          Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="formCont">
 State:<br>
    <asp:DropDownList ID="ddlstate" runat="server" DataSourceID="dsStates"
        DataTextField="name" DataValueField="name" Height="26px" Width="223px">
    </asp:DropDownList>
    </div>
            <div class="formCont">
Postal Code:<asp:TextBox ID="txtzip"
                    runat="server" Height="26px" Width="302px" MaxLength="5"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server"
            ControlToValidate="txtzip" Display="Dynamic" ErrorMessage="Zip Code Required"
            Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
      </div>


<div class="formDivs" id="perstext" runat="server" visible="false">
                        Personalized Text&nbsp;&nbsp;<br />
                            Line 1 Text</span>&nbsp;
                            <asp:TextBox ID="txtperstext1" runat="server" MaxLength="29" 
                                Width="300px" Enabled="False" ></asp:TextBox>
                                                   &nbsp; Choose &quot;Personalized YearBook&quot; From dropdown to enable.<br />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtperstext1" Enabled="False" 
                                ErrorMessage="Enter Text For Personalization in Line 1" Font-Bold="True">
</asp:RequiredFieldValidator>
<div id="icontext" runat="server" visible="false">&nbsp;
  <asp:Label ID="lblchooseicon" runat="server" Text="Choose Your Icons"></asp:Label>
  &nbsp;<asp:Label ID="Label16" 
                            runat="server" Text="(Student portrait and name will appear on the Cover)" 
        Font-Italic="True" Font-Size="Large" ForeColor="#FF3300" Visible="False" 
        Font-Bold="True"></asp:Label>
        <asp:Label ID="Label15" runat="server" Text="(Icons are $1.25 extra per icon)" 
        Font-Italic="True" Font-Size="Smaller" ForeColor="#FF3300" Visible="False"></asp:Label>
</div>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div id="icons" runat="server" visible="false" >
<div style="float: left; width: 200px;">
    &nbsp;
    <asp:Label ID="lblicon1" runat="server" Text="First Icon"></asp:Label>
    &nbsp;&nbsp;<asp:DropDownList ID="ddlicon1" runat="server" 
        DataSourceID="dsicon" DataTextField="caption" DataValueField="ivalue" 
        AutoPostBack="True" Height="19px" Width="140px">
    </asp:DropDownList>

    &nbsp;&nbsp;&nbsp;

    <br />

    <asp:Image ID="imgicon1" runat="server" Height="66px" Width="73px" 
        ImageUrl="~/Images/Icons/0.jpg" />
</div>
<div style="float: left; width: 200px;">
    &nbsp;
    <asp:Label ID="lblicon2" runat="server" Text="Second Icon"></asp:Label>
    &nbsp;&nbsp;<asp:DropDownList ID="ddlicon2" runat="server" 
        DataSourceID="dsicon" DataTextField="caption" DataValueField="ivalue" 
        height="19px" AutoPostBack="True" Width="140px" Enabled="False">
    </asp:DropDownList>

    &nbsp;&nbsp;

    <br />

    <asp:Image ID="imgicon2" runat="server" Height="66px" Width="61px" 
        ImageUrl="~/Images/Icons/0.jpg" />
</div>
<div style="float: left; width: 200px; height: 108px;">
    &nbsp;
    <asp:Label ID="lblicon3" runat="server" Text="Third Icon"></asp:Label>
    &nbsp;&nbsp;<asp:DropDownList ID="ddlicon3" runat="server" 
        DataSourceID="dsicon" DataTextField="caption" DataValueField="ivalue" 
        height="19px" AutoPostBack="True" Width="140px" Enabled="False">
    </asp:DropDownList>

    &nbsp;&nbsp;

    <br />

    <asp:Image ID="imgicon3" runat="server" Height="60px" Width="59px" 
        ImageUrl="~/Images/Icons/0.jpg" />
</div>
<div style="float: left; width: 201px;">
    &nbsp;
    <asp:Label ID="lblicon4" runat="server" Text="Fourth Icon"></asp:Label>
    &nbsp;&nbsp;<asp:DropDownList ID="ddlicon4" runat="server" 
        DataSourceID="dsicon" DataTextField="caption" DataValueField="ivalue" 
        height="19px" AutoPostBack="True" Width="140px" Enabled="False">
    </asp:DropDownList>

    &nbsp;&nbsp;

    <br />

    <asp:Image ID="imgicon4" runat="server" Height="61px" Width="66px" 
        ImageUrl="~/Images/Icons/0.jpg" />
</div>
        </div>
</ContentTemplate></asp:UpdatePanel>
</div>
<div style="clear:left; height:0px"></div>
<div class="col-md-5 formCont">
Student First Name:<br>
<asp:TextBox ID="studfname" runat="server" Width="190px" MaxLength="20"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
          ControlToValidate="studfname" ErrorMessage="Enter First Name" 
            ForeColor="Red"></asp:RequiredFieldValidator>
</div>
<div class="col-md-5 formCont">
Student Last Name:<br>
<asp:TextBox ID="studlname" runat="server" Width="190px" MaxLength="20"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
          ControlToValidate="studlname" ErrorMessage="Enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
<div class="col-md-11 formCont">
 Enter email address for receipt to your inbox: <br>
        <asp:TextBox ID="txtcustemail" runat="server" Width="273px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
          ControlToValidate="txtcustemail" ErrorMessage="Invalid format for email address" 
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
          Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
          runat="server" ControlToValidate="txtcustemail" 
          ErrorMessage="Email address is required." Display="Dynamic" 
        ForeColor="Red"></asp:RequiredFieldValidator>        
</div>
<div class="col-md-11 formCont">
        <asp:Button ID="Button1" runat="server" Text="Add to Order" Width="101px" 
        Height="26px" />
</div>


<!--Listview Starts Here"-->
<div class="col-md-11 formCont" style="height: auto" >
   <asp:ListView ID="lvItems" class="shoppingcart" runat="server" DataKeyNames="id" DataSourceID="dsorders">
        <AlternatingItemTemplate>
            <div class="rowAlt">
		<div class="listcontaino">
			<div class="infoCol">Item Quantity:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("itemqty")%>&nbsp;&nbsp;&nbsp;@&nbsp;<%# Eval("itemamount")%></div> 
		</div>
		<div class="listcontaino">
			<div class="infoCol">Student Name & Booktype:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("studentfname") & " " & Eval("studentlname")%>&nbsp;/&nbsp;<%#  Eval("booktype") %></div>
		</div> 
		<div class="listcontaino">
			<div class="infoCol">Teacher & Grade:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("teacher")%>&nbsp;/&nbsp;<%#   Eval("grade")%></div>
		</div> 
		<div class="listcontaino">
			<div class="infoCol">Line1 Text & Icons:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("perstext1")%>&nbsp;/&nbsp;<span class="smalltext"><%# Eval("cap")%><%# Eval("cap1")%></span></div>
		</div>
		<div class="listcontaino">
			<div class="deleteSelection"> <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete Item" /></div>
			<div class="columnTotal"><%# Eval("itemamount")%></div> 
		</div>
            </div>
        </AlternatingItemTemplate>
        <ItemTemplate>
	<div class="row">
		<div class="listcontaino">
			<div class="infoCol">Item Quantity:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("itemqty")%>&nbsp;&nbsp;&nbsp;@&nbsp;<%# Eval("itemamount")%></div> 
		</div>
		<div class="listcontaino">
			<div class="infoCol">Student Name & Booktype:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("studentfname") & " " & Eval("studentlname")%>&nbsp;/&nbsp;<%#  Eval("booktype") %></div>
		</div> 
		<div class="listcontaino">
			<div class="infoCol">Teacher & Grade:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("teacher")%>&nbsp;/&nbsp;<%#   Eval("grade")%></div>
		</div> 
		<div class="listcontaino">
			<div class="infoCol">Line1 Text & Icons:&nbsp;</div>
			<div class="ResutoCol"><%# Eval("perstext1")%>&nbsp;/&nbsp;<span class="smalltext"><%# Eval("cap")%><%# Eval("cap1")%></span></div>
		</div>
		<div class="listcontaino">
			<div class="deleteSelection"> <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete Item" /></div>
			<div class="columnTotal"><%# Eval("itemamount")%></div> 
		</div>
	</div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div runat="server" style="background-color: #fff;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
               No data was returned.
            </div>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <div class="shoppingcart">
                <div id="itemPlaceholder" runat="server"> </div>
                <div class="footer">
                    <div class="clear"></div>
                    <div class="column" style="min-width:120px">Total:<asp:Label ID="lbltotal" runat="server" OnInit="lbltotal_Init" Text="0.00"></asp:Label></div>
                </div>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    </div>
    <div style="clear:both"></div>
<!--Listview Ends Here"-->
    <div class="col-md-11 formCont" align="right">
         <asp:HiddenField ID="hforderid" runat="server" />
<asp:Button ID="Button2" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />

    </div>
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
       
 <div style="clear:left"></div>
 <div class="formCont">

<div class="col-md-7 formCont" align="right">
     <asp:Label ID="Label11" runat="server" 
                    Text="Contacting payment portal. Please be patient." 
            Font-Bold="True" ForeColor="Black" style="display:none" ></asp:Label>
        </div>
            <div class="col-md-1 formCont" align="center">
     <asp:Image ID="Image1" runat="server" style="display:none" ImageUrl="~/images/loading.gif" /></div>
        <script type="text/javascript">
            function ShowImage() {
                document.getElementById('Image1').style.display = 'inherit';
                document.getElementById('Label11').style.display = 'inherit';
            }
</script>
</div>


<div class="formDivs">
    <asp:SqlDataSource ID="dsStates" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        SelectCommand="SELECT name, abrv, id FROM states ORDER BY name">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsicon" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT id, cvalue, isortorder, caption, ivalue, csortorder, typename FROM lookup WHERE (typename = 'ICON') ORDER BY caption">
    </asp:SqlDataSource>
   <asp:SqlDataSource ID="cus11" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
                    SelectCommand="SELECT cust.* FROM cust"> </asp:SqlDataSource>
   <asp:SqlDataSource ID="dsteacher" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT grade, teacher, schcode FROM dropdowninfo WHERE (schcode = @schcode) AND (grade = @grade)">
     <SelectParameters>
       <asp:SessionParameter DefaultValue="038752" Name="schcode" 
                SessionField="schcode" Type="String" />
       <asp:ControlParameter ControlID="ddlgrade" DefaultValue="0" Name="grade" 
                PropertyName="SelectedValue" />
     </SelectParameters>
   </asp:SqlDataSource>    

<asp:SqlDataSource ID="dsgrade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT distinct schcode, grade FROM dropdowninfo WHERE (schcode = @schcode) ORDER BY grade">
  <SelectParameters>
            <asp:SessionParameter DefaultValue="038752" Name="schcode" 
                SessionField="schcode" Type="String" />
        </SelectParameters>
  </asp:SqlDataSource>
<asp:SqlDataSource ID="dsorders" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        InsertCommand="INSERT INTO temporders(grade, booktype, teacher, perstext1, perstext2, studentfname, emailaddress, schcode, itemamount, itemqty, schinvoicenumber, orderid, orddate, itemtotal, studentlname, schname, parentpayment, sname, saddress, scity, sstate, szip, yr, icon1, icon2, icon3, icon4, josicon1, josicon2, josicon3, josicon4) VALUES (@grade, @booktype, @teacher, @perstext1, @perstext2, @studentfname, @emailaddress, @schcode, @itemamount, @itemqty, @schinvoicenumber, @orderid, NOW(), @itemtotal, @studentlname, @schname, @parentpayment, @sname, @saddress, @scity, @sstate, @szip, @yr, @icon1, @icon2, @icon3, @icon4, @josicon1, @josicon2, @josicon3, @josicon4)" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT temporders.id, temporders.grade, temporders.booktype, temporders.teacher, temporders.perstext1, temporders.perstext2, temporders.studentfname, temporders.emailaddress, temporders.schcode, temporders.itemamount, temporders.itemqty, temporders.schinvoicenumber, temporders.orderid, temporders.orddate, temporders.paytype, temporders.itemtotal, temporders.studentlname, temporders.schname, temporders.parentpayment, temporders.yr, temporders.sname, temporders.saddress, temporders.scity, temporders.szip, concat_ws(',', lookup.caption, lookup_1.caption) AS cap, concat_ws(',', lookup_3.caption, lookup_2.caption) AS cap1 FROM temporders LEFT OUTER JOIN lookup lookup_2 ON temporders.icon4 = lookup_2.ivalue LEFT OUTER JOIN lookup lookup_3 ON temporders.icon3 = lookup_3.ivalue LEFT OUTER JOIN lookup lookup_1 ON temporders.icon2 = lookup_1.ivalue LEFT OUTER JOIN lookup ON temporders.icon1 = lookup.ivalue WHERE (temporders.orderid = @orderid)" 
        DeleteCommand="DELETE FROM temporders WHERE (id = @id)">
  <DeleteParameters>
            <asp:ControlParameter ControlID="lvItems" Name="id" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="orderid" SessionField="orderid" />
        </SelectParameters>
  </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsmisc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>"></asp:SqlDataSource>
    <span class="col-md-11 formCont" style="height: 38px">
    </span></div>

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
