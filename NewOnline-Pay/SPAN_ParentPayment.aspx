<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SPAN_ParentPayment.aspx.vb" Inherits="SPAN_ParentPayment" %>



<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Pago para padres con tarjeta de crédito</title>
<script type="text/javascript">
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
</script>
<link href="css/authnet_forms.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,700italic,600italic,400italic,300italic,200italic,200,600,300,700,900' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Exo:400,800,900' rel='stylesheet' type='text/css'/>
</head>
<body background="Images/background.jpg" link="blue">
<div id="page">

<div id="headline">Pedido/Pago para padres</div>

<div class="header">
    <a href="http://memorybook.com/"> <img src="css/header2.png" alt="Memory Book Header" width="292" height="120" border="0"/></a>
  <asp:Label
      ID="lblschname" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White"></asp:Label>
&nbsp;<asp:Label
      ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Large" ForeColor="White">SITIO DE PAGO</asp:Label> &nbsp;
        </div>
<div class="swoosh_container">

</div>


<div class="body_copy_container_Fullwidth">

<span class="redtext"><strong>Verifique que el código de pago y el nombre de la escuela que aparecen a continuación sean correctos. De no ser así, vuelva a la página anterior e ingrese nuevamente y con cuidado el código de pago.</strong></span>
</div>
<!--Get unit code from sending html form -->
<form id="form1" runat="server">
<div class="body_copy_container_Fullwidth">
<div class="Green_Text_NEW"><%Response.Write(Session("cAddress"))%>
</div>
</div>
<div class="body_copy_container_Fullwidth" style="padding-bottom:10px">
<div style="height: 39px; width: 857px;">
<span class="Text">Grado: </span>
    <asp:DropDownList ID="ddlgrade" runat="server" 
        Height="20px" Width="107px" AutoPostBack="True" DataSourceID="dsgrade" 
        DataTextField="grade" DataValueField="grade">
  </asp:DropDownList>
    
&nbsp;&nbsp;<span class="Text">&nbsp;&nbsp;Básico/personalizado:</span>
<asp:DropDownList ID="basic" runat="server" Height="20px" Width="201px" 
        AutoPostBack="True" Font-Bold="False" Font-Size="9pt">
</asp:DropDownList>
&nbsp;
    <span class="Text">Maestro: 
    <asp:TextBox ID="txtteacher" runat="server" style="margin-top: 0px" 
        Visible="False" Height="20px"></asp:TextBox>
&nbsp;</span><asp:DropDownList ID="dlteacher" runat="server" Height="20px" Width="186px" 
        DataSourceID="dsteacher" DataTextField="teacher" DataValueField="teacher">
    </asp:DropDownList>
    
    
    
    &nbsp;CANTIDAD:<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
        Width="32px" Height="20px">1</asp:TextBox>
    
    
    
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:RequiredFieldValidator 
          ControlToValidate="ddlgrade" ErrorMessage="Seleccionar un grado"  
        ID="RequiredFieldValidator2" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator 
          ControlToValidate="dlteacher" ErrorMessage="Seleccionar un maestro"  
        ID="rfteacher" runat="server" mm_ta_nowrap="error_text"></asp:RequiredFieldValidator>
    
    </div>
</div>
<div class="body_copy_container_Fullwidth">
<div>
   <asp:Panel ID="pnlShipInfo" runat="server" Visible="False" Height="142px">
<div style="height: 142px">
<div style="height: 24px">
    &nbsp;<asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="Large" 
        Font-Underline="True" Text="Información de envío"></asp:Label>
    &nbsp;&nbsp;
    </div>
 <div style="height: 31px">
     &nbsp;&nbsp;&nbsp; Nombre: 
     <asp:TextBox ID="txtname" runat="server" Height="21px" 
         Width="458px" MaxLength="90"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
         ControlToValidate="txtname" Display="Dynamic" ErrorMessage=" Nombre requerido"  
         Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
  <div style="height: 44px">
    Domicilio:
    <asp:TextBox ID="txtaddress" runat="server" Width="361px" MaxLength="75"></asp:TextBox>
    &nbsp; Ciudad:
    <asp:TextBox ID="txtcity" runat="server" Width="305px" MaxLength="45"></asp:TextBox>
      <br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
          ControlToValidate="txtaddress" Display="Dynamic" 
          ErrorMessage=" Domicilio requerido" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
          ControlToValidate="txtcity" Display="Dynamic" ErrorMessage="Ciudad Requerido" 
          Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
     </div>
    <div style="height: 51px">
        &nbsp;&nbsp;&nbsp; Estado:&nbsp;
    <asp:DropDownList ID="ddlstate" runat="server" DataSourceID="dsStates" 
        DataTextField="name" DataValueField="name" Height="23px" Width="223px">
    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Código Postal:
        <asp:TextBox ID="txtzip" runat="server" MaxLength="5" Width="302px"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
            ControlToValidate="txtzip" Display="Dynamic" ErrorMessage="Código postal requerido" 
            Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
</div>

</asp:Panel>

   <asp:Panel ID="Panel1" runat="server">
                        <span class="Text">Texto personalizado:</span><br />
                            <span class="Text">Texto de renglón 1</span>&nbsp;
                            <asp:TextBox ID="txtperstext1" runat="server" MaxLength="29" 
                                Width="300px" ></asp:TextBox>
                                                    <font size="1">&nbsp; Seleccionar &quot;Anuario personalizado&quot; Del menú desplegable para habilitar.</font><br />
                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtperstext1" Enabled="False" 
                                ErrorMessage="Ingrese texto para personalización en el renglón 1" Font-Bold="True">
