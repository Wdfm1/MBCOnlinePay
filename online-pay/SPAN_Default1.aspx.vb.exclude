Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports MySql.Data.MySqlClient
Imports AuthorizeNet
Imports System.IO.File
Imports System.IO


Partial Class SPAN_Default1
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsPostBack Then
			If IsNothing(Session("syslog")) Then
				'0,0=Browser
				'01=platform
				'02=  IP Address
				'03= Pament Page first access Datetime
				'04= submit button clicked Datetime
				'05=is smartphone
				Dim syslog(0, 5) As String
				Dim context As HttpContext = HttpContext.Current

				syslog(0, 0) = context.Request.Browser.Browser & " " & Request.Browser.Version
				syslog(0, 1) = context.Request.Browser.Platform
				syslog(0, 2) = context.Request.UserHostAddress
				syslog(0, 3) = DateTime.Now.ToString()
				If context.Request.Browser.IsMobileDevice Then
					syslog(0, 5) = context.Request.Browser.MobileDeviceManufacturer & "/" & context.Request.Browser.MobileDeviceModel
				Else
					syslog(0, 5) = ""
				End If
				Session.Add("syslog", syslog)
			End If
		End If
		LoadLic()

		If Not IsPostBack Then
			'If Session("defaulterrormessage") = Nothing Then
			'	Session.RemoveAll()
			'End If
		End If

		lblpaytype.Text = "Página de pago para padres"
		h1.Text = "Los padres deberán ingresar el código en el cuadro de texto de más abajo y seleccionar Next (Siguiente) para continuar. Si usted es una escuela, visite la página para escuelas."
		h1.NavigateUrl = "http://www.memorybook.com/online-pay/SPAN_Default.aspx"
		Page.MaintainScrollPositionOnPostBack = True

	End Sub



	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
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

		InsertSyslog()
		Dim ShopCart As Cart
		If Page.IsValid Then
			'set with web config now
			'If Directory.Exists("F:\IsDev") Then 'set dev settings
			'    Me.cus11.ConnectionString = "Server=memserver;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
			'Else
			'    'connection string default is database
			'End If
			If IsNothing(Session("Cart")) Then
				ShopCart = New Cart
			Else
				ShopCart = Session("Cart")

			End If

			Dim cschcode As String = CustomerCode.Text


			Dim dvSql As New DataView
			Dim drvSql As DataRowView
			Dim selectcmd As String = ""

			If cschcode.Length = 5 Then
				selectcmd = "SELECT cust.schname, schaddr, schaddr2, schcity,schstate, schzip," _
				  & "schphone,cust.schcode, schfax,invno,basicinvamt,persinvamt,basiconly,yr,ponum,onlinecuto " _
				  & "FROM cust left join invoiceinfo on cust.schcode=invoiceinfo.schcode WHERE invoiceinfo.invno=" & cschcode & ";"




				Me.cus11.SelectCommand = selectcmd

				Dim cAddress As String = ""

				Try
					dvSql = CType(Me.cus11.Select(DataSourceSelectArguments.Empty), Data.DataView)
				Catch ex As Exception


					If ex.Message = "No se puede conectar a cualquiera de los especificados MySQL hosts." Then
						Me.SetErrorMessage(1)
					ElseIf ex.Message = "No se puede convertir MySQL valor de fecha/hora a System.DateTime" Then
						Me.SetErrorMessage(6)
					Else

						Me.SetErrorMessage(2)
					End If
				End Try

				If dvSql.Table.Rows.Count = 0 Then
					Me.SetErrorMessage(3)
				End If
				Dim schname As String = ""
				Dim schaddr As String = ""
				Dim schcity As String = ""
				Dim schstate As String = ""
				Dim schzip As String = ""
				Dim schcode As String = ""
				Dim ponum As String = ""
				Dim basicinvamt As String = ""
				Dim persinvamt As String = ""
				Dim basiconly As Boolean = 1
				Dim onlinecuto As Date = Today.Date
				Dim yr As String = ""
				'Dim amount As Decimal = 0
				Dim invno As String = ""
				For Each drvSql In dvSql
					schcode = drvSql("schcode").ToString()
					schname = drvSql("schname").ToString()
					schaddr = drvSql("schaddr").ToString
					schcity = drvSql("schcity").ToString
					schstate = drvSql("schstate").ToString
					yr = drvSql("yr").ToString
					schzip = drvSql("schzip").ToString
					invno = drvSql("invno").ToString
					ponum = drvSql("ponum").ToString
					basicinvamt = drvSql("basicinvamt").ToString
					persinvamt = drvSql("persinvamt").ToString
					Try
						onlinecuto = drvSql("onlinecuto")
					Catch ex As Exception

					End Try
					Try
						basiconly = drvSql("basiconly")
					Catch ex As Exception

					End Try


				Next

				If Today.Date > onlinecuto Then
					Me.SetErrorMessage(5)
				End If

				cAddress = "Código de Pago: " & invno & " &nbsp;&nbsp; Nombre de la escuela: " & RTrim(schname) & " &nbsp;&nbsp; "
				Session.Add("caddress", cAddress)

				ShopCart.schcode = schcode
				ShopCart.schname = schname
				ShopCart.ponum = IIf(ponum <> Nothing, ponum, "")
				ShopCart.invno = invno
				ShopCart.basicinvamt = basicinvamt
				ShopCart.persinvamt = persinvamt
				ShopCart.basiconly = basiconly
				ShopCart.yr = yr
				Session.Add("Cart", ShopCart)
				Session.Add("schcode", schcode)

				Page.Validate()

				If persinvamt = "" And basicinvamt = "" Then
					Me.SetErrorMessage(4)
				End If

				Response.Redirect("SPAN_ParentPayment.aspx")

			Else
				'MsgBox1.Show("Incorrect Code", "Your code has been entered incorrectly – please enter your five digit pay code", Nothing, New EO.Web.MsgBoxButton("OK"))
			End If 'end cschool length check

		End If

	End Sub




	Private Sub SetErrorMessage(ByVal errcode As Integer)

		Select Case errcode
			Case 1 ''no connection
				Session("defaulterrormessage") = "La conexión al servidor de datos no está disponible. Comuníquese con su representante de Servicio al Cliente de Memory Book."
				Dim rdirect As String = "default1_SPAN.aspx"
				Response.Redirect(rdirect)
			Case 2 ''incorrect data format
				Session("defaulterrormessage") = "Ingrese un código numérico válido. Inténtelo nuevamente o contacte a su representante de Servicio al Cliente de Memory Book para solicitar asistencia."
				Dim rdirect As String = "SPAN_default1.aspx"
				Response.Redirect(rdirect)
			Case 3 'record not found
				Session("defaulterrormessage") = "Su código no se encuentra en nuestros registros. Comuníquese con el asesor de su escuela."
				Dim rdirect As String = "SPAN_default1.aspx"
				Response.Redirect(rdirect)
			Case 4 'no invoice info
				Session("defaulterrormessage") = "Su información de precios no se encuentra en nuestros registros. Comuníquese con el asesor de su escuela."
				Dim rdirect As String = "SPAN_default1.aspx"
				Response.Redirect(rdirect)
			Case 5 'cut off date 
				Session("defaulterrormessage") = "Su fecha límite en línea ha expirado. Comuníquese con el asesor de su escuela."
				Dim rdirect As String = "SPAN_default1.aspx"
				Response.Redirect(rdirect)
			Case 6 'cut off date 
				Session("defaulterrormessage") = "No se ha podido encontrar su información de facturación en línea. Comuníquese con el asesor de su escuela."
				Dim rdirect As String = "SPAN_default1.aspx"
				Response.Redirect(rdirect)
			Case 7 'cut off date 
				Session("defaulterrormessage") = "No se ha podido encontrar su información de facturación en línea. Comuníquese con el asesor de su escuela."
				Dim rdirect As String = "SPAN_default1.aspx"
				Response.Redirect(rdirect)
		End Select

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
	Protected Sub InsertSyslog()
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

			cmd.Parameters.AddWithValue("@page", "Default1.aspx")
			cmd.Parameters.AddWithValue("@platform", syslog(0, 1))
			cmd.Parameters.AddWithValue("@browser", syslog(0, 0))
			cmd.Parameters.AddWithValue("@ipaddress", syslog(0, 2))
			cmd.Parameters.AddWithValue("@pfatime", DateTime.Parse(syslog(0, 3)))
			cmd.Parameters.AddWithValue("@submittime", DateTime.Parse(syslog(0, 4)))
			cmd.Parameters.AddWithValue("@MobInfo", syslog(0, 5))
			cmd.CommandText = "Insert into mbc.syslog (page,browser,platform,ipaddress,pfatime,submittime,MobInfo) Values(@page,@browser,@platform,@ipaddress,@pfatime,@submittime,@MobInfo);"
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