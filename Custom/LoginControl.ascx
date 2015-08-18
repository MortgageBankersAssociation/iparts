<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LoginControl.ascx.vb" Inherits="Custom_Edge_v2_LoginControl" %>
<%@ Register src="~/Custom/Edge/RequireHTTPS.ascx" tagname="RequireHTTPS" tagprefix="uc1" %>

<uc1:RequireHTTPS ID="RequireHTTPS1" runat="server" />

<div id="login_control">
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    <table>
        <tr>
            <td>Username:</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" />
                <asp:RequiredFieldValidator ID="rfvUsername" ControlToValidate="txtUsername" ValidationGroup="Edge_Login" runat="server" ErrorMessage="Required" />
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ValidationGroup="Edge_Login" runat="server" ErrorMessage="Required" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><p><a href="/EE/AsiCommon/Controls/Shared/FormsAuthentication/RecoverPassword.aspx">Forgot your password?</a></p></td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <div class="btn-signin-shadow">
	    <asp:Button ID="btnSignIn" ValidationGroup="Edge_Login" runat="server" Text="Sign In" CssClass="btn-signin" />
    </div>
</div>
