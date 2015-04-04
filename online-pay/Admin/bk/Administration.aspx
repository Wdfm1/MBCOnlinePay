<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Administration.aspx.vb" Inherits="Admin_Administration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administration</title>

<link href="../css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
    </head>
<body background="../Images/background.jpg" link="blue">
    <form id="form1" runat="server">
<div id="page">
 <div id="header_phone">1-800-247-1526</div>
<div id="headline">Administration</div>
<div class="header">
   
  <a href="http://memorybook.com/"><img src="../css/header2.png" alt="Memory Book Header" width="292" height="120" 
        border="0"/></a>
        <asp:Label
      ID="lblschname" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White"></asp:Label>
&nbsp;<asp:Label
      ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White">PAY SITE</asp:Label> &nbsp;
        
        </div>
<div class="swoosh_container">
</div>


<div class="body_copy_container_Fullwidth" style="text-align:center; padding-bottom:30px">
<div align="left">
    <asp:RadioButtonList ID="rbpanels" runat="server" AutoPostBack="True" 
        RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="orders">Orders Placed</asp:ListItem>
        <asp:ListItem Value="class">Add Class Information</asp:ListItem>
    </asp:RadioButtonList>

    <asp:Panel ID="pnlorders" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Parent Orders Placed For" 
            Font-Bold="True" Font-Size="Large"></asp:Label>
        &nbsp;<asp:Label ID="lblschcode" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <div style="height: 39px">
        
            <asp:Button ID="Button1" runat="server" Text="Search Order Id" />
&nbsp;&nbsp;<asp:TextBox ID="txtorderid" runat="server" Width="72px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Search Student Last Name" 
                Width="188px" />
            &nbsp;<asp:TextBox ID="txtstudentname" runat="server" Width="259px"></asp:TextBox>
        
        </div>
        <div>
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
                <asp:TemplateField HeaderText="Student Name" SortExpression="studentname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("studentname") %>'></asp:TextBox>
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
<div align="center">
    <asp:Label ID="lblrecs" runat="server" Text="" ></asp:Label>
  </div>
<div align="right" style="height: 27px; font-weight: bold;">
    Please click on &quot;Print To Excel&quot; button to view the full report.&nbsp;&nbsp;<asp:Button 
        ID="Button3" runat="server" Text="Print To Excel" />
    &nbsp;</div>
   
    </asp:Panel>
    <asp:Panel ID="Pnldropdowns" runat="server" Visible="False">
    <div style="height: 29px">
        <asp:Label ID="Label3" runat="server" Text="Teacher information for school" 
            Font-Bold="True" Font-Size="Large"></asp:Label>
        <asp:Label
            ID="lblschcode2" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
    </div>
    <div style="height: 54px; width: 840px;">
        <asp:Label ID="Label11" runat="server" Text="Teacher:" Font-Bold="True"></asp:Label>
        &nbsp;<asp:TextBox ID="txtteacher" runat="server" Width="180px" Height="23px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Grade:" Font-Bold="True"></asp:Label>
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
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="Add Teacher To List" 
            ValidationGroup="g1" />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Teacher Name Required" ControlToValidate="txtteacher" 
            Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator>
</div>
<div>
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
        
        
        
        
        
        
        
        
        
        SelectCommand="SELECT orders.teacher, orders.schcode, orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal, orders.parentpayment, orders.booktype, orders.emailaddress, orders.yr, payment.orderid AS porderid, orders.perstext1, orders.perstext2, orders.schinvoicenumber, orders.paytype, orders.schname, payment.transid, payment.paytype AS Expr1, payment.ccnum, payment.authcode FROM orders LEFT OUTER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode) AND (orders.yr = '14') AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, orders.orderid">
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
</div>

<div style="clear:left"></div>
<div class="orange_spacer">
    
    </div>
 
<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved </div>
<script>
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
