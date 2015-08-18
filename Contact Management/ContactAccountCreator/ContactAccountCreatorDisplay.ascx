<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAccountCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAccountCreator.ContactAccountCreatorDisplay" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.iParts.ContactManagement.ContactAccountCreator" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>



<asp:Panel runat="server" ID="ContentPanel"  CssClass="StandardPanel" BorderStyle="None">
    
	<asp:HiddenField ID="AddressIsDirtyControl" runat="server" />
	<asp:HiddenField ID="HiddenContactKey" runat="server" />	

	<div runat="server" visible="false" id="DivLabelErrorMessage">
		<asp:Label id="LabelErrorMessage" runat="server" CssClass="Error" />
	</div>
	
	<div runat="server" visible="false" id="DivLabelSuccessMessage">
		<asp:Label id="LabelSuccessMessage" runat="server" CssClass="Information" />
        <asiweb:Hyperlink ID="ContinueLink" runat="server" visible="false" />
		<br /><br />
	</div>
	
	<asp:Panel runat="server" ID="FormPanel" CssClass="StandardPanel" BorderStyle="None">
	
		<div runat="server" id="DivValidateAddress">
			<asiweb:AddressValidationControl ID="AddressValidator" runat="server" />
		</div>
	
		<div runat="server" id="DivLogOnLink" class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelLogOnLink" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.AlreadyRegistered", "Already registered?")%>'
					AssociatedControlID="LogOnLink"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:Hyperlink ID="LogOnLink" runat="server" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.Security.SignIn", "Sign In")%>'/>
			</div>
		</div>

		<div style="clear: both;"></div>
        <div runat="server" id="DivCreateAccountType">
		    <div class="PanelField Left">
			    <div class="PanelFieldValue">
				    <asiweb:StyledLabel runat="server" ID="LabelCreateAccountType" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.AccountType", "Account type")%>'
					    AssociatedControlID="CreateAccountType" /><br />
				    <blockquote>
					    <asp:RadioButtonList runat="server" ID="CreateAccountType"/>
				    </blockquote>
				
			    </div>
		    </div>
        </div>

		<div style="clear: both;"></div> 
		<div runat="server" id="DivPrefix">
			<div class="PanelField Left">
				<div style="display: inline;">
					<asiweb:StyledLabel runat="server" ID="LabelPrefix" Text='<%#ResourceManager.GetWord("Prefix")%>'
						AssociatedControlID="Prefix"/>
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessDropDownList runat="server" ID="Prefix"/>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivOrganizationName">
            <div class="PanelField Left">
			    <div style="display: inline;">
				    <asiweb:StyledLabel runat="server" ID="LabelOrganizationName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.OrganizationName", "Organization name")%>'
					    AssociatedControlID="OrganizationName"/>
			    </div>
			    <div class="PanelFieldValue">
				    <asiweb:BusinessTextBox runat="server" ID="OrganizationName"/>
				    <asiweb:AsiRequiredFieldValidator runat="server" ID="OrganizationNameValidator" ControlToValidate="OrganizationName" ValidationGroup="AccountCreator" CssClass="Important" />
			    </div>
            </div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivFirstName">
			<div class="PanelField Left">
				<div style="display: inline;">
					<asiweb:StyledLabel runat="server" ID="LabelFirstName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.FirstName", "First name")%>'
						AssociatedControlID="FirstName"/>
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessTextBox MaxLength="20" runat="server" ID="FirstName"/>
					<asiweb:AsiRequiredFieldValidator runat="server" ID="FirstNameValidator" ControlToValidate="FirstName" ValidationGroup="AccountCreator" CssClass="Important" />
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivLastName">
			<div class="PanelField Left">
				<div style="display: inline;">
					<asiweb:StyledLabel runat="server" ID="LabelLastName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.LastName", "Last name")%>'
						AssociatedControlID="LastName"/>
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessTextBox MaxLength="30" runat="server" ID="LastName"/>
					<asiweb:AsiRequiredFieldValidator runat="server" ID="LastNameValidator" ControlToValidate="LastName" ValidationGroup="AccountCreator" CssClass="Important" />
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>      
		<div runat="server" id="DivSuffix">
			<div class="PanelField Left">
				<div style="display: inline;">
					<asiweb:StyledLabel runat="server" ID="LabelSuffix" Text='<%#ResourceManager.GetWord("Suffix")%>'
						AssociatedControlID="Suffix"/>
				</div>
				<div class="PanelFieldValue">
					<asiweb:BusinessDropDownList runat="server" ID="Suffix"/>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivPhone" class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelPhone" Text='<%#ResourceManager.GetWord("Phone")%>'
					AssociatedControlID="Phone"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox MaxLength="25" runat="server" ID="Phone"/>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivEmail" class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelEmail" Text='<%#ResourceManager.GetWord("Email")%>'
					AssociatedControlID="Email"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox MaxLength="40" runat="server" ID="Email"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="EmailValidator" ControlToValidate="Email" ValidationGroup="AccountCreator" CssClass="Important" />
			</div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivConfirmEmail" class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelConfirmEmail" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.ConfirmEmail", "Confirm email")%>'
					AssociatedControlID="ConfirmEmail"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox MaxLength="40" runat="server" ID="ConfirmEmail"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="ConfirmEmailValidator" ControlToValidate="ConfirmEmail" ValidationGroup="AccountCreator" CssClass="Important" />
				<asp:CompareValidator runat="server" ID="ConfirmEmailCompareValidator" ControlToValidate="ConfirmEmail" ControlToCompare="Email" Type="String" Operator="Equal" 
					ErrorMessage="Email addresses do not match" Display="Dynamic" ValidationGroup="AccountCreator"  CssClass="Important"   />
			</div>
		</div>
		<div style="clear: both;"></div>
	</asp:Panel>
    <asp:UpdatePanel ID="AddressPanel" CssClass="StandardPanel" BorderStyle="None"  RenderMode="Inline" runat="server">
        <ContentTemplate>

		<div class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelCountry" CssClass="Required" Text='<%#ResourceManager.GetWord("Country")%>'
					AssociatedControlID="SelectCountry"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessDropDownList runat="server" id="SelectCountry" AutoPostBack="true" />
				<asiweb:AsiRequiredFieldValidator runat="server" ID="SelectCountryValidator" ControlToValidate="SelectCountry" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			</div>
		</div>
		<div style="clear: both;"></div>	
		<div class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelAddress1" CssClass="Required" Text='<%#ResourceManager.GetWord("Address")%>'
					AssociatedControlID="TextAddress1"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox runat="server" MaxLength="40" ID="TextAddress1"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="TextAddress1Validator" ControlToValidate="TextAddress1" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			</div>
		</div>	
		<div style="clear: both;"></div>

        <asp:Panel id="AddressControls" runat="server">
            
		    <div class="PanelField Left" id="DivAddress2" runat="server">
			    <div style="display: inline;">
				    <asiweb:StyledLabel runat="server" ID="LabelAddress2" 
					    AssociatedControlID="TextAddress2" Text="&nbsp;" />
			    </div>
			    <div class="PanelFieldValue">
				    <asiweb:BusinessTextBox MaxLength="40" runat="server" ID="TextAddress2" />
			    </div>
		    </div>			
		    <div style="clear: both;"></div>
		    <div class="PanelField Left" id="DivAddress3" runat="server">
			    <div style="display: inline;">
				    <asiweb:StyledLabel runat="server" ID="LabelAddress3" 
					    AssociatedControlID="TextAddress3" Text="&nbsp;" />
			    </div>
			    <div class="PanelFieldValue">
				    <asiweb:BusinessTextBox MaxLength="40" runat="server" ID="TextAddress3" />
			    </div>
		    </div>		    
		    <div style="clear: both;"></div>
		     <div class="PanelField Left">
			    <div style="display: inline;">
				    <asiweb:StyledLabel runat="server" ID="LabelCity" CssClass="Required" Text='<%#ResourceManager.GetWord("City")%>'
					    AssociatedControlID="TextCity"/>
			    </div>
			    <div class="PanelFieldValue">
				    <asiweb:BusinessTextBox MaxLength="40" runat="server" ID="TextCity"/>
				    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextCityValidator" ControlToValidate="TextCity" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			    </div>
		    </div>
		    <div style="clear: both;"></div>
		    <div class="PanelField Left" id="DivSubEntity" runat="server" >
			    <div style="display: inline;">
				    <asiweb:StyledLabel runat="server" ID="LabelSubEntityCode" CssClass="Required" Text='<%#ResourceManager.GetWord("State")%>'
					    AssociatedControlID="SelectSubEntityCode"/>
			    </div>
			    <div class="PanelFieldValue">
				    <asiweb:BusinessDropDownList runat="server" id="SelectSubEntityCode"/>
				    <asiweb:AsiRequiredFieldValidator runat="server" ID="SubEntityCodeValidator" ControlToValidate="SelectSubEntityCode"   Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
				
				    <asiweb:BusinessTextBox MaxLength="15" runat="server" ID="TextSubEntity" />
				    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextSubEntityValidator" ControlToValidate="TextSubEntity"  Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			    </div>
		    </div>
		    <div style="clear: both;"></div>
		       <div class="PanelField Left">
			    <div style="display: inline;">
				    <asiweb:StyledLabel runat="server" ID="LabelPostalCode" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.PostalCode", "Postal code")%>'
					    AssociatedControlID="TextPostalCode"/>
			    </div>
			    <div class="PanelFieldValue">
				    <asiweb:BusinessTextBox runat="server" ID="TextPostalCode"/>
				    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextPostalCodeValidator" ControlToValidate="TextPostalCode" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
				    <asiweb:AsiRegularExpressionValidator runat="server" ID="TextPostalCodeRegexValidator" ControlToValidate="TextPostalCode" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			    </div>
		    </div>
		    <div style="clear: both;"></div>

        </asp:Panel> <!-- AddressControls -->
        </ContentTemplate>
     </asp:UpdatePanel>

	
	<asp:Panel runat="server" ID="CreateLogonPanel" CssClass="StandardPanel" BorderStyle="None">   
		
		<div class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelCreateLogon" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.CreateLogon", "Create a Logon")%>'/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessCheckBox runat="server" ID="UserRequiresLogon"/> 
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelLogon" Text='<%#ResourceManager.GetWord("Logon")%>'
					Enabled="true" EnableViewState="true"/>
			</div>
			<div runat="server" id="DivLogon" class="PanelFieldValue">
				<asiweb:BusinessTextBox runat="server" ID="Logon" Enabled="true" EnableViewState="true"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="LogonValidator" ControlToValidate="Logon" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			</div>
			<div runat="server" id="DivLogonEmail" class="PanelFieldValue">
				<asiweb:StyledLabel runat="server" ID="LogonEmail" EnableViewState="true"/>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div runat="server" id="DivConfirmLogon" class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelConfirmLogon" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.ConfirmLogon", "Confirm logon")%>'
					AssociatedControlID="ConfirmLogon" Enabled="true" EnableViewState="true"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox runat="server" ID="ConfirmLogon" Enabled="true" EnableViewState="true"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="ConfirmLogonValidator" ControlToValidate="ConfirmLogon" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
				<asp:CompareValidator runat="server" ID="ConfirmLogonCompareValidator" ControlToValidate="ConfirmLogon" ControlToCompare="Logon" Type="String" Operator="Equal" 
					ErrorMessage="Logons do not match" Display="Dynamic" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important"/>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelPassword" Text='<%#ResourceManager.GetWord("Password")%>'
					AssociatedControlID="Password" Enabled="true" EnableViewState="true"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox runat="server" ID="Password" TextMode="Password" Enabled="true" EnableViewState="true"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="PasswordValidator" ControlToValidate="Password" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="PanelField Left">
			<div style="display: inline;">
				<asiweb:StyledLabel runat="server" ID="LabelConfirmPassword" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.ConfirmPassword","Confirm password")%>'
					AssociatedControlID="ConfirmPassword" Enabled="true" EnableViewState="true"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox runat="server" ID="ConfirmPassword" TextMode="Password" Enabled="true" EnableViewState="true"/>
				<asiweb:AsiRequiredFieldValidator runat="server" ID="ConfirmPasswordValidator" ControlToValidate="ConfirmPassword"  Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" />
				<asp:CompareValidator runat="server" ID="ConfirmPasswordCompareValidator" ControlToValidate="ConfirmPassword" ControlToCompare="Password" Type="String" Operator="Equal" 
					ErrorMessage="Passwords do not match" Display="Dynamic" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important"/>
			</div>
		</div>
		<div style="clear: both;"></div>

	</asp:Panel>

