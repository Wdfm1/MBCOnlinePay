Imports Microsoft.VisualBasic

Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports MySql.Data.MySqlClient
Imports System.Text
Imports System.ServiceModel
Imports System.IO.File
Imports System.IO
Imports System

<Serializable()> _
Public Class Cart


	'Private orderDT As System.Data.DataTable

	Private vuseremail As String = ""
	Private vschcode As String = ""
	Private vschname As String = ""
	Private vinvno As String = ""
	Private vponum As String = ""
	Private vbasicinvamt As String = ""
	Private vpersinvamt As String = ""
	Private vbasiconly As Boolean = True
	Private vorderid As Integer = 0
	Private vordertotal As Decimal = 0
	Private vinkpers As Boolean = 0
	Private vfoilpers As Boolean = 0
	Private vpicpers As Boolean = 0
	Private vfoiltxt As Boolean = 0
	Private vinkpersamt As String = ""
	Private vfoilpersamt As String = ""
	Private vfoiltxtamt As String = ""
    Private vpicpersamt As String = ""
    Private vinktxt As Boolean = 0
    Private vinktxtamt As String = ""
    Private vluvline As Boolean = 0
    Private vluvlineamt As String = ""
	Dim vyr As String = ""
	'Private objDR As System.Data.DataRow
	Private vxmltable As String = ""

#Region "Properties"
    Public Property LuvLineAmt As String      'xmlstring
        Get
            Return vluvlineamt
        End Get
        Set(ByVal Value As String)
            vluvlineamt = Value
        End Set
    End Property
    Public Property LuvLine As Boolean     'xmlstring
        Get
            Return vluvline
        End Get
        Set(ByVal Value As Boolean)
            vluvline = Value
        End Set
    End Property




    Public Property picpersamt As String      'xmlstring
        Get
            Return vpicpersamt
        End Get
        Set(ByVal Value As String)
            vpicpersamt = Value
        End Set
    End Property
    Public Property inkpersamt As String      'xmlstring
        Get
            Return vinkpersamt
        End Get
        Set(ByVal Value As String)
            vinkpersamt = Value
        End Set
    End Property
    Public Property foilpersamt As String     'xmlstring
        Get
            Return vfoilpersamt
        End Get
        Set(ByVal Value As String)
            vfoilpersamt = Value
        End Set
    End Property
    Public Property foiltxtamt As String      'xmlstring
        Get
            Return vfoiltxtamt
        End Get
        Set(ByVal Value As String)
            vfoiltxtamt = Value
        End Set
    End Property
    Public Property foiltxt As Boolean    'xmlstring
        Get
            Return vfoiltxt
        End Get
        Set(ByVal Value As Boolean)
            vfoiltxt = Value
        End Set
    End Property
    Public Property inktxt As Boolean    'xmlstring
        Get
            Return vinktxt
        End Get
        Set(ByVal Value As Boolean)
            vinktxt = Value
        End Set
    End Property
    Public Property inktxtamt As String      'xmlstring
        Get
            Return vinktxtamt
        End Get
        Set(ByVal Value As String)
            vinktxtamt = Value
        End Set
    End Property

    Public Property picpers As Boolean    'xmlstring
        Get
            Return vpicpers
        End Get
        Set(ByVal Value As Boolean)
            vpicpers = Value
        End Set
    End Property
    Public Property foilpers As Boolean   'xmlstring
        Get
            Return vfoilpers
        End Get
        Set(ByVal Value As Boolean)
            vfoilpers = Value
        End Set
    End Property
    Public Property inkpers As Boolean    'xmlstring
        Get
            Return vinkpers
        End Get
        Set(ByVal Value As Boolean)
            vinkpers = Value
        End Set
    End Property
    Public Property yr As String      'xmlstring
        Get
            Return vyr
        End Get
        Set(ByVal Value As String)
            vyr = Value
        End Set
    End Property
    Public Property Order As String   'xmlstring
        Get
            Return vxmltable
        End Get
        Set(ByVal Value As String)
            vxmltable = Value
        End Set
    End Property
    Public Property OrderTotal As Decimal
        Get
            Return vordertotal
        End Get
        Set(ByVal Value As Decimal)
            vordertotal = Value
        End Set
    End Property
    Public Property OrderId As Integer
        Get
            Return vorderid
        End Get
        Set(ByVal Value As Integer)
            vorderid = Value
        End Set
    End Property

    Public Property email As String
        Get
            Return vuseremail
        End Get
        Set(ByVal Value As String)
            vuseremail = Value
        End Set
    End Property
    Public Property schcode As String
        Get
            Return vschcode
        End Get
        Set(ByVal Value As String)
            vschcode = Value
        End Set
    End Property
    Public Property schname As String
        Get
            Return vschname
        End Get
        Set(ByVal Value As String)
            vschname = Value
        End Set
    End Property
    Public Property invno As String
        Get
            Return vinvno
        End Get
        Set(ByVal Value As String)
            vinvno = Value
        End Set
    End Property
    Public Property ponum As String
        Get
            Return vponum
        End Get
        Set(ByVal Value As String)
            vponum = Value
        End Set
    End Property
    Public Property basicinvamt As String
        Get
            Return vbasicinvamt
        End Get
        Set(ByVal Value As String)
            vbasicinvamt = Value
        End Set
    End Property
    Public Property persinvamt As String
        Get
            Return vpersinvamt
        End Get
        Set(ByVal Value As String)
            vpersinvamt = Value
        End Set
    End Property
    Public Property basiconly As Boolean
        Get
            Return vbasiconly
        End Get
        Set(ByVal Value As Boolean)
            vbasiconly = Value
        End Set
    End Property
    'Public Property order() As System.Data.DataTable
    '	Get
    '		Return orderDT
    '	End Get
    '	Set(ByVal Value As System.Data.DataTable)
    '		orderDT = Value
    '	End Set
    'End Property
