Imports System.Web
Imports System.Web.Mail
Imports System.Configuration
Imports System.Diagnostics
Imports System.Text
Imports System.IO

Namespace XC.Web
	<Serializable()> _
   Public Class FileNotificationSettings
		Private m_sFileName As String

		Public Sub New()
			m_sFileName = ConfigurationSettings.AppSettings("errorNotifier_Filename")
			If m_sFileName Is Nothing Then
				m_sFileName = "error.txt"
			End If
		End Sub

		Public Property Filename() As String
			Get
				Return m_sFileName
			End Get
			Set(value As String)
				m_sFileName = value
			End Set
		End Property
	End Class
End Namespace