</asp:Panel>

<script type="text/javascript" language="javascript">
    //<![CDATA[
    
    if (typeof(AccountCreatorClass) !== 'undefined') {
        var accountCreatorInstance_<%#ClientID%> = new AccountCreatorClass();

        accountCreatorInstance_<%#ClientID%>.SoaErrorLabel = "<%#LabelErrorMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.SoaSuccessLabel = "<%#LabelSuccessMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivSuccessLabel = "<%#DivLabelSuccessMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LogonEmail = "<%#LogonEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.EmailTextbox = "<%#Email.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmEmailTextbox = "<%#ConfirmEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.UserRequiresLogon = "<%#UserRequiresLogon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelLogon = "<%#LabelLogon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Logon = "<%#Logon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelConfirmLogon = "<%#LabelConfirmLogon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmLogon = "<%#ConfirmLogon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelPassword = "<%#LabelPassword.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Password = "<%#Password.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelConfirmPassword = "<%#LabelConfirmPassword.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmPassword = "<%#ConfirmPassword.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmLogonCompareValidator = "<%#ConfirmLogonCompareValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmPasswordCompareValidator = "<%#ConfirmPasswordCompareValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.PasswordValidator = "<%#PasswordValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmPasswordValidator = "<%#ConfirmPasswordValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LogonValidator = "<%#LogonValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmLogonValidator = "<%#ConfirmLogonValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.CreateAccountType = '<%#CreateAccountType.ClientID.Replace("_", "$")%>';
        accountCreatorInstance_<%#ClientID%>.OrgOnlyAccountType = "<%#AccountType.OrganizationOnly.ToString()%>";
        accountCreatorInstance_<%#ClientID%>.DivFirstName = "<%#DivFirstName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelFirstName = "<%#LabelFirstName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.FirstName = "<%#FirstName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelLastName = "<%#LabelLastName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivLastName = "<%#DivLastName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LastName = "<%#LastName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivPrefix = "<%#DivPrefix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelPrefix = "<%#LabelPrefix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Prefix = "<%#Prefix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivSuffix = "<%#DivSuffix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelSuffix = "<%#LabelSuffix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Suffix = "<%#Suffix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.FirstNameValidator = "<%#FirstNameValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LastNameValidator = "<%#LastNameValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelOrganizationName = "<%#LabelOrganizationName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivOrganizationName = "<%#DivOrganizationName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.OrganizationName = "<%#OrganizationName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.OrganizationNameValidator = "<%#OrganizationNameValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.CreateLogonPanel = "<%#CreateLogonPanel.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivEmail = "<%#DivEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelEmail = "<%#LabelEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivConfirmEmail = "<%#DivConfirmEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelConfirmEmail = "<%#LabelConfirmEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.EmailValidator = "<%#EmailValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmEmailValidator = "<%#ConfirmEmailValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmEmailCompareValidator = "<%#ConfirmEmailCompareValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.NewContactKey = "<%#HiddenContactKey.ClientID%>";

        // Booleans
        accountCreatorInstance_<%#ClientID%>.RequireUserToCreateLogon = <%#RequireUserToCreateLogon.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsOrgOnlyByConfig = <%#AccountTypeAllowed.Equals(AccountType.OrganizationOnly.ToString()).ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsContentDesignMode = <%#IsContentDesignMode.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsImis15 = <%#IsImis15.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
    }
    
    // Prevents pressing the return key from causing a post back when the cursor is a textbox
    function stopRKey(evt) { 
      var evt = (evt) ? evt : ((event) ? event : null); 
      var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
      if ((evt.keyCode == 13) && (node.type=="text" || node.type=="password"))  {return false;} 
    }
    document.onkeypress = stopRKey; 
    
//]]>

</script>
