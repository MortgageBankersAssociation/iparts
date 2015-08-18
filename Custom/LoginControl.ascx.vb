
Partial Class Custom_Edge_v2_LoginControl
    Inherits System.Web.UI.UserControl

    Private _ExpiredVirtualPath As String = "~/EE/Enroll/EnrollmentSelection.aspx"
    <Personalizable(PersonalizationScope.User)> _
    <WebBrowsable()> _
    <WebDisplayName("Expired Virtual Path")> _
    <WebDescription("Enter the Virtual Path to redirect expired users to after they log in.")> _
    Public Property ExpiredVirtualPath() As String
        Get
            Return _ExpiredVirtualPath
        End Get
        Set(ByVal value As String)
            _ExpiredVirtualPath = value
        End Set
    End Property
    Private _NonMemberVirtualPath As String = "~/EE/Enroll/EnrollmentSelection.aspx"
    <Personalizable(PersonalizationScope.User)> _
    <WebBrowsable()> _
    <WebDisplayName("Non-Member Virtual Path")> _
    <WebDescription("Enter the Virtual Path to redirect non-members to after they log in.")> _
    Public Property NonMemberVirtualPath() As String
        Get
            Return _NonMemberVirtualPath
        End Get
        Set(ByVal value As String)
            _NonMemberVirtualPath = value
        End Set
    End Property
    Private _LoginProcessorVirtualPath As String = "~/Custom/Edge/LoginProcessor.aspx"
    <Personalizable(PersonalizationScope.User)> _
    <WebBrowsable()> _
    <WebDisplayName("Login Processor Virtual Path")> _
    <WebDescription("Enter the Virtual Path for Login Processor ASPX page.")> _
    Public Property LoginProcessorVirtualPath() As String
        Get
            Return _LoginProcessorVirtualPath
        End Get
        Set(ByVal value As String)
            _LoginProcessorVirtualPath = value
        End Set
    End Property
    Private _GracePeriod As Integer = 0
    <Personalizable(PersonalizationScope.User)> _
    <WebBrowsable()> _
    <WebDisplayName("Grace Period (in days)")> _
    <WebDescription("Grace period (in days) to permit users to log in past their membership expiration date.")> _
    Public Property GracePeriod() As Integer
        Get
            Return _GracePeriod
        End Get
        Set(ByVal value As Integer)
            _GracePeriod = value
        End Set
    End Property
    Private ReadOnly Property MinimumPaidThroughDate() As Date
        Get
            Return Now.AddDays(GracePeriod * -1)
        End Get
    End Property

    Protected Sub btnSignIn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignIn.Click
        Dim strUsername As String = txtUsername.Text
        Dim strPassword As String = txtPassword.Text
        Dim blnIsPErsistent As Boolean = False

        If Membership.ValidateUser(strUsername, strPassword) Then
            Dim iboUser As Asi.iBO.ContactManagement.CContactUser = Asi.iBO.ContactManagement.CContactUser.LoginByWebLogin(strUsername)
            Dim iboContact As New Asi.iBO.ContactManagement.CContact(iboUser, iboUser.ContactId)

            If Not iboContact.IsMember Then
                LoginAndRedirect(strUsername, NonMemberVirtualPath)
            Else
                If Not (iboContact.PaidThroughDate > MinimumPaidThroughDate) Then
                    LoginAndRedirect(strUsername, ExpiredVirtualPath)
                Else
                    FormsAuthentication.RedirectFromLoginPage(strUsername, blnIsPErsistent)
                End If
            End If
        Else
            Me.lblMessage.Text = "Your username or password were incorrect!"
        End If

    End Sub

    Private Sub LoginAndRedirect(ByVal UserName As String, ByVal LandingURL As String)
        Session("Edge_LoginReturnURL") = LandingURL
        Session("Edge_LoginUsername") = UserName
        Response.Redirect(LoginProcessorVirtualPath)
    End Sub

End Class
