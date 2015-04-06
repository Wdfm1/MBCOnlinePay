<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Administration.aspx.vb" Inherits="Admin_Administration" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Administration</title>
    <!-- Bootstrap core CSS -->
    <link href="../new_look/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
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
<script src="../new_look/modernizr.js"></script>
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
    <a href="http://memorybook.com/"><img src="../new_look/headbig.jpg" alt="Memory Book Header" width="90%" border="0" /></a></div>
    <div class="visible-xs headerASP"><img src="../new_look/logo-1.png" width="70%" alt="" style="margin-top:1em"/></div>
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
	<div class="hidden-xs headline">Administration</div>
    <div class="visible-xs headline2">Administration</div>
<div class="code_contain">
	<div class="formDivs">
    <asp:RadioButtonList ID="rbpanels" runat="server" AutoPostBack="True" 
        RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="orders">Orders Placed</asp:ListItem>
        <asp:ListItem Value="class">Add Class Information</asp:ListItem>
    </asp:RadioButtonList>
</div>
    <asp:Panel ID="pnlorders" runat="server">
	<div class="formDivs">
        <asp:Label ID="Label1" runat="server" Text="Parent Orders Placed For" 
            Font-Bold="True" Font-Size="Large"></asp:Label>
             &nbsp;<asp:Label ID="lblschcode" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
   <div class="formDivs">
            <asp:Button ID="Button1" runat="server" Text="Search Order Id" />
&nbsp;&nbsp;<asp:TextBox ID="txtorderid" runat="server" Width="72px"></asp:TextBox>
     </div>
        <div class="formDivs">
            <asp:Button ID="Button2" runat="server" Text="Search Student Last Name" 
                Width="188px" />
            &nbsp;<asp:TextBox ID="txtstudentname" runat="server" Width="259px"></asp:TextBox>
        </div>
	<div>
<div class="formDivs">
        <asp:GridView ID="GridView1" runat="server" CellPadding="2" ForeColor="#333333" 
            GridLines="None" Width="848px" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="dsorder" PageSize="4" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Order Id" SortExpression="orderid">
                    <ItemTemplate>
                        <asp:LinkButton ID="lborderid" runat="server" onclick="lborderid_Click" 
                            Text='<%# bind("orderid") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="orddate" HeaderText="Order Date" 
                    SortExpression="orddate">
                <ItemStyle Width="165px" />
                </asp:BoundField>
                <asp:BoundField DataField="itemtotal" HeaderText="Item Total" />
                <asp:TemplateField HeaderText="Student Name" SortExpression="studentlname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("studentfname") %>'></asp:Label>
                        &nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Bind("studentlname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="175px" />
                </asp:TemplateField>
                <asp:BoundField DataField="teacher" HeaderText="Teacher" 
                    SortExpression="teacher">
                <ItemStyle Width="175px" />
                </asp:BoundField>
                <asp:BoundField DataField="grade" HeaderText="Grade" InsertVisible="False" 
                    SortExpression="grade" />
                <asp:TemplateField HeaderText="Basic">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("booktype") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkbasic" runat="server" Enabled="False" />
                        <asp:Label ID="lblbooktype" runat="server" Text='<%# Bind("booktype") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No orders were found!
            </EmptyDataTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
  </div>
</div>
   <div class="formDivs" style="text-align:center">
    <asp:Label ID="lblrecs" runat="server" Text="" ></asp:Label>
  </div>
  
<div class="formDivs" style="height: 27px; font-weight: bold; text-align:right">
    Please click on &quot;Print To Excel&quot; button to view the full report.&nbsp;&nbsp;<asp:Button 
        ID="Button3" runat="server" Text="Print To Excel" />
    &nbsp;</div>
   
    </asp:Panel>
    <asp:Panel ID="Pnldropdowns" runat="server" Visible="False">
<div class="formDivs">
        <asp:Label ID="Label3" runat="server" Text="Teacher information for school" 
            Font-Bold="True" Font-Size="Large"></asp:Label>
        <asp:Label
            ID="lblschcode2" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
    </div>
<div class="formDivs">
        <asp:Label ID="Label11" runat="server" Text="Teacher:" Font-Bold="True"></asp:Label>
        &nbsp;<asp:TextBox ID="txtteacher" runat="server" Width="180px" Height="23px"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Teacher Name Required" ControlToValidate="txtteacher" 
            Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator>
	</div>
	<div class="formDivs">
        <asp:Label ID="Label12" runat="server" Text="Grade:" Font-Bold="True"></asp:Label>
        &nbsp;<asp:DropDownList
            ID="ddlgrade" runat="server" Height="23px" Width="171px">
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
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
            <asp:ListItem>KINDERGARTEN</asp:ListItem>
            <asp:ListItem>PREKINDERGARTEN</asp:ListItem>
            <asp:ListItem>STAFF</asp:ListItem>
            <asp:ListItem>OTHER</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="Add Teacher To List" 
            ValidationGroup="g1" />
</div>
<div class="formDivs">
    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="503px" AllowSorting="True" 
        AutoGenerateColumns="False" BorderColor="Black" BorderStyle="Solid" 
        BorderWidth="3px" DataSourceID="dsdropdowninfoadd" 
        AutoGenerateDeleteButton="True" DataKeyNames="id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="grade" HeaderText="Grade" SortExpression="grade" />
            <asp:BoundField DataField="teacher" HeaderText="Teacher" 
                SortExpression="teacher" />
            <asp:BoundField DataField="id" HeaderText="ID" Visible="False" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>

</div>
    </asp:Panel>



</div>
<asp:SqlDataSource ID="dsdropdowninfo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>"></asp:SqlDataSource>

<asp:SqlDataSource ID="dsorder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT orders.teacher, orders.schcode, orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal, orders.parentpayment, orders.booktype, orders.emailaddress, orders.yr, payment.orderid AS porderid, orders.perstext1, orders.perstext2, orders.schinvoicenumber, orders.paytype, orders.schname, payment.transid, payment.paytype AS Expr1, payment.ccnum, payment.authcode FROM orders INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode) AND (orders.yr = '15') AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, orders.orderid">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblschcode" DefaultValue="0" Name="schcode" 
            PropertyName="Text" />
        <asp:ControlParameter ControlID="txtstudentname" DefaultValue="0" 
            Name="studentlname" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtorderid" DefaultValue="0" Name="orderid" 
            PropertyName="Text" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsdropdowninfoadd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        InsertCommand="INSERT INTO dropdowninfo(schcode, grade, teacher) VALUES (@schcode, @grade,upper( @teacher))" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT grade, teacher, field, infotype, id, schcode FROM dropdowninfo WHERE (schcode = @schcode)" 
        DeleteCommand="DELETE FROM dropdowninfo WHERE (id = @id)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView2" Name="id" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="lblschcode" DefaultValue="0" Name="schcode" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlgrade" DefaultValue="12" Name="grade" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtteacher" Name="teacher" 
                PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lblschcode" DefaultValue="0" Name="schcode" 
                PropertyName="Text" />
        </SelectParameters>
  </asp:SqlDataSource>
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
    <script src="../new_look/bootstrap.min.js"></script>
    <script src="../new_look/docs.min.js"></script>
    <script src="../dist/js/respond.min.js"></script>
    
</body>
</html>
