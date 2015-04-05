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


Partial Class _Default1
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

		'lblpaytype.Text = "Parent Payment Page"
		'h1.Text = "Parents should enter your code in the textbox below and click next to proceed. If you are a school, please visit the school page"
		'h1.NavigateUrl = "http://www.memorybook.com/online-pay/Default.aspx"



		'Session.Add("custtype", "school") 'jsut for testing use above when done
		Session.Add("custtype", "parent") 'jsut for testing use above when done


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
                  & "schphone,cust.schcode, schfax,invno,basicinvamt,persinvamt,basiconly,yr,ponum,onlinecuto,picpers,picpersamt,inkpers,inktxt,inktxtamt,foilpers,inkpersamt,foilpersamt, foiltxtamt,foiltxt " _
                  & "FROM cust left join invoiceinfo on cust.schcode=invoiceinfo.schcode WHERE invoiceinfo.invno=" & cschcode & ";"

				Me.cus11.SelectCommand = selectcmd

				Dim cAddress As String = ""

				Try
					dvSql = CType(Me.cus11.Select(DataSourceSelectArguments.Empty), Data.DataView)
				Catch ex As Exception


					If ex.Message = "Unable to connect to any of the specified MySQL hosts." Then
						Me.SetErrorMessage(1)
					ElseIf ex.Message = "Unable to convert MySQL date/time value to System.DateTime" Then
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
				Dim inkpers As Boolean = 0
				Dim foilpers As Boolean = 0
				Dim picpers As Boolean = 0
                Dim foiltxt As Boolean = 0
                Dim inktxt As Boolean = 0
				Dim inkpersamt As String = ""
				Dim foilpersamt As String = ""
                Dim foiltxtamt As String = ""
                Dim inktxtamt As String = ""
				Dim picpersamt As String = ""
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
					'below is an exception because the school sent the flyers out with old invoice number. Remove after year 15 is done.
					If schcode = "107566" Then
						invno = "71966"
 ElseIf schcode = "094845" Then
                        invno = "72312"
					Else
						invno = drvSql("invno").ToString
					End If

					ponum = drvSql("ponum").ToString
					basicinvamt = drvSql("basicinvamt").ToString
					persinvamt = drvSql("persinvamt").ToString
					inkpersamt = drvSql("inkpersamt").ToString
					foilpersamt = drvSql("foilpersamt").ToString
					foiltxtamt = drvSql("foiltxtamt").ToString
                    picpersamt = drvSql("picpersamt").ToString
                    inktxtamt = drvSql("inktxtamt").ToString
					Try
						onlinecuto = drvSql("onlinecuto")
					Catch ex As Exception

					End Try
					Try
						basiconly = drvSql("basiconly")
						inkpers = drvSql("inkpers")
						foilpers = drvSql("foilpers")
						foiltxt = drvSql("foiltxt")
                        picpers = drvSql("picpers")
                        inktxt = drvSql("inktxt")
					Catch ex As Exception

					End Try


				Next

				If Today.Date > onlinecuto Then
					Me.SetErrorMessage(5)
				End If

				cAddress = "Pay Code: " & invno & " &nbsp;&nbsp; School Name: " & RTrim(schname) & " &nbsp;&nbsp; "
				Session.Add("caddress", cAddress)

				ShopCart.schcode = schcode
				ShopCart.schname = schname
				ShopCart.ponum = IIf(ponum <> Nothing, ponum, "")
				ShopCart.invno = invno
				ShopCart.basicinvamt = basicinvamt
				ShopCart.persinvamt = persinvamt
				ShopCart.basiconly = basiconly
				ShopCart.yr = yr
				ShopCart.inkpers = inkpers
				ShopCart.picpers = picpers
				ShopCart.picpersamt = picpersamt
				ShopCart.foilpers = foilpers
				ShopCart.inkpersamt = inkpersamt
				ShopCart.foilpersamt = foilpersamt
				ShopCart.foiltxtamt = foiltxtamt
                ShopCart.foiltxt = foiltxt
                ShopCart.inktxt = inktxt
                ShopCart.inktxtamt = inktxtamt
				Session.Add("Cart", ShopCart)
				Session.Add("schcode", schcode)

				Page.Validate()

				Response.Redirect("ParentPayment.aspx")

			Else
				'MsgBox1.Show("Incorrect Code", "Your code has been entered incorrectly – please enter your five digit pay code", Nothing, New EO.Web.MsgBoxButton("OK"))
			End If 'end cschool length check

		End If

	End Sub




    Private Sub SetErrorMessage(ByVal errcode As Integer)

        Select Case errcode
            Case 1 ''no connection
                Session("defaulterrormessage") = "The data server connection is not available. Please contact your Memory Book customer representative. "
                Dim rdirect As String = "default1.aspx"
                Response.Redirect(rdirect)
            Case 2 ''incorrect data format
                Session("defaulterrormessage") = "Please enter a valid numeric code. Please try again or contact your Memory Book customer representative for help. "
                Dim rdirect As String = "default1.aspx"
                Response.Redirect(rdirect)
            Case 3 'record not found
                Session("defaulterrormessage") = "Your code could not be found in our records. Please contact your school advisor."
                Dim rdirect As String = "default1.aspx"
                Response.Redirect(rdirect)
            Case 4 'no invoice info
                Session("defaulterrormessage") = "Your pricing information could not be found in our records. Please contact your school advisor."
                Dim rdirect As String = "default1.aspx"
                Response.Redirect(rdirect)
            Case 5 'cut off date 
                Session("defaulterrormessage") = "Your online cut off date has expired. Please contact your school advisor."
                Dim rdirect As String = "default1.aspx"
                Response.Redirect(rdirect)
            Case 6 'cut off date 
                Session("defaulterrormessage") = "Your online invoice information could not be found.Please contact your school advisor."
                Dim rdirect As String = "default1.aspx"
                Response.Redirect(rdirect)
            Case 7 'cut off date 
                Session("defaulterrormessage") = "Your online invoice information could not be found.Please contact your school advisor."
                Dim rdirect As String = "default1.aspx"
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