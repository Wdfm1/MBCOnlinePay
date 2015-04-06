Imports Microsoft.VisualBasic
Imports System.Data
Imports MySql.Data
Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.IO

Imports System.Net
Partial Class receipt
    Inherits EmailReadyPage
    Private okToSendMarkup As Boolean = False
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        'oktosendmarkup is set to false
        If okToSendMarkup Then
            ' EmailReceipt()
        End If


        MyBase.Render(writer)
        ' ALTERNATE OPTION:
        ' Remove EmailReceipt(); from above, and instead do: okToSendMarkup = True
        ' Then, in the Render() method, the markup will be generated and emailed
        ' If this alternate option is used, you do not need to disable event validation since
        ' the control is being rendered during the Render stage. Therefore, event validation
        ' can proceed as expected.
    End Sub
    Private Sub EmailReceipt()
        Dim email As String = ""
        Dim transid As String = ""
        Dim paytype As String = ""
        Dim orderid As String = Request.QueryString("orderid")
        'Dim cart As Cart = Session("Cart")
        'Save the position of the DataGrid in the myForm Controls collection
        Dim SB As New StringBuilder()
        Dim SW As New StringWriter(SB)
        Dim htmlTW As New HtmlTextWriter(SW)
        FormView1.RenderControl(htmlTW)
        Dim thefirstformview As String = SB.ToString
        SB.Clear()

        gv1.AllowPaging = False
        gv1.RenderControl(htmlTW)
        Dim thegrid As String = SB.ToString
        SB.Clear()

        FormView2.RenderControl(htmlTW)
        Dim thesecondformview As String = SB.ToString
        SB.Clear()


        'Now, send the email
        'Create an instance of the MailMessage class
        Dim objMM As New MailMessage()
        Dim tomail As String = ""
        Dim smtpclient As String = ""
        Dim cpassword As String = ""
        Dim cuser As String = ""

        Try
            Dim lblemail As Label = FormView1.FindControl("lblemail")
            email = lblemail.Text
            Dim lbltransid As Label = FormView1.FindControl("lbltransactionid")
            transid = lbltransid.Text
            Dim lblpaytype As Label = FormView1.FindControl("lblpaytype")
            paytype = lblpaytype.Text



        Catch ex As Exception

        End Try


        tomail = Trim(email)




        smtpclient = ConfigurationManager.AppSettings("smtpserver")
        cuser = ConfigurationManager.AppSettings("smtpuser")
        cpassword = ConfigurationManager.AppSettings("smtppassword")
        'Set the properties
        objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

        Try
            objMM.To.Add(tomail) 'customer address if address bad try statement in send will catch
			'objMM.Bcc.Add("authnet@memorybook.com")

        Catch ex As Exception

        End Try


        'Send the email in text format
        objMM.IsBodyHtml = True

        'Set the subject
        objMM.Subject = "Receipt for a Parent Payment to Memory Book Company (Transaction Id " & transid & ")  Using " & paytype & "  " & Now

        objMM.Body = "<div>" & thefirstformview & "</div><div>" & thegrid & "</div><div>" & thesecondformview & "</div>"

        Dim smtp As New SmtpClient(smtpclient)
        smtp.Credentials = New NetworkCredential(cuser, cpassword)

        Try
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers

			smtp.Send(objMM)
			MsgBox1.Show("Email Sent", "An email receipt has been sent to " & tomail & ".", Nothing, New EO.Web.MsgBoxButton("OK"))
        Catch ex As Exception
            WriteToFile("exception")
            'Dim handler As New XC.Web.ErrorHandler(Nothing)
            'handler.HandleException()
            MsgBox1.Show("Email Error", "Your confirmation email was not sent because of the following error:" & ex.Message & "Your order has been received and will be processed. No further action is needed.", Nothing, New EO.Web.MsgBoxButton("OK"))
            Dim objMM1 As New MailMessage

            smtpclient = ConfigurationManager.AppSettings("smtpserver")
            cuser = ConfigurationManager.AppSettings("smtpuser")
            cpassword = ConfigurationManager.AppSettings("smtppassword")
            Dim smtperror As New SmtpClient(smtpclient)
            smtperror.Credentials = New NetworkCredential(cuser, cpassword)
            objMM1.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
            objMM1.To.Add("authnet@memorybook.com")
            'objMM1.CC.Add("")
            objMM1.Subject = "Memorybook Online Order Email Error Order Id:" & orderid
            objMM1.IsBodyHtml = True
            objMM1.Body = "The customer did not receive an email because of the following error:" & ex.Message
            Try
                smtperror.Send(objMM1)
            Catch ex2 As Exception

            End Try


        Finally

        End Try



    End Sub
	Private Sub CSReceipt()
		
				Dim email As String = ""
				Dim transid As String = ""
				Dim paytype As String = ""
				Dim orderid As String = Request.QueryString("orderid")
				'Dim cart As Cart = Session("Cart")
				'Save the position of the DataGrid in the myForm Controls collection
				Dim SB As New StringBuilder()
				Dim SW As New StringWriter(SB)
				Dim htmlTW As New HtmlTextWriter(SW)
				FormView1.RenderControl(htmlTW)
				Dim thefirstformview As String = SB.ToString
				SB.Clear()

				gv1.AllowPaging = False
				gv1.RenderControl(htmlTW)
				Dim thegrid As String = SB.ToString
				SB.Clear()

				FormView2.RenderControl(htmlTW)
				Dim thesecondformview As String = SB.ToString
				SB.Clear()


				'Now, send the email
				'Create an instance of the MailMessage class
				Dim objMM As New MailMessage()
				Dim tomail As String = ""
				Dim smtpclient As String = ""
				Dim cpassword As String = ""
				Dim cuser As String = ""

				Try
					Dim lblemail As Label = FormView1.FindControl("lblemail")
					email = lblemail.Text
					Dim lbltransid As Label = FormView1.FindControl("lbltransactionid")
					transid = lbltransid.Text
					Dim lblpaytype As Label = FormView1.FindControl("lblpaytype")
					paytype = lblpaytype.Text
				Catch ex As Exception

				End Try


				tomail = Trim(email)




				smtpclient = ConfigurationManager.AppSettings("smtpserver")
				cuser = ConfigurationManager.AppSettings("smtpuser")
				cpassword = ConfigurationManager.AppSettings("smtppassword")
				'Set the properties
				objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

				Try
			objMM.To.Add("authnet@memorybook.com") 'cs address if address bad try statement in send will catch
			'objMM.To.Add("randy@woodalldevelopment.com")

				Catch ex As Exception

				End Try
				'Send the email in text format
				objMM.IsBodyHtml = True
				'Set the subject
				objMM.Subject = "Receipt for a Parent Payment to Memory Book Company (Transaction Id " & transid & ")  Using " & paytype & "  " & Now
				Dim useragent As String = Request.UserAgent
				Dim servername As String = Request.UserHostName.ToString
				Dim ip As String = Request.UserHostAddress
				Dim url As String = Request.Url.ToString
				Dim prevurl As String
				Try
					prevurl = Request.UrlReferrer.ToString
				Catch ex As Exception
					prevurl = ""
				End Try
				Dim servervars As String = Request.ServerVariables.ToString
				Dim authenication As String = Request.IsAuthenticated.ToString
				Dim crawler As String = Request.Browser.Crawler.ToString
		Dim msg As String = "<table class=style1 width=400>" _
		& "<tr><td align=center colspan=2 style=font-size: xx-large>Data</td></tr> <tr><td align=right bgcolor=#CCCCCC class=style5>" _
		  & " User Agent:</td><td class=style3>" & useragent & "</td></tr><tr> <td align=right bgcolor=#CCCCCC class=style5> Host Name:</td>" _
		  & "<td class=style3>" & servername & "</td></tr> <tr> <td align=right bgcolor=#CCCCCC class=style5>Host Ip Address:</td>" _
		  & " <td class=style3>" & ip & "</td> </tr> <tr> <td align=right bgcolor=#CCCCCC class=style5> URL:</td> <td class=style3>" _
		  & url & "</td> </tr> <tr><td align=right bgcolor=#CCCCCC class=style5>Prev URL:</td><td class=Style3>" _
		  & prevurl & "</td> </tr> <tr><td align=right bgcolor=#CCCCCC class=style5>Authenication:</td><td class=style3>" _
		  & authenication & "</td></tr><tr><td align=right bgcolor=#CCCCCC class=style5> Server Variables:</td> <td class=style3>" _
		  & "</td></tr><tr><td>Crawler:</td><td>" & crawler & "</td></tr></table>"

				objMM.Body = "<div>" & thefirstformview & "</div><div>" & thegrid & "</div><div>" & thesecondformview & "</div><br/><br/><br/><br/>" & msg

				Dim smtp As New SmtpClient(smtpclient)
				smtp.Credentials = New NetworkCredential(cuser, cpassword)

				Try
					'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers

					smtp.Send(objMM)
					SetCsEmailTrue()
				Catch ex As Exception



				Finally

				End Try
			
	End Sub
    Private Sub WriteToFile(sText As String)
        Dim sPath As String = HttpContext.Current.Server.MapPath("Error.txt")
        Try
            Dim fs As New FileStream(sPath, FileMode.Append, FileAccess.Write)
            Dim writer As New StreamWriter(fs)
            writer.Write(sText)
            writer.Close()
            fs.Close()
        Catch generatedExceptionName As Exception
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
		LoadLic()
		Dim orderid As Integer = Request.QueryString("orderid")
                If orderid = Nothing Then
            Response.Redirect("http://www.memorybook.com")
        End If
		If Not IsPostBack Then
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
				InsertSyslog(orderid)
			End If
		End If
		Dim CSemailed As Boolean = CheckIfEmailed()
        'type determine if email is sent when receipt page is accessed


        If Not IsPostBack Then
			If CSemailed = False Then
				CSReceipt()
			End If


		End If

	End Sub
	Private Function CheckIfEmailed() As Boolean
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim a As Integer
		Dim sstring As String = dsorder.SelectCommand
		Dim retval As Boolean = False
		dsorder.SelectCommand = "SELECT distinct csemailed FROM orders  WHERE orderid=@orderid;"
		dsorder.SelectParameters.Clear()
		dsorder.SelectParameters.Add("@orderid", Request.QueryString("orderid"))
		Try
			dvSql = CType(Me.dsorder.Select(DataSourceSelectArguments.Empty), Data.DataView)
			For Each drvSql In dvSql 'only one record
				a = drvSql("csemailed")
				If a = 0 Then
					retval = False
				ElseIf a = 1 Then
					retval = True
				End If
			Next
		Catch ex As Exception

		End Try
		dsorder.SelectCommand = sstring
		Return retval
	End Function
	Protected Sub SetCsEmailTrue()
		dsorder.UpdateCommand = "update orders set csemailed=1 where orderid=@orderid;"
		dsorder.UpdateParameters.Add("@orderid", Request.QueryString("orderid"))
		Try
			dsorder.Update()

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

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
		EmailReceipt()

	End Sub
	Protected Sub InsertSyslog(orderid As Integer)
		'0,0=Browser
		'01=platform
		'02=  IP Address
		'03= Pament Page first access Datetime
        '04= submit button clicked Datetime
        Try
            Dim strconn As String
            strconn = dsorder.ConnectionString '"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
            Dim conn As MySqlConnection = New MySqlConnection(strconn)
            Dim cmd As New MySqlCommand("", conn)
            Dim syslog As Array = Session("syslog")
            cmd.Parameters.AddWithValue("@orderid", orderid)
            cmd.Parameters.AddWithValue("@page", "Receipt.aspx")
            cmd.Parameters.AddWithValue("@browser", syslog(0, 0))
            cmd.Parameters.AddWithValue("@platform", syslog(0, 1))
            cmd.Parameters.AddWithValue("@ipaddress", syslog(0, 2))
            cmd.Parameters.AddWithValue("@pfatime", DateTime.Parse(syslog(0, 3)))


            cmd.CommandText = "Insert into mbc.syslog (orderid,page,browser,platform,ipaddress,pfatime) Values(@orderid,@page,@browser,@platform,@ipaddress,@pfatime);"

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
