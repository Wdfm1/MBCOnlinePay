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
Partial Class echeck
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
        Dim a As String = Session("pagesubmitted")
        Page.MaintainScrollPositionOnPostBack = True
        If Session("pagesubmitted") = True Then
            Session.Clear()
            Response.Redirect("default.aspx")
        End If
        Session("defaulterrormessage") = ""
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Session("caddress") <> Nothing Then
            If Page.IsValid Then
                'pull from the store
                Dim gate As Object = OpenGateway()

                'build the request from the Form post
                Dim apiRequest As Object = CheckoutFormReaders.BuildAuthAndCaptureFromPost()

                Dim cardno As String = apiRequest.Method.ToString
                'set the amount - you can also set this from the page itself
                'you have to have a field named "x_amount"
                'apiRequest.Queue(ApiFields.Amount, order.Price.ToString())

                'send to Auth.NET
                Dim response__1 As Object = gate.Send(apiRequest)
                'We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
                'one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
                Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
                BaseGatewayResponse = response__1
                Dim CardComp As String = BaseGatewayResponse.CardType
                'be sure the amount paid is not over the amount required
                'If response__1.Amount > Session("amount") Then
                '    retval = False
                '    Me.FailedVal.Text = "You have entered an amount greater than what you owe."
                '    Me.FailedVal.Validate()
                '    Return
                '    'Response.Redirect("Error.aspx")
                'End If

                'If CardComp <> Me.CCCompany.SelectedValue Then
                '    retval = False
                '    Me.FailedVal.Validate()
                '    Return
                'End If
                Session.Add("payment", response__1.Amount)
                If response__1.Approved Then
                    Dim authcode As String = response__1.AuthorizationCode
                    Dim transid As String = response__1.TransactionID
                    Session.Add("transid", response__1.TransactionID)
                    Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                    & "<br /> Transaction ID: " & response__1.TransactionID & "<br />Payment Type:" & CardComp)
                    'record payment into database
                    Me.UpdateDatabase()
                    Me.email() 'email Hilary
                    If Me.email1.Text <> Nothing Then
                        Me.emailrecipt()
                    End If

                    'send to the receipt page
                    Session.Add("pagesubmitted", True)
                    Response.Redirect("Receipt.aspx")
                Else
                    Session.Add("ordermessage", "Payment was not submitted because of the following error:<br/>" & response__1.Message)
                    Response.Redirect("Receipt.aspx")

                End If
            End If
        Else 'session empty
            Session("defaulterrormessage") = "Your session has timed out. Please renter your school code."
            Response.Redirect("default.aspx")
        End If 'session empty
    End Sub
    Private Function OpenGateway() As IGateway
        'we used the form builder so we can now just load it up
        'using the form reader
        Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
        Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")
        If Directory.Exists("F:\IsDev") Then 'set dev settings
            Dim gate1 As New Gateway(login, transactionKey, False)
            Return gate1
        Else
            'this is set to test mode - change as needed.
            Dim gate1 As New Gateway(login, transactionKey, False)
            Return gate1
        End If
    End Function
    Protected Sub UpdateDatabase()
        Dim strconn As String
        If Directory.Exists("F:\IsDev") Then 'set dev settings
            strconn = "Server=memserver;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"
            Try
                Dim conn As MySqlConnection = New MySqlConnection(strconn)
                Dim cmd As New MySqlCommand("", conn)
                cmd.CommandText = "Insert into mbc.payment (ddate,transid,schcode,poamt,schname,paytype) Values(curdate(),'" & Session("transid") & "','" & Session("schcode") & "'," & Session("payment") _
                & "," & Chr(39) & Session("schname") & Chr(39) & ",'EC')"
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()

                cmd.Connection.Close()
            Catch ex As Exception
                'create the mail message
                Dim mail As New MailMessage()
                'set the addresses
                'set the addresses
                'mail.From = New MailAddress("authnet@memorybook.com")
                'mail.To.Add("authnet@memorybook.com")
                mail.From = New MailAddress("randy@woodalldevelopment.com")
                mail.To.Add("randy@woodalldevelopment.com")
                'set the content
                mail.Subject = "Mysql Error:Payment from " & Session("schname") & "(" & Session("schcode") & ")"
                mail.Body = "An error occured inserting a payment record into the Mysql database server. The following data was not recorded in the payment table." & "<br/>" & _
                 "School Name:" & Session("schname") & "<br/>" & _
                 "School Code:" & Session("schcode") & "<br/>" & _
                 "Amount:" & Session("payment") & "<br/>" & _
                 "PO Number:" & Session("ponum") & "<br/>" & _
                 "TransactionId:" & Session("transid") & "<br/>" & _
                 "Invoice Number:" & Session("invno") & "<br/>" & _
                 "Payment Type: EC <br/><br/>" & _
                 "Mysql Exception Code:" & ex.Message
                mail.IsBodyHtml = True
                'send the message
                Dim smtp As New SmtpClient("mail.woodalldevelopment.com")
                smtp.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
                smtp.Send(mail)
            End Try


        Else 'live settings

            strconn = "Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"

            Try
                Dim conn As MySqlConnection = New MySqlConnection(strconn)
                Dim cmd As New MySqlCommand("", conn)
                cmd.CommandText = "Insert into mbc.payment (ddate,transid,schcode,poamt,schname,paytype,page) Values(curdate(),'" & Session("transid") & "','" & Session("schcode") & "'," & Session("payment") _
                & ",'" & Session("schname") & "','EC','SCHOOL')"
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()

                cmd.Connection.Close()
            Catch ex As Exception
                'create the mail message
                Dim mail As New MailMessage()
                'set the addresses
                'set the addresses
                'mail.From = New MailAddress("authnet@memorybook.com")
                'mail.To.Add("authnet@memorybook.com")
                mail.From = New MailAddress("authnet@memorybook.com")
                mail.To.Add("authnet@memorybook.com")
                'set the content
                mail.Subject = "Mysql Error:Payment from " & Session("schname") & "(" & Session("schcode") & ")"
                mail.Body = "An error occured inserting a payment record into the Mysql database server. The following data was not recorded in the payment table." & "<br/>" & _
                 "School Name:" & Session("schname") & "<br/>" & _
                 "School Code:" & Session("schcode") & "<br/>" & _
                 "Amount:" & Session("payment") & "<br/>" & _
                 "PO Number:" & Session("ponum") & "<br/>" & _
                 "TransactionId:" & Session("transid") & "<br/>" & _
                 "Invoice Number:" & Session("invno") & "<br/>" & _
                 "Payment Type: EC <br/><br/>" & _
                 "Mysql Exception Code:" & ex.Message
                mail.IsBodyHtml = True
                'send the message                
                Dim smtp As New SmtpClient("192.168.1.245")
                smtp.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
                smtp.Send(mail)
            End Try
        End If
    End Sub
    Protected Sub emailrecipt()
        'create the mail message
        Dim mail As New MailMessage()
        If Directory.Exists("F:\IsDev") Then 'set dev settings
            'set the addresses
            mail.From = New MailAddress("randy@woodalldevelopment.com")
            mail.To.Add(RTrim(Me.email1.Text)) 'customer address
            'set the content
            mail.Subject = "Receipt for payment to Memory Book Company (Transaction Id " & Session("transid") & ")"
            mail.Body = "A payment using AuthorizeNet has been made for " & Session("schname") & "(" & Session("schcode") & ") in the amount of " & Session("payment") & " to Memory Book Company on " & Now.ToString
            mail.IsBodyHtml = True
            'send the message         
            'to authenticate we set the username and password properites on the SmtpClient
            Dim smtp As New SmtpClient("mail.woodalldevelopment.com")
            smtp.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(mail)
            Catch ex As Exception
                'create the mail message
                Dim mail1 As New MailMessage()
                'set the addresses
                mail1.From = New MailAddress("randy@woodalldevelopment.com")
                mail1.To.Add("randy@woodalldevelopment.com")
                'set the content
                mail1.Subject = "Email Receipt Error " & Session("schname") & "(" & Session("schcode") & ")"
                mail1.Body = "There was an error sending a receipt to " & Session("schname") & "(" & Session("schcode") & "), Transaction Id:" & Session("transid")
                mail1.IsBodyHtml = True
                'send the message
                Dim smtp1 As New SmtpClient("mail.woodalldevelopment.com")
                smtp1.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
                'smtp1.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp1.Send(mail1)
            End Try
        Else
            'set the addresses
            mail.From = New MailAddress("authnet@memorybook.com")
            mail.To.Add(RTrim(Me.email1.Text)) 'customer address
            'set the content
            mail.Subject = "Receipt for payment to Memory Book Company (Transaction Id " & Session("transid") & ")"
            mail.Body = "A payment using AuthorizeNet has been made for " & Session("schname") & "(" & Session("schcode") & ") in the amount of " & Session("payment") & " to Memory Book Company on " & Now.ToString
            mail.IsBodyHtml = True
            'send the message         
            'to authenticate we set the username and password properites on the SmtpClient
            Dim smtp As New SmtpClient("192.168.1.245")
            smtp.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(mail)
            Catch ex As Exception
                'create the mail message
                Dim mail1 As New MailMessage()
                'set the addresses
                mail1.From = New MailAddress("authnet@memorybook.com")
                mail1.To.Add("authnet@memorybook.com")
                'set the content
                mail1.Subject = "Email Receipt Error " & Session("schname") & "(" & Session("schcode") & ")"
                mail1.Body = "There was an error sending a receipt to " & Session("schname") & "(" & Session("schcode") & "), Transaction Id:" & Session("transid")
                mail1.IsBodyHtml = True
                'send the message
                Dim smtp1 As New SmtpClient("192.168.1.245")
                smtp1.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
                'smtp1.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp1.Send(mail1)
            End Try
        End If
    End Sub
    Protected Sub email() '_________________________________________________________________

        'create the mail message
        Dim mail As New MailMessage()
        If Directory.Exists("F:\IsDev") Then 'set dev settings
            'set the addresses
            mail.From = New MailAddress("randy@woodalldevelopment.com")
            mail.To.Add("randy@woodalldevelopment.com")
            'set the content
            mail.Subject = "School payment from " & Session("schname") & "(" & Session("schcode") & ")" & " Using E-Check"
            mail.Body = "A payment using AuthorizeNet has been made from " & Session("schname") & "(" & Session("schcode") & ") in the amount of " & Session("payment")
            mail.IsBodyHtml = True
            'to authenticate we set the username and password properites on the SmtpClient
            Dim smtp As New SmtpClient("mail.woodalldevelopment.com")
            smtp.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
            'send the message
            Try
                smtp.Send(mail)
            Catch ex As Exception
                Session.Add("errorpage", "email" & ex.Message)
            End Try
        Else
            'set the addresses
            mail.From = New MailAddress("authnet@memorybook.com")
            mail.To.Add("authnet@memorybook.com")
            'set the content
            mail.Subject = "School payment from " & Session("schname") & "(" & Session("schcode") & ")" & " Using E-Check"
            mail.Body = "A payment using AuthorizeNet has been made from " & Session("schname") & "(" & Session("schcode") & ") in the amount of " & Session("payment")
            mail.IsBodyHtml = True
            'to authenticate we set the username and password properites on the SmtpClient
            Dim smtp As New SmtpClient("192.168.1.245")
            smtp.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
            'send the message
            Try
                smtp.Send(mail)
            Catch ex As Exception
                Session.Add("errorpage", "email" & ex.Message)
            End Try
        End If
    End Sub



End Class
