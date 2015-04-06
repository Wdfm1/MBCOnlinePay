Imports System.Collections.Generic

Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports MySql.Data.MySqlClient
Imports AuthorizeNet
Imports System.IO
Partial Class SchPayment
    Inherits System.Web.UI.Page
    Dim retval As Boolean = True
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")

        Page.MaintainScrollPositionOnPostBack = True
        If Session("pagesubmitted") = True Then
            Session.Clear()
            Response.Redirect("default.aspx")
        End If
        Session("defaulterrormessage") = ""

    End Sub
    
    'pretend this is injected with IoC
    Private Function OpenGateway() As IGateway
        'we used the form builder so we can now just load it up
        'using the form reader
        Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
        Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")

        If Directory.Exists("F:\IsDev") Then 'set dev settings
            Dim gate1 As New Gateway(login, transactionKey, True)
            Return gate1
        Else
            'this is set to test mode - change as needed.
            Dim gate1 As New Gateway(login, transactionKey, False)
            Return gate1
        End If
    End Function

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        
        If Session("caddress") <> Nothing Then
            If Page.IsValid Then
                'pull from the store
                Dim gate As Object = OpenGateway()

                'build the request from the Form post
                Dim apiRequest As Object = CheckoutFormReaders.BuildAuthAndCaptureFromPost()

                Dim cardno As String = apiRequest.CardNum.ToString
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
                    Session.Add("transid", response__1.AuthorizationCode & "/" & response__1.TransactionID)
                    Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                    & "<br /> Transaction ID: " & response__1.AuthorizationCode & "/" & response__1.TransactionID & "<br />" & CardComp & ":" & response__1.CardNumber)
                    'record payment into database
                    Me.UpdateDatabase()
                    Me.email() 'email Hilary
                    If Me.txtcustemail.Text <> Nothing Then
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
    Protected Sub emailrecipt()
        'create the mail message
        Dim mail As New MailMessage()
        If Directory.Exists("F:\IsDev") Then 'set dev settings
            'set the addresses
            mail.From = New MailAddress("randy@woodalldevelopment.com")
            mail.To.Add(RTrim(Me.txtcustemail.Text)) 'customer address
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
                'Session.Add("errorpage", "email " & ex.Message)
                'create the mail message
                Dim mail1 As New MailMessage()
                'set the addresses
                mail1.From = New MailAddress("authnet@memorybook.com")
                mail1.To.Add("randy@woodalldevelopment.com")
                '
                'set the content
                mail1.Subject = "Email Receipt Error " & Session("schname") & "(" & Session("schcode") & ")"
                mail1.Body = "There was an error sending a receipt to " & Session("schname") & "(" & Session("schcode") & "), Transaction Id:" & Session("transid")
                mail1.IsBodyHtml = True
                'send the message
                Dim smtp1 As New SmtpClient("mail.woodalldevelopment.com")
                smtp1.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
                smtp1.Send(mail1)
            End Try


        Else 'live settings
            'set the addresses
            mail.From = New MailAddress("authnet@memorybook.com")
            mail.To.Add(RTrim(Me.txtcustemail.Text)) 'customer address
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
                'Session.Add("errorpage", "email " & ex.Message)
                'create the mail message
                Dim mail1 As New MailMessage()
                'set the addresses
                mail1.From = New MailAddress("authnet@memorybook.com")
                mail1.To.Add("authnet@memorybook.com")
                '
                'set the content
                mail1.Subject = "Email Receipt Error " & Session("schname") & "(" & Session("schcode") & ")"
                mail1.Body = "There was an error sending a receipt to " & Session("schname") & "(" & Session("schcode") & "), Transaction Id:" & Session("transid")
                mail1.IsBodyHtml = True
                'send the message
                Dim smtp1 As New SmtpClient("192.168.1.245")
                smtp1.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
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
            mail.Subject = "School payment from " & Session("schname") & "(" & Session("schcode") & ")"
            mail.Body = "A payment using AuthorizeNet has been made from " & Session("schname") & "(" & Session("schcode") & ") in the amount of " & Session("payment")
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("mail.woodalldevelopment.com")
            'to authenticate we set the username and password properites on the SmtpClient
            smtp.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
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
            mail.Subject = "School payment from " & Session("schname") & "(" & Session("schcode") & ")"
            mail.Body = "A payment using AuthorizeNet has been made from " & Session("schname") & "(" & Session("schcode") & ") in the amount of " & Session("payment")
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.245")
            'to authenticate we set the username and password properites on the SmtpClient
            smtp.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
            Try
                smtp.Send(mail)
            Catch ex As Exception
                Session.Add("errorpage", "email" & ex.Message)
            End Try
        End If
    End Sub

    Protected Sub UpdateDatabase()
        Dim strconn As String
        If Directory.Exists("F:\IsDev") Then 'set dev settings
            'Session.Add("dev", True) 'so I know to set emails (already added in defaul load)
            strconn = "Server=memserver;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"

        Else
            strconn = "Server=databases;User id=root;Password=3l3phant1;Persist Security Info=True;Database=mbc"

        End If

        Try
            Dim conn As MySqlConnection = New MySqlConnection(strconn)
            Dim cmd As New MySqlCommand("", conn)

            cmd.Parameters.AddWithValue("@transid", Session("transid"))
            cmd.Parameters.AddWithValue("@page", "SCHOOL")
            cmd.Parameters.AddWithValue("@schcode", Session("schcode"))
            cmd.Parameters.AddWithValue("@payment", Session("payment"))
            cmd.Parameters.AddWithValue("@schname", Trim(Session("schname")))
            cmd.Parameters.AddWithValue("@creditcard", "CC")

            cmd.CommandText = "Insert into mbc.payment (ddate,transid,schcode,poamt,schname,paytype,page) Values(curdate(),@transid,@schcode,@payment," _
            & "@schname,@creditcard,@page)"
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()

            cmd.Connection.Close()
        Catch ex As Exception
            If Directory.Exists("F:\IsDev") Then 'set dev settings
                'create the mail message
                Dim mail As New MailMessage()
                'set the addresses
                'set the addresses
                mail.From = New MailAddress("authnet@memorybook.com")
                mail.To.Add("randy@woodalldevelopment.com")
                'mail.From = New MailAddress("yearbooks@memorybook.com")
                'mail.To.Add("yearbook@memorybook.com")
                'set the content
                mail.Subject = "Mysql Error:Payment from " & Session("schname") & "(" & Session("schcode") & ")"
                mail.Body = "An error occured inserting a payment record into the Mysql database server. The following data was not recorded in the payment table." & "<br/>" & _
                "School Name:" & Session("schname") & "<br/>" & _
                "School Code:" & Session("schcode") & "<br/>" & _
                "Amount:" & Session("payment") & "<br/>" & _
                "PO Number:" & Session("ponum") & "<br/>" & _
                "TransactionId:" & Session("transid") & "<br/>" & _
                "Invoice Number:" & Session("invno") & "<br/><br/>" & _
                "Mysql Exception Code:" & ex.Message
                mail.IsBodyHtml = True
                'send the message
                Dim smtp As New SmtpClient("mail.woodalldevelopment.com")
                smtp.Credentials = New NetworkCredential("randy@woodalldevelopment.com", "briggitte")
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
                smtp.Send(mail)
            Else


                'create the mail message
                Dim mail As New MailMessage()
                'set the addresses
                'set the addresses
                mail.From = New MailAddress("authnet@memorybook.com")
                mail.To.Add("authnet@memorybook.com")
                'mail.From = New MailAddress("yearbooks@memorybook.com")
                'mail.To.Add("yearbook@memorybook.com")
                'set the content
                mail.Subject = "Mysql Error:Payment from " & Session("schname") & "(" & Session("schcode") & ")"
                mail.Body = "An error occured inserting a payment record into the Mysql database server. The following data was not recorded in the payment table." & "<br/>" & _
                "School Name:" & Session("schname") & "<br/>" & _
                "School Code:" & Session("schcode") & "<br/>" & _
                "Amount:" & Session("payment") & "<br/>" & _
                "PO Number:" & Session("ponum") & "<br/>" & _
                "TransactionId:" & Session("transid") & "<br/>" & _
                "Invoice Number:" & Session("invno") & "<br/><br/>" & _
                "Mysql Exception Code:" & ex.Message
                mail.IsBodyHtml = True
                'send the message
                Dim smtp As New SmtpClient("192.168.1.245")
                smtp.Credentials = New NetworkCredential("authnet@memorybook.com", "authnet")
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some serves
                smtp.Send(mail)
            End If
        End Try

    End Sub

    

    Protected Sub ddlmonth_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlmonth.SelectedIndexChanged
        
        Me.x_exp_date.Value = Me.ddlmonth.SelectedValue & "/" & Me.ddlyear.SelectedValue
    End Sub

    Protected Sub ddlyear_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlyear.SelectedIndexChanged
        
        Me.x_exp_date.Value = Me.ddlmonth.SelectedValue & "/" & Me.ddlyear.SelectedValue
    End Sub