#End Region
	Sub New()

		'Me.MakeCart()
	End Sub
#Region "Make Tables Functions"
	'Sub MakeCart()
	'	orderDT = New System.Data.DataTable("Order")
	'	orderDT.Columns.Add("id", GetType(Integer))
	'	orderDT.Columns("id").AutoIncrement = True
	'	orderDT.Columns("id").AutoIncrementSeed = 1
	'	orderDT.Columns.Add("grade", GetType(String))
	'	orderDT.Columns.Add("booktype", GetType(String))
	'	orderDT.Columns.Add("teacher", GetType(String))
	'	orderDT.Columns.Add("perstext1", GetType(String))
	'	orderDT.Columns.Add("perstext2", GetType(String))
	'	orderDT.Columns.Add("perstext3", GetType(String))
	'	orderDT.Columns.Add("studentfname", GetType(String))
	'	orderDT.Columns.Add("studentlname", GetType(String))
	'	orderDT.Columns.Add("emailaddress", GetType(String))
	'	orderDT.Columns.Add("schcode", GetType(String))
	'	orderDT.Columns.Add("itemamount", GetType(Decimal))
	'	orderDT.Columns.Add("itemqty", GetType(Integer))
	'	orderDT.Columns.Add("schinvoicenumber", GetType(Integer))
	'	orderDT.Columns.Add("itemtotal", GetType(Decimal))

	'	'add a row
	'	'Dim dr As DataRow = orderDT.NewRow()
	'	'orderDT.Rows.Add(dr)

	'	Me.SetOrder(orderDT)
	'End Sub

