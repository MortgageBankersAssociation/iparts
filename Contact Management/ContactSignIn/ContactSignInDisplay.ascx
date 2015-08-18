<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactSignInDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactSignIn.ContactSignInDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel runat="server" DefaultButton="SubmitButton">
<asp:Panel ID="contentPanel" runat="server" Visible="true" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent">
     <telerik:RadAjaxPanel ID="ActionPanel" runat="server" LoadingPanelID="loadingPanel" EnableAJAX="False">     
        <div class="PanelField">
            <asiweb:StyledLabel ID="SignInFailureMsg" runat="server" CssClass="Error" />
            <asiweb:BusinessLabel id="confirmationMessage" runat="server" Visible="false" />
        </div>
        <div style="clear: both; padding-bottom: 1em;"></div>
        <div id="signInDiv" runat="server">
            <div class="PanelField"> 
                <!-- <asp:Label ID="signInUserNameLabelORIG" Text='<%#ResourceManager.GetWord("Username") %>' runat="server" AssociatedControlID="signInUserName" CssClass="PanelFieldLabel Required"/> -->                  
                <asp:Label ID="signInUserNameLabel" Text="Email Address*" runat="server" AssociatedControlID="signInUserName" CssClass="PanelFieldLabel Required"/>
                <div class="PanelFieldValue">
                    <asp:TextBox ID="signInUserName" runat="server"/>  
                    <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="UserNameRequired" runat="server" ControlToValidate="signInUserName" Text='<%#ResourceManager.GetWord("Required") %>'></asp:requiredfieldvalidator>                      
                </div>
            </div>
            <div class="PanelField">
                <asp:Label ID="signInPasswordLabel" runat="server" Text='<%#ResourceManager.GetWord("Password") %>' AssociatedControlID="signInPassword" CssClass="PanelFieldLabel Required" />
                <div class="PanelFieldValue">
                    <input type="password" ID="signInPassword" runat="server" onkeypress="enterKeyPress(event);" /> 
                    <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="PasswordRequired" runat="server" ControlToValidate="signInPassword" Text='<%#ResourceManager.GetWord("Required") %>'></asp:requiredfieldvalidator>
                </div>
            </div>
            <div id="RememberMeDiv" class="PanelField AutoWidth FloatNone" runat="server" Visible="<%# ShowRememberMe() %>">
                <asp:CheckBox ID="RememberMe" runat="server" Text='<%#ResourceManager.GetPhrase("RememberMe","Remember me on this computer") %>' TextAlign="Right" CssClass="PanelFieldLabel" />
            </div>
        </div>         
        <div id="requestPasswordDiv" runat="server" Visible="false" >
            <h4 class="SectionLabel">
                <asiweb:StyledLabel ID="passwordRequestHeader" runat="server" />
            </h4>
            <div class="PanelField">
                <asiweb:BusinessLabel id="requestPasswordInstructions" runat="server" Visible="True" />
            </div>
            <div style="clear: both; padding-bottom: 1em;"></div>
            <div class="PanelField">
                <asiweb:BusinessLabel CssClass="Required" ID="passwordUserNameLabel" runat="server" AssociatedControlID="passwordUserName" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="passwordUserName" />
                    <asp:RequiredFieldValidator ID="passwordUserNameRequiredValidator" runat="server" EnableClientScript="true" Display="Dynamic" 
                    ControlToValidate="passwordUserName" CssClass="Important" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </div>		  
            </div>                  
        </div>        
        <div id="requestUserNameDiv" runat="server" Visible="false" >
            <h4 class="SectionLabel">
                <asiweb:StyledLabel ID="userRequestHeader" runat="server" />
            </h4>
            <div class="PanelField">
                <asiweb:BusinessLabel id="requestUserNameInstructions" runat="server" Visible="True" />
            </div>
            <div style="clear: both; padding-bottom: 1em;"></div>
            <div class="PanelField">
                <asiweb:BusinessLabel CssClass="Required" ID="passwordEmailLabel" runat="server" AssociatedControlID="passwordEmail" />
                <div class="PanelFieldValue">
                     <asiweb:BusinessTextBox runat="server" ID="passwordEmail" /> 
                     <asp:RequiredFieldValidator id="passwordEmailValidator" CssClass="Important" Runat="server" EnableClientScript="true" Display="Dynamic"
                     ErrorMessage="Required" ControlToValidate="passwordEmail"></asp:RequiredFieldValidator>	
                    <asp:RegularExpressionValidator id="passwordEmailRegexValidator" CssClass="Important" Runat="server" EnableClientScript="true" Display="Dynamic"
                    ErrorMessage="Invalid email format" ControlToValidate="passwordEmail" ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"></asp:RegularExpressionValidator>
                </div>
            </div>            
        </div>            
     </telerik:RadAjaxPanel>
