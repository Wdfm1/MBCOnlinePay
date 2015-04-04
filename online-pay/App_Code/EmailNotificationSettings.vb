Imports System.Web
Imports System.Web.Mail
Imports System.Configuration
Imports System.Diagnostics
Imports System.Text
Imports System.IO

Namespace XC.Web
	<Serializable()> _
 Public Class EmailNotificationSettings
		Private m_sTo As String
		Private m_sFrom As String
		Private m_sSubject As String
		Private m_sSmtpServer As String = Nothing

		Public Sub New()
			'm_sTo = ConfigurationSettings.AppSettings("errorNotifier_EmailTo")
			If m_sTo Is Nothing Then
				m_sTo = "randy@woodalldevelopment.com"
			End If

			' m_sFrom = ConfigurationSettings.AppSettings("errorNotifier_EmailFrom")
			If m_sFrom Is Nothing Then
				m_sFrom = "randy@woodalldevelopment.com"
			End If

			' m_sSubject = ConfigurationSettings.AppSettings("errorNotifier_EmailSubject")
			If m_sSubject Is Nothing Then
				m_sSubject = "Error in ASP.NET app"
			End If

			m_sSmtpServer = ConfigurationSettings.AppSettings("errorNotifier_EmailSmtpServer")
		End Sub

		Public Property [To]() As String
			Get
				Return m_sTo
			End Get
			Set(value As String)
				m_sTo = value
			End Set
		End Property

		Public Property From() As String
			Get
				Return m_sFrom
			End Get
			Set(value As String)
				m_sFrom = value
			End Set
		End Property

		Public Property Subject() As String
			Get
				Return m_sSubject
			End Get
			Set(value As String)
				m_sSubject = value
			End Set
		End Property

		Public Property SmtpServer() As String
			Get
				Return m_sSmtpServer
			End Get
			Set(value As String)
				m_sSmtpServer = value
			End Set
		End Property

	End Class
End Namespace
