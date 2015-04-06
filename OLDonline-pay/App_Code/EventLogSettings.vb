Imports System.Web
Imports System.Web.Mail
Imports System.Configuration
Imports System.Diagnostics
Imports System.Text
Imports System.IO

Namespace XC.Web
	<Serializable()> _
 Public Class EventLogSettings
		Private m_sEventSource As String

		Public Sub New()
			m_sEventSource = ConfigurationSettings.AppSettings("errorNotifier_EventLogSource")
			If m_sEventSource Is Nothing Then
				m_sEventSource = "ASP.NET App Error"
			End If
		End Sub

		Public Property EventSource() As String
			Get
				Return m_sEventSource
			End Get
			Set(value As String)
				m_sEventSource = value
			End Set
		End Property

	End Class
End Namespace