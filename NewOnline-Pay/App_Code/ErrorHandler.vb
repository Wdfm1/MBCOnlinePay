Imports System.Web

Imports System.Net.Mail
Imports System.Configuration
Imports System.Diagnostics
Imports System.Text
Imports System.IO
Imports System.Net

Namespace XC.Web
	<Serializable()> _
 Public Class ErrorHandler
		Public Const UseEventLog As Integer = 1
		Public Const UseFile As Integer = 2
		Public Const UseEmail As Integer = 4

		Private m_notifyMode As Integer = 0

		Private m_emailSettings As New EmailNotificationSettings()
		Private m_fileSettings As New FileNotificationSettings()
		Private m_logSettings As New EventLogSettings()
		Private m_exception As Exception


		Public Sub New(e As Exception)
			tryexception = e
			If ConfigurationSettings.AppSettings("errorNotifier_NotifyMode") Is Nothing Then
				NotifyMode = UseFile
			Else
				NotifyMode = Integer.Parse(ConfigurationSettings.AppSettings("errorNotifier_NotifyMode"))
			End If
		End Sub
		Public Property tryexception As Exception
			Get
				Return m_exception
			End Get
			Set(value As Exception)
				m_exception = value
			End Set
		End Property
		Public Property NotifyMode() As Integer
			Get
				Return m_notifyMode
			End Get
			Set(value As Integer)
				m_notifyMode = value
			End Set
		End Property

		Public Property EmailSettings() As EmailNotificationSettings
			Get
				Return m_emailSettings
			End Get
			Set(value As EmailNotificationSettings)
				m_emailSettings = value
			End Set
		End Property

		Public Property FileSettings() As FileNotificationSettings
			Get
				Return m_fileSettings
			End Get
			Set(value As FileNotificationSettings)
				m_fileSettings = value
			End Set
		End Property

		Public Property LogSettings() As EventLogSettings
			Get
				Return m_logSettings
			End Get
			Set(value As EventLogSettings)
				m_logSettings = value
			End Set
		End Property

		Public Sub HandleException()
			Dim e As Exception = HttpContext.Current.Server.GetLastError()

			If e Is Nothing Then
				If IsNothing(tryexception) Then
					Return
				Else
					e = tryexception
				End If

			End If

			e = e.GetBaseException()

			If e IsNot Nothing Then
				HandleException(e)
			End If
		End Sub

        Public Sub HandleException(ByVal e As Exception)
            If e.Message = "This is an invalid webresource request." Then
                'don't do anything is a webcrawler don't want emails
                Return
            End If
            Dim sExceptionDescription As String = FormatExceptionDescription(e)

            If (NotifyMode And UseFile) = UseFile Then
                WriteToFile(sExceptionDescription)
            End If

            If (NotifyMode And UseEmail) = UseEmail Then
                'email and write to file
                SendEmail(sExceptionDescription)
                WriteToFile(sExceptionDescription)
            End If

            If (NotifyMode And UseEventLog) = UseEventLog Then
                LogEvent(sExceptionDescription)
            End If
        End Sub

		Protected Overridable Function FormatExceptionDescription(e As Exception) As String
			Dim sb As New StringBuilder()
			Dim context As HttpContext = HttpContext.Current
			'Dim SC As ShoppingCart
			'Try
			'    SC = asessions(1)
			'Catch ex As Exception

			'End Try

			sb.Append("Time of Error: " & DateTime.Now.ToString("g") & Environment.NewLine)
			sb.Append("URL: " & Convert.ToString(context.Request.Url) & Environment.NewLine)
			sb.Append("Form: " & context.Request.Form.ToString() & Environment.NewLine)
			sb.Append("QueryString: " & context.Request.QueryString.ToString() & Environment.NewLine)
			sb.Append("Server Name: " & context.Request.ServerVariables("SERVER_NAME") & Environment.NewLine)
			sb.Append("User Agent: " & context.Request.UserAgent & Environment.NewLine)
			sb.Append("User IP: " & context.Request.UserHostAddress & Environment.NewLine)
			sb.Append("User Host Name: " & context.Request.UserHostName & Environment.NewLine)
			sb.Append("User is Authenticated: " & context.User.Identity.IsAuthenticated.ToString() & Environment.NewLine)

			'Try
			'    sb.Append("Customer Id:" & SC.CompanyName.ToString & Environment.NewLine)
			'    sb.Append("Customer Id:" & SC.useremail.ToString & Environment.NewLine)
			'Catch ex As Exception

			'End Try

			While e IsNot Nothing

				sb.Append("Message: " & e.Message & Environment.NewLine)
				sb.Append("Source: " & e.Source & Environment.NewLine)
				sb.Append("TargetSite: " & Convert.ToString(e.TargetSite) & Environment.NewLine)
				sb.Append("StackTrace: " & e.StackTrace & Environment.NewLine)
				sb.Append(Environment.NewLine & Environment.NewLine)

				e = e.InnerException
			End While

			sb.Append(vbLf & vbLf)
			Return sb.ToString()
		End Function

		Private Sub WriteToFile(sText As String)
			Dim sPath As String = HttpContext.Current.Server.MapPath(FileSettings.Filename)
			Try
				Dim fs As New FileStream(sPath, FileMode.Append, FileAccess.Write)
				Dim writer As New StreamWriter(fs)
				writer.Write(sText)
				writer.Close()
				fs.Close()
			Catch generatedExceptionName As Exception
			End Try
		End Sub

		Private Sub SendEmail(sBody As String)
			Dim msg As New MailMessage
			'Dim SmtpClient As String
			'Dim cuser As String
			'Dim cpassword As String
			msg.To.Add(EmailSettings.[To])
			msg.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
			msg.Subject = EmailSettings.Subject
			msg.IsBodyHtml = False
			msg.Body = sBody
			'If Directory.Exists("F:\IsDev") Then 'set dev settings
			'SmtpClient = "mail.woodalldevelopment.com"
			'cuser = "randy@woodalldevelopment.com"
			'cpassword = "briggitte"

			'Else 'live
			'SmtpClient = "192.168.1.245"
			'cuser = "authnet@memorybook.com"
			'cpassword = "authnet"

			'End If
			Dim Smtp As New SmtpClient(ConfigurationManager.AppSettings("SmtpServer"))
			Smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
			Try
				Smtp.Send(msg)
			Catch generatedExceptionName As Exception

			End Try
		End Sub

		Private Sub LogEvent(sText As String)
			Try
				If Not EventLog.SourceExists(LogSettings.EventSource) Then
					EventLog.CreateEventSource(LogSettings.EventSource, "Application")
				End If

				Dim log As New EventLog()
				log.Source = LogSettings.EventSource
				log.WriteEntry(sText, EventLogEntryType.[Error])
			Catch generatedExceptionName As Exception
			End Try

		End Sub

		Public Sub ClearLoggedFileErrors()
			Try
				File.Delete(HttpContext.Current.Server.MapPath(FileSettings.Filename))
			Catch generatedExceptionName As Exception
			End Try
		End Sub


	End Class
End Namespace