</asp:RequiredFieldValidator>
                        </asp:Panel>

   </div>            
               
</div>
<div class="body_copy_container_Fullwidth">
<div>
<div>
  Alumno 
Nombre:&&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Apellido del alumno:</div>
    <div>

    <asp:TextBox ID="studfname" runat="server" Width="190px" MaxLength="20"></asp:TextBox>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="studlname" runat="server" Width="190px" MaxLength="20"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
          ControlToValidate="studfname" ErrorMessage="Ingrese el nombre" 
            ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
          ControlToValidate="studlname" ErrorMessage="Ingrese el apellido" 
            ForeColor="Red"></asp:RequiredFieldValidator>
</div>
    <br />
 Ingrese una dirección de correo electrónico de recepción:  
        <br />
        <asp:TextBox ID="txtcustemail" runat="server" Width="323px"></asp:TextBox>
         
        <br />

 
        <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
          ControlToValidate="txtcustemail" ErrorMessage="Formato no válido para dirección de correo electrónico"
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
          Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
          runat="server" ControlToValidate="txtcustemail" 
          ErrorMessage="Se requiere la dirección de correo electrónico."  Display="Dynamic" 
        ForeColor="Red"></asp:RequiredFieldValidator>
 
    <br />
&nbsp;
        <br />
   
        <asp:Button ID="Button1" runat="server" Text="Agregar al pedido" Width="143px" 
        Height="26px" />
   
    <br />
   
    <br />
    <div style="height: auto; border-style: solid; width: 840px;">
   <asp:GridView ID="GridView1" runat="server" Width="838px" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateDeleteButton="True" DataSourceID="dsorders" 
            DataKeyNames="id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Cantidad">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("itemqty") %>'></asp:Label>
                    @<br />
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("itemamount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alumno\Tipo de anuario">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("studentfname") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label55" runat="server" Text='<%# Bind("studentlname") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("booktype") %>'></asp:Label>
                    <br />
                </ItemTemplate>
                <ItemStyle Width="250px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Maestro\Grado">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("teacher") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("grade") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Texto de renglón 1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("perstext1") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("perstext2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total del artículo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("itemtotal") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="75px" HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
        </Columns>
        <EmptyDataTemplate>
         o hay artículos en el carrito.
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
    <div align="right" style="height: 38px">
        <asp:Label ID="Label1" runat="server" Text="Total: "></asp:Label>
        <asp:TextBox ID="txttotal" runat="server" ReadOnly="True" Width="60px">0.00</asp:TextBox>
    </div>
    <div>
    <div align="right" style="width: 417px; height: 52px; float: left;">
    <asp:Label ID="Label11" runat="server" 
                    Text="Contactando al portal de pago. Por favor, espere." 
            Font-Bold="True" ForeColor="Black" style="display:none" ></asp:Label>
       <asp:Image ID="Image1" runat="server" style="display:none" ImageUrl="~/images/loading.gif" />
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
<div align="right">
 

    <asp:HiddenField ID="hforderid" runat="server" />
<asp:Button ID="Button2" runat="server" Text="Enviar pago" Width="119px" 
        style="height: 26px"  onclientclick="ShowImage()" />
        <script type="text/javascript">
            function ShowImage() {
                document.getElementById('Image1').style.display = 'inherit';
                document.getElementById('Label11').style.display = 'inherit';
            }
</script>
</div>
</div>
</div>

</div>

<div class="body_copy_container_Fullwidth">    
    <asp:SqlDataSource ID="dsStates" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mbcConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        SelectCommand="SELECT name, abrv, id FROM states ORDER BY name">
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
        InsertCommand="INSERT INTO temporders(grade, booktype, teacher, perstext1, perstext2, studentfname, emailaddress, schcode, itemamount, itemqty, schinvoicenumber, orderid, orddate, itemtotal, studentlname, schname, parentpayment, sname, saddress, scity, sstate, szip, yr) VALUES (@grade, @booktype, @teacher, @perstext1, @perstext2, @studentfname, @emailaddress, @schcode, @itemamount, @itemqty, @schinvoicenumber, @orderid, NOW(), @itemtotal, @studentlname, @schname, @parentpayment, @sname, @saddress, @scity, @sstate, @szip, @yr)" 
        ProviderName="<%$ ConnectionStrings:mbcConnectionString.ProviderName %>" 
        
        
        SelectCommand="SELECT id, grade, booktype, teacher, perstext1, perstext2, studentfname, emailaddress, schcode, itemamount, itemqty, schinvoicenumber, orderid, orddate, paytype, itemtotal, studentlname, schname, parentpayment, yr, sname, saddress, scity, szip FROM temporders WHERE (orderid = @orderid)" 
        DeleteCommand="DELETE FROM temporders WHERE (id = @id)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="orderid" SessionField="orderid" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
   
    

   
    
</form>
<div style="clear:both"></div>
<div class="orange_spacer"></div>

<div class="page_footer"> Memory Book Company • © Copyright 2013 • All rights reserved 
</div>
</div>
</body>
</html>