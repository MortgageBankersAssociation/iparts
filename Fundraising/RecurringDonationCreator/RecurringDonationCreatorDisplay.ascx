<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringDonationCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonationCreator.RecurringDonationCreatorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="TributeGiftEditorDisplayPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">

    <div class="PanelField Top CalloutPanelField1">

        <div class="PanelFieldValue">
            <asp:RadioButtonList ID="RecurringDonationOption" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" />
        </div>
    </div>
    <div class="PanelField Left" id="FrequencySelect" runat="server">
		<div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="GiftFrequencyLabel" Text="Select gift frequency" AssociatedControlID="RecurringDonationFrequency"/>
		</div>
		<div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" ID="RecurringDonationFrequency" DisplayCaption="False" Caption="" RenderPanelField="true"></asiweb:BusinessDropDownList>
		</div>
	</div>

</asiweb:PanelTemplateControl>
