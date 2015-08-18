
Partial Class Custom_Edge_v2_LogoutControl
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsWCM() Then
            FormsAuthentication.SignOut()
            Response.Redirect("~/")
        End If
    End Sub
    Private Function IsWCM() As Boolean
        Return (HttpContext.Current.Request.Url.ToString.ToLower.Contains("content_designer") _
                Or HttpContext.Current.Request.Url.ToString.ToLower.Contains("content_management") _
                Or HttpContext.Current.Request.Url.ToString.ToLower.Contains("contentdesigner") _
                Or HttpContext.Current.Request.Url.ToString.ToLower.Contains("contentmanagement"))
    End Function

End Class
