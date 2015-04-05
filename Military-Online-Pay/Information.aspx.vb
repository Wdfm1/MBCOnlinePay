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
Imports System.IO
Partial Class Information
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
        Dim a As String = Session("pagesubmitted")

        Page.MaintainScrollPositionOnPostBack = True
        If Session("pagesubmitted") = True Then
            Session.Clear()
            Response.Redirect("Default_MILITARY.aspx")
        End If
        If Not IsPostBack Then
            If Session("basiconly") = True Then

                Me.basic.Items.Add("YEARBOOK")
                Me.basic.SelectedValue() = "YEARBOOK"
                lblamount.Text = Session("basicinvamt")
                Me.Panel1.Visible = False 'personalized text box wording
            Else 'or personalized
                Me.basic.Items.Add("YEARBOOK")
                Me.basic.SelectedValue() = "YEARBOOK"
                Me.basic.Items.Add("PERSONALIZED YEARBOOK")
                lblamount.Text = Session("basicinvamt")
                'Me.x_amount.Text = Session("persinvamt")
                Me.Panel1.Visible = True
                Me.Panel1.Enabled = False
            End If
        End If
        Session("defaulterrormessage") = ""
        Me.x_schcode.Value = Session("schcode")
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Session("caddress") <> Nothing Then
            If Page.IsValid Then
                UpdateDatabase()
                
            Else 'session empty
                Session("defaulterrormessage") = "Your session has timed out. Please renter your unit code."
                Response.Redirect("Default_MILITARY.aspx")
            End If
        End If 'session empty




    End Sub
    
    Protected Sub UpdateDatabase()
        Dim strconn As String
        Dim yr As String

        strconn = cus11.ConnectionString
        Dim orderid As Integer = GetOrderId()
        Try
            Dim conn As MySqlConnection = New MySqlConnection(strconn)
            Dim cmd As New MySqlCommand("", conn)
            '    cmd.CommandText = "Insert into mbc.orders (ddate,transid,schcode,poamt,schname,paytype,grade,perstext1,perstext2,addr,city,state,zip,teachname,basiconly,studname,invno,custemail) Values(curdate(),'" & Session("transid") & "','" & Session("schcode") & "'," & Session("payment") _
            '& ",'" & Session("schname") & "','CC','" & Me.grade.SelectedValue & "','" & Me.txtperstext1.Text & "','" & Me.txtperstext2.Text & " ','" & Me.txtaddr.Text & " ','" & Me.txtcity.Text & "','" & Me.txtstate.Text & "','" & Me.txtzip.Text & "','" & Me.teachname.Text & "','" & Me.basic.SelectedValue & "','" & Me.studname.Text & "','" & Session("invno") & "'," & Me.txtemail.Text & "')"
            cmd.Parameters.AddWithValue("@orderid", orderid)
            cmd.Parameters.AddWithValue("@schname", Session("schname"))
            cmd.Parameters.AddWithValue("@grade", "Military")
            cmd.Parameters.AddWithValue("@booktype", basic.SelectedValue)
            cmd.Parameters.AddWithValue("@teacher", teachname.Text)
            cmd.Parameters.AddWithValue("@perstext1", txtperstext1.Text)
            cmd.Parameters.AddWithValue("@perstext2", txtperstext2.Text)
            cmd.Parameters.AddWithValue("@studentfname", fname.Text)
            cmd.Parameters.AddWithValue("@studentlname", lname.Text)
            cmd.Parameters.AddWithValue("@emailaddress", txtemail.Text)
            cmd.Parameters.AddWithValue("@schcode", Session("schcode"))
            cmd.Parameters.AddWithValue("@itemamount", lblamount.Text)
            cmd.Parameters.AddWithValue("@itemtotal", lblamount.Text)
            cmd.Parameters.AddWithValue("@itemqty", "1")
            cmd.Parameters.AddWithValue("@schinvoicenumber", Session("invno"))
            If Now.Month < 6 Then
                yr = Now.Year.ToString.Substring(2, 2)
            Else
                Dim ddate As DateTime = Now.AddYears(1)
                yr = ddate.Year.ToString.Substring(2, 2)
            End If

            cmd.Parameters.AddWithValue("@yr", yr)
            cmd.CommandText = "Insert into mbc.orders (orddate,yr,parentpayment,schname,orderid,grade,booktype,teacher,perstext1,perstext2,studentfname,studentlname,emailaddress,schcode,itemamount,itemtotal,itemqty,schinvoicenumber)Values(Now(),@yr,1,@schname,@orderid,@grade,@booktype,@teacher,@perstext1,@perstext2,@studentfname,@studentlname,@emailaddress,@schcode,@itemamount,@itemtotal,@itemqty,@schinvoicenumber);"
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()

            cmd.Connection.Close()
            Response.Redirect("https://www.securepaymentportal.com/MilitarySecure/MilPayment.aspx?orderid=" & orderid)

          
        Catch ex As Exception
            'create the mail message
            Dim mail As New MailMessage()

            mail.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"))
            mail.To.Add("randy@woodalldevelopment.com")
            'set the content
            mail.Subject = "Mysql Error:Order Insert from " & Session("schname") & "(" & Session("schcode") & " " & Date.Now.ToString & ")"
            mail.Body = "An error occured inserting an order record into the Mysql database server. The following data was not recorded in the order table." & "<br/>" & _
             "Unit Name:" & Session("schname") & "<br/>" & _
             "Unit Code:" & Session("schcode") & "<br/>" & _
             "Amount:" & lblamount.Text & "<br/>" & _
             "Invoice Number:" & Session("invno") & "<br/>" & _
             "OrderId:" & orderid & " <br/>" & _
             "Grade:Military <br/>" & _
             "BookType:1<br/>" & _
             "Unit Leader:" & teachname.Text & " <br/>" & _
            "Line1:" & txtperstext1.Text & "<br/>" & _
            "Line2:" & txtperstext2.Text & "<br/>" & _
            "First Name:" & fname.Text & "<br/>" & _
            "Last Name:" & lname.Text & "<br/>" & _
            "Email Address:" & txtemail.Text & "<br/>" & _
             "QTY:1<br/><br/>" & _
             "Mysql Exception Code:" & ex.Message
            mail.IsBodyHtml = True
            'send the message
            Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("SmtpServer"))
            smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
            smtp.Send(mail)
            MsgBox1.Show("Order Error", "There was an error placing your order. Please try again or contact your military advisor.", Nothing, New EO.Web.MsgBoxButton("OK", "", "updateerror"))

        End Try



    End Sub
    Private Function GetOrderId() As Integer
        Dim strconn As String
        Dim orderid As Integer
        strconn = cus11.ConnectionString
        Dim conn As MySqlConnection = New MySqlConnection(strconn)
        Dim cmd As New MySqlCommand("", conn)
        cmd.CommandText = "SELECT MAX(o.`orderid`) FROM `orders` o;"
        Try
            cmd.Connection.Open()
            orderid = cmd.ExecuteScalar() 'get the highest orderid in order table
            orderid = orderid + 1 'increment by 1

        Catch ex As Exception
            orderid = 1
        Finally
            cmd.Connection.Close()
        End Try

        Return orderid

    End Function




    Protected Sub basic_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles basic.SelectedIndexChanged
        If Me.basic.SelectedValue() = "YEARBOOK" Then
            lblamount.Text = Session("basicinvamt")
            Me.RequiredFieldValidator11.Enabled = False
            Me.Panel1.Enabled = False
            Me.txtperstext1.Text = ""
            Me.txtperstext1.BackColor = Drawing.Color.WhiteSmoke
            Me.txtperstext2.Text = ""
            Me.txtperstext2.BackColor = Drawing.Color.WhiteSmoke
        Else
            lblamount.Text = Session("persinvamt")
            Me.Panel1.Enabled = True
            Me.RequiredFieldValidator11.Enabled = True
            Me.txtperstext1.BackColor = Drawing.Color.White
            Me.txtperstext2.BackColor = Drawing.Color.White
        End If
    End Sub



    Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
        If e.CommandName = "updateerror" Then
            Session.Clear()
            Response.Redirect("Default_MILITARY.aspx")
        End If
    End Sub
End Class
