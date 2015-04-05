Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web

Public Class Paymentclass
    Public Sub New(ByVal slug As String)
        Me.PaymentID = Guid.NewGuid()
    End Sub
    Public Property AuthCode() As String
        Get
            Return m_AuthCode
        End Get
        Set(ByVal value As String)
            m_AuthCode = value
        End Set
    End Property
    Private m_AuthCode As String
    Public Property TransactionID() As String
        Get
            Return m_TransactionID
        End Get
        Set(ByVal value As String)
            m_TransactionID = value
        End Set
    End Property
    Private m_TransactionID As String
    Public Property OrderMessage() As String
        Get
            Return m_OrderMessage
        End Get
        Set(ByVal value As String)
            m_OrderMessage = value
        End Set
    End Property
    Private m_OrderMessage As String
    Public Property PaymentID() As Guid
        Get
            Return m_PaymentID
        End Get
        Set(ByVal value As Guid)
            m_PaymentID = value
        End Set
    End Property
    Private m_PaymentID As Guid
   

    Public Property Price() As Decimal
        Get
            Return m_Price
        End Get
        Set(ByVal value As Decimal)
            m_Price = value
        End Set
    End Property
    Private m_Price As Decimal
    
End Class
