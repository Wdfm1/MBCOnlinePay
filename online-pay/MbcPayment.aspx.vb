Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.Net
Imports System.Data

Partial Public Class MbcPayment
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
		LoadLic()
		'Should be no postbacks so I am inserting every time page is loaded

		Dim orderid As String = Request.QueryString("orderid")
		'Dim orderid As String = "27872"
		Session.Add("orderid", orderid)
		If IsNothing(Session("syslog")) Then
			'0,0=Browser
			'01=platform
			'02=  IP Address
			'03= Pament Page first access Datetime
			'04= submit button clicked Datetime
			Dim syslog(0, 4) As String
			syslog(0, 0) = Context.Request.Browser.Browser & " " & Request.Browser.Version
			syslog(0, 1) = Context.Request.Browser.Platform
			syslog(0, 2) = Context.Request.UserHostAddress
			syslog(0, 3) = DateTime.Now.ToString()
			Session.Add("syslog", syslog)
		Else 'some kind of post back insert anyway 
			Dim syslog As Array = Session("syslog")
			syslog(0, 0) = Context.Request.Browser.Browser & " " & Request.Browser.Version
			syslog(0, 1) = Context.Request.Browser.Platform
			syslog(0, 2) = Context.Request.UserHostAddress
			syslog(0, 3) = DateTime.Now.ToString()
			Session("syslog") = syslog

		End If
		'_________________________________________________	


		If Not IsPostBack Then
			Session.Add("orderbad", "TRUE")
			Session.Add("Company", "MBC")



			Dim dvSql As New DataView
			Dim drvSql As DataRowView
			Dim emailaddress As String = ""
			Dim itemtotal As Decimal = 0
			Dim schinvoicenumber As String = ""
			Dim schcode As String = ""
			Dim schname As String = ""
			Dim sfname As String = ""
			Dim slname As String = ""
			dstemporders.SelectCommand = "SELECT distinct schcode,schname,schinvoicenumber,emailaddress,studentfname,studentlname,sum(itemtotal) as itemtotal FROM `temporders` o where orderid=" & orderid & ";"
			Try
				dvSql = CType(Me.dstemporders.Select(DataSourceSelectArguments.Empty), Data.DataView)
				For Each drvSql In dvSql 'should only be one record
					schcode = drvSql("schcode")
					schname = drvSql("schname")
					schinvoicenumber = drvSql("schinvoicenumber").ToString
					emailaddress = drvSql("EmailAddress")
					'itemtotal = drvSql("itemtotal") + 1	'the one is for processing fee per order  to be use year 16
					itemtotal = drvSql("itemtotal")
					Session.Add("sfname", drvSql("studentfname"))
					Session.Add("slname", drvSql("studentlname"))
				Next
				lblamount.Text = itemtotal.ToString
				lblschname.Text = schname
				lblemailaddress.Text = emailaddress
				lblorderid.Text = orderid
				hfschcode.Value = schcode
				hfschinvoicenumber.Value = schinvoicenumber
			Catch ex As Exception
				Response.Redirect("error.aspx")
			End Try

		End If
    End Sub


    Protected Sub rbpaytype_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rbpaytype.SelectedIndexChanged
        If rbpaytype.SelectedValue = "CC" Then
            CCPanel.Visible = True
            ECPanel.Visible = False
            BlankFields("CC")
            hfpaytype.Value = "CC"
        Else
            hfpaytype.Value = "EC"
            CCPanel.Visible = False
            ECPanel.Visible = True
            BlankFields("EC")
        End If
    End Sub
    Private Sub BlankFields(paytype As String)
        If paytype = "CC" Then
            x_card_num.Text = ""
            x_card_code.Text = ""
            x_first_name.Text = ""
            x_last_name.Text = ""
        Else
            x_bank_acct_name.Text = ""
            x_bank_aba_code.Text = ""
            x_bank_acct_num.Text = ""

            x_bank_name.Text = ""
        End If
    End Sub

    Protected Sub ccsubmit_Click(sender As Object, e As EventArgs) Handles ccsubmit.Click

		If CheckForOrder() Then	 'duplicate found
			Dim a As String = Session("duporder")
			MsgBox1.Show("Possible Duplicate", a, Nothing, New EO.Web.MsgBoxButton("Yes", "", "ccyessubmit"), New EO.Web.MsgBoxButton("No", "", "nosubmit"))
			Session.Remove("duporder")
		Else 'no duplicates go on

			StartCCSubmission()
		End If
	End Sub
	Protected Sub StartCCSubmission()
		Page.Validate()
        'Dim someScript1 As String = "alertMe"
		If Page.IsValid = False Then
			'turns off overlay that was startd with onclient click
            'If (Not ClientScript.IsStartupScriptRegistered(Me.GetType(), someScript1)) Then
            '	ClientScript.RegisterStartupScript(Me.GetType(), someScript1, "<script 'javascript'>javascript:void(0)</script>")
            'End If

		Else
			If IsNothing(Session("numtrys")) Then
				Session.Add("numtrys", 1)
			Else
				Session("numtrys") = Session("numtrys") + 1
			End If
			
			'live_________________________________________________________________________________________________
			'Dim submission As New payportal.AuthorizenetSubmission
			'Dim authresponse As New payportal.Response
			'Dim info As New payportal.AuthReq
			Dim submission As New submission
			Dim authresponse As New Response
			Dim info As New AuthReq
			''_______________________________________________________________________________________________________

			Dim total As String = lblamount.Text
			Dim emailaddress As String = lblemailaddress.Text

			If CDec(total) > 0 Then
				'cc info and submission
				info.CardNum = x_card_num.Text
				info.SecurityCode = x_card_code.Text
				info.CardFname = x_first_name.Text
				info.CardLname = x_last_name.Text
				info.ExpDate = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
				info.OrderId = lblorderid.Text
				info.Custid = hfschcode.Value
				info.Amount = total
				info.Email = emailaddress
				info.Method = hfpaytype.Value
				info.TransType = "AUTH_CAPTURE"
				info.SiteName = "Mbc"

				authresponse = submission.Capture(info)

				If authresponse.Approved Then
					'0,0=Browser
					'01=platform
					'02=  IP Address
					'03= Pament Page first access Datetime
					'04= submit button clicked Datetime
					Try
						Dim syslog As Array = Session("syslog")
						syslog(0, 4) = DateTime.Now.ToString()
						Session("syslog") = syslog
					Catch ex As Exception

					End Try

					InsertSyslog(Session("orderid"))
					Session("orderbad") = "FALSE"
					
					InsertRealOrder()
					UpdatePayment(authresponse.TransId, authresponse.AuthCode, x_card_num.Text.Substring(x_card_num.Text.Length - 4))
					Dim time As TimeSpan = Date.Now.TimeOfDay
					'type determine if email is sent when receipt page is accessed
					DeleteOrder() 'deletes temporder
					Session.Clear()
					Response.Redirect("receipt.aspx?orderid=" & lblorderid.Text)

				Else 'card not approved

					Session("orderbad") = "TRUE"

					MsgBox1.Show("Credit Card Submission Error", "Your Credit Card Company returned the following error:" & authresponse.Message & "Do you wish to try again?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yes"), New EO.Web.MsgBoxButton("No", "", "no"))
					If Session("numtrys") = 3 Then
						'they have had 3 tries call it  quits
						MsgBox1.Show("Credit Card Submission Error", "Your Credit Card Company returned the following error:" & authresponse.Message & "Your order has not been processed. Please contact your Credit Card Company for help.", Nothing, New EO.Web.MsgBoxButton("OK"))
						DeleteOrder() 'deletes temporder
						Session.Abandon()

						Response.Redirect("http://www.memorybook.com/")

					Else

						MsgBox1.Show("Credit Card Submission Error", "Your Credit Card Company returned the following error:" & authresponse.Message & "Do you wish to try again?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yes"), New EO.Web.MsgBoxButton("No", "", "no"))

					End If


				End If
			Else 'total not greater than 0

			End If 'total greater than 0
		End If 'is valid

	End Sub
	Protected Sub ecsubmit_Click(sender As Object, e As EventArgs)

		If CheckForOrder() Then	 'duplicate found
			Dim a As String = Session("duporder")
			MsgBox1.Show("Possible Duplicate", a, Nothing, New EO.Web.MsgBoxButton("Yes", "", "ecyessubmit"), New EO.Web.MsgBoxButton("No", "", "nosubmit"))
			Session.Remove("duporder")
		Else 'no duplicates go on
			StartECSubmission()
		End If
		
	End Sub
	Protected Sub StartECSubmission()
		Page.Validate()
		Dim someScript1 As String = "alertMe"
		If Page.IsValid = False Then
			'turns off overlay that was startd with onclient click
			If (Not ClientScript.IsStartupScriptRegistered(Me.GetType(), someScript1)) Then
				ClientScript.RegisterStartupScript(Me.GetType(), someScript1, "<script 'javascript'>javascript:void(0)</script>")
			End If

		Else
			If IsNothing(Session("numtrys")) Then
				Session.Add("numtrys", 1)
			Else
				Session("numtrys") = Session("numtrys") + 1
			End If
			Dim orderid As Integer = Session("orderid")

			'live_________________________________________________________________________________________________
			'Dim submission As New payportal.AuthorizenetSubmission
			'Dim authresponse As New payportal.Response
			'Dim info As New payportal.AuthReq
			Dim submission As New submission
			Dim authresponse As New Response
			Dim info As New AuthReq
			''_______________________________________________________________________________________________________

			Dim total As String = lblamount.Text
			Dim emailaddress As String = lblemailaddress.Text

			If CDec(total) > 0 Then
				'echeck info and submission
				info.bankname = x_bank_name.Text
				info.bankcustomername = x_bank_acct_name.Text
				info.bankaccounttype = x_bank_acct_type.Text
				info.bankaccountnumber = x_bank_acct_num.Text
				info.bankabacode = x_bank_aba_code.Text
				info.CardFname = x_first_name.Text
				info.CardLname = x_last_name.Text
				info.OrderId = lblorderid.Text
				info.Custid = hfschcode.Value
				info.Amount = total
				info.Email = emailaddress
				info.Method = "ECHECK"
				info.echecktype = "WEB"
				info.SiteName = "Mbc"
				authresponse = submission.Capture(info)

				If authresponse.Approved Then
					'0,0=Browser
					'01=platform
					'02=  IP Address
					'03= Pament Page first access Datetime
					'04= submit button clicked Datetime
					Try
						Dim syslog As Array = Session("syslog")
						syslog(0, 4) = DateTime.Now.ToString()
						Session("syslog") = syslog
					Catch ex As Exception

					End Try

					Session("orderbad") = "FALSE"
					Session("ordergood") = "TRUE"
					InsertSyslog(orderid)
					InsertRealOrder()
					'Session.Add("transid", authresponse.TransId)
					'Session.Add("authcode", authresponse.AuthCode)
					'Session.Add("ccnum", x_card_num.Text.Substring(x_card_num.Text.Length - 4))
					UpdatePayment(authresponse.TransId, authresponse.AuthCode, "")

					'type determine if email is sent when receipt page is accessed
					DeleteOrder()
					Session.Clear()
					Response.Redirect("receipt.aspx?orderid=" & lblorderid.Text)
				Else 'card not approved
					Session("ordergood") = "FALSE"
					MsgBox1.Show("Check Submission Error", "Your bank returned the following error:" & authresponse.Message & "Do you wish to try again?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yes"), New EO.Web.MsgBoxButton("No", "", "no"))
					If Session("numtrys") = 3 Then
						'they have had 3 tries call it  quits
						MsgBox1.Show("Check Submission Error", "Your bank returned the following error:" & authresponse.Message & "Your order has not been processed. Please contact your Credit Card Company for help.", Nothing, New EO.Web.MsgBoxButton("OK"))
						DeleteOrder()
						Session.Abandon()
						Response.Redirect("http://www.memorybook.com/")

					Else

						MsgBox1.Show("Check Submission Error", "Your bank returned the following error:" & authresponse.Message & "Do you wish to try again?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yes"), New EO.Web.MsgBoxButton("No", "", "no"))

					End If


				End If
			Else 'total not greater than 0

			End If 'total greater than 0
		End If 'pagevalidate
	End Sub

	Protected Sub InsertRealOrder()
		Dim orderid As String = Request.QueryString("orderid")
		Dim strconn As String
		dstemporders.SelectCommand = "select * from temporders where orderid=" & orderid
		strconn = dstemporders.ConnectionString	'"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
		Dim conn As MySqlConnection = New MySqlConnection(strconn)
		Dim cmd As New MySqlCommand("", conn)
		cmd.CommandText = "Insert into mbc.orders (orddate,yr,parentpayment,schname,orderid,grade,booktype,teacher,perstext1,perstext2,studentfname," _
		  & "studentlname,emailaddress,schcode,itemamount,itemtotal,itemqty,schinvoicenumber,sname,saddress,scity,sstate,szip,icon1,icon2,icon3,icon4,josicon1,josicon2,josicon3,josicon4) Values(Now(),@yr,1,@schname," _
		  & "@orderid,@grade,@booktype,@teacher,@perstext1,@perstext2,@studentfname,@studentlname,@emailaddress,@schcode,@itemamount,@itemtotal,@itemqty," _
		  & "@schinvoicenumber,@sname,@saddress,@scity,@sstate,@szip,@icon1,@icon2,@icon3,@icon4,@josicon1,@josicon2,@josicon3,@josicon4);"
		Dim berror As Boolean = False
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		'get tmporder loop through and copy to real order (orderid is in querystring)
		Try
			dvSql = CType(Me.dstemporders.Select(DataSourceSelectArguments.Empty), Data.DataView)
			For Each drvSql In dvSql 'should only be one record
				cmd.Parameters.Clear()
				cmd.Parameters.AddWithValue("@orderid", orderid)
				cmd.Parameters.AddWithValue("@schname", drvSql("schname"))
				cmd.Parameters.AddWithValue("@grade", drvSql("grade"))
				cmd.Parameters.AddWithValue("@booktype", drvSql("booktype"))
				cmd.Parameters.AddWithValue("@teacher", drvSql("teacher"))
				cmd.Parameters.AddWithValue("@perstext1", drvSql("perstext1"))
				cmd.Parameters.AddWithValue("@perstext2", drvSql("perstext2"))
				cmd.Parameters.AddWithValue("@studentfname", drvSql("studentfname"))
				cmd.Parameters.AddWithValue("@studentlname", drvSql("studentlname"))
				cmd.Parameters.AddWithValue("@emailaddress", drvSql("emailaddress"))
				cmd.Parameters.AddWithValue("@schcode", drvSql("schcode"))
				cmd.Parameters.AddWithValue("@itemamount", drvSql("itemamount"))
				cmd.Parameters.AddWithValue("@itemtotal", drvSql("itemtotal"))
				cmd.Parameters.AddWithValue("@itemqty", drvSql("itemqty"))
				cmd.Parameters.AddWithValue("@schinvoicenumber", drvSql("schinvoicenumber"))
				cmd.Parameters.AddWithValue("@yr", drvSql("yr"))
				cmd.Parameters.AddWithValue("@sname", drvSql("sname"))
				cmd.Parameters.AddWithValue("@saddress", drvSql("saddress"))
				cmd.Parameters.AddWithValue("@scity", drvSql("scity"))
				cmd.Parameters.AddWithValue("@sstate", drvSql("sstate"))
				cmd.Parameters.AddWithValue("@szip", drvSql("szip"))
				cmd.Parameters.AddWithValue("@icon1", drvSql("icon1"))
				cmd.Parameters.AddWithValue("@icon2", drvSql("icon2"))
				cmd.Parameters.AddWithValue("@icon3", drvSql("icon3"))
				cmd.Parameters.AddWithValue("@icon4", drvSql("icon4"))
				cmd.Parameters.AddWithValue("@josicon1", drvSql("josicon1"))
				cmd.Parameters.AddWithValue("@josicon2", drvSql("josicon2"))
				cmd.Parameters.AddWithValue("@josicon3", drvSql("josicon3"))
				cmd.Parameters.AddWithValue("@josicon4", drvSql("josicon4"))
				Try
					cmd.Connection.Open()
					cmd.ExecuteNonQuery()
					cmd.Connection.Close()
				Catch ex As Exception
					'create the mail message
					Dim mail As New MailMessage()
					'set the addresses
					'set the addresses
					mail.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"))
					mail.To.Add("randy@woodalldevelopment.com")
					'set the content
					mail.Subject = "Mysql Error:Inserting Order " & lblschname.Text & "(" & drvSql("schcode") & ")"
					mail.Body = "An error occured inserting a order record into the Mysql database server. The following data was not recorded in the order table.<br/>" _
					  & "School Name:" & lblschname.Text & "<br/>" _
					  & "Student Name:" & drvSql("studentfname") & " " & drvSql("studentlname") & "<br/>" _
					  & "School Code:" & drvSql("schcode") & "<br/>" _
					  & "Grade:" & drvSql("grade") & "<br/>" _
					  & "Teacher:" & drvSql("teacher") & "<br/>" _
					  & "Book Type:" & drvSql("booktype") & "<br/>" _
					  & "EmailAddress:" & drvSql("emailaddress") & "<br/>" _
					  & "Perstext1:" & drvSql("perstext1") & "<br/>" _
					  & "Perstext2:" & drvSql("perstext2") & "<br/>" _
					  & "Item Amount:" & drvSql("itemamount") & "<br/>" _
					  & "Item Total:" & drvSql("itemtotal") & "<br/>" _
					  & "Item Qty:" & drvSql("itemqty") & "<br/>" _
					  & "ShipName:" & drvSql("sname") & "<br/>" _
					  & "Ship Address:" & drvSql("saddress") & "<br/>" _
					  & "Ship City:" & drvSql("scity") & "<br/>" _
					  & "Ship State:" & drvSql("sstate") & "<br/>" _
					  & "Ship Zip:" & drvSql("szip") & "<br/>" _
					  & "icon1:" & drvSql("icon1") & "<br/>" _
					  & "icon2:" & drvSql("icon2") & "<br/>" _
					  & "icon3:" & drvSql("icon3") & "<br/>" _
					  & "icon4:" & drvSql("icon4") & "<br/>" _
					  & "Year:" & drvSql("yr") & "<br/><br/>" _
					  & "Mysql Exception Code:" & ex.Message
					mail.IsBodyHtml = True
					'send the message
					Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("SmtpServer"))
					smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
					'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
					smtp.Send(mail)

				End Try	 'endtry excute query

			Next
		Catch ex As Exception  'system/program error take to a error page
			Dim handler As New XC.Web.ErrorHandler(Nothing)
			handler.HandleException()
			Response.Redirect("~/MBCSecure/error.aspx")
		End Try	'end of loop in temporders

	End Sub




    Private Sub UpdatePayment(ByVal transid As String, ByVal authcode As String, ByVal ccnum As String)
        Dim connection1 As New MySqlConnection(dsorder.ConnectionString)

        connection1.Open()

        Dim cmd As MySqlCommand = connection1.CreateCommand()


		Dim commandtext As String = "insert into payment (orderid,custemail,ddate,poamt,paytype,transid,authcode,ccnum,invno,schcode,parentpay,payerfname,payerlname)" _
		   & "values(@orderid,@custemail,@ddate,@poamt,@paytype,@transid,@authcode,@ccnum,@invno,@schcode,1,@payerfname,@payerlname);"
        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@orderid", lblorderid.Text)
        cmd.Parameters.AddWithValue("@custemail", lblemailaddress.Text)
        cmd.Parameters.AddWithValue("@ddate", Now)
        cmd.Parameters.AddWithValue("@poamt", lblamount.Text)
        cmd.Parameters.AddWithValue("@paytype", hfpaytype.Value)
        cmd.Parameters.AddWithValue("@transid", transid)
        cmd.Parameters.AddWithValue("@authcode", authcode)
        cmd.Parameters.AddWithValue("@ccnum", ccnum)
        cmd.Parameters.AddWithValue("@invno", hfschinvoicenumber.Value)
		cmd.Parameters.AddWithValue("@schcode", hfschcode.Value)
		cmd.Parameters.AddWithValue("@payerfname", x_first_name.Text.Trim)
		cmd.Parameters.AddWithValue("@payerlname", x_last_name.Text.Trim)
        cmd.CommandText = commandtext

        Try
            cmd.ExecuteNonQuery()
			connection1.Close()

        Catch ex As Exception
            'send email


            Dim objMM As New MailMessage()
            Dim tomail As String = ""
            Dim smtpclient As String = ""
            Dim cpassword As String = ""
            Dim cuser As String = ""

            tomail = "randy@woodalldevelopment.com"


            smtpclient = ConfigurationManager.AppSettings("smtpserver")
            cuser = ConfigurationManager.AppSettings("smtpuser")
            cpassword = ConfigurationManager.AppSettings("smtppassword")
            'Set the properties
            objMM.From = New MailAddress("authnet@memorybook.com", "Developer")
            'objMM.Bcc.Add(ConfigurationManager.AppSettings("FromAddr"))
            Try
                objMM.To.Add("randy@woodalldevelopment.com")
            Catch ex1 As Exception

            End Try 'ex1

            'Send the email in text format
            objMM.IsBodyHtml = True

            'Set the subject
            objMM.Subject = "Update Error"

            objMM.Body = "There was an error inserting the following fields for order payment " & lblorderid.Text & "</br> Pay Date=" & Now.ToString _
                 & "</br> Amount=" & lblamount.Text & "</br> Pay Type=CC </br> TransId=" & transid & "</br> AuthCode=" & authcode & "</br> School Invoice No.=" & hfschinvoicenumber.Value _
                 & "</br> Credit Card Num=" & ccnum & "</br> Schcode=" & hfschcode.Value

            Dim smtp As New SmtpClient(smtpclient)
            smtp.Credentials = New NetworkCredential(cuser, cpassword)

            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(objMM)
            Catch ex2 As Exception

            Finally

            End Try 'ex2
			Dim handler As New XC.Web.ErrorHandler(Nothing)
			handler.HandleException()

        End Try

    End Sub
    Private Sub DeleteOrder()
		'      Dim connection1 As New MySqlConnection(dsorder.ConnectionString)
		'      connection1.Open()

		'      Dim cmd As MySqlCommand = connection1.CreateCommand()


		'Dim commandtext As String = "DELETE FROM temporders WHERE orderid=" & Request.QueryString("orderid") & ";"

		'      cmd.CommandText = commandtext

		'      Try
		'          cmd.ExecuteNonQuery()

		'	connection1.Close()
		'      Catch ex As Exception
		'          'send email

		'      End Try
    End Sub


    Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
		If e.CommandName = "ccyessubmit" Then	'add order to grid
			StartCCSubmission()
		End If
		If e.CommandName = "ecyessubmit" Then	'add order to grid
			StartECSubmission()
		End If
        If e.CommandName = "no" Then

			DeleteOrder()
			Session.Abandon()

            Response.Redirect("http://www.memorybook.com/")
        End If
    End Sub
	Private Function CheckForOrder() As Boolean
		Dim rstudfname, rstudlname, rorderid, rpayerlname, rpayerfname As String
		Dim rddate As String
		Dim retval As Boolean = False
		Dim strconn As String
		strconn = dsorder.ConnectionString	'"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
		Dim conn As MySqlConnection = New MySqlConnection(strconn)
		Dim cmd As New MySqlCommand("", conn)
		Dim reader As MySqlDataReader
		cmd.Parameters.AddWithValue("@studentfname", Session("sfname"))
		cmd.Parameters.AddWithValue("@studentlname", Session("slname"))
		cmd.Parameters.AddWithValue("@schcode", hfschcode.Value)
		cmd.CommandText = "Select orders.orderid,orders.studentfname,orders.studentlname,orders.orddate,payment.payerlname,payment.payerfname from orders" _
		 & " inner join payment on orders.orderid=payment.orderid where orders.studentfname=@studentfname and " _
		 & "orders.studentlname=@studentlname and orders.schcode=@schcode and orders.yr='15';"
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
			End If
			reader.Close()
			cmd.Connection.Close()

			Session.Add("duporder", "Our records shows there has been an order placed with this student name (" & rstudfname & " " & rstudlname & ") on " & rddate.ToString _
			& " and paid for by " & rpayerfname & " " & rpayerlname & ". Click Yes to submit payment and place order.")
		Catch ex As Exception

		End Try

		Return retval
	End Function

    

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


    Protected Sub Page_Unload(sender As Object, e As System.EventArgs) Handles Me.Unload
        'If IsPostBack Then
        '    Session.Add("Refresh", "TRUE")
        'Else
        '    Session.Add("Refresh", "FALSE")
        'End If
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
			strconn = dsorder.ConnectionString '"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
			Dim conn As MySqlConnection = New MySqlConnection(strconn)
			Dim cmd As New MySqlCommand("", conn)
			cmd.Parameters.AddWithValue("@orderid", orderid)
			cmd.Parameters.AddWithValue("@page", "MbcPayment.aspx")
			cmd.Parameters.AddWithValue("@browser", syslog(0, 0))
			cmd.Parameters.AddWithValue("@platform", syslog(0, 1))
			cmd.Parameters.AddWithValue("@ipaddress", syslog(0, 2))
			cmd.Parameters.AddWithValue("@pfatime", DateTime.Parse(syslog(0, 3)))
			cmd.Parameters.AddWithValue("@submittime", DateTime.Parse(syslog(0, 4)))
			cmd.CommandText = "Insert into mbc.syslog (orderid,page,browser,platform,ipaddress,pfatime,submittime) Values(@orderid,@page,@browser,@platform,@ipaddress,@pfatime,@submittime);"
			Try
				cmd.Connection.Open()
				cmd.ExecuteNonQuery()
				cmd.Connection.Close()
			Catch ex As Exception

			End Try
		Catch ex As Exception

		End Try


	End Sub
	
End Class