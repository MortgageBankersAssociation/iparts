<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TributeGiftEditorDisplay.ascx.cs"
	Inherits="Asi.Web.iParts.Fundraising.TributeGiftEditor.TributeGiftEditorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="cac" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>
<asiweb:PanelTemplateControl ID="TributeGiftEditorDisplayPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
        <div class="PanelField  Top CalloutPanelField1">
			<div>
				<asiweb:StyledLabel ID="StyledLabel1" runat="server"  AssociatedControlID="DisplayTributeOptions">Is this Donation a tribute?</asiweb:StyledLabel>
			</div>
			<div class="PanelFieldValue AutoWidth FloatNone"><asp:RadioButtonList 
					ID="DisplayTributeOptions" runat="server" RepeatDirection="Vertical" 
					RepeatLayout="Flow">
                    <asp:ListItem Value="true">Yes</asp:ListItem>
                    <asp:ListItem Value="false">No</asp:ListItem>
                    </asp:RadioButtonList>
			</div>
		</div>
		<div class="PanelField ">
			<asp:Panel ID="DetailsPanel" runat="server">
				<asiweb:BusinessDropDownList runat="server" ID="TributeTypes" DisplayCaption="true" Caption="Select tribute type" RenderPanelField="true"></asiweb:BusinessDropDownList>
				<asiweb:BusinessTextBox runat="server" ID="Name" DisplayCaption="true" Caption="Name" RenderPanelField="true"></asiweb:BusinessTextBox>
				<asiweb:BusinessTextBox runat="server" ID="Message" DisplayCaption="true" Caption="Tribute message" TextMode="MultiLine" Rows="5" RenderPanelField="true"></asiweb:BusinessTextBox>

                <asp:Panel ID="TributeNotifyMainPanel" runat="server">
                    <asiweb:BusinessCheckBox class="PanelFieldValue AutoWidth FloatNone" runat="server" ID="TributeNotification" Text="Please inform the following person about my donation" />
					<div class="PanelField ">
						<asp:Panel ID="TributeNotifyPanel" runat="server" >
							<cac:ContactAccountCreator ID="ContactAccountCreator" runat="server"
                            ShowBorder="false"
                            Collapsible = "false"
							AccountTypeAllowed="IndividualOnly"
							HideForAuthenticatedUsers="false"
							IncludeSuffix="false"
							IncludePrefix="false"
							IncludePhone="false"
							IncludeEmail="false"
							RequireAddress="true"
							MultipleAddressLines="true"
							CreateAddressPurpose="Address"
							IncludeLogOnLink="false"
							IncludeOptionToCreateLogon="false"
							RequireUserToCreateLogon="false"
							UseEmailAsLogon="false" />
						</asp:Panel>
					</div>
                </asp:Panel>
            </asp:Panel>
        </div>
        <asp:HiddenField ID="ValidatorIds" runat="server" />
</asiweb:PanelTemplateControl>
