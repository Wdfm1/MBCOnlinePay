Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports System.Globalization
Imports MySql.Data
Imports MySql.Data.MySqlClient
Partial Class ParentPayment
    Inherits System.Web.UI.Page
    Dim lbltotal As Label
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

        Dim shopcart As Cart = Session("Cart")
        SetTotal(shopcart.OrderId)
        MyBase.Render(writer)

    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        

    End Sub
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Page.EnableViewState = False   
 Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
        Page.MaintainScrollPositionOnPostBack = True
        If Not IsPostBack Then
            If IsNothing(Session("syslog")) Then
                '0,0=Browser
                '01=platform
                '02=  IP Address
                '03= Pament Page first access Datetime
                '04= submit button clicked Datetime
                Dim syslog(0, 5) As String
                Dim context As HttpContext = HttpContext.Current

                syslog(0, 0) = context.Request.Browser.Browser & " " & Request.Browser.Version
                syslog(0, 1) = context.Request.Browser.Platform
                syslog(0, 2) = context.Request.UserHostAddress
                syslog(0, 3) = DateTime.Now.ToString()
                If context.Request.Browser.IsMobileDevice Then
                    syslog(0, 4) = context.Request.Browser.MobileDeviceManufacturer & "/" & context.Request.Browser.MobileDeviceModel
                Else
                    syslog(0, 4) = ""
                End If
                Session.Add("syslog", syslog)
            End If
        End If
        LoadLic()

        Dim ShopCart As Cart = Nothing

        Select Case Session("schcode")
            Case "141724"
                'code to call java script to hide/show divs
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContenta", "ShowContent('shpinfo');", True)
                shpinfo.Visible = True
            Case "124581"

                'code to call java script to hide/show divs
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContenta", "ShowContent('shpinfo');", True)
                'Case Else
                '    'code to call java script to hide/show divs
                '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContenta", "HideContent('shpinfo');", True)
                shpinfo.Visible = True
        End Select

        If IsNothing(Session("Cart")) Then

            Session.Clear()
            Response.Redirect("default1.aspx")
        Else
            ShopCart = Session("Cart")
        End If
        lblschname.Text = ShopCart.schname
        Session("defaulterrormessage") = ""
        If Not IsPostBack Then
            ShopCart.OrderId = GetOrderId()
            Session.Add("orderid", ShopCart.OrderId)
            If ShopCart.basiconly = True Then
                Me.basic.Items.Add("YEARBOOK")
                Me.basic.SelectedValue = "YEARBOOK"
                If ShopCart.luvline = True Then
                    Me.basic.Items.Add("LUVLINE")
                End If
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContenta", "HideContent('perstext');", True)
                perstext.Visible = True

                ''code to call java script to hide/show divs
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent1", "HideContent('perstext');", True) 'personalized text box 
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent2", "HideContent('icontext');", True)
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent3", "HideContent('icons');", True)
            Else 'or personalized
                'If ShopCart.foilpers = True Then
                '    Label15.Visible = True
                'Else
                '    Label15.Visible = False
                'End If
                If ShopCart.picpers = True Then 'hide dropdowns________________
                    'code to call java script to hide/show divs
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icontext');", True)
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icons');", True) 'personalized text box 

                    'ddlicon1.Visible = False
                    'ddlicon2.Visible = False
                    'ddlicon3.Visible = False
                    'ddlicon4.Visible = False
                    'lblicon1.Visible = False
                    'lblicon2.Visible = False
                    'lblicon3.Visible = False
                    'lblicon4.Visible = False
                    'lblchooseicon.Visible = False
                Else
                    'code to call java script to hide/show divs
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContent1", "ShowContent('icontext');", True)
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContent2", "ShowContent('icons');", True)
                    'lblchooseicon.Visible = True
                    'Label16.Visible = False
                    'ddlicon1.Visible = True
                    'ddlicon2.Visible = True
                    'ddlicon3.Visible = True
                    'ddlicon4.Visible = True
                    'lblicon1.Visible = True
                    'lblicon2.Visible = True
                    'lblicon3.Visible = True
                    'lblicon4.Visible = True
                End If
                Me.basic.Items.Add("YEARBOOK")
                Me.basic.SelectedValue = "YEARBOOK"
                If ShopCart.LuvLine = True Then
                    Me.basic.Items.Add("LUVLINE")
                End If
                If ShopCart.inkpers Then
                    Me.basic.Items.Add("PERSONALIZED INK YEARBOOK")
                    'txtperstext1.Enabled = True
                ElseIf ShopCart.foilpers Then
                    Me.basic.Items.Add("PERSONALIZED FOIL YEARBOOK")
                    'txtperstext1.Enabled = True
                ElseIf ShopCart.picpers Then
                    'txtperstext1.Enabled = False
                    Me.basic.Items.Add("PERSONALIZED PICTURE YEARBOOK")
                ElseIf ShopCart.foiltxt Then
                    Me.basic.Items.Add("PERSONALIZED YEARBOOK")
                    'code to call java script to hide/show divs
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icontext');", True)
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icons');", True)
                    'ddlicon1.Visible = False
                    'ddlicon2.Visible = False
                    'ddlicon3.Visible = False
                    'ddlicon4.Visible = False
                    'lblicon1.Visible = False
                    'lblicon2.Visible = False
                    'lblicon3.Visible = False
                    'lblicon4.Visible = False
                    'lblchooseicon.Visible = False
                    'Label15.Visible = False
                ElseIf ShopCart.inktxt Then
                    Me.basic.Items.Add("PERSONALIZED YEARBOOKS")
                    'code to call java script to hide/show divs
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icontext');", True)
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icons');", True)
                    'ddlicon1.Visible = False
                    'ddlicon2.Visible = False
                    'ddlicon3.Visible = False
                    'ddlicon4.Visible = False
                    'lblicon1.Visible = False
                    'lblicon2.Visible = False
                    'lblicon3.Visible = False
                    'lblicon4.Visible = False
                    'lblchooseicon.Visible = False
                    'Label15.Visible = False
               

                Else   'personal with out icons	(this line for schools that booked before the foil with out icon line was put in. Take out after year 15)
                    Me.basic.Items.Add("PERSONALIZED_YEARBOOK")
                    'code to call java script to hide/show divs
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icontext');", True)
                    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "HideContent", "HideContent('icons');", True)
                    'ddlicon1.Visible = False
                    'ddlicon2.Visible = False
                    'ddlicon3.Visible = False
                    'ddlicon4.Visible = False
                    'lblicon1.Visible = False
                    'lblicon2.Visible = False
                    'lblicon3.Visible = False
                    'lblicon4.Visible = False
                    'lblchooseicon.Visible = False
                    'Label15.Visible = False
                End If

                'code to call java script to hide/show divs
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContent", "ShowContent('perstext');", True)
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContent", "ShowContent('icontext');", True)
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContent", "ShowContent('icons');", True)


            End If
        End If
    End Sub
	'Protected Sub UpdateDatabase()
	'	Dim berror As Boolean = False
	'	Dim name As String = ""
	'	Dim address As String = ""
	'	Dim city As String = ""
	'	Dim state As String = ""
	'	Dim zip As String = ""
	'	Try	'if panel is hid will fail use default vaue then
	'		name = txtname.Text
	'		address = txtaddress.Text
	'		city = txtcity.Text
	'		state = ddlstate.SelectedValue
	'		zip = txtzip.Text
	'	Catch ex As Exception

	'	End Try

	'	Dim ShopCart As Cart = Session("Cart")
	'	Dim orderDT As New DataTable
	'	orderDT=ShopCart.GetOrder 
	'	Dim orderid As Integer = GetOrderId()
	'	InsertSyslog(orderid)
	'	Dim strconn As String
	'	strconn = cus11.ConnectionString	'"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
	'	Dim conn As MySqlConnection = New MySqlConnection(strconn)
	'	Dim cmd As New MySqlCommand("", conn)
	'	Dim yr As String
	'	If Now.Month < 6 Then
	'		yr = Now.Year.ToString.Substring(2, 2)
	'	Else
	'		Dim ddate As DateTime = Now.AddYears(1)
	'		yr = ddate.Year.ToString.Substring(2, 2)


	'	End If
	'	Dim booktype, grade, teacher, perstext1, perstext2, studentfname, studentlname, emailaddress, schcode, schinvoicenumber As String
	'	Dim itemamount, itemtotal As Decimal
	'	Dim itemqty As Integer
	'	Try
	'		Label1.Visible = True
	'		Image1.Visible = True
	'		'cmd.Connection.Open()
	'		''For Each row As DataRow In ShopCart.order.Rows
	'		'For Each row As DataRow In orderDT.Rows
	'		'	cmd.Parameters.Clear()
	'		'	cmd.Parameters.AddWithValue("@orderid", orderid)
	'		'	cmd.Parameters.AddWithValue("@schname", lblschname.Text)
	'		'	grade = row("grade")
	'		'	cmd.Parameters.AddWithValue("@grade", grade)
	'		'	booktype = row("booktype")
	'		'	cmd.Parameters.AddWithValue("@booktype", booktype)
	'		'	teacher = row("teacher")
	'		'	cmd.Parameters.AddWithValue("@teacher", teacher)
	'		'	perstext1 = row("perstext1")
	'		'	cmd.Parameters.AddWithValue("@perstext1", perstext1)
	'		'	perstext2 = row("perstext2")
	'		'	cmd.Parameters.AddWithValue("@perstext2", perstext2)
	'		'	studentfname = row("studentfname")
	'		'	cmd.Parameters.AddWithValue("@studentfname", studentfname)
	'		'	studentlname = row("studentlname")
	'		'	cmd.Parameters.AddWithValue("@studentlname", studentlname)
	'		'	emailaddress = row("emailaddress")
	'		'	cmd.Parameters.AddWithValue("@emailaddress", emailaddress)
	'		'	schcode = row("schcode")
	'		'	cmd.Parameters.AddWithValue("@schcode", schcode)
	'		'	itemamount = row("itemamount")
	'		'	cmd.Parameters.AddWithValue("@itemamount", itemamount)
	'		'	itemtotal = row("itemtotal")
	'		'	cmd.Parameters.AddWithValue("@itemtotal", itemtotal)
	'		'	itemqty = row("itemqty")
	'		'	cmd.Parameters.AddWithValue("@itemqty", itemqty)
	'		'	schinvoicenumber = row("schinvoicenumber")
	'		'	cmd.Parameters.AddWithValue("@schinvoicenumber", schinvoicenumber)
	'		'	cmd.Parameters.AddWithValue("@yr", yr)

	'		'	cmd.Parameters.AddWithValue("@sname", name)
	'		'	cmd.Parameters.AddWithValue("@saddress", address)
	'		'	cmd.Parameters.AddWithValue("@scity", city)
	'		'	cmd.Parameters.AddWithValue("@sstate", state)
	'		'	cmd.Parameters.AddWithValue("@szip", zip)


	'		'	cmd.CommandText = "Insert into mbc.temporders (orddate,yr,parentpayment,schname,orderid,grade,booktype,teacher,perstext1,perstext2,studentfname,studentlname,emailaddress,schcode,itemamount,itemtotal,itemqty,schinvoicenumber,sname,saddress,scity,sstate,szip)Values(Now(),@yr,1,@schname,@orderid,@grade,@booktype,@teacher,@perstext1,@perstext2,@studentfname,@studentlname,@emailaddress,@schcode,@itemamount,@itemtotal,@itemqty,@schinvoicenumber,@sname,@saddress,@scity,@sstate,@szip);"


	'		'	cmd.ExecuteNonQuery()


	'		'Next
	'		'cmd.Connection.Close()

	'	Catch ex As Exception
	'		'berror = True

	'		''create the mail message
	'		'Dim mail As New MailMessage()
	'		''set the addresses
	'		''set the addresses
	'		'mail.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"))
	'		'mail.To.Add("randy@woodalldevelopment.com")
	'		''set the content
	'		'mail.Subject = "Mysql Error:Parent payment from " & lblschname.Text & "(" & schcode & ")"
	'		'mail.Body = "An error occured inserting a order record into the Mysql database server. The following data was not recorded in the payment table.<br/>" _
	'		'  & "School Name:" & lblschname.Text & "<br/>" _
	'		'  & "Student Name:" & studentfname & " " & studentlname & "<br/>" _
	'		'  & "School Code:" & schcode & "<br/>" _
	'		'  & "Grade:" & grade & "<br/>" _
	'		'  & "Teacher:" & teacher & "<br/>" _
	'		'  & "Book Type:" & booktype & "<br/>" _
	'		'  & "EmailAddress:" & emailaddress & "<br/>" _
	'		'  & "Perstext1:" & perstext1 & "<br/>" _
	'		'  & "Perstext2:" & perstext2 & "<br/>" _
	'		'  & "Item Amount:" & itemamount & "<br/>" _
	'		'  & "Item Total:" & itemtotal & "<br/>" _
	'		'  & "Item Qty:" & itemqty & "<br/>" _
	'		'  & "ShipName:" & name & "<br/>" _
	'		'  & "Ship Address:" & address & "<br/>" _
	'		'   & "Ship City:" & city & "<br/>" _
	'		' & "Ship State:" & state & "<br/>" _
	'		' & "Ship Zip:" & zip & "<br/>" _
	'		'  & "Year:" & yr & "<br/><br/>" _
	'		'  & "Mysql Exception Code:" & ex.Message
	'		'mail.IsBodyHtml = True
	'		''send the message
	'		'Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("SmtpServer"))
	'		'smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
	'		''smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
	'		'smtp.Send(mail)

	'		'MsgBox1.Show("Order Error", "There was an error placing your order. Please try again or contact your school advisor.", Nothing, New EO.Web.MsgBoxButton("OK", "", "updateerror"))

	'	End Try
	'	If berror = False Then
	'		Session.Clear()
	'		Response.Redirect("https://www.securepaymentportal.com/MBCSecure/MbcPayment.aspx?orderid=" & orderid)


	'		' Response.Redirect("http://192.168.1.101/MBCSecure/MbcPayment.aspx?orderid=" & orderid)
	'	Else

	'	End If

	'End Sub
	Private Function GetOrderId() As Integer
		Dim strconn As String
		Dim orderid As Integer
		Dim neworderid As Integer
		strconn = cus11.ConnectionString
		Dim conn As MySqlConnection = New MySqlConnection(strconn)
		Dim cmd As New MySqlCommand("", conn)
		cmd.CommandText = "SELECT value FROM sys where name='unordernum';"
		Try
			cmd.Connection.Open()
			orderid = cmd.ExecuteScalar() 'get the highest orderid in order table
			neworderid = orderid + 1
			cmd.CommandText = "Update sys set value=" & neworderid & " where name='unordernum';"
			cmd.ExecuteNonQuery()

		Catch ex As Exception
			orderid = 1
			'Now, send the email
			'Create an instance of the MailMessage class
			Dim objMM As New MailMessage()
			Dim tomail As String = ""
			Dim smtpclient As String = ""
			Dim cpassword As String = ""
			Dim cuser As String = ""
			tomail = Trim("randy@woodalldevelopment.com")
			smtpclient = ConfigurationManager.AppSettings("smtpserver")
			cuser = ConfigurationManager.AppSettings("smtpuser")
			cpassword = ConfigurationManager.AppSettings("smtppassword")
			'Set the properties
			objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
			Try
				objMM.To.Add(tomail)
				'objMM.To.Add("randy@woodalldevelopment.com")

			Catch ex1 As Exception

			End Try
			'Send the email in text format
			objMM.IsBodyHtml = True
			'Set the subject
			objMM.Subject = "Update to Unique Number Failed"
			Dim msg As String = "The updateing of the unique order id failed in the sys table. Check unordernum and increment if needed.</br>" & ex.Message
			objMM.Body = msg
			Dim smtp As New SmtpClient(smtpclient)
			smtp.Credentials = New NetworkCredential(cuser, cpassword)
			Try
				'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
				smtp.Send(objMM)
			Catch ex2 As Exception

			End Try
		Finally
			cmd.Connection.Close()
		End Try
		Return orderid

	End Function
	Protected Sub basic_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles basic.SelectedIndexChanged
        If Me.basic.SelectedValue = "YEARBOOK" Then
            dropdownenable(0)
            perstext.Visible = False
            icontext.Visible = False
            icons.Visible = False
            txtperstext1.Enabled = False
            txtperstext1.Text = ""
            Me.RequiredFieldValidator11.Enabled = False

        Else  'is personalization
            Dim shopcart As Cart = Session("Cart")
            If shopcart.picpers = True Then  'they get no text, message stating Picture with name.
                icontext.Visible = True
                Label16.Visible = True
                Label15.Visible = False
                txtperstext1.Enabled = True

                icons.Visible = False

                Me.RequiredFieldValidator11.Enabled = True
            ElseIf shopcart.inkpers = True Then

                perstext.Visible = True

                icontext.Visible = True

                icons.Visible = True
                Label15.Visible = False
                txtperstext1.Enabled = True
                Me.RequiredFieldValidator11.Enabled = True
            ElseIf shopcart.inktxt = True Then

                perstext.Visible = True

                icontext.Visible = False

                icons.Visible = False
                txtperstext1.Enabled = True
                Me.RequiredFieldValidator11.Enabled = True
            ElseIf shopcart.foilpers = True Then

                perstext.Visible = True

                icontext.Visible = True


                icons.Visible = True

                Label15.Visible = True
                txtperstext1.Enabled = True
                Me.RequiredFieldValidator11.Enabled = True
            ElseIf shopcart.foiltxt = True Then

                perstext.Visible = True


                icontext.Visible = False

                icons.Visible = False
                txtperstext1.Enabled = True
                Me.RequiredFieldValidator11.Enabled = True
            End If


        End If
	End Sub
	Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
		If CheckForOrder() Then	'true is duplicate an order was found ask customer if it is a duplicate
			Dim a As String = Session("duporder")
            MsgBox1.Show("Possible Duplicate", a, Nothing, New EO.Web.MsgBoxButton("Yes", "", "yessubmit"), New EO.Web.MsgBoxButton("No", "", "nosubmit"))
            Session.Remove("duporder")
		Else 'no duplicates go on
			InsertOrder()
		End If
	End Sub
	Protected Sub InsertOrder()
		Dim ShopCart As Cart = Session("Cart")
		Dim itemamount As Decimal
		Dim teacher As String
		Dim iconamt As String = GetIconAmt(ShopCart)
		Select Case basic.SelectedValue
			Case "YEARBOOK"
				itemamount = ShopCart.basicinvamt
			Case "PERSONALIZED INK YEARBOOK"
				itemamount = ShopCart.inkpersamt
			Case "PERSONALIZED FOIL YEARBOOK"
				itemamount = ShopCart.foilpersamt + CDec(iconamt)  'icons are extra add icon amount
			Case "PERSONALIZED PICTURE YEARBOOK"
				itemamount = ShopCart.picpersamt
			Case "PERSONALIZED YEARBOOK"
                itemamount = ShopCart.foiltxtamt
            Case "PERSONALIZED YEARBOOKS"
                itemamount = ShopCart.inktxtamt
			Case "PERSONALIZED_YEARBOOK"
				itemamount = ShopCart.persinvamt
		End Select
		If dlteacher.SelectedValue = "" Then
			teacher = txtteacher.Text
		Else
			teacher = dlteacher.SelectedValue
		End If
		'INSERT INTO temporders(grade, booktype, teacher, perstext1, perstext2, studentfname,
		'emailaddress, schcode, itemamount, itemqty, schinvoicenumber, orderid, orddate, paytype, itemtotal,
		'studentlname, schname, parentpayment, sname, saddress, scity, sstate, szip) VALUES (@grade, @booktype, @teacher,
		'@perstext1, @perstext2, @studentfname, @emailaddress, @schcode, @itemamount, @itemqty, @schinvoicenumber, @orderid,
		'@orddate, @paytype, @itemtotal, @studentlname, @schname, @parentpayment, @sname, @saddress, @scity, @sstate, @szip)

		dsorders.InsertParameters.Clear()
		dsorders.InsertParameters.Add("@orderid", ShopCart.OrderId)
		dsorders.InsertParameters.Add("@grade", ddlgrade.SelectedValue)
		dsorders.InsertParameters.Add("@booktype", basic.SelectedValue)
		dsorders.InsertParameters.Add("@teacher", teacher)
		dsorders.InsertParameters.Add("@perstext1", txtperstext1.Text)
		dsorders.InsertParameters.Add("@perstext2", "")
		dsorders.InsertParameters.Add("@studentfname", studfname.Text)
		dsorders.InsertParameters.Add("@emailaddress", txtcustemail.Text)
		dsorders.InsertParameters.Add("@schcode", ShopCart.schcode)
		dsorders.InsertParameters.Add("@itemamount", itemamount)
		dsorders.InsertParameters.Add("@itemqty", TextBox1.Text)
		dsorders.InsertParameters.Add("@itemtotal", (CInt(TextBox1.Text) * CDec(itemamount)))
		dsorders.InsertParameters.Add("@schinvoicenumber", ShopCart.invno)
		dsorders.InsertParameters.Add("@studentlname", studlname.Text)
		dsorders.InsertParameters.Add("@schname", ShopCart.schname)
		dsorders.InsertParameters.Add("@parentpayment", 1)
		dsorders.InsertParameters.Add("@sname", txtname.Text)
		dsorders.InsertParameters.Add("@saddress", txtaddress.Text)
		dsorders.InsertParameters.Add("@scity", txtcity.Text)
		dsorders.InsertParameters.Add("@sstate", ddlstate.SelectedValue)
		dsorders.InsertParameters.Add("@szip", txtzip.Text)
		dsorders.InsertParameters.Add("@icon1", ddlicon1.SelectedValue)
		dsorders.InsertParameters.Add("@icon2", ddlicon2.SelectedValue)
		dsorders.InsertParameters.Add("@icon3", ddlicon3.SelectedValue)
		dsorders.InsertParameters.Add("@icon4", ddlicon4.SelectedValue)
		Dim i1 As String = ""
		Dim i2 As String = ""
		Dim i3 As String = ""
		Dim i4 As String = ""

		Try
			i1 = GetJostID(ddlicon1.SelectedValue)
			i2 = GetJostID(ddlicon2.SelectedValue)
			i3 = GetJostID(ddlicon3.SelectedValue)
			i4 = GetJostID(ddlicon4.SelectedValue)
		Catch ex As Exception
			
		End Try
		dsorders.InsertParameters.Add("@josicon1", i1)
		dsorders.InsertParameters.Add("@josicon2", i2)
		dsorders.InsertParameters.Add("@josicon3", i3)
		dsorders.InsertParameters.Add("@josicon4", i4)

		Dim yr As String
		
		dsorders.InsertParameters.Add("@yr", ShopCart.yr)
		Try
			dsorders.Insert()
            'SetTotal(ShopCart.OrderId)
			Session("Cart") = ShopCart


		Catch ex As Exception


			'create the mail message
			Dim mail As New MailMessage()
			'set the addresses
			'set the addresses
			mail.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"))
			mail.To.Add("randy@woodalldevelopment.com")
			'set the content
			mail.Subject = "Mysql Error:Parent payment from " & lblschname.Text & "(" & ShopCart.schcode & ")"
			mail.Body = "An error occured inserting a order record into the Mysql database server. The following data was not recorded in the payment table.<br/>" _
			  & "School Name:" & lblschname.Text & "<br/>" _
			  & "Student Name:" & studfname.Text & " " & studlname.Text & "<br/>" _
			  & "School Code:" & ShopCart.schcode & "<br/>" _
			   & "Orderid:" & ShopCart.OrderId & "<br/>" _
			  & "Grade:" & ddlgrade.SelectedValue & "<br/>" _
			  & "Teacher:" & teacher & "<br/>" _
			  & "Book Type:" & basic.SelectedValue & "<br/>" _
			  & "EmailAddress:" & txtcustemail.Text & "<br/>" _
			  & "Perstext1:" & txtperstext1.Text & "<br/>" _
			 & "Item Amount:" & itemamount & "<br/>" _
			  & "Item Total:" & (CInt(TextBox1.Text) * CDec(itemamount)) & "<br/>" _
			  & "Item Qty:" & TextBox1.Text & "<br/>" _
			  & "ShipName:" & txtname.Text & "<br/>" _
			  & "Ship Address:" & txtaddress.Text & "<br/>" _
			   & "Ship City:" & txtcity.Text & "<br/>" _
			 & "Ship State:" & ddlstate.SelectedValue & "<br/>" _
			 & "Ship Zip:" & txtzip.Text & "<br/>" _
			  & "Year:" & yr & "<br/><br/>" _
			  & "Mysql Exception Code:" & ex.Message
			mail.IsBodyHtml = True
			'send the message
			Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("SmtpServer"))
			smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
			'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
			smtp.Send(mail)

			MsgBox1.Show("Order Error", "There was an error placing your order. Please try again or contact your school advisor.", Nothing, New EO.Web.MsgBoxButton("OK", "", "updateerror"))
		End Try



	End Sub
	Private Function GetJostID(ByVal iid As Integer) As String
		Dim retval As String = ""
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim selectcmd As String = "Select cvalue from lookup where ivalue=@ivalue;"
		Me.dsmisc.SelectCommand = selectcmd
		dsmisc.SelectParameters.Clear()
		dsmisc.SelectParameters.Add("@ivalue", iid)
		Try
			dvSql = CType(dsmisc.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception

		End Try
		If dvSql.Count > 0 Then
			For Each drvSql In dvSql
				retval = drvSql("cvalue").ToString()
			Next
		End If
		Return retval.ToString.Trim
	End Function
	Protected Sub SetTotal(orderid As Integer)
        Dim strconn As String
        Dim total As Decimal


        strconn = cus11.ConnectionString
        Dim conn As MySqlConnection = New MySqlConnection(strconn)
        Dim cmd As New MySqlCommand("", conn)
        cmd.CommandText = "SELECT sum(itemtotal) FROM temporders where orderid=" & orderid & ";"
        Try
            cmd.Connection.Open()
            total = cmd.ExecuteScalar() 'get the highest orderid in order table
            lbltotal.Text = total
            'txttotal.Text = total + 1	 Use in year 16 1 added per order for processing
        Catch ex As Exception
            lbltotal.Text = "0.00"   'all rows deleted returns dbnull
        End Try
	End Sub
	Protected Sub TextBox1_TextChanged(sender As Object, e As System.EventArgs) Handles TextBox1.TextChanged
		Try
			If CInt(TextBox1.Text) < 1 Then
				TextBox1.Text = 1
			End If

		Catch ex As Exception
			TextBox1.Text = 1
		End Try



	End Sub
	
	Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        '0,0=Browser
        '01=platform
        '02=  IP Address
        '03= Pament Page first access Datetime
        '04= submit button clicked Datetime
        If lvItems.Items.Count > 0 Then
            If IsNothing(Session("updated")) Then
                Try
                    Dim syslog As Array = Session("syslog")
                    syslog(0, 4) = DateTime.Now.ToString()
                    Session("syslog") = syslog
                Catch ex As Exception

                End Try
                Dim ShopCart As Cart = Session("Cart")
                'Image1.Visible = True
                'Label11.Visible = True
                Dim orderid As Integer = ShopCart.OrderId
                InsertSyslog(orderid)
                Session.Clear()

                Response.Redirect("https://www.securepaymentportal.com/MBCSecure/MbcPayment.aspx?orderid=" & orderid)


                ' Response.Redirect("http://192.168.1.101/MBCSecure/MbcPayment.aspx?orderid=" &shopCart.OrderId)

            Else
                'do nothing
            End If
        Else
            'Image1.Visible = False
            'Label11.Visible = False

        End If
	End Sub
    Protected Sub ddlgrade_DataBound(sender As Object, e As EventArgs) Handles ddlgrade.DataBound
        Dim itemcount As Integer = ddlgrade.Items.Count
        Dim i As Integer
        If itemcount <= 0 Then
            For i = 12 To 1 Step -1
                ddlgrade.Items.Add(i.ToString)

            Next
            ddlgrade.Items.Add("KINDERGARTEN")
            ddlgrade.Items.Add("PREKINDERGARTEN")
        End If
    End Sub
	Protected Sub dlteacher_DataBound(sender As Object, e As EventArgs) Handles dlteacher.DataBound
		Dim itemcount As Integer = dlteacher.Items.Count
		If itemcount <= 0 Then
			dlteacher.Visible = False
			txtteacher.Visible = True
			rfteacher.ControlToValidate = "txtteacher"
		Else
			dlteacher.Visible = True
			txtteacher.Visible = False
			rfteacher.ControlToValidate = "dlteacher"
		End If
	End Sub
	Private Function CheckForOrder() As Boolean
		Dim rstudfname, rstudlname, rorderid, rpayerlname, rpayerfname As String
		Dim rddate As String
		Dim retval As Boolean = False
		Dim strconn As String
		strconn = cus11.ConnectionString	'"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
		Dim conn As MySqlConnection = New MySqlConnection(strconn)
		Dim cmd As New MySqlCommand("", conn)
		Dim reader As MySqlDataReader
		cmd.Parameters.AddWithValue("@studentfname", studfname.Text.Trim)
		cmd.Parameters.AddWithValue("@studentlname", studlname.Text.Trim)
		cmd.Parameters.AddWithValue("@schcode", Session("schcode"))
		'need to change year each year
		cmd.CommandText = "Select orders.orderid,orders.studentfname,orders.studentlname,orders.orddate,payment.payerlname,payment.payerfname from orders" _
		 & " inner join payment on orders.orderid=payment.orderid where orders.studentfname=@studentfname and " _
		 & "orders.studentlname=@studentlname and orders.schcode=@schcode and orders.yr=15;"
		Try
			cmd.Connection.Open()
			reader = cmd.ExecuteReader

			If reader.HasRows Then
				retval = True
				While reader.Read()
					Try
						rorderid = IIf(IsDBNull(reader.Item(0)), "", reader.Item(0))
						rstudfname = IIf(IsDBNull(reader.Item(1)), "", reader.Item(1))
						rstudlname = IIf(IsDBNull(reader.Item(2)), "", reader.Item(2))
						rddate = IIf(IsDBNull(reader.Item(3)), "(No Date)", reader.Item(3))
						'rddate = reader.Item(3)
						rpayerlname = IIf(IsDBNull(reader.Item(4)), "", reader.Item(4))
						rpayerfname = IIf(IsDBNull(reader.Item(5)), "", reader.Item(5))
					Catch ex As Exception
						retval = False 'let things go if it bombs
					End Try


				End While
				Session.Add("duporder", "Our records shows there has been an order placed with this student name (" & rstudfname & " " & rstudlname & ") on " & rddate.ToString _
			  & " and paid for by " & rpayerfname & " " & rpayerlname & ". Do you still want to place an order?")
			Else
				retval = False
			End If
			reader.Close()
			cmd.Connection.Close()


		Catch ex As Exception

		End Try

		Return retval
	End Function
	Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
		If e.CommandName = "updateerror" Then
			Session.Clear()
			Response.Redirect("http://www.memorybook.com/online-pay/")
		End If
		If e.CommandName = "yessubmit" Then	'add order to grid
			InsertOrder()
		End If


	End Sub
	Protected Sub InsertSyslog(orderid As Integer)
		'0,0=Browser
		'01=platform
		'02=  IP Address
		'03= Pament Page first access Datetime
		'04= submit button clicked Datetime
		Try
			Dim syslog As Array = Session("syslog")
			Dim strconn As String
			strconn = cus11.ConnectionString	'"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
			Dim conn As MySqlConnection = New MySqlConnection(strconn)
			Dim cmd As New MySqlCommand("", conn)
			cmd.Parameters.AddWithValue("@orderid", orderid)
			cmd.Parameters.AddWithValue("@page", "ParentPayment.aspx")
			cmd.Parameters.AddWithValue("@platform", syslog(0, 1))
			cmd.Parameters.AddWithValue("@browser", syslog(0, 0))
			cmd.Parameters.AddWithValue("@ipaddress", syslog(0, 2))
			cmd.Parameters.AddWithValue("@pfatime", DateTime.Parse(syslog(0, 3)))
			cmd.Parameters.AddWithValue("@submittime", DateTime.Parse(syslog(0, 4)))
			cmd.Parameters.AddWithValue("@MobInfo", syslog(0, 5))
			cmd.CommandText = "Insert into mbc.syslog (orderid,page,browser,platform,ipaddress,pfatime,submittime,MobInfo) Values(@orderid,@page,@browser,@platform,@ipaddress,@pfatime,@submittime,@MobInfo);"
			Try
				cmd.Connection.Open()
				cmd.ExecuteNonQuery()
				cmd.Connection.Close()
			Catch ex As Exception

			End Try
		Catch ex As Exception

		End Try


	End Sub
	Private Sub LoadLic()
		EO.Web.Runtime.AddLicense( _
		 "b/8goVnt6QMe6KjlwbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560puQX" + _
		 "6J3c0fYZ9FuX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+Knc" + _
		 "wbP/4JvK+AMU71uX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf" + _
		 "+KncwbP/8Z7c2voQ9luX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb" + _
		 "6LEf+KncwbP49KXr7eEM5p6ZpAcQ8azg8//ooWqossHNn2i1kZvLn1mXpLHL" + _
		 "n3XY6PXL87Ln6c7Nwprj6f8P4KuZpAcQ8azg8//ooWqossHNn2i1kZvLn1mX" + _
		 "pLHLn3XY6PXL87Ln6c7Nwprj8PMM4qSZpAcQ8azg8//ooWqossHNn2i1kZvL" + _
		 "n1mXpLHLn3XY6PXL87Ln6c7NwIO43OYb66jY6PYdoVnt6QMe6KjlwbPcsGen" + _
		 "prHavUaBpLHLn1mXpLHn4J3bpAUk7560ptUU4KXm67PL9Z7p9/oa7XaZtcLZ" + _
		 "r1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvK9P0U863c9rPL9Z7p9/oa7XaZ" + _
		 "tcLZr1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvE5QQW5J286PofoVnt6QMe" + _
		 "6KjlwbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560ptgd6J2ZpAcQ8azg" + _
		 "8//ooWqossHNn2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwqjj8wP76Jzi6QPN" + _
		 "n6/c9gQU7qe0psLcrWmZpMDpjEOXpLHLn1mXpM0M452X+Aob5HaZ1wEQ66W6" + _
		 "7PYO6p7pprEh5Kvq7QAZvFuotb/boVmmwp61n1mXpLHLn1mz5fUPn63w9Pbo" + _
		 "oX7b7QUa8VuX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+Knc" + _
		 "wbP07Jre6esa7qaZpAcQ8azg8//ooWqossHNn2i1kZvLn1mXpLHLn3XY6PXL" + _
		 "87Ln6c7Nw6ju8v0a4J3c9rPL9Z7p9/oa7XaZtcLZr1uXs8+4iVmXpLHLn1mX" + _
		 "wPIP41nr/QEQvFu98AAM857pprEh5Kvq7QAZvFuotb/boVmmwp61n1mXpLHL" + _
		 "n1mz5fUPn63w9PbooYzj7fUQoVnt6QMe6KjlwbPcsGenprHavUaBpLHLn1mX" + _
		 "pLHn4J3bpAUk7560ptcX+Kjs+LPL9Z7p9/oa7XaZtcLZr1uXs8+4iVmXpLHL" + _
		 "n1mXwPIP41nr/QEQvFu86Pof4Jvj6d0M4Z7jprEh5Kvq7QAZvFuotb/boVmm" + _
		 "wp61n1mXpLHLn1mz5fUPn63w9PbooYXg9wXt7rGZpAcQ8azg8//ooWqossHN" + _
		 "n2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwqjk5gDt7rGZpAcQ8azg8//ooWqo" + _
		 "ssHNn2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwprn+PQT4FuX+vYd8qLm8s7N" + _
		 "sGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+KncwbP/7qjj2PoboVnt6QMe6Kjl" + _
		 "wbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560puMM86Ll67PL9Z7p9/oa" + _
		 "7XaZtcLZr1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvK8PoP5KuZpAcQ8azg" + _
		 "8//ooWqossHNn2i1kZvLn1mXwMAM66Xm+8+4iVmXpLHn7qvb6QP07Z/mpPUM" + _
		 "8560psPasXCmtsHcsluX+vYd8qLm8s7NsGmZpMDpjEOXpLHLu6zg6/8M867p" + _
		 "6c8a2HDs8bzi56PFt9wU12nQ0QAl4pvewc7nrqzg6/8M867p6c+4iXWm8PoO" + _
		 "5Kfq6c+4iXXj7fQQ7azcwp61n1mXpM0X6Jzc8gQQyJ21ucHfsW+vtMjgtnWm" + _
		 "8PoO5Kfq6doPvUaBpLHLn3Xj7fQQ7azc6c/nrqXg5/YZ8p7cwp61n1mXpM0M" + _
		 "66Xm+8+4iVmXpLHLn1mXwPIP41nr/QEQvFvE6Q==")
	End Sub
	Protected Sub dsorders_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorders.Deleted
		Dim ShopCart As Cart = Session("Cart")

		Session("Cart") = ShopCart
	End Sub
	Protected Sub ddlicon1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlicon1.SelectedIndexChanged
		Dim filename As String = CStr(ddlicon1.SelectedValue)
		Dim path As String = "~/images/icons/" & filename & ".jpg"
		imgicon1.ImageUrl = path
		dropdownenable(1)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContentdroplist", "ShowContent('icons');", True)
	End Sub
	Protected Sub ddlicon2_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlicon2.SelectedIndexChanged
		Dim filename As String = CStr(ddlicon2.SelectedValue)
		Dim path As String = "~/images/icons/" & filename & ".jpg"
		imgicon2.ImageUrl = path
        dropdownenable(2)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContentdroplist", "ShowContent('icons');", True)
	End Sub
	Protected Sub ddlicon3_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlicon3.SelectedIndexChanged
		Dim filename As String = CStr(ddlicon3.SelectedValue)
		Dim path As String = "~/images/icons/" & filename & ".jpg"
		imgicon3.ImageUrl = path
        dropdownenable(3)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContentdroplist", "ShowContent('icons');", True)
	End Sub
	Protected Sub ddlicon4_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlicon4.SelectedIndexChanged
		Dim filename As String = CStr(ddlicon4.SelectedValue)
		Dim path As String = "~/images/icons/" & filename & ".jpg"
        imgicon4.ImageUrl = path
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowContentdroplist", "ShowContent('icons');", True)
	End Sub
	Protected Sub dropdownenable(whichlist As Integer)
		Select Case whichlist
			Case 0 ' yearbook is/was selected
				imgicon1.ImageUrl = "~/images/icons/0.jpg"
				ddlicon1.SelectedValue = "0"
				ddlicon2.Enabled = False
				imgicon2.ImageUrl = "~/images/icons/0.jpg"
				ddlicon2.SelectedValue = "0"
				ddlicon3.Enabled = False
				imgicon3.ImageUrl = "~/images/icons/0.jpg"
				ddlicon3.SelectedValue = "0"
				ddlicon4.Enabled = False
				imgicon4.ImageUrl = "~/images/icons/0.jpg"
				ddlicon4.SelectedValue = "0"

			Case 1
				If ddlicon1.SelectedValue > 0 Then
					ddlicon2.Enabled = True
				Else
					ddlicon2.Enabled = False
					imgicon2.ImageUrl = "~/images/icons/0.jpg"
					ddlicon2.SelectedValue = "0"
					ddlicon3.Enabled = False
					imgicon3.ImageUrl = "~/images/icons/0.jpg"
					ddlicon3.SelectedValue = "0"
					ddlicon4.Enabled = False
					imgicon4.ImageUrl = "~/images/icons/0.jpg"
					ddlicon4.SelectedValue = "0"
				End If
			Case 2
				If ddlicon2.SelectedValue > 0 Then
					ddlicon3.Enabled = True
				Else
					ddlicon3.Enabled = False
					imgicon3.ImageUrl = "~/images/icons/0.jpg"
					ddlicon3.SelectedValue = "0"
					ddlicon4.Enabled = False
					imgicon4.ImageUrl = "~/images/icons/0.jpg"
					ddlicon4.SelectedValue = "0"
				End If
			Case 3
				If ddlicon3.SelectedValue > 0 Then
					ddlicon4.Enabled = True
				Else
					ddlicon4.Enabled = False
					imgicon4.ImageUrl = "~/images/icons/0.jpg"
					ddlicon4.SelectedValue = "0"
				End If
		End Select
	End Sub
	Private Function GetIconAmt(shopcart As Cart) As String
		Dim retval As String = "0"
		Dim ncount As Integer
		Dim ival As Decimal
		If shopcart.basiconly = True Then
			retval = 0
		ElseIf shopcart.inkpers = True Then
			retval = 0
		ElseIf shopcart.foilpers = True Then
			If ddlicon1.SelectedValue > "0" Then
				ncount = ncount + 1
			End If
			If ddlicon2.SelectedValue > "0" Then
				ncount = ncount + 1
			End If
			If ddlicon3.SelectedValue > "0" Then
				ncount = ncount + 1
			End If
			If ddlicon4.SelectedValue > "0" Then
				ncount = ncount + 1
			End If

			ival = ncount * 1.25
			retval = ival.ToString("N2")
		End If


		Return retval
	End Function

    Protected Sub lbltotal_init(sender As Object, e As EventArgs)
        lbltotal = sender

    End Sub
  
End Class

