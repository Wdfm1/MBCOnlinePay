<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ParentPayment.aspx.vb" Inherits="ParentPayment" %>



<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Parent Credit Card Payment</title>
 <style type="text/css">
        .shoppingcart {border:2px solid #000;}
        .shoppingcart .header{background-color:#800000;color:#ffffff;width:100%!important;height:auto!important;padding:5px 0px 5px 2px}
        .shoppingcart .header .column{float:left;width:120px;font-weight:bold;display:block }
        .shoppingcart .row{padding:3px}
        .shoppingcart .rowAlt{background-color:#FFFBD6;padding:3px}
        .shoppingcart .rowAlt .column{float:left;width:120px}
        .shoppingcart .row .column{float:left;width:120px}
        .smalltext{font-size:8px;font-style:italic}

        .columnEmpty{width:60px!important}
        .columnQty {width:40px!important;text-align:center!important;}
        .columnStudent {width:160px!important;}
        .columnTeacher {width:120px!important;}
        .columnIcons {width:120px!important;}
        .columnTotal{float:right!important;text-align:right!important;padding-right:10px}
        .shoppingcart .footer{text-align:right;float:right;width:100%!important}
        .shoppingcart .footer .column{background-color:white;border:2px solid #a8a8a8;width:70px;float:right;text-align:right;font-weight:bold;padding:10px}
         .clear {clear:left;}
        .floatLeft {float:left;}
        .submit1{width: 840px;
                padding-left: 0px;
                float:right; 
                text-align:right;
                font-family: "Titillium Web";
                font-size: 14px;
                font-weight: normal;color: #333;
                text-decoration: none;
	            line-height: 17px;
	            padding-top: 2px;
	            padding-right: 0px;
                background-color:gray ;
	       }
     #form1 {
         height: 1879px;
     }

    </style>

<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">

<div id="headline">Parent Order/Payment</div>

<div class="header">
    <a href="http://memorybook.com/"> <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"></a>
  <asp:Label
      ID="lblschname" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White"></asp:Label>
&nbsp;<asp:Label
      ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White">PAY SITE</asp:Label> &nbsp;
        </div>
<div class="swoosh_container">

</div>
   

<div class="body_copy_container_Fullwidth">

<span class="redtext"><strong>Check that your Pay Code and School Name below are 
    correct. If they are not, return to the previous page and carefully re-enter 
    your Pay Code.</strong></span>
</div>
<!--Get unit code from sending html form -->
<form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="body_copy_container_Fullwidth">
<div class="Green_Text_NEW"><%Response.Write(Session("cAddress"))%>
</div>
</div>
<div class="body_copy_container_Fullwidth" style="padding-bottom:10px; height: 34px;">
<div style="height: 39px; width: 857px;">
<span class="Text">Grade: </span>
    <asp:DropDownList ID="ddlgrade" runat="server" 
        Height="20px" Width="62px" AutoPostBack="True" DataSourceID="dsgrade" 
        DataTextField="grade" DataValueField="grade">
  </asp:DropDownList>
    
&nbsp;&nbsp;<span class="Text">&nbsp;&nbsp;Basic/Personalized:</span>
<asp:DropDownList ID="basic" runat="server" Height="26px" Width="253px" 
        AutoPostBack="True" Font-Bold="False" Font-Size="9pt">
</asp:DropDownList>
&nbsp;
    <span class="Text">Teacher: 
    <asp:TextBox ID="txtteacher" runat="server" style="margin-top: 0px" 
        Visible="False" Height="20px" Width="151px"></asp:TextBox>
&nbsp;</span><asp:DropDownList ID="dlteacher" runat="server" Height="22px" Width="149px" 
        DataSourceID="dsteacher" DataTextField="teacher" DataValueField="teacher">
    </asp:DropDownList>
    
    &nbsp;QTY:<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
        Width="32px" Height="20px">1</asp:TextBox>
    
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:RequiredFieldValidator 
          ControlToValidate="ddlgrade" ErrorMessage="Select Grade" 
        ID="RequiredFieldValidator2" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator 
          ControlToValidate="dlteacher" ErrorMessage="Select Teacher" 
        ID="rfteacher" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
    
    </div>
</div>
<div class="body_copy_container_Fullwidth">
<div >
    <div id="shpinfo" runat="server" visible="false">

        <div style="height: 142px">
            <div style="height: 24px">
                &nbsp;<asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="Large"
                    Font-Underline="True" Text="Shipping Information"></asp:Label>
                &nbsp;&nbsp;
            </div>
            <div style="height: 31px">
                &nbsp;&nbsp;&nbsp; Name: 
     <asp:TextBox ID="txtname" runat="server" Height="21px"
         Width="458px" MaxLength="90"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                    ControlToValidate="txtname" Display="Dynamic" ErrorMessage=" Name Required"
                    Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div style="height: 44px">
                Address:
    <asp:TextBox ID="txtaddress" runat="server" Width="361px" MaxLength="75"></asp:TextBox>
                &nbsp; City:
    <asp:TextBox ID="txtcity" runat="server" Width="305px" MaxLength="45"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
          ControlToValidate="txtaddress" Display="Dynamic"
          ErrorMessage="Address Required" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
          ControlToValidate="txtcity" Display="Dynamic" ErrorMessage="City Required"
          Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div style="height: 51px">
                &nbsp;&nbsp;&nbsp; State:&nbsp;
    <asp:DropDownList ID="ddlstate" runat="server" DataSourceID="dsStates"
        DataTextField="name" DataValueField="name" Height="23px" Width="223px">
    </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Postal Code:<asp:TextBox ID="txtzip"
                    runat="server" Width="302px" MaxLength="5"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server"
            ControlToValidate="txtzip" Display="Dynamic" ErrorMessage="Zip Code Required"
            Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
  <div id="perstext" runat="server" visible="false">
                        <span class="Text">Personalized Text&nbsp;&nbsp; </span><br />
                            <span class="Text">Line 1 Text</span>&nbsp;
                            <asp:TextBox ID="txtperstext1" runat="server" MaxLength="29" 
                                Width="300px" Enabled="False" ></asp:TextBox>
                                                    <font size="1">&nbsp; Choose &quot;Personalized YearBook&quot; From dropdown to enable.</font><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtperstext1" Enabled="False" 
                                ErrorMessage="Enter Text For Personalization in Line 1" Font-Bold="True">
</asp:RequiredFieldValidator>
      </div>

<div  style="height: 25px">
<div id="icontext" runat="server" visible="false">
    <asp:Label ID="lblchooseicon" runat="server" Text="Choose Your Icons"></asp:Label>&nbsp;&nbsp; 
    <asp:Label ID="Label15" runat="server" Text="(Icons are $1.25 extra per icon)" 
        Font-Italic="True" Font-Size="Smaller" ForeColor="#FF3300" Visible="False"></asp:Label><asp:Label ID="Label16" 
                            runat="server" Text="(Student portrait and name will appear on the Cover)" 
        Font-Italic="True" Font-Size="Large" ForeColor="#FF3300" Visible="False" 
        Font-Bold="True"></asp:Label>
</div> 
   <br />
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

                      
   </div>            
               
</div>
<div class="body_copy_container_Fullwidth">

<div>
  Student 
    First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Student Last Name:</div>
    <div>

    <asp:TextBox ID="studfname" runat="server" Width="190px" MaxLength="20"></asp:TextBox>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="studlname" runat="server" Width="190px" MaxLength="20"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
          ControlToValidate="studfname" ErrorMessage="Enter First Name" 
            ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
          ControlToValidate="studlname" ErrorMessage="Enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
</div>
    <br />
 Enter email address for receipt to your inbox: 
        <br />
        <asp:TextBox ID="txtcustemail" runat="server" Width="323px"></asp:TextBox>
         
        <br />

 
        <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
          ControlToValidate="txtcustemail" ErrorMessage="Invalid format for email address" 
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
          Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
          runat="server" ControlToValidate="txtcustemail" 
          ErrorMessage="Email address is required." Display="Dynamic" 
        ForeColor="Red"></asp:RequiredFieldValidator>
 
    <br />
&nbsp;
        <br />
   
        <asp:Button ID="Button1" runat="server" Text="Add to Order" Width="101px" 
        Height="26px" />
   
    <br />
   
    <br />
    <asp:ListView ID="lvItems" class="shoppingcart" runat="server" DataKeyNames="id" DataSourceID="dsorders">
        <AlternatingItemTemplate>
            <div class="rowAlt">
                <div class="column columnEmpty"><asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" /></div> 
                <div class="column columnQty"><%# Eval("itemqty")%></div> 
                <div class="column columnStudent"><%# Eval("studentfname") & " " & Eval("studentlname")%><br /> <%#  Eval("booktype") %> </div> 
                <div class="column columnTeacher"><%# Eval("teacher")%> <br/> <%#   Eval("grade")%></div> 
                <div class="column columnIcons"><%# Eval("perstext1")%> <br />  <div class="smalltext"><%# Eval("cap")%> <br /> <%# Eval("cap1")%></div></div> 
                <div class="column columnTotal"><%# Eval("itemamount")%></div> 
                <div style="clear:left"></div>
            </div>
        </AlternatingItemTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="column columnEmpty"> <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" /></div> 
                <div class="column columnQty"><%# Eval("itemqty")%></div> 
                <div class="column columnStudent"><%# Eval("studentfname") & " " & Eval("studentlname")%><br /> <%#  Eval("booktype") %> </div> 
                <div class="column columnTeacher"><%# Eval("teacher")%> <br/> <%#   Eval("grade")%></div> 
                <div class="column columnIcons"><%# Eval("perstext1")%> <br />  <div class="smalltext"><%# Eval("cap")%> <br /> <%# Eval("cap1")%></div></div> 
                <div class="column columnTotal"><%# Eval("itemamount")%></div> 
                <div style="clear:left"></div>
            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <table runat="server" style="background-color: #fff;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <div class="shoppingcart">
                <div class="header">
                    <div class="column columnEmpty">&nbsp;</div>
                    <div class="column columnQty">Qty</div>
                    <div class="column columnStudent">Student\Book Type</div>
                    <div class="column columnTeacher">Teacher\Grade</div>
                    <div class="column columnIcons">Line1 Text\Icons</div>
                    <div class="column columnTotal">Item Total</div>
                    <div class="clear"></div>
                </div>
                <div id="itemPlaceholder" runat="server">

                </div>
                <div class="footer">
                    <div class="clear"></div>
                    <div class="column">Total:<asp:Label ID="lbltotal" runat="server" OnInit="lbltotal_Init" Text="0.00"></asp:Label></div>
                </div>
            </div>
        </LayoutTemplate>
    </asp:ListView>

    
   

<div class="submit1 ">
     <asp:HiddenField ID="hforderid" runat="server" />
<asp:Button ID="Button2" runat="server" Text="Submit Payment" Width="119px" 
        style="height: 26px" UseSubmitBehavior="False" />
      
</div>
   
</div>
 
  
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

<asp:SqlDataSource ID="dsgrade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT distinct schcode, grade FROM dropdowninfo WHERE (schcode = @schcode) ORDER BY grade">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="038752" Name="schcode" 
                SessionField="schcode" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
  
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
    <asp:SqlDataSource ID="dsorders" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        InsertCommand="INSERT INTO temporders(grade, booktype, teacher, perstext1, perstext2, studentfname, emailaddress, schcode, itemamount, itemqty, schinvoicenumber, orderid, orddate, itemtotal, studentlname, schname, parentpayment, sname, saddress, scity, sstate, szip, yr, icon1, icon2, icon3, icon4, josicon1, josicon2, josicon3, josicon4) VALUES (@grade, @booktype, @teacher, @perstext1, @perstext2, @studentfname, @emailaddress, @schcode, @itemamount, @itemqty, @schinvoicenumber, @orderid, NOW(), @itemtotal, @studentlname, @schname, @parentpayment, @sname, @saddress, @scity, @sstate, @szip, @yr, @icon1, @icon2, @icon3, @icon4, @josicon1, @josicon2, @josicon3, @josicon4)" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT temporders.id, temporders.grade, temporders.booktype, temporders.teacher, temporders.perstext1, temporders.perstext2, temporders.studentfname, temporders.emailaddress, temporders.schcode, temporders.itemamount, temporders.itemqty, temporders.schinvoicenumber, temporders.orderid, temporders.orddate, temporders.paytype, temporders.itemtotal, temporders.studentlname, temporders.schname, temporders.parentpayment, temporders.yr, temporders.sname, temporders.saddress, temporders.scity, temporders.szip, concat_ws(',', lookup.caption, lookup_1.caption) AS cap, concat_ws(',', lookup_3.caption, lookup_2.caption) AS cap1 FROM temporders LEFT OUTER JOIN lookup lookup_2 ON temporders.icon4 = lookup_2.ivalue LEFT OUTER JOIN lookup lookup_3 ON temporders.icon3 = lookup_3.ivalue LEFT OUTER JOIN lookup lookup_1 ON temporders.icon2 = lookup_1.ivalue LEFT OUTER JOIN lookup ON temporders.icon1 = lookup.ivalue WHERE (temporders.orderid = @orderid)" 
        DeleteCommand="DELETE FROM temporders WHERE (id = @id)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="orderid" SessionField="orderid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsmisc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>"></asp:SqlDataSource>

   
    

     <%--<script type="text/javascript">
         function ShowImage() {
             document.getElementById('Image1').style.display = 'inherit';
             document.getElementById('Label11').style.display = 'inherit';
         }
</script>--%>
    

   
    <script type="text/javascript">
      
        $(document).ready(function () {
            $("#Button2").click(function () {
                document.getElementById('Image1').style.display = 'inherit';
                document.getElementById('Label11').style.display = 'inherit';
                $(this).prop("disabled", true);
                return true;
            });
        });

    </script>   
 <div style="clear:both"></div>
<div style="clear:left"></div>
  
<div class="orange_spacer"></div>
<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 
rights reserved 
</div> 
 </form>

</div>
</body>
</html>