Imports Microsoft.VisualBasic
<Serializable()> _
  Public Class EmailReadyPage
	Inherits System.Web.UI.Page

	Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
		'DO NOTHING
	End Sub

	Public Overrides Property EnableEventValidation() As Boolean
		Get
			Return False
		End Get
		Set(ByVal value As Boolean)
			'DO NOTHING
		End Set
	End Property
End Class