End Class





'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
'    'By default, this sample code is designed to post to our test server for
'    'developer accounts: https://test.authorize.net/gateway/transact.dll
'    'for real accounts (even in test mode), please make sure that you are
'    'posting to: https://secure.authorize.net/gateway/transact.dll
'    'Dim post_url As String
'    'post_url = "https://test.authorize.net/gateway/transact.dll"


'    'Dim post_values As New Dictionary(Of String, String)

'    ''the API Login ID and Transaction Key must be replaced with valid values
'    ''post_values.Add("x_login", "API_LOGIN_ID")
'    'post_values.Add("x_login", "7R4h6ATZqR5u")
'    ''post_values.Add("x_tran_key", "TRANSACTION_KEY")
'    'post_values.Add("x_tran_key", "4n6d6U8H75hYmTSn")
'    'post_values.Add("x_delim_data", "TRUE")
'    'post_values.Add("x_delim_char", "|")
'    'post_values.Add("x_relay_response", "FALSE")
'    'post_values.Add("x_invoice_num", "12546")
'    'post_values.Add("x_description", "Yearbooks for year12")
'    'post_values.Add("x_type", "AUTH_CAPTURE")
'    'post_values.Add("x_method", "CC")
'    ''post_values.Add("x_card_num", "4111111111111111")
'    'post_values.Add("x_card_num", Me.x_card_num.Text) '"4012888818888"
'    'post_values.Add("x_exp_date", Me.x_card_code.Text)

