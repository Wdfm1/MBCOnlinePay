Imports System.IO
Imports System.Net.Mail
Imports System.Net

Partial Class Receipt_Military
    Inherits EmailReadyPage
    Private okToSendMarkup As Boolean = False
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        'oktosendmarkup is set to false
        If okToSendMarkup Then
            EmailReceipt()
        End If


        MyBase.Render(writer)
        ' ALTERNATE OPTION:
        ' Remove EmailReceipt(); from above, and instead do: okToSendMarkup = True
        ' Then, in the Render() method, the markup will be generated and emailed
        ' If this alternate option is used, you do not need to disable event validation since
        ' the control is being rendered during the Render stage. Therefore, event validation
        ' can proceed as expected.
    End Sub
    Sub EmailReceipt()
        Dim email As String = ""
        Dim transid As String = ""
        Dim paytype As String = ""
        Dim orderid As String = Request.QueryString("orderid")
        'Dim orderid As String = "9066"

      
        Dim SB As New StringBuilder()
        Dim SW As New StringWriter(SB)
        Dim htmlTW As New HtmlTextWriter(SW)


        DetailsView1.RenderControl(htmlTW)
        Dim dtview As String = SB.ToString
        SB.Clear()


        'Now, send the email
        'Create an instance of the MailMessage class
        Dim objMM As New MailMessage()
        Dim tomail As String = ""
        Dim smtpclient As String = ""
        Dim cpassword As String = ""
        Dim cuser As String = ""


        Try

            email = DetailsView1.Rows(6).Cells(1).Text
            transid = DetailsView1.Rows(7).Cells(1).Text
            paytype = DetailsView1.Rows(14).Cells(1).Text



        Catch ex As Exception

        End Try


        tomail = Trim(email)




        smtpclient = ConfigurationManager.AppSettings("smtpserver")
        cuser = ConfigurationManager.AppSettings("smtpuser")
        cpassword = ConfigurationManager.AppSettings("smtppassword")
        'Set the properties
        objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

        Try
            objMM.To.Add(tomail) 'customer address if address bad try statement in send will catch
            objMM.Bcc.Add("authnet@memorybook.com")

        Catch ex As Exception

        End Try


        'Send the email in text format
        objMM.IsBodyHtml = True

        'Set the subject
        objMM.Subject = "Receipt for a Military Book Payment to Memory Book Company (Transaction Id " & transid & ")  Using " & paytype & "  " & Now

        objMM.Body = "<div style='font-size: large; height: 56px;'>Thank you for your payment! </div><div>" & dtview & "</div>"

        Dim smtp As New SmtpClient(smtpclient)
        smtp.Credentials = New NetworkCredential(cuser, cpassword)

        Try
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers

            smtp.Send(objMM)
        Catch ex As Exception
            WriteToFile("exception")
            'Dim handler As New XC.Web.ErrorHandler(Nothing)
            'handler.HandleException()
            MsgBox1.Show("Email Error", "Your confirmation email was not sent because of the following error:" & ex.Message & "Your order has been received and will be processed. No further action is needed.", Nothing, New EO.Web.MsgBoxButton("OK"))
            Dim objMM1 As New MailMessage

            smtpclient = ConfigurationManager.AppSettings("smtpserver")
            cuser = ConfigurationManager.AppSettings("smtpuser")
            cpassword = ConfigurationManager.AppSettings("smtppassword")
            Dim smtperror As New SmtpClient(smtpclient)
            smtperror.Credentials = New NetworkCredential(cuser, cpassword)
            objMM1.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
            objMM1.To.Add("authnet@memorybook.com")
            'objMM1.CC.Add("")
            objMM1.Subject = "Military Online Order Email Error Order Id:" & orderid
            objMM1.IsBodyHtml = True
            objMM1.Body = "The customer did not receive an email because of the following error:" & ex.Message
            Try
                smtperror.Send(objMM1)
            Catch ex2 As Exception

            End Try


        Finally

        End Try



    End Sub
    Private Sub WriteToFile(sText As String)
        Dim sPath As String = HttpContext.Current.Server.MapPath("Error.txt")
        Try
            Dim fs As New FileStream(sPath, FileMode.Append, FileAccess.Write)
            Dim writer As New StreamWriter(fs)
            writer.Write(sText)
            writer.Close()
            fs.Close()
        Catch generatedExceptionName As Exception
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LoadLic()


        'type determine if email is sent when receipt page is accessed


        Dim typerequest As String = "0"
        Try
            typerequest = Request.QueryString("type")
            If typerequest = Nothing Then
                typerequest = "0"
            End If
        Catch ex As Exception

        End Try

        If Not IsPostBack Then
            'if querystring secval is not present then an error occurss. I left this here to see if this happens.
            'In my code this query string will be present. If someone trys to access it without the code I want to know.
            'If bots keep trying then I will put a try statement in so I don't keep getting the error emails.
            Dim time As TimeSpan = Date.Now.TimeOfDay 'for testing
            'Dim senttime As TimeSpan = TimeSpan.Parse(Request.QueryString("secval"))
            Dim senttime As TimeSpan = TimeSpan.Parse(time.ToString)

            Dim curtime As TimeSpan = Today.TimeOfDay
            Dim timediff As TimeSpan = curtime - senttime
            Dim diff As Integer = timediff.Seconds
            If diff < 14400 Then 'four hours then access is cut off
                If typerequest = "1" Then 'change to 1
                    Session.Clear()
                    EmailReceipt()
                    'Else 'testing only remove when done
                    '    Session.Clear()
                    '    EmailReceipt()
                End If
            Else
                Response.Redirect("Default_MILITARY.aspx")
            End If
        End If
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
