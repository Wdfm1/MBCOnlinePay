Imports System.Data

Partial Class Admin_Administration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If HttpContext.Current.Request.IsAuthenticated Then
            lblschcode.Text = Session("schcode")
            lblschcode2.Text = lblschcode.Text
            'for testing
            'lblschcode.Text = "038752"
            'lblschcode2.Text = "038752"


            lblschname.Text = Session("schname")
            If Not IsPostBack Then
                ViewState.Add("custcmd", "")
            Else
                If ViewState("custcmd") = "" Then
					dsorder.SelectCommand = "SELECT orders.teacher,  orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal,  orders.booktype, orders.emailaddress, orders.perstext1, orders.perstext2,  orders.paytype, orders.schname, payment.transid  FROM orders INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode) AND (orders.yr = '15') AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, orders.orderid"


                Else
                    dsorder.SelectCommand = ViewState("custcmd")
                End If

            End If
        Else
            Response.Redirect("http://www.memorybook.com")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If txtorderid.Text = Nothing Then

			dsorder.SelectCommand = "SELECT orders.teacher, orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal, orders.booktype, orders.emailaddress,   orders.perstext1, orders.perstext2, orders.paytype, orders.schname, payment.transid  FROM orders INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode) AND (orders.yr = '15') AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, orders.orderid"

            ViewState("custcmd") = dsorder.SelectCommand
        Else
			dsorder.SelectCommand = "SELECT orders.teacher, orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal, orders.booktype, orders.emailaddress,   orders.perstext1, orders.perstext2, orders.paytype, orders.schname, payment.transid FROM orders INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode) and (orders.yr = '15') and ORDERS.orderid=@orderid AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, orders.orderid;"
            ViewState("custcmd") = dsorder.SelectCommand

        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click



        If txtstudentname.Text = Nothing Then
			dsorder.SelectCommand = "SELECT orders.teacher, orders.itemamount, orders.itemqty,orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal, orders.parentpayment, orders.booktype, orders.emailaddress,  orders.perstext1, orders.perstext2,  orders.paytype, orders.schname, payment.transid FROM orders INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode)and(orders.yr = '15') AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, orders.orderid;"
            ViewState("custcmd") = dsorder.SelectCommand
        Else
			dsorder.SelectCommand = "SELECT orders.teacher, orders.itemamount, orders.itemqty, orders.orderid, orders.orddate, orders.grade, orders.studentfname, orders.studentlname, orders.itemtotal, orders.booktype, orders.emailaddress,  orders.perstext1, orders.perstext2, orders.paytype, orders.schname, payment.transid  FROM orders INNER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.schcode = @schcode) and upper(orders.studentlname)=upper(@studentlname)and(orders.yr = '15') AND (payment.orderid IS NOT NULL) ORDER BY orders.orddate, ORDERS.orderid ;"
            ViewState("custcmd") = dsorder.SelectCommand

        End If
    End Sub


    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        Dim dvSql As New DataView
		'Dim drvSql As DataRowView
		Dim a As String = dsorder.SelectCommand
        Try
            dvSql = CType(Me.dsorder.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception

        End Try
        Dim dtorder As DataTable = dvSql.Table

        '
        Dim context As HttpContext = HttpContext.Current
        context.Response.Clear()
		context.Response.ContentType = "text/tab"
		context.Response.AddHeader("Content-Disposition", "attachment; filename=ParentOrders.xls")



        For i As Integer = 0 To dtorder.Columns.Count - 1
            If i > 0 Then
                'adding comma in between columns...
				context.Response.Write(vbTab)
				'context.Response.Write("vbtab")

            End If
            context.Response.Write(dtorder.Columns(i).ColumnName)
        Next
        context.Response.Write(Environment.NewLine)

        'Write data into context 
        For Each row As DataRow In dtorder.Rows
            '  here we are again going into loop because we want "comma" in between columns 
            For i As Integer = 0 To dtorder.Columns.Count - 1
                If i > 0 Then
					context.Response.Write(vbTab)
                End If
                context.Response.Write(row(i))
            Next
            context.Response.Write(Environment.NewLine)
        Next
        context.Response.[End]()

    End Sub

    Protected Sub dsorder_Selected(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorder.Selected
        lblrecs.Text = "Number of Records: " & e.AffectedRows.ToString

    End Sub

    Protected Sub lborderid_Click(sender As Object, e As System.EventArgs)
        Dim lborderid As LinkButton = sender

        Dim time As TimeSpan = Date.Now.TimeOfDay
        'type determine if email is sent when receipt page is accessed 1=email 0=noemail
        Response.Redirect("~/receipt.aspx?orderid=" & lborderid.Text & "&type=0&secval=" & time.ToString)
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Try
        
            Dim row As GridViewRow = e.Row
            Dim lblbooktype As Label = row.FindControl("lblbooktype")
            Dim chkbasic As CheckBox = row.FindControl("chkbasic")
            If Trim(lblbooktype.Text) = "YEARBOOK" Then
                chkbasic.Checked = True
            Else
                chkbasic.Checked = False
            End If
        Catch ex As Exception

        End Try

    End Sub

   

    Protected Sub rbpanels_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles rbpanels.SelectedIndexChanged
        If rbpanels.SelectedValue = "orders" Then 'orders

            pnlorders.Visible = True
            Pnldropdowns.Visible = False

        Else 'class
            pnlorders.Visible = False
            Pnldropdowns.Visible = True
        End If
    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click

        dsdropdowninfoadd.Insert()
        txtteacher.Text = ""


    End Sub
End Class