#End Region
	'Function GetOrder() As DataTable
	'	Dim xmlStream As New System.IO.StringReader(Me.Order)
	'	'xmlStream.Position = 0
	'	Dim dtorder As New DataTable
	'	Dim reader As New System.Xml.XmlTextReader(xmlStream)
	'	dtorder.ReadXml(reader)
	'	Return dtorder
	'End Function
	'Sub SetOrder(orderDT As DataTable)
	'	Dim bkorder As String = Me.Order
	'	Dim xmlStream As New StringWriter
	'	Me.Order = ""
	'	orderDT.WriteXml(xmlStream, XmlWriteMode.WriteSchema)
	'	Me.Order = xmlStream.ToString
	'End Sub

	Sub ClearOrder()
		'Me.shipmethod = Nothing
		'Me.promocode = Nothing
		'Dim rcount As Integer = Me.orderdetail.Rows.Count - 1

		'Do While rcount > -1
		'    Me.orderdetail.Rows(rcount).Delete()
		'    Me.orderdetail.Rows(rcount).AcceptChanges()
		'    rcount = rcount - 1
		'Loop


	End Sub



	Sub Delete_Item(ByVal orddt As System.Data.DataTable, ByVal opdt As System.Data.DataTable, ByVal detailid As Integer, ByVal ProdCode As String, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) 'dataview
		'Dim detailid As Integer = orddt.Rows(e.RowIndex).Item("DetailId") 'get order detail id 

		'For Each dr As DataRow In orddt.Rows  'ds.Tables(0).Rows

		'    If (dr("detailid") = detailid) Then

		'        dr.Delete()
		'        orddt.AcceptChanges()
		'        Exit For
		'    End If
		'Next
		'Me.orderdetail = orddt


	End Sub
	'Function AddToCart(ByVal order As System.Data.DataTable, ByVal grade As String, ByVal booktype As String, ByVal teacher As String, _
	'					ByVal text1 As String, ByVal text2 As String, ByVal text3 As String, ByVal studfname As String, ByVal studlname As String, ByVal emailaddress As String, _
	'					ByVal schcode As String, ByVal itemamount As Decimal, ByVal qty As Integer, ByVal schinvoice As String) As Integer
	'	objDR = order.NewRow

	'	objDR("grade") = grade
	'	objDR("booktype") = booktype
	'	objDR("teacher") = teacher
	'	objDR("perstext1") = text1
	'	objDR("perstext2") = text2
	'	objDR("perstext3") = text3
	'	objDR("studentfname") = studfname
	'	objDR("studentlname") = studlname
	'	objDR("emailaddress") = emailaddress
	'	objDR("schcode") = schcode
	'	objDR("itemamount") = itemamount
	'	objDR("itemqty") = qty
	'	objDR("schinvoicenumber") = schinvoice

	'	objDR("itemtotal") = qty * itemamount


	'	order.Rows.Add(objDR)
	'	Me.SetOrder(order)
	'	'Dim rowcount As Integer = order.Rows.Count
	'	'Dim detid As Integer = order.Rows(rowcount - 1).Item("DetailId")

	'	'Return detid.ToString
	'	Return Nothing
	'End Function

	'Sub AddOrderNote(ByVal orderDT As System.Data.DataTable, ByVal notetext As String)
	'	objDR = orderDT.Rows(0)
	'	objDR("notes") = notetext
	'	Me.SetOrder(orderDT)
	'	'Me.order = orderDT

	'End Sub
	'Sub AddSubTotal(ByVal orderDT As System.Data.DataTable, ByVal subtotal As Decimal)
	'	objDR = orderDT.Rows(0)
	'	'objDR("subtotal") = subtotal.ToString("N2")
	'	objDR("subtotal") = CStr(subtotal)
	'	Me.SetOrder(orderDT)
	'	'Me.order = orderDT
	'End Sub

	'Sub AddTotal(ByVal orderDT As DataTable, ByVal orderdetailDT As DataTable)
	'	Dim total As Decimal
	'	Dim strtotal As String

	'	For Each row As DataRow In orderdetailDT.Rows
	'		Try
	'			total += CDec(row.Item("totalprice"))
	'		Catch ex As Exception

	'		End Try
	'	Next row
	'	Dim orderrow As DataRow = orderDT.Rows(0)
	'	Dim shippingcost As Decimal = CDec(orderrow.Item("shippingcost"))
	'	total = total + shippingcost
	'	strtotal = CStr(total)
	'	orderrow.Item("total") = strtotal
	'	'Me.order = orderDT
	'	Me.SetOrder(orderDT)

	'End Sub



End Class
