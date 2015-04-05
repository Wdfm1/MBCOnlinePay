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
        If Not IsPostBack Then
            If Session("defaulterrormessage") = Nothing Then
                Session.Clear()
            End If
        End If

        'Session.Add("custtype", Request.QueryString("paytype"))

        'Session.Add("custtype", "school") 'jsut for testing use above when done
        'Session.Add("custtype", "parent") 'jsut for testing use above when done


        Page.MaintainScrollPositionOnPostBack = True

    End Sub



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        
        Dim cschcode As String = CustomerCode.Text
        Session.Add("errormessage", "")
        
        Dim dvSql As New DataView
        Dim drvSql As DataRowView



        Dim selectcmd As String = "SELECT cust.schname, schaddr, schaddr2, schcity,schstate, schzip," _
       & "schphone,cust.schcode, schfax,invno,basicinvamt,persinvamt,basiconly,ponum,onlinecuto " _
       & "FROM cust left join invoiceinfo on cust.schcode=invoiceinfo.schcode WHERE cust.schcode=" & cschcode & ";"
        Me.cus11.SelectCommand = selectcmd

        Dim cAddress As String = ""
        Try
            dvSql = CType(Me.cus11.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception

            'Session.Add("errorpage", "Error")
            If ex.Message = "Unable to connect to any of the specified MySQL hosts." Then
                Me.SetErrorMessage(1)
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
            onlinecuto = drvSql("onlinecuto")
            Try
                basiconly = drvSql("basiconly")
            Catch ex As Exception

            End Try



        Next
        If Today.Date > onlinecuto Then
            Me.SetErrorMessage(5)

        End If
       
        cAddress = "School Code: " & schcode & " &nbsp;&nbsp; School Name: " & RTrim(schname) & " &nbsp;&nbsp; Invoice# " & invno

        Session.Add("caddress", cAddress)

        Session.Add("schcode", schcode)
        Session.Add("schname", schname)
        Session.Add("invno", invno)
        Session.Add("ponum", IIf(ponum <> Nothing, ponum, ""))
        Session.Add("basicinvamt", basicinvamt)
        Session.Add("persinvamt", persinvamt)
        Session.Add("basiconly", basiconly)

        Page.Validate()
        Dim lValild As Boolean = Page.IsValid
        If lValild Then

            If persinvamt = "" And basicinvamt = "" Then
                Me.SetErrorMessage(4)
            End If

            Response.Redirect("Information.aspx")
        End If



    End Sub




    Private Sub SetErrorMessage(ByVal errcode As Integer)

        Select Case errcode
            Case 1 ''no connection
                Session("defaulterrormessage") = "The data server connection is not available. Please contact your military yearbook coordinator. "
                Dim rdirect As String = "Default_MILITARY.aspx"
                Response.Redirect(rdirect)
            Case 2 ''incorrect data format
                Session("defaulterrormessage") = "Please enter a 6 digit numeric unit code. Please try again or contact your military yearbook coordinator."
                Dim rdirect As String = "Default_MILITARY.aspx"
                Response.Redirect(rdirect)
            Case 3 'record not found
                Session("defaulterrormessage") = "Your unit code could not be found in our records. Please contact military yearbook coordinator or try again."
                Dim rdirect As String = "Default_MILITARY.aspx"
                Response.Redirect(rdirect)
            Case 4 'no invoice info
                Session("defaulterrormessage") = "Your pricing information could not be found in our records. Please contact military yearbook coordinator."
                Dim rdirect As String = "Default_MILITARY.aspx"
                Response.Redirect(rdirect)
            Case 5 'cut off date 
                Session("defaulterrormessage") = "Your online cut off date has expired.Please contact MBC customer support."
                Dim rdirect As String = "Default_MILITARY.aspx"
                Response.Redirect(rdirect)
        End Select

    End Sub







End Class