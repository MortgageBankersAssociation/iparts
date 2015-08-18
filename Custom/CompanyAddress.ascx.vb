
Partial Class Custom_GE_CompanyAddress
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            Dim strUsername As String = HttpContext.Current.User.Identity.Name
            Dim iboUser As Asi.iBO.ContactManagement.CContactUser = Asi.iBO.ContactManagement.CContactUser.LoginByWebLogin(strUsername)
            Dim iboContact As New Asi.iBO.ContactManagement.CContact(iboUser, iboUser.ContactId)
            Dim strCompanyID As String = iboContact.InstituteContactId
            If strCompanyID <> "" Then
                Dim iboCompany As New Asi.iBO.ContactManagement.CContact(iboUser, strCompanyID)
                Me.lblCompany.Text = iboCompany.InstituteName
                Me.lblAddress.Text = iboCompany.PreferredMailAddress.FormattedAddress.Replace(Chr(13), "<br />")
                Me.lblPhone.Text = iboCompany.WorkPhone
                Me.lblFax.Text = iboCompany.Fax
                Me.lblTollFree.Text = iboCompany.TollFreePhone
                Me.lblWebsite.Text = iboCompany.WebsiteAddress
                Me.lblPaidThru.Text = iboCompany.PaidThroughDate
            Else
                Me.pnlCompanyAddress.Visible = False
                Me.pnlNoCompany.Visible = True
            End If
        Else
            Me.pnlCompanyAddress.Visible = False
        End If
    End Sub
End Class