'    'post_values.Add("x_amount", Me.x_amount.Text)
'    ''post_values.Add("x_description", "Sample Transaction")

'    'post_values.Add("x_first_name", "John")
'    'post_values.Add("x_last_name", "Doe")
'    'post_values.Add("x_address", "1234 Street")
'    'post_values.Add("x_state", "WA")
'    'post_values.Add("x_zip", "98004")
'    '' Additional fields can be added here as outlined in the AIM integration
'    '' guide at: http://developer.authorize.net

'    '' This section takes the input fields and converts them to the proper format
'    '' for an http post.  For example: "x_login=username&x_tran_key=a1B2c3D4"
'    'Dim post_string As String = ""
'    'For Each field As KeyValuePair(Of String, String) In post_values
'    '    post_string &= field.Key & "=" & HttpUtility.UrlEncode(field.Value) & "&"
'    'Next
'    'post_string = Left(post_string, Len(post_string) - 1)

'    '' The following section provides an example of how to add line item details to
'    '' the post string.  Because line items may consist of multiple values with the
'    '' same key/name, they cannot be simply added into the above array.
'    ''
'    '' This section is commented out by default.
'    ''Dim line_items() As String = { _
'    ''    "item1<|>golf balls<|><|>2<|>18.95<|>Y", _
'    ''    "item2<|>golf bag<|>Wilson golf carry bag, red<|>1<|>39.99<|>Y", _
'    ''    "item3<|>book<|>Golf for Dummies<|>1<|>21.99<|>Y"}
'    ''
'    ''For Each value As String In line_items
'    ''   post_string += "&x_line_item=" + HttpUtility.UrlEncode(value)
'    ''Next

'    '' create an HttpWebRequest object to communicate with Authorize.net
'    'Dim objRequest As HttpWebRequest = CType(WebRequest.Create(post_url), HttpWebRequest)
'    'objRequest.Method = "POST"
'    'objRequest.ContentLength = post_string.Length
'    'objRequest.ContentType = "application/x-www-form-urlencoded"

'    '' post data is sent as a stream
'    'Dim myWriter As StreamWriter = Nothing
'    'myWriter = New StreamWriter(objRequest.GetRequestStream())
'    'myWriter.Write(post_string)
'    'myWriter.Close()

'    '' returned values are returned as a stream, then read into a string
'    'Dim objResponse As HttpWebResponse = CType(objRequest.GetResponse(), HttpWebResponse)
'    'Dim responseStream As New StreamReader(objResponse.GetResponseStream())
'    'Dim post_response As String = responseStream.ReadToEnd()
'    'responseStream.Close()

'    '' the response string is broken into an array
'    'Dim response_array As Array = Split(post_response, post_values("x_delim_char"), -1)

'    '' the results are output to the screen in the form of an html numbered list.
'    'resultSpan.InnerHtml += "<OL>" & vbCrLf
'    'For Each value In response_array
'    '    resultSpan.InnerHtml += "<LI>" & value & "&nbsp;</LI>" & vbCrLf
'    'Next
'    'resultSpan.InnerHtml += "</OL>" & vbCrLf
'    ' individual elements of the array could be accessed to read certain response
'    ' fields.  For example, response_array(0) would return the Response Code,
'    ' response_array(2) would return the Response Reason Code.
'    ' for a list of response fields, please review the AIM Implementation Guide
'End Sub