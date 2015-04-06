Imports System.Data

Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate

        Dim cPassword As String = Me.Login1.Password.ToString.Trim
        Dim cUser As String = Me.Login1.UserName.ToString.Trim
        Dim schcode As String = cUser 'username is schcode
        Dim schname As String = ""
        

        Dim dvSql As New DataView
        Dim drvSql As DataRowView
       
        Dim selectcmd As String
        selectcmd = "SELECT distinct schcode,password,schname from invoiceinfo where schcode=@schcode  and trim(password)=@password;"
        Me.dslogin.SelectCommand = selectcmd
        dslogin.SelectParameters.Add("@schcode", cUser)
        dslogin.SelectParameters.Add("@password", cPassword)

        Try
            dvSql = CType(Me.dslogin.Select(DataSourceSelectArguments.Empty), Data.DataView)
            If dvSql.Table.Rows.Count = 0 Then
                e.Authenticated = False
                Me.Login1.FailureText = "Your authenication failed. Please check that the password and school code are correct."
                Return
            Else
                For Each drvSql In dvSql
                    schname = drvSql("schname")
                Next
                Session.Add("schname", schname)
                Session.Add("schcode", schcode)
                e.Authenticated = True

            End If
        Catch ex As Exception
            e.Authenticated = False
            Me.Login1.FailureText = "The data server connection is not available. Please contact your school advisor customer representative. "

        End Try

       

    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As System.EventArgs)

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LoadLic()
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