</asp:Panel>
<asp:Panel ID="contentPanelReset" runat="server" Visible="false" >
    <div id="resetPassword">
        <div>
            <asiweb:StyledLabel ID="PasswordInstructionsLiteral" runat="server" />
            <div class="PanelField">
            <asiweb:BusinessLabel id="errorResetPassword" runat="server" Visible="false" CssClass="Important" />
            </div>
        </div>
        <div style="clear: both; padding-bottom: 1em;"></div>
        <div class="PanelField">
            <asiweb:BusinessLabel CssClass="Required" ID="newPasswordLabel" runat="server" AssociatedControlID="newPassword" />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="newPassword" TextMode="Password" />
                <asp:RequiredFieldValidator id="newPasswordValidator" CssClass="Important" Runat="server" EnableClientScript="False" Display="Dynamic"
                    ErrorMessage="Required" ControlToValidate="newPassword"></asp:RequiredFieldValidator>        
            </div>
        </div>
        <div class="PanelField">
            <asiweb:BusinessLabel CssClass="Required" ID="confirmPasswordLabel" runat="server" AssociatedControlID="confirmPassword" />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="confirmPassword" TextMode="Password" /> 
                <asp:RequiredFieldValidator id="confirmPasswordValidator" CssClass="Important" Runat="server" EnableClientScript="False" Display="Dynamic"
                    ErrorMessage="Required" ControlToValidate="confirmPassword"></asp:RequiredFieldValidator>       
            </div>
        </div>
        <asp:CompareValidator ID="PasswordsMatchValidator" runat="server" EnableClientScript="False" Display="Dynamic" ControlToValidate="confirmPassword" 
        ControlToCompare="newPassword" Type="String" CssClass="Important" ErrorMessage="Passwords must match."></asp:CompareValidator>        
    </div>    
</asp:Panel>
<asiweb:RecaptchaControl ID="Recaptcha1" runat="server" Enabled="False" />
 <div id="commandButtons" class="PanelField" runat="server" Visible="false" style="padding-top: 1em; padding-bottom: 0.5em;">            
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitClick" causesvalidation="true" CssClass="TextButton PrimaryButton"   />
            <asp:Button ID="ResetCancelButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" />
</div>
<asp:Panel ID="LinkPanel" runat="server" Visible="true" BorderStyle="None" BackColor="Transparent">
    <div id="forgotPasswordUserLinkDiv" runat="server" class="PanelField">
        <!---<label runat="server" ID="forgotPasswordUser" class="PanelFieldValue" style="font-weight:normal !important;"></label> -->
        <a href="http://apps.mba.org/global/default.aspx?PopIn=http://registration.mba.org/login/forgotpassword.aspx?siteid=1050">Forgot my Password</a>
        <br /><br />
        <style="font-size: smaller;">* MBA Staff login with user name</style>
    </div>    
    <div id="accountLinkDiv" runat="server" class="PanelField" >
        <a ID="accountLink" runat="server" class="PanelFieldValue" />
        <label runat="server" ID="accountLinkReadOnly" class="PanelFieldValue" style="font-weight:normal !important;" Visible="False"></label> 
    </div>    
</asp:Panel>
<div style="clear: both;"></div>
</asp:Panel>
<script type="text/javascript">
    //<![CDATA[
    function enterKeyPress(e) {
        // look for window.event in case event isn't passed in 
        if (typeof e == 'undefined' && window.event) { e = window.event; }
        if (e != null && e.keyCode == 13) {
            document.getElementById('<%#SubmitButton.ClientID%>').click();
        } 
    }    
     //]]>
</script>