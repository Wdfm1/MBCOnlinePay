Imports Microsoft.VisualBasic
Imports System.Data
Imports MySql.Data
Imports MySql.Data.MySqlClient
Imports System.Net.Mail
Imports System.IO
Imports System.Net

Partial Class TimeOut
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
		Session.Add("test1", 1)
		Session.Add("test2", 2)
		InsertSyslog()
		Dim email As String = ""
		Dim transid As String = ""
		Dim paytype As String = ""
		Dim orderid As String = Request.QueryString("orderid")




        ''Now, send the email
        ''Create an instance of the MailMessage class
        'Dim objMM As New MailMessage()
        'Dim tomail As String = ""
        'Dim smtpclient As String = ""
        'Dim cpassword As String = ""
        'Dim cuser As String = ""



        'tomail = Trim(email)




        'smtpclient = ConfigurationManager.AppSettings("smtpserver")
        'cuser = ConfigurationManager.AppSettings("smtpuser")
        'cpassword = ConfigurationManager.AppSettings("smtppassword")
        ''Set the properties
        'objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

        'Try
        '	objMM.To.Add("randy@woodalldevelopment.com") 'cs address if address bad try statement in send will catch
        '	'objMM.To.Add("randy@woodalldevelopment.com")

        'Catch ex As Exception

        'End Try
		'Send the email in text format
        'objMM.IsBodyHtml = True
        ''Set the subject
        'objMM.Subject = "Time Out Page Hit"
        'Dim useragent As String = Request.UserAgent
        'Dim servername As String = Request.UserHostName.ToString
        'Dim ip As String = Request.UserHostAddress
        'Dim url As String = Request.Url.ToString
        'Dim prevurl As String
        'Dim sb As New StringBuilder()
        'Try
        '	prevurl = Request.UrlReferrer.ToString
        'Catch ex As Exception
        '	prevurl = ""
        'End Try
        'Dim servervars As String = Request.ServerVariables.ToString
        'Dim authenication As String = Request.IsAuthenticated.ToString
        'Dim crawler As String = Request.Browser.Crawler.ToString
        'Dim msg As String = "<table class=style1 width=400>" _
        '& "<tr><td align=center colspan=2 style=font-size: xx-large>Data</td></tr> <tr><td align=right bgcolor=#CCCCCC class=style5>" _
        '  & " User Agent:</td><td class=style3>" & useragent & "</td></tr><tr> <td align=right bgcolor=#CCCCCC class=style5> Host Name:</td>" _
        '  & "<td class=style3>" & servername & "</td></tr> <tr> <td align=right bgcolor=#CCCCCC class=style5>Host Ip Address:</td>" _
        '  & " <td class=style3>" & ip & "</td> </tr> <tr> <td align=right bgcolor=#CCCCCC class=style5> URL:</td> <td class=style3>" _
        '  & url & "</td> </tr> <tr><td align=right bgcolor=#CCCCCC class=style5>Prev URL:</td><td class=Style3>" _
        '  & prevurl & "</td> </tr> <tr><td align=right bgcolor=#CCCCCC class=style5>Authenication:</td><td class=style3>" _
        '  & authenication & "</td></tr><tr><td align=right bgcolor=#CCCCCC class=style5> Server Variables:</td> <td class=style3>" _
        '  & "</td></tr><tr><td>Crawler:</td><td>" & crawler & "</td></tr></table>"

        'Dim I As Integer = 0
        'Dim L As Integer = Session.Contents.Count
        'Dim Value(L) As String
        'Dim keyName(L) As String
        'Try
        '	For I = I To L - 1
        '		Value(I) = Session.Contents.Item(I).ToString()
        '		keyName(I) = Session.Contents.Keys(I).ToString()
        '		sb.Append(Environment.NewLine)
        '		sb.Append(keyName(I) & "=" & Value(I))

        '	Next
        '	Dim a As Integer = Session.Timeout
        '	sb.Append(Environment.NewLine)
        '	sb.Append("Timeout=" & a.ToString)
        'Catch ex As Exception

        'End Try

        'Dim svals As String = sb.ToString
        'objMM.Body = msg & svals

        'Dim smtp As New SmtpClient(smtpclient)
        'smtp.Credentials = New NetworkCredential(cuser, cpassword)

        'Try
        '	'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers

        '	smtp.Send(objMM)

        'Catch ex As Exception



        'Finally

        'End Try


	End Sub
	Protected Sub InsertSyslog()
		'0,0=Browser
		'01=platform
		'02=  IP Address
		'03= Pament Page first access Datetime
		'04= submit button clicked Datetime


		Try
			Dim syslog As Array = Session("syslog")

			Dim strconn As String
			strconn = cust11.ConnectionString	 '"Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
			Dim conn As MySqlConnection = New MySqlConnection(strconn)
			Dim cmd As New MySqlCommand("", conn)

			cmd.Parameters.AddWithValue("@page", "TimeOut.aspx")
			cmd.Parameters.AddWithValue("@platform", Context.Request.Browser.Platform.ToString)
			cmd.Parameters.AddWithValue("@browser", Context.Request.Browser.Browser & " " & Request.Browser.Version)
			cmd.Parameters.AddWithValue("@ipaddress", Context.Request.UserHostAddress)
			cmd.Parameters.AddWithValue("@pfatime", DateTime.Parse(DateTime.Now.ToString()))


			cmd.CommandText = "Insert into mbc.syslog (page,browser,platform,ipaddress,pfatime) Values(@page,@browser,@platform,@ipaddress,@pfatime);"
			Try
				cmd.Connection.Open()
				cmd.ExecuteNonQuery()
				cmd.Connection.Close()
			Catch ex As Exception

			End Try
		Catch ex As Exception




			'Now, send the email
			'Create an instance of the MailMessage class
			Dim objMM As New MailMessage()
			Dim tomail As String = ""
			Dim smtpclient As String = ""
			Dim cpassword As String = ""
			Dim cuser As String = ""








			smtpclient = ConfigurationManager.AppSettings("smtpserver")
			cuser = ConfigurationManager.AppSettings("smtpuser")
			cpassword = ConfigurationManager.AppSettings("smtppassword")
			'Set the properties
			objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

			Try
				objMM.To.Add("randy@woodalldevelopment.com") 'cs address if address bad try statement in send will catch
				'objMM.To.Add("randy@woodalldevelopment.com")

			Catch ex1 As Exception

			End Try
			'Send the email in text format
			objMM.IsBodyHtml = True
			'Set the subject
			objMM.Subject = "Time Out Syslog Error"







			objMM.Body = "Error inserting syslog timeout page"

			Dim smtp As New SmtpClient(smtpclient)
			smtp.Credentials = New NetworkCredential(cuser, cpassword)

			Try
				'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers

				smtp.Send(objMM)

			Catch ex3 As Exception



			Finally

			End Try
		End Try



	End Sub
End Class
