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


Partial Class _Default
    Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'Response.Redirect("Maint.aspx")
		LoadLic()
		If Not IsPostBack Then
			If Session("defaulterrormessage") = Nothing Then
				Session.Clear()
			End If
		End If


		lblpaytype.Text = "School Payment Page"
		h1.Text = "Schools should enter your code in the textbox below and click next to proceed. If you are a parent, please visit the parent page."
		h1.NavigateUrl = "http://www.memorybook.com/online-pay/default1.aspx"

		Page.MaintainScrollPositionOnPostBack = True

	End Sub



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
           
            Dim cschcode As String = CustomerCode.Text
            Session.Add("errormessage", "")
            
            Dim dvSql As New DataView
            Dim drvSql As DataRowView
			Dim selectcmd As String = ""
            'If Session("custtype") = "school" Then
            If cschcode.Length = 6 Then
                selectcmd = "SELECT cust.schname, schaddr, schaddr2, schcity,schstate, schzip," _
                & "schphone,cust.schcode, schfax,invno,basicinvamt,persinvamt,basiconly,ponum,onlinecuto " _
                & "FROM cust left join invoiceinfo on cust.schcode=invoiceinfo.schcode WHERE cust.schcode='" & cschcode & "';"
            Else
                SetErrorMessage(2)
            End If


            

            Me.cus11.SelectCommand = selectcmd

            Dim cAddress As String = ""
            Try
                dvSql = CType(Me.cus11.Select(DataSourceSelectArguments.Empty), Data.DataView)
            Catch ex As Exception

                'Session.Add("errorpage", "Error")
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
            'Dim amount As Decimal = 0
            Dim invno As String = ""
            For Each drvSql In dvSql
                schcode = drvSql("schcode").ToString()
                schname = drvSql("schname").ToString()
                schaddr = drvSql("schaddr").ToString
                schcity = drvSql("schcity").ToString
                schstate = drvSql("schstate").ToString
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
           
            cAddress = "School Code: " & schcode & " &nbsp;&nbsp; School Name: " & RTrim(schname)
         


            Session.Add("caddress", cAddress)

            Session.Add("schcode", schcode)
            Session.Add("schname", schname)
            Session.Add("invno", invno)
            Session.Add("ponum", IIf(ponum <> Nothing, ponum, ""))
            Session.Add("basicinvamt", basicinvamt)
            Session.Add("persinvamt", persinvamt)
            Session.Add("basiconly", basiconly)

            Page.Validate()
           
            Response.Redirect("https://www.securepaymentportal.com/MBCSecure/SchoolPay.aspx?schname=" & schname & "&schcode=" & schcode)


            'Response.Redirect("SchPayment.aspx")

        End If

    End Sub




    Private Sub SetErrorMessage(ByVal errcode As Integer)

        Select Case errcode
            Case 1 ''no connection
                Session("defaulterrormessage") = "The data server connection is not available. Please contact your Memory Book customer representative. "
                Dim rdirect As String = "default.aspx"
                Response.Redirect(rdirect)
            Case 2 ''incorrect data format
				Session("defaulterrormessage") = "Please enter a valid numeric code. Please try again or contact your Memory Book customer representative for help. "
                Dim rdirect As String = "default.aspx"
                Response.Redirect(rdirect)
            Case 3 'record not found
				Session("defaulterrormessage") = "Your code could not be found in our records. Please contact your school advisor."
                Dim rdirect As String = "default.aspx"
                Response.Redirect(rdirect)
            Case 4 'no invoice info
				Session("defaulterrormessage") = "Your pricing information could not be found in our records. Please contact your school advisor."
                Dim rdirect As String = "default.aspx"
                Response.Redirect(rdirect)
            Case 5 'cut off date 
				Session("defaulterrormessage") = "Your online cut off date has expired. Please contact your school advisor."
                Dim rdirect As String = "default.aspx"
                Response.Redirect(rdirect)
            Case 6 'cut off date 
				Session("defaulterrormessage") = "Your online invoice information could not be found.Please contact your school advisor."
                Dim rdirect As String = "default.aspx"
				Response.Redirect(rdirect)
			Case 7 'cut off date 
				Session("defaulterrormessage") = "Your online invoice information could not be found.Please contact your school advisor."
                Dim rdirect As String = "default.aspx"
				Response.Redirect(rdirect)
		End Select

    End Sub

    
    


    Protected Sub cv11_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        Dim retval As Boolean = True

        If Len(Me.CustomerCode.Text) <> 6 Then
            retval = False
        End If

        args.IsValid = retval
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
End Class